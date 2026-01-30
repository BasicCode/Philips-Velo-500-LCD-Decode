module VGA_timing
(
    input                   PixelClk,
    input                   nRST,

    // Framebuffer read interface
    output reg  [18:0]      fb_read_addr,
    input       wire        fb_pixel,       // 1-bit pixel from framebuffer

    output                  LCD_DE,
    output                  LCD_HSYNC,
    output                  LCD_VSYNC,

    output          [4:0]   LCD_B,
    output          [5:0]   LCD_G,
    output          [4:0]   LCD_R
);

    //Output display characteristics 800x480 pixels
    parameter       H_Pixel_Valid    = 16'd800; 
    parameter       H_FrontPorch     = 16'd50;
    parameter       H_BackPorch      = 16'd30;  

    parameter       PixelForHS       = H_Pixel_Valid + H_FrontPorch + H_BackPorch;

    parameter       V_Pixel_Valid    = 16'd480; 
    parameter       V_FrontPorch     = 16'd20;  
    parameter       V_BackPorch      = 16'd5;    

    parameter       PixelForVS       = V_Pixel_Valid + V_FrontPorch + V_BackPorch;

    // Horizontal / Vertical counters
    reg [15:0] H_PixelCount;
    reg [15:0] V_PixelCount;

    localparam H_TOTAL = H_Pixel_Valid + H_FrontPorch + H_BackPorch;
    localparam V_TOTAL = V_Pixel_Valid + V_FrontPorch + V_BackPorch;

    always @(posedge PixelClk or negedge nRST) begin
        if (!nRST) begin
            H_PixelCount <= 0;
            V_PixelCount <= 0;
        end
        else begin
            if (H_PixelCount == H_TOTAL - 1) begin
                H_PixelCount <= 0;

                if (V_PixelCount == V_TOTAL - 1)
                    V_PixelCount <= 0;
                else
                    V_PixelCount <= V_PixelCount + 1;
            end else begin
                H_PixelCount <= H_PixelCount + 1;
            end
        end
    end

    assign LCD_HSYNC = (H_PixelCount < H_Pixel_Valid + H_FrontPorch) ? 1'b1 : 1'b0;
    assign LCD_VSYNC = (V_PixelCount < V_Pixel_Valid + V_FrontPorch) ? 1'b1 : 1'b0;

    wire in_active_area =
        (H_PixelCount < H_Pixel_Valid) &&
        (V_PixelCount < V_Pixel_Valid);

    assign LCD_DE = in_active_area;

    // fb_x, fb_y
    wire [15:0] fb_x = H_PixelCount;
    wire [15:0] fb_y = V_PixelCount;

    // Framebuffer only take up a portion of the display
    parameter FB_H_SIZE      = 640; //620 pixels / 4 pixels per clock 
    //(This includes 10 front and back porch pixels - fix later)
    parameter FB_V_SIZE      = 240;
    wire inside_fb = (fb_x < FB_H_SIZE) && (fb_y < FB_V_SIZE);

    reg [18:0] line_base;

    always @(posedge PixelClk) begin
        if (H_PixelCount == 0)
            line_base <= fb_y * FB_H_SIZE;  // can replace with shift-add
        fb_read_addr <= line_base + fb_x;
    end

    // Pixel selection: framebuffer or white
    wire pixel_on = inside_fb ? fb_pixel : 1'b1;  // white background

    assign LCD_R = pixel_on ? 5'b11111 : 5'b00000;
    assign LCD_G = pixel_on ? 6'b111111 : 6'b000000;
    assign LCD_B = pixel_on ? 5'b11111 : 5'b00000;

endmodule