// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module VGA_Clock(clk_pix, reset, clk_pix_locked, clk_100m);
  output clk_pix;
  input reset;
  output clk_pix_locked;
  input clk_100m;
endmodule
