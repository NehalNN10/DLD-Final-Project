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

module maze_draw(
    input wire clk_d,
    input wire [9:0] pixel_x,
    input wire [9:0] pixel_y,
    input wire video_on,
    output reg [3:0] red=0,
    output reg [3:0] green=0,
    output reg [3:0] blue=0
    );
    
    reg [9:0] BlobX = 100;
    reg [8:0] BlobY = 300;
    
    localparam BlobWidth = 400;
    localparam BlobHeight = 200;
    
//    localparam BlobColor = 8'b11111111;
    
    // check if xx,yy are within the confines of the Bee character
always @(posedge clk_d) begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
            end
        else begin
        
//        if(pixel_x[5] ^ pixel_y[5]) begin
//            checkerboard_pattern <= 1'b1;
//        end else begin
            red <= (video_on & (pixel_x > BlobX & pixel_y > BlobY & (pixel_x < BlobX + BlobWidth) & (pixel_y < BlobY + BlobHeight) )) ? 4'hF : 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
    end    
    
endmodule