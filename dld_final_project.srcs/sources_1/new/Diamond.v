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
module Diamond(
    input wire clk_pix,
    input wire [9:0] sx, 
    input wire [9:0] sy,
    input wire [9:0] BeeX,
    input wire [9:0] BeeY,
    input wire de,
    input wire rstBtn,
    output reg [1:0] BeeSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout
    );

    // instantiate BeeRom code
    reg [8:0] address; // 2^10 or 1024, need 34 x 27 = 918
    DiamondRom BeeVRom (
        .address(address),
        .clk_pix(clk_pix),
        .dataout(dataout)
    );
    
    wire restart;
    
    Debounce deb_rst(
    .clk_pix(clk_pix), 
    .btn(rstBtn),
    .out(restart)
    );
    
    
    // setup character positions and sizes
//    reg [9:0] BeeX = 300; // Bee X start position
//    reg [8:0] BeeY = 240; // Bee Y start position
    localparam BeeWidth = 20; // Bee width in pixels
    localparam BeeHeight = 20; // Bee height in pixels
    
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
//      if (restart)
//        begin
//            BeeX <= 300;
//            BeeY <= 240;
//        end
    end
endmodule