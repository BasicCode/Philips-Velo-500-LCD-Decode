module TOP
(
	input			Reset_Button,
    input           User_Button,
    input           XTAL_IN,

	output			LCD_CLK,
	output			LCD_HYNC,
	output			LCD_SYNC,
	output			LCD_DEN,
	output	[4:0]	LCD_R,
	output	[5:0]	LCD_G,
	output	[4:0]	LCD_B,

    //Input LCD signals
    input           input_lcd_clk,
    input           input_lcd_hsync,
    input           input_lcd_vsync,
    input wire [3:0] input_lcd_data

    //Shared signals
    
);
    wire [18:0] fb_read_addr_w;
    wire [7:0] fb_read_byte;

    wire        fb_we_w;
    wire [18:0] fb_addr_w;
    wire [3:0]  fb_data_w;

    // Simply store 4 pixels per byte, padding upper bits
    // This wastes half the BRAM but avoids read-modify-write complexity
    wire [7:0]  fb_data_byte = {4'b0000, fb_data_w};
    
    // Extract single pixel bit from the lower 4 bits of the byte
    wire fb_pixel_w = fb_read_byte[fb_read_addr_w[1:0]];

    // Set up clocks
    Gowin_rPLL Gowin_rPLL_9Mhz(
        .clkout(LCD_CLK), // 9MHz
        .clkin(XTAL_IN)   //27MHz
    );

    // Set up BRAM
    // Write: 4 pixels per byte, so divide address by 4
    // Read: same, divide address by 4
    Gowin_SDP fb_ram (
        .clka(input_lcd_clk),
        .cea(fb_we_w),
        .ada(fb_addr_w),
        .din(fb_data_byte),
        .reseta(1'b0),

        .clkb(LCD_CLK),
        .ceb(1'b1),  // Always enable reads
        .adb(fb_read_addr_w >> 2),
        .dout(fb_read_byte),
        .resetb(1'b0),
        .oce(1'b1)  // Output clock enable
    );

    VGA_timing VGA_timing_inst (
        .PixelClk(LCD_CLK),
        .nRST(Reset_Button),

        .fb_read_addr(fb_read_addr_w),
        .fb_pixel(fb_pixel_w),

        .LCD_DE(LCD_DEN),
        .LCD_HSYNC(LCD_HYNC),
        .LCD_VSYNC(LCD_SYNC),
        .LCD_R(LCD_R),
        .LCD_G(LCD_G),
        .LCD_B(LCD_B)
    );

    Velo_timings Velo_timings_inst (
        .lcd_clk (input_lcd_clk),
        .hsync   (input_lcd_hsync),
        .vsync   (input_lcd_vsync),
        .lcd_data(input_lcd_data),

        .fb_we   (fb_we_w),
        .fb_addr (fb_addr_w),
        .fb_data (fb_data_w)
    );

endmodule