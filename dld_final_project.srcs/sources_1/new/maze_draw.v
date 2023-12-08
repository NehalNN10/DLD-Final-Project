`timescale 1ns / 1ps

module maze_draw(
    input wire clk_d,
    input wire [9:0] pixel_x,
    input wire [9:0] pixel_y,
    input wire video_on,
    output reg [3:0] red=0,
    output reg [3:0] green=0,
    output reg [3:0] blue=0
    );
    
    reg [9:0] DenialX = 0;
    reg [8:0] DenialY = 0;
    
    localparam DenialWidth = 50;
    localparam DenialHeight = 50;
    
//    localparam DenialSpeedX = 3;
//    localparam DenialSpeedY = 3;
    
    // Instantiate Debounce
//    wire sig_right;
//    wire sig_left;
//    wire sig_up;
//    wire sig_down;
//    wire de;
//    wire restart;

    
    
    wire pathA = (DenialX >= 0 && DenialX <= 500 - DenialWidth && DenialY >= 200 && DenialY <= 380 - DenialHeight);
    wire pathB = (DenialX >= 350 && DenialX <= 640-DenialWidth && DenialY >= 50 && DenialY <= 200 - DenialHeight);
    
    wire collision = ~(pathA||pathB);
    
    wire collisionR = ~((DenialY >= 200 && DenialY <= 380 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX + DenialWidth <= 640));
    wire collisionL = ~((DenialY >= 200 && DenialY <= 380 && DenialX >= 0 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX >= 350));
    wire collisionU = ~((DenialY >= 200 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialX >= 350 && DenialX + DenialWidth <= 640));
    wire collisionD = ~((DenialY + DenialHeight <= 380 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY + DenialHeight <= 200 && DenialX >= 350 && DenialX + DenialWidth <= 640));
    
    wire d1 = (pixel_x > DenialX & pixel_y > DenialY & (pixel_x < DenialX + DenialWidth) & (pixel_y < DenialY + DenialHeight));
    
    wire pathA = (DenialX >= 0 && DenialX <= 500 - DenialWidth && DenialY >= 200 && DenialY <= 380 - DenialHeight);
    wire pathB = (DenialX >= 350 && DenialX <= 640-DenialWidth && DenialY >= 50 && DenialY <= 200 - DenialHeight);
    
    wire collision = ~(pathA||pathB);
    
    wire collisionR = ~((DenialY >= 200 && DenialY <= 380 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX + DenialWidth <= 640));
    wire collisionL = ~((DenialY >= 200 && DenialY <= 380 && DenialX >= 0 ) || (DenialY >= 50 && DenialY + DenialHeight <= 200 && DenialX >= 350));
    wire collisionU = ~((DenialY >= 200 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY >= 50 && DenialX >= 350 && DenialX + DenialWidth <= 640));
    wire collisionD = ~((DenialY + DenialHeight <= 380 && DenialX >= 0 && DenialX+DenialWidth <= 500 ) || (DenialY + DenialHeight <= 200 && DenialX >= 350 && DenialX + DenialWidth <= 640));
    
    wire d1 = (pixel_x > DenialX & pixel_y > DenialY & (pixel_x < DenialX + DenialWidth) & (pixel_y < DenialY + DenialHeight));
    
    //Block 1 Border
    wire b1 =  (pixel_x > 0 & pixel_y > 0 & (pixel_x <= 640 ) & (pixel_y <= 20));
    
    //Block 2 Border
    wire b2 =  (pixel_x > 0 & pixel_y > 60 & (pixel_x <= 20 ) & (pixel_y <= 480));
    
    //block 3 Border
    wire b3 =  (pixel_x > 620 & pixel_y > 20 & (pixel_x <= 640 ) & (pixel_y <= 420));
    
    //block 4 Border
    wire b4 =  (pixel_x > 20 & pixel_y > 460 & (pixel_x <= 640 ) & (pixel_y <= 480));
    
    //Blocks 
    wire m1 = (pixel_x > 60 & pixel_y > 60 & (pixel_x <= 80 ) & (pixel_y <= 120));
    
    wire m2 = (pixel_x > 80 & pixel_y > 60 & (pixel_x <= 220 ) & (pixel_y <= 80));
    
    wire m3 = (pixel_x > 220 & pixel_y > 20 & (pixel_x <= 240 ) & (pixel_y <= 80));
    
    wire m4 = (pixel_x > 120 & pixel_y > 120 & (pixel_x <= 280 ) & (pixel_y <= 140));
    
    wire m5 = (pixel_x > 280 & pixel_y > 60 & (pixel_x <= 300 ) & (pixel_y <= 200));
    
    wire m6 = (pixel_x > 180 & pixel_y > 180 & (pixel_x <= 280 ) & (pixel_y <= 200));
    
    wire m7 = (pixel_x > 300 & pixel_y > 120 & (pixel_x <= 460 ) & (pixel_y <= 140));
    
    wire m8 = (pixel_x > 340 & pixel_y > 60 & (pixel_x <= 360 ) & (pixel_y <= 120));
    
    wire m9 = (pixel_x > 360 & pixel_y > 60 & (pixel_x <= 400 ) & (pixel_y <= 80));
    
    wire m10 = (pixel_x > 440 & pixel_y > 60 & (pixel_x <= 460 ) & (pixel_y <= 120));
    
    wire m11 = (pixel_x > 500 & pixel_y > 60 & (pixel_x <= 520 ) & (pixel_y <= 120));
    
    wire m12 = (pixel_x > 520 & pixel_y > 100 & (pixel_x <= 560 ) & (pixel_y <= 120));
    
    wire m13 = (pixel_x > 560 & pixel_y > 60 & (pixel_x <= 580 ) & (pixel_y <= 120));
    
    wire m14 = (pixel_x > 580 & pixel_y > 100 & (pixel_x <= 620 ) & (pixel_y <= 120));
    
    wire m15 = (pixel_x > 500 & pixel_y > 160 & (pixel_x <= 520 ) & (pixel_y <= 320));
    
    wire m16 = (pixel_x > 520 & pixel_y > 160 & (pixel_x <= 620 ) & (pixel_y <= 180));
    
    wire m17 = (pixel_x > 560 & pixel_y > 180 & (pixel_x <= 580 ) & (pixel_y <= 220));
    
    wire m18 = (pixel_x > 560 & pixel_y > 260 & (pixel_x <= 580 ) & (pixel_y <= 380));
    
    wire m19 = (pixel_x > 500 & pixel_y > 360 & (pixel_x <= 560 ) & (pixel_y <= 380));
    
    wire m20 = (pixel_x > 580 & pixel_y > 360 & (pixel_x <= 620 ) & (pixel_y <= 380));
    
    wire m21 = (pixel_x > 60 & pixel_y > 160 & (pixel_x <= 80 ) & (pixel_y <= 240));

    wire m22 = (pixel_x > 80 & pixel_y > 220 & (pixel_x <= 120 ) & (pixel_y <= 240));
    
    wire m23 = (pixel_x > 120 & pixel_y > 180 & (pixel_x <= 140 ) & (pixel_y <= 300));
    
    wire m24 = (pixel_x > 60 & pixel_y > 280 & (pixel_x <= 120 ) & (pixel_y <= 300));
    
    wire m25 = (pixel_x > 60 & pixel_y > 300 & (pixel_x <= 80 ) & (pixel_y <= 420));
    
    wire m27 = (pixel_x > 20 & pixel_y > 400 & (pixel_x <= 60 ) & (pixel_y <= 420));
    
    wire m28 = (pixel_x > 340 & pixel_y > 180 & (pixel_x <= 440 ) & (pixel_y <= 200));
    
    wire m29 = (pixel_x > 440 & pixel_y > 180 & (pixel_x <= 460 ) & (pixel_y <= 240));
    
    wire m30 = (pixel_x > 240 & pixel_y > 240 & (pixel_x <= 460 ) & (pixel_y <= 260));
    
    wire m31 = (pixel_x > 440 & pixel_y > 260 & (pixel_x <= 460 ) & (pixel_y <= 300));
    
    wire m32 = (pixel_x > 200 & pixel_y > 300 & (pixel_x <= 460 ) & (pixel_y <= 320));
    
    wire m33 = (pixel_x > 180 & pixel_y > 240 & (pixel_x <= 200 ) & (pixel_y <= 320));
    
    wire m34 = (pixel_x > 300 & pixel_y > 320 & (pixel_x <= 320 ) & (pixel_y <= 360));
    
    wire m35 = (pixel_x > 260 & pixel_y > 360 & (pixel_x <= 460 ) & (pixel_y <= 380));
    
    wire m36 = (pixel_x > 240 & pixel_y > 360 & (pixel_x <= 260 ) & (pixel_y <= 420));
    
    wire m37 = (pixel_x > 120 & pixel_y > 400 & (pixel_x <= 240 ) & (pixel_y <= 420));
    
    wire m38 = (pixel_x > 160 & pixel_y > 360 & (pixel_x <= 180 ) & (pixel_y <= 400));
    
    wire m39 = (pixel_x > 300 & pixel_y > 420 & (pixel_x <= 320 ) & (pixel_y <= 460));
    
    wire m40 = (pixel_x > 320 & pixel_y > 440 & (pixel_x <= 360 ) & (pixel_y <= 460));
    
    wire m41 = (pixel_x > 440 & pixel_y > 420 & (pixel_x <= 460 ) & (pixel_y <= 460));
    
    wire m42 = (pixel_x > 500 & pixel_y > 420 & (pixel_x <= 520 ) & (pixel_y <= 460));
    
    wire m43 = (pixel_x > 560 & pixel_y > 420 & (pixel_x <= 580 ) & (pixel_y <= 460));
    

    
    // check if xx,yy are within the confines of Denial character
always @(posedge clk_d) 
        begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
            end
        else 
        begin
            red <= ((video_on & b1) || (video_on & b2) || (video_on & b3) || (video_on & b4) || (video_on & m1)|| (video_on & m2) || (video_on & m3) || (video_on & m4) || (video_on & m5) || (video_on & m6) || (video_on & m7) || (video_on & m8) || (video_on & m9) || (video_on & m10) || (video_on & m11) || (video_on & m12) || (video_on & m13) || (video_on & m14) || (video_on & m15) || (video_on & m16) || (video_on & m17) || (video_on & m18) || (video_on & m19) || (video_on & m20) || (video_on & m21) || (video_on & m22) || (video_on & m23) || (video_on & m24) || (video_on & m25) || (video_on & m27) || (video_on & m28) || (video_on & m29) || (video_on & m30) || (video_on & m31) || (video_on & m32) || (video_on & m33) || (video_on & m34) || (video_on & m35) || (video_on & m36) || (video_on & m37) || (video_on & m38) || (video_on & m39) || (video_on & m40) || (video_on & m41) || (video_on & m42) || (video_on & m43)) ? 4'hF : 4'h0;
//            red <= (video_on & b1) ? 4'hF : 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
        
//        if (pixel_x==639 && pixel_y==479) // check for movement once every frame
//             begin 
//             if (sig_right == 1 && ~collisionR) // Check for right button
//                DenialX<=DenialX+DenialSpeedX;
//             else
//             if (sig_left == 1 && ~collisionL) // Check for left button
//                DenialX<=DenialX-DenialSpeedX;
//             if (sig_up == 1 && ~collisionU) // Check for right button
//                DenialY<=DenialY-DenialSpeedY;
//             else
//             if (sig_down == 1 && ~collisionD) // Check for left button
//                DenialY<=DenialY+DenialSpeedY;
//        end
        
//        if (restart == 1 || (DenialX+DenialWidth==590 & (DenialY<=150 & DenialY+DenialHeight>=100))) // if Denial reaches the treasure
//            begin
//                DenialX <= 0;
//                DenialY <= 300;
//            end
end    
    
endmodule

//-----------------------------------------------------------------------------------
/*
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
    
    localparam DenialWidth = 25;
    localparam DenialHeight = 25;
    
    // Instantiate Debounce
    wire sig_right;
    wire sig_left;
    wire sig_up;
    wire sig_down;
    
    wire restart;
    
    
    
    
    
always @(posedge clk_d) begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
            end
        else begin
       
            red <= ((video_on & b1)|| (video_on & b2) || (video_on & b3) || (video_on & b4) || (video_on & m1)) || (video_on & m2) || (video_on & m3) || (video_on & m4) || (video_on & m5) || (video_on & m6) || (video_on & m7) || (video_on & m8) || (video_on & m9) || (video_on & m10) || (video_on & m11) || (video_on & m12) || (video_on & m13) || (video_on & m14) || (video_on & m15) || (video_on & m16) || (video_on & m17) || (video_on & m18) || (video_on & m19) || (video_on & m20) || (video_on & m21) || (video_on & m22) || (video_on & m23) || (video_on & m24) || (video_on & m25) || (video_on & m27) || (video_on & m28) || (video_on & m29) || (video_on & m30) || (video_on & m31) || (video_on & m32) || (video_on & m33) || (video_on & m34) || (video_on & m35) || (video_on & m36) || (video_on & m37) || (video_on & m38) || (video_on & m39) || (video_on & m40) || (video_on & m41) || (video_on & m42) || (video_on & m43)  ? 4'hF : 4'h0;
            green <= (video_on & d1) ? 4'hF : 4'h0;
//            blue <= (video_on & b4) ? 4'hF :4'h0;
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
        if (restart == 1)
            begin
                DenialX <= 0;
                DenialY <= 300;
//                restart <= 0;
            end
end    
    
endmodule
*/