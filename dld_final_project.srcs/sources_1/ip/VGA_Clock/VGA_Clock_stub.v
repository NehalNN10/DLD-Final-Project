// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Fri Nov 17 12:41:25 2023
// Host        : CTRL-ALT-DEL running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Dell/Documents/uni_docs/cs/dld/project_stuff/dld_final_project/dld_final_project.srcs/sources_1/ip/VGA_Clock/VGA_Clock_stub.v
// Design      : VGA_Clock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module VGA_Clock(clk_pix, reset, clk_pix_locked, clk_100m)
/* synthesis syn_black_box black_box_pad_pin="clk_pix,reset,clk_pix_locked,clk_100m" */;
  output clk_pix;
  input reset;
  output clk_pix_locked;
  input clk_100m;
endmodule
