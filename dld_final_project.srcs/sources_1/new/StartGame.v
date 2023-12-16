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
module StartGame(
    input wire clk_pix,
    input wire [9:0] sx, 
    input wire [9:0] sy,
    input wire de,
    output reg [1:0] screenOn, // 1=on, 0=off
    output wire [7:0] dataout
    );

    // instantiate BeeRom code
    reg [18:0] address; // 2^10 or 1024, need 34 x 27 = 918
    start_rom sRom (
        .address(address),
        .clk_pix(clk_pix),
        .dataout(dataout)
    );
    
    // setup character positions and sizes
    reg [9:0] screenX = 0; // Bee X start position
    reg [8:0] screenY = 0; // Bee Y start position
    localparam screenHeight = 480;
    localparam screenWidth = 480;
    
    // check if sx,sy are within the confines of the Bee character
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(sx==screenX && sy==screenY)  // sx=295
                    begin
                        address <= 0;       // 1st Entry: address = 0
                        screenOn <=1;
                    end
                if((sx>screenX) && (sx<screenX+screenWidth-1) && (sy>screenY) && (sy<screenY+screenHeight)) // sx = 296 to 329 = 33 Entries
                    begin
                        address <= (sx-screenX) + ((sy-screenY)*screenWidth); // 2nd Entry: address = 296 + 2 - 297 = 1
                        screenOn <=1;
                    end
                else
                    screenOn <=0;
            end
    end
endmodule