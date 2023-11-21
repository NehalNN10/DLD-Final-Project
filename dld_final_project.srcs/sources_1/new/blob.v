`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2023 11:25:22
// Design Name: 
// Module Name: blob
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module blob(
    input wire i_clk,
    input wire i_rst,
    input wire [9:0] xx,
    input wire [9:0] yy,
    input wire aactive,
    output reg [1:0] BlobSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout
    );
    
    reg [9:0] BlobX = 100;
    reg [8:0] BlobY = 300;
    
    localparam BlobWidth = 100;
    localparam BlobHeight = 100;
    
    
    localparam BlobColor = 8'b11111111;
    
    // check if xx,yy are within the confines of the Bee character
always @ (posedge i_clk)
begin
if (aactive)
begin
if (xx==BlobX-1 && yy==BlobY)
begin
//dataout <= 0;
BlobSpriteOn <=1;
end
if ((xx>BlobX-1) && (xx<BlobX+BlobWidth) && (yy>BlobY-1) && (yy<BlobY+BlobHeight))
begin
//address <= (xx-BlobX) + ((yy-BlobY)*BlobWidth);
BlobSpriteOn <=1;
end
else
BlobSpriteOn <=0;
end
end
    
endmodule
