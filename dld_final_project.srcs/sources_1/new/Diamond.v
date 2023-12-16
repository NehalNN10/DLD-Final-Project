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
    input wire de,
    input wire rstBtn,
    input wire BeesX,
    input wire BeesY,
    output reg [1:0] diamond_on_1, // 1=on, 0=off
    output reg [1:0] diamond_on_2,
    output reg [1:0] diamond_on_3,
    output wire [7:0] dataout_1,
    output wire [7:0] dataout_2,
    output wire [7:0] dataout_3
    );

    // instantiate BeeRom code
    reg [8:0] address_1; // 2^10 or 1024, need 34 x 27 = 918
    reg [8:0] address_2; // 2^10 or 1024, need 34 x 27 = 918
    reg [8:0] address_3; // 2^10 or 1024, need 34 x 27 = 918
    DiamondRom diamond_rom_1 (
        .address(address_1),
        .clk_pix(clk_pix),
        .dataout(dataout_1)
    );
    DiamondRom diamond_rom_2(
        .address(address_2),
        .clk_pix(clk_pix),
        .dataout(dataout_2)
    );
    DiamondRom diamond_rom_3(
        .address(address_3),
        .clk_pix(clk_pix),
        .dataout(dataout_3)
    );
    
    
    
    wire restart;
    
    Debounce deb_rst(
    .clk_pix(clk_pix), 
    .btn(rstBtn),
    .out(restart)
    );
    
    wire square = ((sx-BeesX-10)*(sx-BeesX-10) + (sy-BeesY-10)*(sy-BeesY-10))<=3600;
    
    // setup character positions and sizes
    reg [9:0] diamond_one_x = 300; // Bee X start position
    reg [8:0] diamond_one_y = 200; // Bee Y start position
    reg [9:0] diamond_two_x = 0; // Bee X start position
    reg [8:0] diamond_two_y = 340;
    reg [9:0] diamond_three_x = 500; // Bee X start position
    reg [8:0] diamond_three_y = 140;
    
    localparam BeeWidth = 20; // Bee width in pixels
    localparam BeeHeight = 23; // Bee height in pixels
    
    // check if sx,sy are within the confines of the Bee character
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(sx==diamond_one_x && sy==diamond_one_y)  // sx=295
                    begin
                        address_1 <= 0;       // 1st Entry: address = 0
                        diamond_on_1 <=1;
                    end
                if((sx>diamond_one_x) && (sx<diamond_one_x+19) && (sy>diamond_one_y-1) && (sy<diamond_one_y+20)) // sx = 296 to 329 = 33 Entries
                    begin
                        address_1 <= (sx-diamond_one_x) + ((sy-diamond_one_y)*20); // 2nd Entry: address = 296 + 2 - 297 = 1
                        diamond_on_1 <=1;
                    end
                else
                    diamond_on_1 <=0;
                 
                if(sx==diamond_two_x && sy==diamond_two_y)  // sx=295
                    begin
                        address_2 <= 0;       // 1st Entry: address = 0
                        diamond_on_2 <=1;
                    end
                if((sx>diamond_two_x) && (sx<diamond_two_x+19) && (sy>diamond_two_y-1) && (sy<diamond_two_y+20)) // sx = 296 to 329 = 33 Entries
                    begin
                        address_2 <= (sx-diamond_two_x) + ((sy-diamond_two_y)*20); // 2nd Entry: address = 296 + 2 - 297 = 1
                        diamond_on_2 <=1;
                    end
                else
                    diamond_on_2 <=0;
                 
                if(sx==diamond_three_x && sy==diamond_three_y)  // sx=295
                    begin
                        address_3 <= 0;       // 1st Entry: address = 0
                        diamond_on_3 <=1;
                    end
                if((sx>diamond_three_x) && (sx<diamond_three_x+19) && (sy>diamond_three_y-1) && (sy<diamond_three_y+20)) // sx = 296 to 329 = 33 Entries
                    begin
                        address_3 <= (sx-diamond_three_x) + ((sy-diamond_three_y)*20); // 2nd Entry: address = 296 + 2 - 297 = 1
                        diamond_on_3 <=1;
                    end
                else
                    diamond_on_3 <=0;
            end
//      if (restart)
//        begin
//            BeeX <= 300;
//            BeeY <= 240;
//        end
    end
endmodule