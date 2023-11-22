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
    input wire btnR, // right button
    input wire btnL, //left button 
    input wire btnU, // up button
    input wire btnD, // down button
    input wire rstBtn, 
    output reg [3:0] red=0,
    output reg [3:0] green=0,
    output reg [3:0] blue=0
    );
    
    reg [9:0] DenialX = 0;
    reg [8:0] DenialY = 300;
    
    localparam DenialWidth = 50;
    localparam DenialHeight = 50;
    
    // Instantiate Debounce
    wire sig_right;
    wire sig_left;
    wire sig_up;
    wire sig_down;
    
    wire restart;
    
    Debounce deb_right (
    .clk_pix(clk_d),
    .btn(btnR),
    .out(sig_right)
    );
    Debounce deb_left (
    .clk_pix(clk_d),
    .btn(btnL),
    .out(sig_left)
    );
    Debounce deb_up (
    .clk_pix(clk_d),
    .btn(btnU),
    .out(sig_up)
    );
    Debounce deb_down (
    .clk_pix(clk_d),
    .btn(btnD),
    .out(sig_down)
    );
    Debounce deb_rst(
    .clk_pix(clk_d),
    .btn(rstBtn),
    .out(restart)
    );
    
//    reg restart = 0;
    
    wire pathA = (DenialX >= 0 && DenialX <= 500 - DenialWidth && DenialY >= 200 && DenialY <= 380 - DenialHeight);
    wire pathB = (DenialX >= 350 && DenialX <= 640-DenialWidth && DenialY >= 50 && DenialY <= 200 - DenialHeight);
    
    wire collision = ~(pathA||pathB);
    
    wire collisionR = ~((DenialY >= 200 && DenialY <= 380 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX + DenialWidth <= 640));
    wire collisionL = ~((DenialY >= 200 && DenialY <= 380 && DenialX >= 0 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX >= 350));
    wire collisionU = ~((DenialY >= 200 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialX >= 350 && DenialX + DenialWidth <= 640));
    wire collisionD = ~((DenialY + DenialHeight <= 380 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY + DenialHeight <= 200 && DenialX >= 350 && DenialX + DenialWidth <= 640));
//    wire collisionY = ;
    
    wire d1 = (pixel_x > DenialX & pixel_y > DenialY & (pixel_x < DenialX + DenialWidth) & (pixel_y < DenialY + DenialHeight));
    
    wire m1 =  (pixel_x > 0 & pixel_y > 0 & (pixel_x <= 350 ) & (pixel_y <= 200));
    
    //block B
    wire m2 =  (pixel_x > 0 & pixel_y > 380 & (pixel_x < 640 ) & (pixel_y < 480));
    
    //block C
    wire m3 =  (pixel_x > 350 & pixel_y > 0 & (pixel_x < 640 ) & (pixel_y < 50));
    
    //block D
    wire m4 =  (pixel_x > 500 & pixel_y > 200 & (pixel_x < 640 ) & (pixel_y <= 380));
   
    //Treasure
    wire m5 =  (pixel_x > 590 & pixel_y > 100 & (pixel_x < 640 ) & (pixel_y < 150));

    
//    localparam BlobColor = 8'b11111111;
    
    // check if xx,yy are within the confines of the Bee character
always @(posedge clk_d) begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
            end
        else begin
            red <= ((video_on & m1)|| (video_on & m2) || (video_on & m3) || (video_on & m4)) ? 4'hF : 4'h0;
            green <= (video_on & d1) ? 4'hF : 4'h0;
            blue <= (video_on & m5) ? 4'hF :4'h0;
        end
        if (pixel_x==639 && pixel_y==479) // check for movement once every frame
             begin 
             if (sig_right == 1 && ~collisionR) // Check for right button
                DenialX<=DenialX+1;
             else
             if (sig_left == 1 && ~collisionL) // Check for left button
                DenialX<=DenialX-1;
             if (sig_up == 1 && ~collisionU) // Check for right button
                DenialY<=DenialY-1;
             else
             if (sig_down == 1 && ~collisionD) // Check for left button
                DenialY<=DenialY+1;
        end 
        if (restart == 1 || (DenialX+DenialWidth==590 & (DenialY<=150 & DenialY+DenialHeight>=100)))
            begin
                DenialX <= 0;
                DenialY <= 300;
//                restart <= 0;
            end
end    
    
endmodule