module Velo_timings
(
    input       lcd_clk,
    input       hsync,
    input       vsync,
    input wire [3:0] lcd_data,

    output reg  [18:0] fb_addr,
    output reg         fb_we,
    output reg  [3:0]  fb_data
);

parameter H_ACTIVE      = 640; //620 pixels / 4 pixels per clock 
// (10 front and back porch included in the H_ACTIVE calculation)
parameter V_ACTIVE      = 240;

reg [9:0] hcount = 0;
reg [9:0] vcount = 0;

// Detect sync edges (active HIGH signals)
reg hsync_prev = 1;
wire hsync_rising = !hsync_prev && hsync;   // Start of active line

always @(posedge lcd_clk) begin
    hsync_prev <= hsync;  //Edge detection
    
    // Reset horizontal counter at start of each line
    if (hsync) begin
        hcount <= 0;
    end
    if (hsync_rising) begin
        hcount <= hcount + 4;  // Increment by 4 since we get 4 pixels at once
    end

    // Reset vertical counter at start of frame
    if (vsync) begin
        vcount <= 0;
    end else if (hsync_rising) begin
        vcount <= vcount + 1;  // Increment line count on each new line during active frame
    end
end

wire in_active_area =
    !hsync && !vsync &&
    (hcount < H_ACTIVE) &&
    (vcount < V_ACTIVE);

always @(posedge lcd_clk) begin
    fb_we <= 0;

    // Reset address at start of frame
    if (vsync) begin
        fb_addr <= 0;
    end else if (in_active_area) begin
        fb_data <= ~lcd_data;
        fb_we   <= 1;
        fb_addr <= fb_addr + 1;
    end
end

endmodule