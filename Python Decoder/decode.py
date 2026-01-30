import array
import struct
import sys
from collections import namedtuple
import bisect

TYPE_DIGITAL = 0
TYPE_ANALOG = 1
expected_version = 0

# Hard Coded Filenames YAY
PIXEL_0_FILE = "digital_3.bin"
PIXEL_1_FILE = "digital_2.bin"
PIXEL_2_FILE = "digital_1.bin"
PIXEL_3_FILE = "digital_0.bin"
VSYNC_FILE   = "digital_4.bin"
HSYNC_FILE   = "digital_5.bin"
CLK_FILE     = "digital_6.bin"

# BMP file parameters (will create lcd_output_frame_0.bmp, lcd_output_frame_1.bmp, etc.)
BMP_OUTPUT_PREFIX = "lcd_output_frame"

DigitalData = namedtuple('DigitalData', ('initial_state', 'begin_time', 'end_time', 'num_transitions', 'transition_times'))

def parse_digital(f):
    # Parse header
    identifier = f.read(8)
    if identifier != b"<SALEAE>":
        raise Exception("Not a saleae file")

    version, datatype = struct.unpack('<ii', f.read(8))

    if version != expected_version or datatype != TYPE_DIGITAL:
        raise Exception("Unexpected data type: {}".format(datatype))

    # Parse digital-specific data
    initial_state, begin_time, end_time, num_transitions = struct.unpack('<iddq', f.read(28))

    # Parse transition times
    transition_times = array.array('d')
    transition_times.fromfile(f, num_transitions)

    return DigitalData(initial_state, begin_time, end_time, num_transitions, transition_times)


def get_signal_state_at_time(data, time):
    """Get the signal state at a specific time - optimized version"""
    if time < data.begin_time:
        return data.initial_state
    
    # Find the last transition before or at this time using binary search
    idx = bisect.bisect_right(data.transition_times, time)
    
    # Current state = initial state flipped idx times
    # Use modulo 2 to avoid counting transitions
    return data.initial_state if (idx % 2) == 0 else (1 - data.initial_state)


def find_rising_edges(clk_data):
    """Find all rising edge times in the clock signal"""
    rising_edges = []
    current_state = clk_data.initial_state
    
    for transition_time in clk_data.transition_times:
        # Flip state
        current_state = 0 if current_state else 1
        # If we just transitioned to high (1), it's a rising edge
        if current_state == 1:
            rising_edges.append(transition_time)
    
    return rising_edges


def find_hsync_pulses(hsync_data):
    """Find HSYNC pulse start times (active HIGH)"""
    hsync_pulses = []
    current_state = hsync_data.initial_state
    
    for transition_time in hsync_data.transition_times:
        # If transitioning from low to high, it's start of HSYNC pulse
        if current_state == 0:
            hsync_pulses.append(transition_time)
        current_state = 0 if current_state else 1
    
    return hsync_pulses


def find_vsync_pulses(vsync_data):
    """Find VSYNC pulse start times (active HIGH)"""
    vsync_pulses = []
    current_state = vsync_data.initial_state
    
    for transition_time in vsync_data.transition_times:
        # If transitioning from low to high, it's start of VSYNC pulse
        if current_state == 0:
            vsync_pulses.append(transition_time)
        current_state = 0 if current_state else 1
    
    return vsync_pulses


def create_bmp_header(width, height):
    """Create BMP file header for 4-bit grayscale image"""
    # BMP uses 4-bit with color palette
    row_size = (width + 1) // 2  # 2 pixels per byte
    row_size = (row_size + 3) & ~3  # Align to 4-byte boundary
    
    image_size = row_size * height
    file_size = 54 + 64 + image_size  # Header + palette + data
    
    # BMP File Header (14 bytes)
    bmp_header = struct.pack('<2sIHHI',
        b'BM',        # Signature
        file_size,    # File size
        0,            # Reserved
        0,            # Reserved  
        54 + 64       # Offset to image data (header + palette)
    )
    
    # DIB Header (40 bytes)
    dib_header = struct.pack('<IIIHHIIIIII',
        40,           # DIB header size
        width,        # Image width
        height,       # Image height
        1,            # Number of color planes
        4,            # Bits per pixel
        0,            # Compression method
        image_size,   # Image size
        2835,         # Horizontal resolution (pixels/meter)
        2835,         # Vertical resolution (pixels/meter)
        16,           # Number of colors in palette
        0             # Number of important colors
    )
    
    # Create grayscale palette (16 colors, 4 bytes each)
    palette = b''
    for i in range(16):
        gray_level = (i * 255) // 15  # Scale to 0-255
        palette += struct.pack('<BBBB', gray_level, gray_level, gray_level, 0)
    
    return bmp_header + dib_header + palette


