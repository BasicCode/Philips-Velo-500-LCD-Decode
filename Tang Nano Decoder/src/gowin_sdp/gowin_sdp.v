//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.12.01 (64-bit)
//IP Version: 1.0
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Fri Jan 30 20:53:04 2026

module Gowin_SDP (dout, clka, cea, reseta, clkb, ceb, resetb, oce, ada, din, adb);

output [7:0] dout;
input clka;
input cea;
input reseta;
input clkb;
input ceb;
input resetb;
input oce;
input [15:0] ada;
input [7:0] din;
input [15:0] adb;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire lut_f_4;
wire lut_f_5;
wire lut_f_6;
wire lut_f_7;
wire lut_f_8;
wire lut_f_9;
wire lut_f_10;
wire lut_f_11;
wire lut_f_12;
wire lut_f_13;
wire lut_f_14;
wire lut_f_15;
wire lut_f_16;
wire lut_f_17;
wire lut_f_18;
wire lut_f_19;
wire [27:0] sdpb_inst_0_dout_w;
wire [3:0] sdpb_inst_0_dout;
wire [27:0] sdpb_inst_1_dout_w;
wire [3:0] sdpb_inst_1_dout;
wire [27:0] sdpb_inst_2_dout_w;
wire [3:0] sdpb_inst_2_dout;
wire [27:0] sdpb_inst_3_dout_w;
wire [3:0] sdpb_inst_3_dout;
wire [27:0] sdpb_inst_4_dout_w;
wire [3:0] sdpb_inst_4_dout;
wire [27:0] sdpb_inst_5_dout_w;
wire [3:0] sdpb_inst_5_dout;
wire [27:0] sdpb_inst_6_dout_w;
wire [3:0] sdpb_inst_6_dout;
wire [27:0] sdpb_inst_7_dout_w;
wire [3:0] sdpb_inst_7_dout;
wire [27:0] sdpb_inst_8_dout_w;
wire [7:4] sdpb_inst_8_dout;
wire [27:0] sdpb_inst_9_dout_w;
wire [7:4] sdpb_inst_9_dout;
wire [27:0] sdpb_inst_10_dout_w;
wire [7:4] sdpb_inst_10_dout;
wire [27:0] sdpb_inst_11_dout_w;
wire [7:4] sdpb_inst_11_dout;
wire [27:0] sdpb_inst_12_dout_w;
wire [7:4] sdpb_inst_12_dout;
wire [27:0] sdpb_inst_13_dout_w;
wire [7:4] sdpb_inst_13_dout;
wire [27:0] sdpb_inst_14_dout_w;
wire [7:4] sdpb_inst_14_dout;
wire [27:0] sdpb_inst_15_dout_w;
wire [7:4] sdpb_inst_15_dout;
wire [27:0] sdpb_inst_16_dout_w;
wire [3:0] sdpb_inst_16_dout;
wire [27:0] sdpb_inst_17_dout_w;
wire [7:4] sdpb_inst_17_dout;
wire [23:0] sdpb_inst_18_dout_w;
wire [7:0] sdpb_inst_18_dout;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_13;
wire mux_o_14;
wire mux_o_15;
wire mux_o_16;
wire mux_o_18;
wire mux_o_31;
wire mux_o_32;
wire mux_o_33;
wire mux_o_34;
wire mux_o_35;
wire mux_o_36;
wire mux_o_37;
wire mux_o_39;
wire mux_o_52;
wire mux_o_53;
wire mux_o_54;
wire mux_o_55;
wire mux_o_56;
wire mux_o_57;
wire mux_o_58;
wire mux_o_60;
wire mux_o_73;
wire mux_o_74;
wire mux_o_75;
wire mux_o_76;
wire mux_o_77;
wire mux_o_78;
wire mux_o_79;
wire mux_o_81;
wire mux_o_94;
wire mux_o_95;
wire mux_o_96;
wire mux_o_97;
wire mux_o_98;
wire mux_o_99;
wire mux_o_100;
wire mux_o_102;
wire mux_o_115;
wire mux_o_116;
wire mux_o_117;
wire mux_o_118;
wire mux_o_119;
wire mux_o_120;
wire mux_o_121;
wire mux_o_123;
wire mux_o_136;
wire mux_o_137;
wire mux_o_138;
wire mux_o_139;
wire mux_o_140;
wire mux_o_141;
wire mux_o_142;
wire mux_o_144;
wire mux_o_157;
wire mux_o_158;
wire mux_o_159;
wire mux_o_160;
wire mux_o_161;
wire mux_o_162;
wire mux_o_163;
wire mux_o_165;
wire gw_gnd;

assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_0.INIT = 16'h0001;
LUT4 lut_inst_1 (
  .F(lut_f_1),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_1.INIT = 16'h0002;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_2.INIT = 16'h0004;
LUT4 lut_inst_3 (
  .F(lut_f_3),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_3.INIT = 16'h0008;
LUT4 lut_inst_4 (
  .F(lut_f_4),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_4.INIT = 16'h0010;
LUT4 lut_inst_5 (
  .F(lut_f_5),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_5.INIT = 16'h0020;
LUT4 lut_inst_6 (
  .F(lut_f_6),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_6.INIT = 16'h0040;
LUT4 lut_inst_7 (
  .F(lut_f_7),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_7.INIT = 16'h0080;
LUT4 lut_inst_8 (
  .F(lut_f_8),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15])
);
defparam lut_inst_8.INIT = 16'h0100;
LUT5 lut_inst_9 (
  .F(lut_f_9),
  .I0(ada[11]),
  .I1(ada[12]),
  .I2(ada[13]),
  .I3(ada[14]),
  .I4(ada[15])
);
defparam lut_inst_9.INIT = 32'h00040000;
LUT4 lut_inst_10 (
  .F(lut_f_10),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_10.INIT = 16'h0001;
LUT4 lut_inst_11 (
  .F(lut_f_11),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_11.INIT = 16'h0002;
LUT4 lut_inst_12 (
  .F(lut_f_12),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_12.INIT = 16'h0004;
LUT4 lut_inst_13 (
  .F(lut_f_13),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_13.INIT = 16'h0008;
LUT4 lut_inst_14 (
  .F(lut_f_14),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_14.INIT = 16'h0010;
LUT4 lut_inst_15 (
  .F(lut_f_15),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_15.INIT = 16'h0020;
LUT4 lut_inst_16 (
  .F(lut_f_16),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_16.INIT = 16'h0040;
LUT4 lut_inst_17 (
  .F(lut_f_17),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_17.INIT = 16'h0080;
LUT4 lut_inst_18 (
  .F(lut_f_18),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15])
);
defparam lut_inst_18.INIT = 16'h0100;
LUT5 lut_inst_19 (
  .F(lut_f_19),
  .I0(adb[11]),
  .I1(adb[12]),
  .I2(adb[13]),
  .I3(adb[14]),
  .I4(adb[15])
);
defparam lut_inst_19.INIT = 32'h00040000;
SDPB sdpb_inst_0 (
    .DO({sdpb_inst_0_dout_w[27:0],sdpb_inst_0_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_10}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_0.READ_MODE = 1'b0;
defparam sdpb_inst_0.BIT_WIDTH_0 = 4;
defparam sdpb_inst_0.BIT_WIDTH_1 = 4;
defparam sdpb_inst_0.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_0.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_0.RESET_MODE = "SYNC";

SDPB sdpb_inst_1 (
    .DO({sdpb_inst_1_dout_w[27:0],sdpb_inst_1_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_11}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_1.READ_MODE = 1'b0;
defparam sdpb_inst_1.BIT_WIDTH_0 = 4;
defparam sdpb_inst_1.BIT_WIDTH_1 = 4;
defparam sdpb_inst_1.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_1.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_1.RESET_MODE = "SYNC";

SDPB sdpb_inst_2 (
    .DO({sdpb_inst_2_dout_w[27:0],sdpb_inst_2_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_2}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_12}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_2.READ_MODE = 1'b0;
defparam sdpb_inst_2.BIT_WIDTH_0 = 4;
defparam sdpb_inst_2.BIT_WIDTH_1 = 4;
defparam sdpb_inst_2.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_2.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_2.RESET_MODE = "SYNC";

SDPB sdpb_inst_3 (
    .DO({sdpb_inst_3_dout_w[27:0],sdpb_inst_3_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_3}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_13}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_3.READ_MODE = 1'b0;
defparam sdpb_inst_3.BIT_WIDTH_0 = 4;
defparam sdpb_inst_3.BIT_WIDTH_1 = 4;
defparam sdpb_inst_3.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_3.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_3.RESET_MODE = "SYNC";

SDPB sdpb_inst_4 (
    .DO({sdpb_inst_4_dout_w[27:0],sdpb_inst_4_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_4}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_14}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_4.READ_MODE = 1'b0;
defparam sdpb_inst_4.BIT_WIDTH_0 = 4;
defparam sdpb_inst_4.BIT_WIDTH_1 = 4;
defparam sdpb_inst_4.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_4.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_4.RESET_MODE = "SYNC";

SDPB sdpb_inst_5 (
    .DO({sdpb_inst_5_dout_w[27:0],sdpb_inst_5_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_5}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_15}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_5.READ_MODE = 1'b0;
defparam sdpb_inst_5.BIT_WIDTH_0 = 4;
defparam sdpb_inst_5.BIT_WIDTH_1 = 4;
defparam sdpb_inst_5.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_5.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_5.RESET_MODE = "SYNC";

SDPB sdpb_inst_6 (
    .DO({sdpb_inst_6_dout_w[27:0],sdpb_inst_6_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_6}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_16}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_6.READ_MODE = 1'b0;
defparam sdpb_inst_6.BIT_WIDTH_0 = 4;
defparam sdpb_inst_6.BIT_WIDTH_1 = 4;
defparam sdpb_inst_6.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_6.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_6.RESET_MODE = "SYNC";

SDPB sdpb_inst_7 (
    .DO({sdpb_inst_7_dout_w[27:0],sdpb_inst_7_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_7}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_17}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_7.READ_MODE = 1'b0;
defparam sdpb_inst_7.BIT_WIDTH_0 = 4;
defparam sdpb_inst_7.BIT_WIDTH_1 = 4;
defparam sdpb_inst_7.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_7.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_7.RESET_MODE = "SYNC";

SDPB sdpb_inst_8 (
    .DO({sdpb_inst_8_dout_w[27:0],sdpb_inst_8_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_10}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_8.READ_MODE = 1'b0;
defparam sdpb_inst_8.BIT_WIDTH_0 = 4;
defparam sdpb_inst_8.BIT_WIDTH_1 = 4;
defparam sdpb_inst_8.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_8.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_8.RESET_MODE = "SYNC";

SDPB sdpb_inst_9 (
    .DO({sdpb_inst_9_dout_w[27:0],sdpb_inst_9_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_11}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_9.READ_MODE = 1'b0;
defparam sdpb_inst_9.BIT_WIDTH_0 = 4;
defparam sdpb_inst_9.BIT_WIDTH_1 = 4;
defparam sdpb_inst_9.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_9.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_9.RESET_MODE = "SYNC";

SDPB sdpb_inst_10 (
    .DO({sdpb_inst_10_dout_w[27:0],sdpb_inst_10_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_2}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_12}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_10.READ_MODE = 1'b0;
defparam sdpb_inst_10.BIT_WIDTH_0 = 4;
defparam sdpb_inst_10.BIT_WIDTH_1 = 4;
defparam sdpb_inst_10.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_10.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_10.RESET_MODE = "SYNC";

SDPB sdpb_inst_11 (
    .DO({sdpb_inst_11_dout_w[27:0],sdpb_inst_11_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_3}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_13}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_11.READ_MODE = 1'b0;
defparam sdpb_inst_11.BIT_WIDTH_0 = 4;
defparam sdpb_inst_11.BIT_WIDTH_1 = 4;
defparam sdpb_inst_11.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_11.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_11.RESET_MODE = "SYNC";

SDPB sdpb_inst_12 (
    .DO({sdpb_inst_12_dout_w[27:0],sdpb_inst_12_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_4}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_14}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_12.READ_MODE = 1'b0;
defparam sdpb_inst_12.BIT_WIDTH_0 = 4;
defparam sdpb_inst_12.BIT_WIDTH_1 = 4;
defparam sdpb_inst_12.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_12.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_12.RESET_MODE = "SYNC";

SDPB sdpb_inst_13 (
    .DO({sdpb_inst_13_dout_w[27:0],sdpb_inst_13_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_5}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_15}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_13.READ_MODE = 1'b0;
defparam sdpb_inst_13.BIT_WIDTH_0 = 4;
defparam sdpb_inst_13.BIT_WIDTH_1 = 4;
defparam sdpb_inst_13.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_13.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_13.RESET_MODE = "SYNC";

SDPB sdpb_inst_14 (
    .DO({sdpb_inst_14_dout_w[27:0],sdpb_inst_14_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_6}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_16}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_14.READ_MODE = 1'b0;
defparam sdpb_inst_14.BIT_WIDTH_0 = 4;
defparam sdpb_inst_14.BIT_WIDTH_1 = 4;
defparam sdpb_inst_14.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_14.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_14.RESET_MODE = "SYNC";

SDPB sdpb_inst_15 (
    .DO({sdpb_inst_15_dout_w[27:0],sdpb_inst_15_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_7}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_17}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_15.READ_MODE = 1'b0;
defparam sdpb_inst_15.BIT_WIDTH_0 = 4;
defparam sdpb_inst_15.BIT_WIDTH_1 = 4;
defparam sdpb_inst_15.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_15.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_15.RESET_MODE = "SYNC";

SDPB sdpb_inst_16 (
    .DO({sdpb_inst_16_dout_w[27:0],sdpb_inst_16_dout[3:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_8}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_18}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_16.READ_MODE = 1'b0;
defparam sdpb_inst_16.BIT_WIDTH_0 = 4;
defparam sdpb_inst_16.BIT_WIDTH_1 = 4;
defparam sdpb_inst_16.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_16.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_16.RESET_MODE = "SYNC";

SDPB sdpb_inst_17 (
    .DO({sdpb_inst_17_dout_w[27:0],sdpb_inst_17_dout[7:4]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_8}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_18}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd})
);

defparam sdpb_inst_17.READ_MODE = 1'b0;
defparam sdpb_inst_17.BIT_WIDTH_0 = 4;
defparam sdpb_inst_17.BIT_WIDTH_1 = 4;
defparam sdpb_inst_17.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_17.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_17.RESET_MODE = "SYNC";

SDPB sdpb_inst_18 (
    .DO({sdpb_inst_18_dout_w[23:0],sdpb_inst_18_dout[7:0]}),
    .CLKA(clka),
    .CEA(cea),
    .RESETA(reseta),
    .CLKB(clkb),
    .CEB(ceb),
    .RESETB(resetb),
    .OCE(oce),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_9}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_19}),
    .ADA({ada[10:0],gw_gnd,gw_gnd,gw_gnd}),
    .DI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,din[7:0]}),
    .ADB({adb[10:0],gw_gnd,gw_gnd,gw_gnd})
);

defparam sdpb_inst_18.READ_MODE = 1'b0;
defparam sdpb_inst_18.BIT_WIDTH_0 = 8;
defparam sdpb_inst_18.BIT_WIDTH_1 = 8;
defparam sdpb_inst_18.BLK_SEL_0 = 3'b001;
defparam sdpb_inst_18.BLK_SEL_1 = 3'b001;
defparam sdpb_inst_18.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(adb[15]),
  .CLK(clkb),
  .CE(ceb)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(adb[12]),
  .CLK(clkb),
  .CE(ceb)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(sdpb_inst_0_dout[0]),
  .I1(sdpb_inst_1_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(sdpb_inst_2_dout[0]),
  .I1(sdpb_inst_3_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(sdpb_inst_4_dout[0]),
  .I1(sdpb_inst_5_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_13 (
  .O(mux_o_13),
  .I0(sdpb_inst_6_dout[0]),
  .I1(sdpb_inst_7_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(sdpb_inst_16_dout[0]),
  .I1(sdpb_inst_18_dout[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_15 (
  .O(mux_o_15),
  .I0(mux_o_10),
  .I1(mux_o_11),
  .S0(dff_q_2)
);
MUX2 mux_inst_16 (
  .O(mux_o_16),
  .I0(mux_o_12),
  .I1(mux_o_13),
  .S0(dff_q_2)
);
MUX2 mux_inst_18 (
  .O(mux_o_18),
  .I0(mux_o_15),
  .I1(mux_o_16),
  .S0(dff_q_1)
);
MUX2 mux_inst_20 (
  .O(dout[0]),
  .I0(mux_o_18),
  .I1(mux_o_14),
  .S0(dff_q_0)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(sdpb_inst_0_dout[1]),
  .I1(sdpb_inst_1_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_32 (
  .O(mux_o_32),
  .I0(sdpb_inst_2_dout[1]),
  .I1(sdpb_inst_3_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_33 (
  .O(mux_o_33),
  .I0(sdpb_inst_4_dout[1]),
  .I1(sdpb_inst_5_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_34 (
  .O(mux_o_34),
  .I0(sdpb_inst_6_dout[1]),
  .I1(sdpb_inst_7_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_35 (
  .O(mux_o_35),
  .I0(sdpb_inst_16_dout[1]),
  .I1(sdpb_inst_18_dout[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_36 (
  .O(mux_o_36),
  .I0(mux_o_31),
  .I1(mux_o_32),
  .S0(dff_q_2)
);
MUX2 mux_inst_37 (
  .O(mux_o_37),
  .I0(mux_o_33),
  .I1(mux_o_34),
  .S0(dff_q_2)
);
MUX2 mux_inst_39 (
  .O(mux_o_39),
  .I0(mux_o_36),
  .I1(mux_o_37),
  .S0(dff_q_1)
);
MUX2 mux_inst_41 (
  .O(dout[1]),
  .I0(mux_o_39),
  .I1(mux_o_35),
  .S0(dff_q_0)
);
MUX2 mux_inst_52 (
  .O(mux_o_52),
  .I0(sdpb_inst_0_dout[2]),
  .I1(sdpb_inst_1_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_53 (
  .O(mux_o_53),
  .I0(sdpb_inst_2_dout[2]),
  .I1(sdpb_inst_3_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_54 (
  .O(mux_o_54),
  .I0(sdpb_inst_4_dout[2]),
  .I1(sdpb_inst_5_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_55 (
  .O(mux_o_55),
  .I0(sdpb_inst_6_dout[2]),
  .I1(sdpb_inst_7_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_56 (
  .O(mux_o_56),
  .I0(sdpb_inst_16_dout[2]),
  .I1(sdpb_inst_18_dout[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_57 (
  .O(mux_o_57),
  .I0(mux_o_52),
  .I1(mux_o_53),
  .S0(dff_q_2)
);
MUX2 mux_inst_58 (
  .O(mux_o_58),
  .I0(mux_o_54),
  .I1(mux_o_55),
  .S0(dff_q_2)
);
MUX2 mux_inst_60 (
  .O(mux_o_60),
  .I0(mux_o_57),
  .I1(mux_o_58),
  .S0(dff_q_1)
);
MUX2 mux_inst_62 (
  .O(dout[2]),
  .I0(mux_o_60),
  .I1(mux_o_56),
  .S0(dff_q_0)
);
MUX2 mux_inst_73 (
  .O(mux_o_73),
  .I0(sdpb_inst_0_dout[3]),
  .I1(sdpb_inst_1_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_74 (
  .O(mux_o_74),
  .I0(sdpb_inst_2_dout[3]),
  .I1(sdpb_inst_3_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_75 (
  .O(mux_o_75),
  .I0(sdpb_inst_4_dout[3]),
  .I1(sdpb_inst_5_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_76 (
  .O(mux_o_76),
  .I0(sdpb_inst_6_dout[3]),
  .I1(sdpb_inst_7_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_77 (
  .O(mux_o_77),
  .I0(sdpb_inst_16_dout[3]),
  .I1(sdpb_inst_18_dout[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(mux_o_73),
  .I1(mux_o_74),
  .S0(dff_q_2)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(mux_o_75),
  .I1(mux_o_76),
  .S0(dff_q_2)
);
MUX2 mux_inst_81 (
  .O(mux_o_81),
  .I0(mux_o_78),
  .I1(mux_o_79),
  .S0(dff_q_1)
);
MUX2 mux_inst_83 (
  .O(dout[3]),
  .I0(mux_o_81),
  .I1(mux_o_77),
  .S0(dff_q_0)
);
MUX2 mux_inst_94 (
  .O(mux_o_94),
  .I0(sdpb_inst_8_dout[4]),
  .I1(sdpb_inst_9_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(sdpb_inst_10_dout[4]),
  .I1(sdpb_inst_11_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(sdpb_inst_12_dout[4]),
  .I1(sdpb_inst_13_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(sdpb_inst_14_dout[4]),
  .I1(sdpb_inst_15_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_98 (
  .O(mux_o_98),
  .I0(sdpb_inst_17_dout[4]),
  .I1(sdpb_inst_18_dout[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(mux_o_94),
  .I1(mux_o_95),
  .S0(dff_q_2)
);
MUX2 mux_inst_100 (
  .O(mux_o_100),
  .I0(mux_o_96),
  .I1(mux_o_97),
  .S0(dff_q_2)
);
MUX2 mux_inst_102 (
  .O(mux_o_102),
  .I0(mux_o_99),
  .I1(mux_o_100),
  .S0(dff_q_1)
);
MUX2 mux_inst_104 (
  .O(dout[4]),
  .I0(mux_o_102),
  .I1(mux_o_98),
  .S0(dff_q_0)
);
MUX2 mux_inst_115 (
  .O(mux_o_115),
  .I0(sdpb_inst_8_dout[5]),
  .I1(sdpb_inst_9_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_116 (
  .O(mux_o_116),
  .I0(sdpb_inst_10_dout[5]),
  .I1(sdpb_inst_11_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_117 (
  .O(mux_o_117),
  .I0(sdpb_inst_12_dout[5]),
  .I1(sdpb_inst_13_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_118 (
  .O(mux_o_118),
  .I0(sdpb_inst_14_dout[5]),
  .I1(sdpb_inst_15_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_119 (
  .O(mux_o_119),
  .I0(sdpb_inst_17_dout[5]),
  .I1(sdpb_inst_18_dout[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_120 (
  .O(mux_o_120),
  .I0(mux_o_115),
  .I1(mux_o_116),
  .S0(dff_q_2)
);
MUX2 mux_inst_121 (
  .O(mux_o_121),
  .I0(mux_o_117),
  .I1(mux_o_118),
  .S0(dff_q_2)
);
MUX2 mux_inst_123 (
  .O(mux_o_123),
  .I0(mux_o_120),
  .I1(mux_o_121),
  .S0(dff_q_1)
);
MUX2 mux_inst_125 (
  .O(dout[5]),
  .I0(mux_o_123),
  .I1(mux_o_119),
  .S0(dff_q_0)
);
MUX2 mux_inst_136 (
  .O(mux_o_136),
  .I0(sdpb_inst_8_dout[6]),
  .I1(sdpb_inst_9_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_137 (
  .O(mux_o_137),
  .I0(sdpb_inst_10_dout[6]),
  .I1(sdpb_inst_11_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_138 (
  .O(mux_o_138),
  .I0(sdpb_inst_12_dout[6]),
  .I1(sdpb_inst_13_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_139 (
  .O(mux_o_139),
  .I0(sdpb_inst_14_dout[6]),
  .I1(sdpb_inst_15_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_140 (
  .O(mux_o_140),
  .I0(sdpb_inst_17_dout[6]),
  .I1(sdpb_inst_18_dout[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_141 (
  .O(mux_o_141),
  .I0(mux_o_136),
  .I1(mux_o_137),
  .S0(dff_q_2)
);
MUX2 mux_inst_142 (
  .O(mux_o_142),
  .I0(mux_o_138),
  .I1(mux_o_139),
  .S0(dff_q_2)
);
MUX2 mux_inst_144 (
  .O(mux_o_144),
  .I0(mux_o_141),
  .I1(mux_o_142),
  .S0(dff_q_1)
);
MUX2 mux_inst_146 (
  .O(dout[6]),
  .I0(mux_o_144),
  .I1(mux_o_140),
  .S0(dff_q_0)
);
MUX2 mux_inst_157 (
  .O(mux_o_157),
  .I0(sdpb_inst_8_dout[7]),
  .I1(sdpb_inst_9_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_158 (
  .O(mux_o_158),
  .I0(sdpb_inst_10_dout[7]),
  .I1(sdpb_inst_11_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_159 (
  .O(mux_o_159),
  .I0(sdpb_inst_12_dout[7]),
  .I1(sdpb_inst_13_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_160 (
  .O(mux_o_160),
  .I0(sdpb_inst_14_dout[7]),
  .I1(sdpb_inst_15_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_161 (
  .O(mux_o_161),
  .I0(sdpb_inst_17_dout[7]),
  .I1(sdpb_inst_18_dout[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_162 (
  .O(mux_o_162),
  .I0(mux_o_157),
  .I1(mux_o_158),
  .S0(dff_q_2)
);
MUX2 mux_inst_163 (
  .O(mux_o_163),
  .I0(mux_o_159),
  .I1(mux_o_160),
  .S0(dff_q_2)
);
MUX2 mux_inst_165 (
  .O(mux_o_165),
  .I0(mux_o_162),
  .I1(mux_o_163),
  .S0(dff_q_1)
);
MUX2 mux_inst_167 (
  .O(dout[7]),
  .I0(mux_o_165),
  .I1(mux_o_161),
  .S0(dff_q_0)
);
endmodule //Gowin_SDP
