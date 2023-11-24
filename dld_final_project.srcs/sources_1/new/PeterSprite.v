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
    output reg [1:0] PSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout
    );

    // instantiate BeeRom code
    reg [9:0] address; // 2^10 or 1024, need 34 x 27 = 918
    PeterRom PRom (
        .address(address),
        .clk_pix(clk_pix),
        .dataout(dataout)
    );
    
    // setup character positions and sizes
    reg [9:0] PX = 0; // Bee X start position
    reg [8:0] PY = 300; // Bee Y start position
    localparam PWidth = 30; // Bee width in pixels
    localparam PHeight = 30; // Bee height in pixels
    
    // check if sx,sy are within the confines of the Bee character
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(sx==PX-2 && sy==PY)  // sx=295
                    begin
                        address <= 0;       // 1st Entry: address = 0
                        PSpriteOn <=1;
                    end
                if((sx>PX-2) && (sx<PX+PWidth-1) && (sy>PY-1) && (sy<PY+PHeight)) // sx = 296 to 329 = 33 Entries
                    begin
                        address <= (sx+2-PX) + ((sy-PY)*PWidth); // 2nd Entry: address = 296 + 2 - 297 = 1
                        PSpriteOn <=1;
                    end
                else
                    PSpriteOn <=0;
            end
    end
endmodule