-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Fri Nov 17 12:41:25 2023
-- Host        : CTRL-ALT-DEL running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Dell/Documents/uni_docs/cs/dld/project_stuff/dld_final_project/dld_final_project.srcs/sources_1/ip/VGA_Clock/VGA_Clock_stub.vhdl
-- Design      : VGA_Clock
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_Clock is
  Port ( 
    clk_pix : out STD_LOGIC;
    reset : in STD_LOGIC;
    clk_pix_locked : out STD_LOGIC;
    clk_100m : in STD_LOGIC
  );

end VGA_Clock;

architecture stub of VGA_Clock is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_pix,reset,clk_pix_locked,clk_100m";
begin
end;
