//----------------------------------------------
// Top.v module
// Digilent Basys 3             
// Bee Invaders Tutorial_2
// Onboard clock 100MHz
// VGA Resolution: 640x480 @ 60Hz
// Pixel Clock 25.2MHz
//----------------------------------------------

`default_nettype none
`timescale 1ns / 1ps

// Setup Top module
module Top(
    input  wire clk_100m,                   // 100 MHz clock
    input  wire btn_rst_n,                  // reset button
    input wire btnR, // right button
    input wire btnL, //left button 
    input wire btnU,
    input wire btnD,
    input wire restart,
    input wire startGame,
    output wire vga_hsync,                  // VGA horizontal sync
    output wire vga_vsync,                  // VGA vertical sync
    output reg [3:0] vga_r,                 // 4-bit VGA red
    output reg [3:0] vga_g,                 // 4-bit VGA green
    output reg [3:0] vga_b                  // 4-bit VGA blue
    );

    // Instantiate VGA_Clock
    reg reset;                              // Reset Button
    wire clk_pix;                           // 25.2Mhz Pixel clock
    wire clk_pix_locked;                    // Pixel clock locked?
    
    VGA_Clock clock_pix_inst (
       .clk_100m(clk_100m),
       .reset(btn_rst_n),                  // reset button is active high
       .clk_pix(clk_pix),
       .clk_pix_locked(clk_pix_locked)
    );

    // Instantiate VGA_Timing
    localparam CORDW = 10;                  // screen coordinate width in bits 
	reg rst_pix; 
    wire [CORDW-1:0] sx, sy;
    wire hsync; 
    wire vsync; 
    wire de;
    
    wire[9:0] beeX;
    wire[8:0] beeY;
    
    wire [3:0] maze_red;
    wire [3:0] maze_blue;
    wire [3:0] maze_green;
    
    VGA_Timing display_inst (
        .clk_pix(clk_pix),
        .rst_pix(!clk_pix_locked),          // wait for clock lock
        .sx(sx),
        .sy(sy),
        .hsync(hsync),
        .vsync(vsync),
        .de(de)
    );
      
    
    // Instantiate BeeSprite
//    wire [1:0] StartScreenOn;                 // 1=on, 0=off
//    wire [7:0] ss;                        // pixel value from Bee.mem
//    StartGame StartScreenDisplay (
//        .clk_pix(clk_pix),
//        .sx(sx),
//        .sy(sy),
//        .de(de),
//        .screenOn(StartScreenOn),
//        .dataout(ss)
//    );
    
//    // Load colour palette
//    reg [7:0] start_screen_palette [0:191];              // 8 bit values from the 192 hex entries in the colour palette
////    reg [7:0] COL = 0;                      // background colour palette value
//    initial begin
//        $readmemh("pal_start_game_screen.mem", start_screen_palette); // load 192 hex values into "palette"
//    end   
    
    
    // Instantiate BeeSprite
    wire [1:0] BeeSpriteOn;                 // 1=on, 0=off
    wire [7:0] dout;                        // pixel value from Bee.mem
    Spiderman SpidermanDisplay (
        .clk_pix(clk_pix),
        .sx(sx),
        .sy(sy),
        .de(de),
        .btnR(btnR),
        .btnL(btnL),
        .btnU(btnU),
        .btnD(btnD),
        .rstBtn(restart),
        .BeeSpriteOn(BeeSpriteOn),
        .dataout(dout),
        .BeesX(beeX),
        .BeesY(beeY) 
    );
    
    maze_draw m1(
        .clk_d(clk_pix),
        .pixel_x(sx),
        .pixel_y(sy),
        .video_on(de),
        .BeesX(beeX),
        .BeesY(beeY),
        .red(maze_red),
        .green(maze_green),
        .blue(maze_blue)
    );
    
    // Load colour palette
    reg [7:0] palette [0:62];              // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] COL = 0;                      // background colour palette value
    initial begin
        $readmemh("pal_spiderman.mem", palette); // load 192 hex values into "palette"
    end   
    
    // Instantiate BeeSprite
    wire [1:0] DiamondOn1;
    wire [1:0] DiamondOn2;
    wire [1:0] DiamondOn3;                 // 1=on, 0=off
    wire [7:0] diamond_out_1;
    wire [7:0] diamond_out_2;
    wire [7:0] diamond_out_3;                        // pixel value from Bee.mem
    Diamond DiamondDisplay1 (
        .clk_pix(clk_pix),
        .sx(sx),
        .sy(sy),
        .de(de),
        .rstBtn(restart),
        .BeesX(beeX),
        .BeesY(beeY),
        .diamond_on_1(DiamondOn1),
        .diamond_on_2(DiamondOn2),
        .diamond_on_3(DiamondOn3),
        .dataout_1(diamond_out_1),
        .dataout_2(diamond_out_2),
        .dataout_3(diamond_out_3)
    );
    
    // Load colour palette
    reg [7:0] diamond_palette [0:191];              // 8 bit values from the 192 hex entries in the colour palette
    reg [7:0] COL2 = 0;                      // background colour palette value
    initial begin
        $readmemh("pal_diamond.mem", diamond_palette); // load 192 hex values into "palette"
    end
    
    // VGA Output
    always @ (posedge clk_pix)
    begin
        if(de)
            begin
                if(startGame)
                    if (BeeSpriteOn==1)
                        begin
                            vga_r <= (palette[(dout*3)])>>4;    // RED bits(7:4) from colour palette
                            vga_g <= (palette[(dout*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                            vga_b <= (palette[(dout*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                        end
                    else if (DiamondOn1==1)
                        begin
                            vga_r <= (diamond_palette[(diamond_out_1*3)])>>4;    // RED bits(7:4) from colour palette
                            vga_g <= (diamond_palette[(diamond_out_1*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                            vga_b <= (diamond_palette[(diamond_out_1*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                        end
                     else if (DiamondOn2==1)
                        begin
                            vga_r <= (diamond_palette[(diamond_out_2*3)])>>4;    // RED bits(7:4) from colour palette
                            vga_g <= (diamond_palette[(diamond_out_2*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                            vga_b <= (diamond_palette[(diamond_out_2*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                        end
                     else if (DiamondOn3==1)
                        begin
                            vga_r <= (diamond_palette[(diamond_out_3*3)])>>4;    // RED bits(7:4) from colour palette
                            vga_g <= (diamond_palette[(diamond_out_3*3)+1])>>4;  // GREEN bits(7:4) from colour palette
                            vga_b <= (diamond_palette[(diamond_out_3*3)+2])>>4;  // BLUE bits(7:4) from colour palette
                        end
                    else
                        begin
                            vga_r <= maze_red;
                            vga_g <= maze_green;
                            vga_b <= maze_blue;
                        end
//                else
//                    begin
//                            vga_r <= (start_screen_palette[(ss*3)])>>4;
//                            vga_g <= (start_screen_palette[(ss*3)+1])>>4;  // GREEN bits(7:4) from colour palette
//                            vga_b <= (start_screen_palette[(ss*3)+2])>>4;
//                    end
            end
        else
            begin
                vga_r <= 0; // set RED, GREEN & BLUE
                vga_g <= 0; // to "0" when x,y outside of
                vga_b <= 0; // the active display area
            end
    end
    
    // VGA Output
    assign vga_hsync = hsync;
    assign vga_vsync = vsync;
//    wire [1:0] draw;
    
endmodule