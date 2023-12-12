//----------------------------------------------
// BeeSprite.v Module         
// Digilent Basys 3             
// Bee Invaders Tutorial_2
// Onboard clock 100MHz
// VGA Resolution: 640x480 @ 60Hz
// Pixel Clock 25.2MHz
//----------------------------------------------
`timescale 1ns / 1ps

// Setup BeeSprite module
module PeterSprite(
    input wire clk_pix,
    input wire [9:0] sx, 
    input wire [9:0] sy,
    input wire de,
    input wire btnR, // right button
    input wire btnL, //left button 
    input wire btnU, // up button
    input wire btnD, // down button
    input wire rstBtn,
    output reg [1:0] BeeSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout
    );

    // instantiate BeeRom code
    reg [9:0] address; // 2^10 or 1024, need 34 x 27 = 918
    PeterRom BeeVRom (
        .address(address),
        .clk_pix(clk_pix),
        .dataout(dataout)
    );
    
    // Instantiate Debounce
    wire sig_right;
    wire sig_left;
    wire sig_up;
    wire sig_down;
//    wire de;
    wire restart;
    
    Debounce deb_right (
    .clk_pix(clk_pix),
    .btn(btnR),
    .out(sig_right)
    );
    Debounce deb_left (
    .clk_pix(clk_pix),
    .btn(btnL),
    .out(sig_left)
    );
    Debounce deb_up (
    .clk_pix(clk_pix),
    .btn(btnU),
    .out(sig_up)
    );
    Debounce deb_down (
    .clk_pix(clk_pix),
    .btn(btnD),
    .out(sig_down)
    );
    Debounce deb_rst(
    .clk_pix(clk_pix), 
    .btn(rstBtn),
    .out(restart)
    );
    
    // setup character positions and sizes
    reg [9:0] BeeX = 0; // Bee X start position
    reg [8:0] BeeY = 25; // Bee Y start position
    localparam BeeWidth = 30; // Bee width in pixels
    localparam BeeHeight = 30; // Bee height in pixels
    localparam BeeSpeedX = 3;
    localparam BeeSpeedY = 3;
    
//    wire collisionR = (BeeY>=60 && BeeY<=120 && BeeX+20==60 ) || (BeeY+20>=60 && BeeY+20<=120 && BeeX+20==60) || (BeeY>=60 && BeeY<=80 && BeeX+20==80 ) || (BeeY+20>=60 && BeeY+20<=80 && BeeX+20==80) || (BeeY>=20 && BeeY<=80 && BeeX+20==220 ) || (BeeY+20>=20 && BeeY+20<=80 && BeeX+20==220) || (BeeY>=120 && BeeY<=140 && BeeX+20==120 ) || (BeeY+20>=120 && BeeY+20<=140 && BeeX+20==120) || (BeeY>=60 && BeeY<=200 && BeeX+20==280 ) || (BeeY+20>=60 && BeeY+20<=200 && BeeX+20==280) || (BeeY>=180 && BeeY<=200 && BeeX+20==180 ) || (BeeY+20>=180 && BeeY+20<=200 && BeeX+20==180) || (BeeY>=120 && BeeY<=140 && BeeX+20==300 ) || (BeeY+20>=120 && BeeY+20<=140 && BeeX+20==300) || (BeeY>=60 && BeeY<=120 && BeeX+20==340 ) || (BeeY+20>=60 && BeeY+20<=120 && BeeX+20==340) || (BeeY>=60 && BeeY<=80 && BeeX+20==360 ) || (BeeY+20>=60 && BeeY+20<=80 && BeeX+20==360) || (BeeY>=60 && BeeY<=120 && BeeX+20==440 ) || (BeeY+20>=60 && BeeY+20<=120 && BeeX+20==440) || (BeeY>=60 && BeeY<=120 && BeeX+20==500 ) || (BeeY+20>=60 && BeeY+20<=120 && BeeX+20==500) || (BeeY>=100 && BeeY<=120 && BeeX+20==520 ) || (BeeY+20>=100 && BeeY+20<=120 && BeeX+20==520) || (BeeY>=60 && BeeY<=120 && BeeX+20==560 ) || (BeeY+20>=60 && BeeY+20<=120 && BeeX+20==560) || (BeeY>=100 && BeeY<=120 && BeeX+20==580 ) || (BeeY+20>=100 && BeeY+20<=120 && BeeX+20==580) || (BeeY>=160 && BeeY<=320 && BeeX+20==500 ) || (BeeY+20>=160 && BeeY+20<=320 && BeeX+20==500) || (BeeY>=160 && BeeY<=180 && BeeX+20==520 ) || (BeeY+20>=160 && BeeY+20<=180 && BeeX+20==520) || (BeeY>=180 && BeeY<=220 && BeeX+20==560 ) || (BeeY+20>=180 && BeeY+20<=220 && BeeX+20==560) || (BeeY>=240 && BeeY<=380 && BeeX+20==560 ) || (BeeY+20>=240 && BeeY+20<=380 && BeeX+20==560) || (BeeY>=360 && BeeY<=380 && BeeX+20==500 ) || (BeeY+20>=360 && BeeY+20<=380 && BeeX+20==500) || (BeeY>=360 && BeeY<=380 && BeeX+20==580 ) || (BeeY+20>=360 && BeeY+20<=380 && BeeX+20==580) || (BeeY>=160 && BeeY<=240 && BeeX+20==60 ) || (BeeY+20>=160 && BeeY+20<=240 && BeeX+20==60) || (BeeY>=220 && BeeY<=240 && BeeX+20==80 ) || (BeeY+20>=220 && BeeY+20<=240 && BeeX+20==80) || (BeeY>=180 && BeeY<=300 && BeeX+20==120 ) || (BeeY+20>=180 && BeeY+20<=300 && BeeX+20==120) || (BeeY>=280 && BeeY<=300 && BeeX+20==60 ) || (BeeY+20>=280 && BeeY+20<=300 && BeeX+20==60) || (BeeY>=300 && BeeY<=420 && BeeX+20==60 ) || (BeeY+20>=300 && BeeY+20<=420 && BeeX+20=60) || (BeeY>=400 && BeeY<=420 && BeeX+20==20 ) || (BeeY+20>=400 && BeeY+20<=420 && BeeX+20==20) || (BeeY>=180 && BeeY<=200 && BeeX+20==340 ) || (BeeY+20>=180 && BeeY+20<=200 && BeeX+20==340) || (BeeY>=180 && BeeY<=240 && BeeX+20==440 ) || (BeeY+20>=180 && BeeY+20<=240 && BeeX+20==440) || (BeeY>=240 && BeeY<=260 && BeeX+20==240 ) || (BeeY+20>=240 && BeeY+20<=260 && BeeX+20==240) || (BeeY>=260 && BeeY<=300 && BeeX+20==440 ) || (BeeY+20>=260 && BeeY+20<=300 && BeeX+20==440) || (BeeY>=300 && BeeY<=320 && BeeX+20==200 ) || (BeeY+20>=300 && BeeY+20<=320 && BeeX+20==200) || (BeeY>=240 && BeeY<=320 && BeeX+20==180 ) || (BeeY+20>=240 && BeeY+20<=320 && BeeX+20==180) || (BeeY>=320 && BeeY<=360 && BeeX+20==300 ) || (BeeY+20>=320 && BeeY+20<=360 && BeeX+20==300) || (BeeY>=360 && BeeY<=380 && BeeX+20==260 ) || (BeeY+20>=360 && BeeY+20<=380 && BeeX+20==260) || (BeeY>=360 && BeeY<=420 && BeeX+20==240 ) || (BeeY+20>=360 && BeeY+20<=420 && BeeX+20==240) || (BeeY>=400 && BeeY<=420 && BeeX+20==120 ) || (BeeY+20>=400 && BeeY+20<=420 && BeeX+20==120) || (BeeY>=360 && BeeY<=400 && BeeX+20==160 ) || (BeeY+20>=360 && BeeY+20<=400 && BeeX+20==160) || (BeeY>=420 && BeeY<=460 && BeeX+20==300 ) || (BeeY+20>=420 && BeeY+20<=460 && BeeX+20==300) || (BeeY>=440 && BeeY<=460 && BeeX+20==320 ) || (BeeY+20>=440 && BeeY+20<=460 && BeeX+20==320) || (BeeY>=420 && BeeY<=460 && BeeX+20==440 ) || (BeeY+20>=420 && BeeY+20<=460 && BeeX+20==440) || (BeeY>=420 && BeeY<=460 && BeeX+20==500 ) || (BeeY+20>=420 && BeeY+20<=460 && BeeX+20==500) || (BeeY>=420 && BeeY<=460 && BeeX+20==560 ) || (BeeY+20>=420 && BeeY+20<=460 && BeeX+20==560) || (BeeY>=0 && BeeY<=20 && BeeX+20==0 ) || (BeeY+20>=0 && BeeY+20<=20 && BeeX+20==0) || (BeeY>=60 && BeeY<=480 && BeeX+20==0 ) || (BeeY+20>=60 && BeeY+20<=480 && BeeX+20==0) || (BeeY>=620 && BeeY<=640 && BeeX+20==0 ) || (BeeY+20>=620 && BeeY+20<=640 && BeeX+20==0) || (BeeY>=460 && BeeY<=480 && BeeX+20==0 ) || (BeeY+20>=460 && BeeY+20<=480 && BeeX+20==0);
    
    wire collisionR = (BeeY > 0 && BeeY <= 20 && BeeX == 0)||(BeeY > 60 && BeeY <= 480 && BeeX == 0)||(BeeY > 20 && BeeY <= 420 && BeeX == 620)||(BeeY > 460 && BeeY <= 480 && BeeX == 20)||(BeeY > 60 && BeeY <= 120 && BeeX == 60)||(BeeY > 60 && BeeY <= 80 && BeeX == 80)||(BeeY > 20 && BeeY <= 80 && BeeX == 220)||(BeeY > 120 && BeeY <= 140 && BeeX == 120)||(BeeY > 60 && BeeY <= 200 && BeeX == 280)||(BeeY > 180 && BeeY <= 200 && BeeX == 180)||(BeeY > 120 && BeeY <= 140 && BeeX == 300)||(BeeY > 60 && BeeY <= 120 && BeeX == 340)||(BeeY > 60 && BeeY <= 80 && BeeX == 360)||(BeeY > 60 && BeeY <= 120 && BeeX == 440)||(BeeY > 60 && BeeY <= 120 && BeeX == 500)||(BeeY > 100 && BeeY <= 120 && BeeX == 520)||(BeeY > 60 && BeeY <= 120 && BeeX == 560)||(BeeY > 100 && BeeY <= 120 && BeeX == 580)||(BeeY > 160 && BeeY <= 320 && BeeX == 500)||(BeeY > 160 && BeeY <= 180 && BeeX == 520)||(BeeY > 180 && BeeY <= 220 && BeeX == 560)||(BeeY > 260 && BeeY <= 380 && BeeX == 560)||(BeeY > 360 && BeeY <= 380 && BeeX == 500)||(BeeY > 360 && BeeY <= 380 && BeeX == 580)||(BeeY > 160 && BeeY <= 240 && BeeX == 60)||(BeeY > 220 && BeeY <= 240 && BeeX == 80)||(BeeY > 180 && BeeY <= 300 && BeeX == 120)||(BeeY > 280 && BeeY <= 300 && BeeX == 60)||(BeeY > 300 && BeeY <= 420 && BeeX == 60)||(BeeY > 400 && BeeY <= 420 && BeeX == 20)||(BeeY > 180 && BeeY <= 200 && BeeX == 340)||(BeeY > 180 && BeeY <= 240 && BeeX == 440)||(BeeY > 240 && BeeY <= 260 && BeeX == 240)||(BeeY > 260 && BeeY <= 300 && BeeX == 440)||(BeeY > 300 && BeeY <= 320 && BeeX == 200)||(BeeY > 240 && BeeY <= 320 && BeeX == 180)||(BeeY > 320 && BeeY <= 360 && BeeX == 300)||(BeeY > 360 && BeeY <= 380 && BeeX == 260)||(BeeY > 360 && BeeY <= 420 && BeeX == 240)||(BeeY > 400 && BeeY <= 420 && BeeX == 120)||(BeeY > 360 && BeeY <= 400 && BeeX == 160)||(BeeY > 420 && BeeY <= 460 && BeeX == 300)||(BeeY > 440 && BeeY <= 460 && BeeX == 320)||(BeeY > 420 && BeeY <= 460 && BeeX == 440)||(BeeY > 420 && BeeY <= 460 && BeeX == 500)||(BeeY > 420 && BeeY <= 46 && BeeX == 560);
    wire collisionL = (BeeY > 0 && BeeY <= 20 && BeeX == 640)||(BeeY > 60 && BeeY <= 480 && BeeX == 20)||(BeeY > 20 && BeeY <= 420 && BeeX == 640)||(BeeY > 460 && BeeY <= 480 && BeeX == 640)||(BeeY > 60 && BeeY <= 120 && BeeX == 80)||(BeeY > 60 && BeeY <= 80 && BeeX == 220)||(BeeY > 20 && BeeY <= 80 && BeeX == 240)||(BeeY > 120 && BeeY <= 140 && BeeX == 280)||(BeeY > 60 && BeeY <= 200 && BeeX == 300)||(BeeY > 180 && BeeY <= 200 && BeeX == 280)||(BeeY > 120 && BeeY <= 140 && BeeX == 460)||(BeeY > 60 && BeeY <= 120 && BeeX == 360)||(BeeY > 60 && BeeY <= 80 && BeeX == 400)||(BeeY > 60 && BeeY <= 120 && BeeX == 460)||(BeeY > 60 && BeeY <= 120 && BeeX == 520)||(BeeY > 100 && BeeY <= 120 && BeeX == 560)||(BeeY > 60 && BeeY <= 120 && BeeX == 580)||(BeeY > 100 && BeeY <= 120 && BeeX == 620)||(BeeY > 160 && BeeY <= 320 && BeeX == 520)||(BeeY > 160 && BeeY <= 180 && BeeX == 620)||(BeeY > 180 && BeeY <= 220 && BeeX == 580)||(BeeY > 260 && BeeY <= 380 && BeeX == 580)||(BeeY > 360 && BeeY <= 380 && BeeX == 560)||(BeeY > 360 && BeeY <= 380 && BeeX == 620)||(BeeY > 160 && BeeY <= 240 && BeeX == 80)||(BeeY > 220 && BeeY <= 240 && BeeX == 120)||(BeeY > 180 && BeeY <= 300 && BeeX == 140)||(BeeY > 280 && BeeY <= 300 && BeeX == 120)||(BeeY > 300 && BeeY <= 420 && BeeX == 80)||(BeeY > 400 && BeeY <= 420 && BeeX == 60)||(BeeY > 180 && BeeY <= 200 && BeeX == 440)||(BeeY > 180 && BeeY <= 240 && BeeX == 460)||(BeeY > 240 && BeeY <= 260 && BeeX == 460)||(BeeY > 260 && BeeY <= 300 && BeeX == 460)||(BeeY > 300 && BeeY <= 320 && BeeX == 460)||(BeeY > 240 && BeeY <= 320 && BeeX == 200)||(BeeY > 320 && BeeY <= 360 && BeeX == 320)||(BeeY > 360 && BeeY <= 380 && BeeX == 460)||(BeeY > 360 && BeeY <= 420 && BeeX == 260)||(BeeY > 400 && BeeY <= 420 && BeeX == 240)||(BeeY > 360 && BeeY <= 400 && BeeX == 180)||(BeeY > 420 && BeeY <= 460 && BeeX == 320)||(BeeY > 440 && BeeY <= 460 && BeeX == 360)||(BeeY > 420 && BeeY <= 460 && BeeX == 460)||(BeeY > 420 && BeeY <= 460 && BeeX == 520)||(BeeY > 420 && BeeY <= 46 && BeeX == 580);
    wire collisionU = (BeeX > 0 && BeeX <= 640 && BeeY == 0)||(BeeX > 0 && BeeX <= 20 && BeeY == 60)||(BeeX > 620 && BeeX <= 640 && BeeY == 20)||(BeeX > 20 && BeeX <= 640 && BeeY == 460)||(BeeX > 60 && BeeX <= 80 && BeeY == 60)||(BeeX > 80 && BeeX <= 220 && BeeY == 60)||(BeeX > 220 && BeeX <= 240 && BeeY == 20)||(BeeX > 120 && BeeX <= 280 && BeeY == 120)||(BeeX > 280 && BeeX <= 300 && BeeY == 60)||(BeeX > 180 && BeeX <= 280 && BeeY == 180)||(BeeX > 300 && BeeX <= 460 && BeeY == 120)||(BeeX > 340 && BeeX <= 360 && BeeY == 60)||(BeeX > 360 && BeeX <= 400 && BeeY == 60)||(BeeX > 440 && BeeX <= 460 && BeeY == 60)||(BeeX > 500 && BeeX <= 520 && BeeY == 60)||(BeeX > 520 && BeeX <= 560 && BeeY == 100)||(BeeX > 560 && BeeX <= 580 && BeeY == 60)||(BeeX > 580 && BeeX <= 620 && BeeY == 100)||(BeeX > 500 && BeeX <= 520 && BeeY == 160)||(BeeX > 520 && BeeX <= 620 && BeeY == 160)||(BeeX > 560 && BeeX <= 580 && BeeY == 180)||(BeeX > 560 && BeeX <= 580 && BeeY == 260)||(BeeX > 500 && BeeX <= 560 && BeeY == 360)||(BeeX > 580 && BeeX <= 620 && BeeY == 360)||(BeeX > 60 && BeeX <= 80 && BeeY == 160)||(BeeX > 80 && BeeX <= 120 && BeeY == 220)||(BeeX > 120 && BeeX <= 140 && BeeY == 180)||(BeeX > 60 && BeeX <= 120 && BeeY == 280)||(BeeX > 60 && BeeX <= 80 && BeeY == 300)||(BeeX > 20 && BeeX <= 60 && BeeY == 400)||(BeeX > 340 && BeeX <= 440 && BeeY == 180)||(BeeX > 440 && BeeX <= 460 && BeeY == 180)||(BeeX > 240 && BeeX <= 460 && BeeY == 240)||(BeeX > 440 && BeeX <= 460 && BeeY == 260)||(BeeX > 200 && BeeX <= 460 && BeeY == 300)||(BeeX > 180 && BeeX <= 200 && BeeY == 240)||(BeeX > 300 && BeeX <= 320 && BeeY == 320)||(BeeX > 260 && BeeX <= 460 && BeeY == 360)||(BeeX > 240 && BeeX <= 260 && BeeY == 360)||(BeeX > 120 && BeeX <= 240 && BeeY == 400)||(BeeX > 160 && BeeX <= 180 && BeeY == 360)||(BeeX > 300 && BeeX <= 320 && BeeY == 420)||(BeeX > 320 && BeeX <= 360 && BeeY == 440)||(BeeX > 440 && BeeX <= 460 && BeeY == 420)||(BeeX > 500 && BeeX <= 520 && BeeY == 420)||(BeeX > 560 && BeeX <= 580 && BeeY == 420);
    wire collisionD = (BeeX > 0 && BeeX <= 640 && BeeY == 20)||(BeeX > 0 && BeeX <= 20 && BeeY == 480)||(BeeX > 620 && BeeX <= 640 && BeeY == 420)||(BeeX > 20 && BeeX <= 640 && BeeY == 480)||(BeeX > 60 && BeeX <= 80 && BeeY == 120)||(BeeX > 80 && BeeX <= 220 && BeeY == 80)||(BeeX > 220 && BeeX <= 240 && BeeY == 80)||(BeeX > 120 && BeeX <= 280 && BeeY == 140)||(BeeX > 280 && BeeX <= 300 && BeeY == 200)||(BeeX > 180 && BeeX <= 280 && BeeY == 200)||(BeeX > 300 && BeeX <= 460 && BeeY == 140)||(BeeX > 340 && BeeX <= 360 && BeeY == 120)||(BeeX > 360 && BeeX <= 400 && BeeY == 80)||(BeeX > 440 && BeeX <= 460 && BeeY == 120)||(BeeX > 500 && BeeX <= 520 && BeeY == 120)||(BeeX > 520 && BeeX <= 560 && BeeY == 120)||(BeeX > 560 && BeeX <= 580 && BeeY == 120)||(BeeX > 580 && BeeX <= 620 && BeeY == 120)||(BeeX > 500 && BeeX <= 520 && BeeY == 320)||(BeeX > 520 && BeeX <= 620 && BeeY == 180)||(BeeX > 560 && BeeX <= 580 && BeeY == 220)||(BeeX > 560 && BeeX <= 580 && BeeY == 380)||(BeeX > 500 && BeeX <= 560 && BeeY == 380)||(BeeX > 580 && BeeX <= 620 && BeeY == 380)||(BeeX > 60 && BeeX <= 80 && BeeY == 240)||(BeeX > 80 && BeeX <= 120 && BeeY == 240)||(BeeX > 120 && BeeX <= 140 && BeeY == 300)||(BeeX > 60 && BeeX <= 120 && BeeY == 300)||(BeeX > 60 && BeeX <= 80 && BeeY == 420)||(BeeX > 20 && BeeX <= 60 && BeeY == 420)||(BeeX > 340 && BeeX <= 440 && BeeY == 200)||(BeeX > 440 && BeeX <= 460 && BeeY == 240)||(BeeX > 240 && BeeX <= 460 && BeeY == 260)||(BeeX > 440 && BeeX <= 460 && BeeY == 300)||(BeeX > 200 && BeeX <= 460 && BeeY == 320)||(BeeX > 180 && BeeX <= 200 && BeeY == 320)||(BeeX > 300 && BeeX <= 320 && BeeY == 360)||(BeeX > 260 && BeeX <= 460 && BeeY == 380)||(BeeX > 240 && BeeX <= 260 && BeeY == 420)||(BeeX > 120 && BeeX <= 240 && BeeY == 420)||(BeeX > 160 && BeeX <= 180 && BeeY == 400)||(BeeX > 300 && BeeX <= 320 && BeeY == 460)||(BeeX > 320 && BeeX <= 360 && BeeY == 460)||(BeeX > 440 && BeeX <= 460 && BeeY == 460)||(BeeX > 500 && BeeX <= 520 && BeeY == 460)||(BeeX > 560 && BeeX <= 580 && BeeY == 460);
    
    // check if sx,sy are within the confines of the Bee character
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(sx==BeeX && sy==BeeY)  // sx=295
                    begin
                        address <= 0;       // 1st Entry: address = 0
                        BeeSpriteOn <=1;
                    end
                if((sx>BeeX) && (sx<BeeX+BeeWidth-1) && (sy>BeeY-1) && (sy<BeeY+BeeHeight)) // sx = 296 to 329 = 33 Entries
                    begin
                        address <= (sx-BeeX) + ((sy-BeeY)*BeeWidth); // 2nd Entry: address = 296 + 2 - 297 = 1
                        BeeSpriteOn <=1;
                    end
                else
                    BeeSpriteOn <=0;
            end
        if (sx==639 && sy==479) // check for movement once every frame
             begin 
             if (sig_right == 1 && ~collisionR) // Check for right button
                BeeX<=BeeX+BeeSpeedX;
             else
             if (sig_left == 1 && ~collisionL) // Check for left button
                BeeX<=BeeX-BeeSpeedX;
             if (sig_up == 1 && ~collisionU) // Check for right button
                BeeY<=BeeY-BeeSpeedY;
             else
             if (sig_down == 1 && ~collisionD) // Check for left button
                BeeY<=BeeY+BeeSpeedY;
            end
      if (restart)
        begin
            BeeX <= 0;
            BeeY <= 25;
        end
    end
endmodule