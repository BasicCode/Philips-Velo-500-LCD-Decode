import array
import struct
import sys
from collections import namedtuple
import bisect

TYPE_DIGITAL = 0
TYPE_ANALOG = 1
expected_version = 0

# Hard Coded Filenames YAY
SIBDIN_FILE  = "digital_0.bin"  # Data from host to controller
SIBDOUT_FILE = "digital_1.bin"  # Data from controller to host
SIBCLK_FILE  = "digital_4.bin"  # SIB Clock
SIBSYNC_FILE = "digital_2.bin"  # SIB Sync pulse

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


def find_edges(clk_data):
    rising_edges = []
    falling_edges = []
    current_state = clk_data.initial_state
    
    for transition_time in clk_data.transition_times:
        # Flip state
        current_state = 0 if current_state else 1
        
        # Check for rising edge (transition to high)
        if current_state == 1:
            rising_edges.append(transition_time)
        # Check for falling edge (transition to low)
        elif current_state == 0:
            falling_edges.append(transition_time)
    
    return rising_edges, falling_edges

def find_sibsync_pulses(sibsync_data):
    """Find SIBSYNC pulse start times (active HIGH)"""
    sibsync_pulses = []
    current_state = sibsync_data.initial_state
    
    for transition_time in sibsync_data.transition_times:
        #Flip state
        current_state = 0 if current_state else 1
        # The frame starts at the END of the Sync pulse.
        if current_state == 0:
            sibsync_pulses.append(transition_time)
    
    return sibsync_pulses

def decode_sib_subframe(subframe_bits):
    """Decode a 64-bit SIB sub-frame and extract control register fields"""
    # Bits 17-20: Control register address (4 bits, bit 17 = MSB)
    ctrl_reg_addr = (subframe_bits >> (63 - 20)) & 0xF
    
    # Bit 21: Write bit (1 = write)
    write_bit = (subframe_bits >> (63 - 21)) & 1
    
    # Bits 48-63: Control register data (16 bits, bit 48 = MSB)
    ctrl_reg_data = subframe_bits & 0xFFFF
    
    rw_str = "WRITE" if write_bit else "READ"
    return rw_str, ctrl_reg_addr, ctrl_reg_data