def stretch_frame_horizontally(frame, target_width=620):
    """Stretch frame horizontally from ~640 pixels to target width (620)"""
    if not frame:
        return []
    
    stretched_frame = []
    for line in frame:
        if not line:
            stretched_frame.append([0] * target_width)
            continue
            
        source_width = len(line)
        stretch_factor = target_width / source_width
        stretched_line = []
        
        for i in range(target_width):
            source_idx = int(i / stretch_factor)
            if source_idx < source_width:
                stretched_line.append(line[source_idx])
            else:
                stretched_line.append(0)
        
        stretched_frame.append(stretched_line)
    
    return stretched_frame


def write_bmp_file(filename, pixel_data, width, height):
    """Write pixel data to BMP file"""
    with open(filename, 'wb') as f:
        f.write(create_bmp_header(width, height))
        
        # BMP rows are stored bottom to top
        row_size = (width + 1) // 2
        padded_row_size = (row_size + 3) & ~3
        
        for row in reversed(pixel_data):
            # Pack 2 pixels per byte (4-bit each)
            row_bytes = bytearray()
            for i in range(0, len(row), 2):
                # Invert colors: 15 - pixel_value
                pixel1 = 15 - row[i]
                pixel2 = 15 - (row[i + 1] if i + 1 < len(row) else 0)
                # High nibble is first pixel, low nibble is second
                byte_val = (pixel1 << 4) | pixel2
                row_bytes.append(byte_val)
            
            # Pad row to 4-byte boundary
            while len(row_bytes) < padded_row_size:
                row_bytes.append(0)
            
            f.write(row_bytes)


