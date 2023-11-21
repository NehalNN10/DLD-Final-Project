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
module MazeSprite(
    input wire clk_pix,
    input wire [9:0] sx, 
    input wire [9:0] sy,
    input wire de,
    output reg [1:0] MazeSpriteOn, // 1=on, 0=off
    output wire [7:0] dataout
    );

    // instantiate BeeRom code
    reg [15:0] address; // 2^10 or 1024, need 34 x 27 = 918
    MazeRom MazeVRom (
        .address(address),
        .clk_pix(clk_pix),
        .dataout(dataout)
    );
    
    // setup character positions and sizes
    reg [9:0] MazeX = 5; // Bee X start position
    reg [8:0] MazeY = 5; // Bee Y start position
    localparam MazeWidth = 243; // Bee width in pixels
    localparam MazeHeight = 178; // Bee height in pixels
    
    // check if sx,sy are within the confines of the Bee character
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(sx==MazeX-2 && sy==MazeY)  // sx=295
                    begin
                        address <= 0;       // 1st Entry: address = 0
                        MazeSpriteOn <=1;
                    end
                if((sx>MazeX-2) && (sx<MazeX+MazeWidth-1) && (sy>MazeY-1) && (sy<MazeY+MazeHeight)) // sx = 296 to 329 = 33 Entries
                    begin
                        address <= (sx+2-MazeX) + ((sy-MazeY)*MazeWidth); // 2nd Entry: address = 296 + 2 - 297 = 1
                        MazeSpriteOn <=1;
                    end
                else
                    MazeSpriteOn <=0;
            end
    end
endmodule