def decode_mystery_binary():
    # Load all four SIB signals
    print("Loading data files...")
    with open(SIBDIN_FILE, 'rb') as f:
        sibdin = parse_digital(f)
    
    with open(SIBDOUT_FILE, 'rb') as f:
        sibdout = parse_digital(f)
    
    with open(SIBCLK_FILE, 'rb') as f:
        sibclk = parse_digital(f)
    
    with open(SIBSYNC_FILE, 'rb') as f:
        sibsync = parse_digital(f)
    
    print("Finding SIBCLK edges...")
    rising_edges, falling_edges = find_edges(sibclk)
    
    print("Finding SIBSYNC pulses...")
    sync_pulses = find_sibsync_pulses(sibsync)
    
    print(f"Found {len(sync_pulses)} Frames (SIBSYNC pulses), {len(rising_edges)} SIBCLK rising edges, {len(falling_edges)} SIBCLK falling edges\n")
    print("UCB1200 SIB Protocol Decoder - Control Register Operations")
    print("=" * 120)
    print(f"{'Frame':<6} {'Sub':<4} {'Time (s)':<12} {'SIBDIN (Host->Ctrl)':<40} {'SIBDOUT (Ctrl->Host)':<40}")
    print(f"{'':6} {'':4} {'':12} {'R/W Reg  Data(hex) Data(dec)':<40} {'R/W Reg  Data(hex) Data(dec)':<40}")
    print("=" * 120)

    # Collect all data first
    all_data = []
    
    # Process each Frame (data between SYNC pulses)
    for frame_num, sync_time in enumerate(sync_pulses):
        # Find the first rising edge after this sync pulse (for SIBDOUT)
        first_rising_idx = bisect.bisect_right(rising_edges, sync_time)
        # Find the first falling edge after this sync pulse (for SIBDIN)
        first_falling_idx = bisect.bisect_right(falling_edges, sync_time)
        
        # Read two 64-bit sub-frames per Frame
        rising_idx = first_rising_idx
        falling_idx = first_falling_idx
        
        # Each 128-bit Frame has two 64-bit sub-frames
        # The second sub-frame is always empty in this implementation
        if rising_idx + 64 > len(rising_edges) or falling_idx + 64 > len(falling_edges):
            break
        
        # Read 64 bits from SIBDIN (host to controller)
        # the datasheet says that SIBDIN is sampled on FALLING edges
        sibdin_bits = 0
        for bit_idx in range(64):
            clk_time = falling_edges[falling_idx + bit_idx]
            #clk_time = rising_edges[rising_idx + bit_idx]
            bit_value = get_signal_state_at_time(sibdin, clk_time)
            # Shift in MSB first (bit 0 goes to position 63)
            sibdin_bits |= (bit_value << (63 - bit_idx))
        
        # Read 64 bits from SIBDOUT (controller to host)
        sibdout_bits = 0
        for bit_idx in range(64):
            clk_time = falling_edges[falling_idx + bit_idx]
            #clk_time = rising_edges[rising_idx + bit_idx]
            bit_value = get_signal_state_at_time(sibdout, clk_time)
            # Shift in MSB first (bit 0 goes to position 63)
            sibdout_bits |= (bit_value << (63 - bit_idx))
        
        # Decode SIBDIN (commands from host)
        rw_str_in, ctrl_addr_in, ctrl_data_in = decode_sib_subframe(sibdin_bits)
        
        # Decode SIBDOUT (responses from controller)
        rw_str_out, ctrl_addr_out, ctrl_data_out = decode_sib_subframe(sibdout_bits)
        
        # Store sub-frame data if it contains control register operation
        if ctrl_addr_in != 0 or ctrl_data_in != 0 or ctrl_addr_out != 0 or ctrl_data_out != 0:
            all_data.append((frame_num, sync_time, sibdin_bits, sibdout_bits, 
                            rw_str_in, ctrl_addr_in, ctrl_data_in, 
                            rw_str_out, ctrl_addr_out, ctrl_data_out))
    
    # Display all data in compact table format
    adc_str = ""
    previous_data = 0
    for frame_num, sync_time, sibdin_bits, sibdout_bits, rw_str_in, ctrl_addr_in, ctrl_data_in, rw_str_out, ctrl_addr_out, ctrl_data_out in all_data:
        # Try to decode some ADC data
        adc_value = ((ctrl_data_out & 0x7FE0) >> 5) 
        #Search only for data with touch position X and touch position Y requested
        tps_data = (ctrl_data_in >> (15 - 6)) & 0x7
        if(False):
            if((previous_data == 32937 or 
                previous_data == 32933 or 
                previous_data == 32929 or 
                previous_data == 32941) and 
                (ctrl_data_out >> 15) and
                adc_value != 5 ): # Touch register requests
                # Characterise requested value TSPY, TSPX, TSMY, or TSMX
                if(previous_data == 32937):
                    adc_str += f"PY:{adc_value:<5} "
                if(previous_data == 32933):
                    adc_str += f"MX:{adc_value:<5} "
                if(previous_data == 32929):
                    adc_str += f"PX:{adc_value:<5} "
                if(previous_data == 32941):
                    adc_str += f"MY:{adc_value:<5} "
                # If this is a read of register the ADC register then calculate the value
                # ADC data is bits 14-5 of the register
                #adc_str += f"{adc_value:<5} "

        # Show all data here
        if(True):
            din_str = f"{rw_str_in} 0x{ctrl_addr_in:X}  0x{ctrl_data_in:04X}     {ctrl_data_in:<5}"
            dout_str = f"{rw_str_out} 0x{ctrl_addr_out:X}  0x{ctrl_data_out:04X}     {ctrl_data_out:<5}"
            print(f"{frame_num:<6} {sync_time:<12.9f} {din_str:<40} {dout_str:<40} {adc_value}")
            
        previous_data = ctrl_data_in #For getting the NEXT byte
    
    print(adc_str)
    print(f"Total non-empty sub-frames: {len(all_data)}")

if __name__ == '__main__':
    decode_mystery_binary()