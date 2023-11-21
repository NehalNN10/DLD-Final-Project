//--------------------------------------------------
// BeeSprite Module : Digilent Basys 3
// BeeInvaders Tutorial 2 : Onboard clock 100MHz
// VGA Resolution 640x480 @ 60Hz : Pixel Clock 25MHz
//--------------------------------------------------
`timescale 1ns / 1ps
// Setup MazeSprite Module
module Dungeon(
input wire i_clk,
input wire i_rst,
input wire [9:0] xx,
input wire [9:0] yy,
input wire aactive,
output reg [1:0] DOn, // 1=on, 0=off
output wire [7:0] dataout
);
// instantiate MazeRom code
reg [15:0] address; // 2^10 or 1024, need 34 x 27 = 918
DungeonRom DVRom (.i_addr(address),.i_clk2(i_clk),.o_data(dataout));
// setup character positions and sizes
reg [9:0] DungeonX = 20; // Bee X start position
reg [8:0] DungeonY = 20; // Bee Y start position
localparam DungeonWidth = 250; // Bee width in pixels
localparam DungeonHeight = 230; // Bee height in pixels
// check if xx,yy are within the confines of the Bee character
always @ (posedge i_clk)
begin
if (aactive)
begin
if (xx==DungeonX-1 && yy==DungeonY)
begin
address <= 0;
DOn <=1;
end
if ((xx>DungeonX-1) && (xx<DungeonX+DungeonWidth) && (yy>DungeonY-1) && (yy<DungeonY+DungeonHeight))
begin
address <= (xx-DungeonX) + ((yy-DungeonY)*DungeonWidth);
DOn <=1;
end
else
DOn <=0;
end
end
endmodule