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
module Spiderman(
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
    reg [8:0] address; // 2^10 or 1024, need 34 x 27 = 918
    SpiderRom BeeVRom (
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
    localparam BeeWidth = 20; // Bee width in pixels
    localparam BeeHeight = 20; // Bee height in pixels
    localparam BeeSpeedX = 3;
    localparam BeeSpeedY = 3;
    
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
             if (sig_right == 1 && BeeX<640-BeeWidth) // Check for right button
                BeeX<=BeeX+BeeSpeedX;
             else
             if (sig_left == 1 && BeeX>0) // Check for left button
                BeeX<=BeeX-BeeSpeedX;
             if (sig_up == 1 && BeeY > 0) // Check for right button
                BeeY<=BeeY-BeeSpeedY;
             else
             if (sig_down == 1 && BeeY<480 - BeeHeight) // Check for left button
                BeeY<=BeeY+BeeSpeedY;
            end
      if (restart)
        begin
            BeeX <= 0;
            BeeY <= 25;
        end
    end
endmodule