def decode_lcd_data():
    """Main function to decode LCD data and generate BMP"""
    print("Loading digital signal files...")
    
    # Load all digital files
    files_to_load = [
        ("PIXEL_0", PIXEL_0_FILE),
        ("PIXEL_1", PIXEL_1_FILE), 
        ("PIXEL_2", PIXEL_2_FILE),
        ("PIXEL_3", PIXEL_3_FILE),
        ("HSYNC", HSYNC_FILE),
        ("VSYNC", VSYNC_FILE),
        ("CLK", CLK_FILE)
    ]
    
    signals = {}
    for name, filename in files_to_load:
        try:
            with open(filename, 'rb') as f:
                signals[name] = parse_digital(f)
            print(f"Loaded {name} from {filename}")
        except FileNotFoundError:
            print(f"Warning: Could not find {filename}")
            return
        except Exception as e:
            print(f"Error loading {filename}: {e}")
            return
    
    # Find CLK rising edges for sampling
    print("Finding CLK rising edges...")
    clk_rising_edges = find_rising_edges(signals["CLK"])
    print(f"Found {len(clk_rising_edges)} CLK rising edges")
    
    # Find HSYNC pulses for line boundaries
    print("Finding HSYNC pulses...")
    hsync_pulses = find_hsync_pulses(signals["HSYNC"])
    print(f"Found {len(hsync_pulses)} HSYNC pulses")
    
    # Find VSYNC pulses for frame boundaries
    print("Finding VSYNC pulses...")
    vsync_pulses = find_vsync_pulses(signals["VSYNC"])
    print(f"Found {len(vsync_pulses)} VSYNC pulses")
    
    # Sample pixel data on CLK rising edges
    # Each clock cycle produces 4 separate 1-bit pixels (one from each data line)
    print("Sampling pixel data...")
    pixel_samples = []
    
    for i, clk_time in enumerate(clk_rising_edges):
        if i % 10000 == 0:
            print(f"  Progress: {i}/{len(clk_rising_edges)} samples processed")
        
        # Sample all 4 data lines at this CLK rising edge
        # Each represents a separate 1-bit pixel
        pixel_0 = get_signal_state_at_time(signals["PIXEL_0"], clk_time)
        pixel_1 = get_signal_state_at_time(signals["PIXEL_1"], clk_time)
        pixel_2 = get_signal_state_at_time(signals["PIXEL_2"], clk_time)
        pixel_3 = get_signal_state_at_time(signals["PIXEL_3"], clk_time)
        
        # Convert 1-bit values to 4-bit grayscale for BMP (0 or 15)
        # Add all 4 pixels to the sample list
        pixel_samples.append((clk_time, pixel_0 * 15))
        pixel_samples.append((clk_time, pixel_1 * 15))
        pixel_samples.append((clk_time, pixel_2 * 15))
        pixel_samples.append((clk_time, pixel_3 * 15))
    
    print(f"Collected {len(pixel_samples)} pixel samples")
    
    # Organize samples into frames using VSYNC
    print("Organizing into frames...")
    frames = []
    current_frame_samples = []
    vsync_idx = 0
    
    for sample_time, pixel_value in pixel_samples:
        # Check if we need to start a new frame
        while (vsync_idx < len(vsync_pulses) and 
               sample_time > vsync_pulses[vsync_idx]):
            if current_frame_samples:  # Only add non-empty frames
                frames.append(current_frame_samples)
                current_frame_samples = []
            vsync_idx += 1
        
        current_frame_samples.append((sample_time, pixel_value))
    
    # Add the last frame
    if current_frame_samples:
        frames.append(current_frame_samples)
    
    if len(frames) == 0:
        print("No frame data found!")
        return
    
    print(f"Found {len(frames)} frames")
    
    # Process all frames and output valid ones
    valid_frame_count = 0
    valid_frames_for_averaging = []  # Store first 4 valid frames for averaging
    
    for frame_idx, frame_samples in enumerate(frames):
        print(f"\nProcessing frame {frame_idx}...")
        lines = []
        current_line = []
        hsync_idx = 0
        
        for sample_time, pixel_value in frame_samples:
            # Check if we need to start a new line
            while (hsync_idx < len(hsync_pulses) and 
                   sample_time > hsync_pulses[hsync_idx]):
                if current_line:  # Only add non-empty lines
                    lines.append(current_line)
                    current_line = []
                hsync_idx += 1
            
            current_line.append(pixel_value)
        
        # Add the last line
        if current_line:
            lines.append(current_line)
        
        if not lines:
            print(f"  Frame {frame_idx}: No lines found - SKIPPED")
            continue
        
        # Ensure all lines have the same width (pad with zeros if needed)
        source_width = max(len(line) for line in lines)
        for line in lines:
            while len(line) < source_width:
                line.append(0)
        
        # Validate frame dimensions (at least 240 lines tall)
        if len(lines) < 240:
            print(f"  Frame {frame_idx}: {len(lines)} lines, {source_width} pixels wide - REJECTED (too few lines)")
            continue
        
        print(f"  Frame {frame_idx}: {len(lines)} lines, {source_width} pixels wide - VALID")
        
        # Store first 4 valid frames for averaging
        if len(valid_frames_for_averaging) < 4:
            valid_frames_for_averaging.append([line[:] for line in lines])  # Deep copy
        
        # Stretch horizontally to 620 pixels
        final_frame = stretch_frame_horizontally(lines, 620)
        
        if not final_frame:
            print(f"  Frame {frame_idx}: Failed to stretch - SKIPPED")
            continue
        
        target_width = 620
        target_height = len(final_frame)
        
        # Write BMP file for this frame
        output_filename = f"lcd_output_frame_{valid_frame_count}.bmp"
        print(f"  Writing {output_filename} ({target_width} x {target_height})")
        write_bmp_file(output_filename, final_frame, target_width, target_height)
        valid_frame_count += 1
    
    print(f"\nSuccessfully created {valid_frame_count} BMP files")
    if valid_frame_count == 0:
        print("Warning: No valid frames were found!")
        return
    
    # Create averaged frame from first 4 valid frames
    if len(valid_frames_for_averaging) >= 4:
        print(f"\nCreating temporally averaged image from first 4 valid frames...")
        
        # Average the frames
        min_lines = min(len(frame) for frame in valid_frames_for_averaging[:4])
        min_width = min(min(len(line) for line in frame) for frame in valid_frames_for_averaging[:4])
        
        averaged_frame = []
        for line_idx in range(min_lines):
            averaged_line = []
            for pixel_idx in range(min_width):
                # Average this pixel across the 4 frames
                pixel_sum = sum(valid_frames_for_averaging[i][line_idx][pixel_idx] for i in range(4))
                averaged_pixel = pixel_sum / 4.0
                # Round to nearest 4-bit value (0-15)
                averaged_pixel = min(15, max(0, round(averaged_pixel)))
                averaged_line.append(averaged_pixel)
            averaged_frame.append(averaged_line)
        
        # Stretch the averaged frame to 620 pixels
        final_averaged = stretch_frame_horizontally(averaged_frame, 620)
        
        if final_averaged:
            output_filename = "lcd_output_averaged.bmp"
            print(f"Writing {output_filename} ({620} x {len(final_averaged)})")
            write_bmp_file(output_filename, final_averaged, 620, len(final_averaged))
            print("Averaged image created successfully!")
        else:
            print("Failed to create averaged image")
    else:
        print(f"\nWarning: Only {len(valid_frames_for_averaging)} valid frames found, need 4 for averaging")


if __name__ == '__main__':
    decode_lcd_data()