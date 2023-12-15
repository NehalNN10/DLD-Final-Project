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
//    input wire btnR, // right button
//    input wire btnL, //left button
//    input wire btnU, // up button
//    input wire btnD, // down button
//    input wire rstBtn,
    output reg [3:0] red=0,
    output reg [3:0] green=0,
    output reg [3:0] blue=0
    );
   
//    reg [9:0] DenialX = 0;
//    reg [8:0] DenialY = 33;
   
//    localparam DenialWidth = 20;
//    localparam DenialHeight = 20;
   
    // Instantiate Debounce
//    wire sig_right;
//    wire sig_left;
//    wire sig_up;
//    wire sig_down;
   
//    wire restart;
   
//    Debounce deb_right (
//    .clk_pix(clk_d),
//    .btn(btnR),
//    .out(sig_right)
//    );
//    Debounce deb_left (
//    .clk_pix(clk_d),
//    .btn(btnL),
//    .out(sig_left)
//    );
//    Debounce deb_up (
//    .clk_pix(clk_d),
//    .btn(btnU),
//    .out(sig_up)
//    );
//    Debounce deb_down (
//    .clk_pix(clk_d),
//    .btn(btnD),
//    .out(sig_down)
//    );
//    Debounce deb_rst(
//    .clk_pix(clk_d),
//    .btn(rstBtn),
//    .out(restart)
//    );
   
   
  
   
//    wire collisionR = (DenialY>=60 && DenialY<=120 && DenialX+20==60) || (DenialY+20>=60 && DenialY+20<=120 && DenialX+20==60) || (DenialY>=60 && DenialY<=80 && DenialX+20==80) || (DenialY+20>=60 && DenialY+20<=80 && DenialX+20==80) || (DenialY>=20 && DenialY<=80 && DenialX+20==220) || (DenialY+20>=20 && DenialY+20<=80 && DenialX+20==220) || (DenialY>=120 && DenialY<=140 && DenialX+20==120) || (DenialY+20>=120 && DenialY+20<=140 && DenialX+20==120) || (DenialY>=60 && DenialY<=200 && DenialX+20==280) || (DenialY+20>=60 && DenialY+20<=200 && DenialX+20==280) || (DenialY>=180 && DenialY<=200 && DenialX+20==180) || (DenialY+20>=180 && DenialY+20<=200 && DenialX+20==180) || (DenialY>=120 && DenialY<=140 && DenialX+20==300) || (DenialY+20>=120 && DenialY+20<=140 && DenialX+20==300) || (DenialY>=60 && DenialY<=120 && DenialX+20==340) || (DenialY+20>=60 && DenialY+20<=120 && DenialX+20==340) || (DenialY>=60 && DenialY<=80 && DenialX+20==360) || (DenialY+20>=60 && DenialY+20<=80 && DenialX+20==360) || (DenialY>=60 && DenialY<=120 && DenialX+20==440) || (DenialY+20>=60 && DenialY+20<=120 && DenialX+20==440) || (DenialY>=60 && DenialY<=120 && DenialX+20==500) || (DenialY+20>=60 && DenialY+20<=120 && DenialX+20==500) || (DenialY>=100 && DenialY<=120 && DenialX+20==520) || (DenialY+20>=100 && DenialY+20<=120 && DenialX+20==520) || (DenialY>=60 && DenialY<=120 && DenialX+20==560) || (DenialY+20>=60 && DenialY+20<=120 && DenialX+20==560) || (DenialY>=100 && DenialY<=120 && DenialX+20==580) || (DenialY+20>=100 && DenialY+20<=120 && DenialX+20==580) || (DenialY>=160 && DenialY<=320 && DenialX+20==500) || (DenialY+20>=160 && DenialY+20<=320 && DenialX+20==500) || (DenialY>=160 && DenialY<=180 && DenialX+20==520) || (DenialY+20>=160 && DenialY+20<=180 && DenialX+20==520) || (DenialY>=180 && DenialY<=220 && DenialX+20==560) || (DenialY+20>=180 && DenialY+20<=220 && DenialX+20==560) || (DenialY>=240 && DenialY<=380 && DenialX+20==560) || (DenialY+20>=240 && DenialY+20<=380 && DenialX+20==560) || (DenialY>=360 && DenialY<=380 && DenialX+20==500) || (DenialY+20>=360 && DenialY+20<=380 && DenialX+20==500) || (DenialY>=360 && DenialY<=380 && DenialX+20==580) || (DenialY+20>=360 && DenialY+20<=380 && DenialX+20==580) || (DenialY>=160 && DenialY<=240 && DenialX+20==60) || (DenialY+20>=160 && DenialY+20<=240 && DenialX+20==60) || (DenialY>=220 && DenialY<=240 && DenialX+20==80) || (DenialY+20>=220 && DenialY+20<=240 && DenialX+20==80) || (DenialY>=180 && DenialY<=300 && DenialX+20==120) || (DenialY+20>=180 && DenialY+20<=300 && DenialX+20==120) || (DenialY>=280 && DenialY<=300 && DenialX+20==60) || (DenialY+20>=280 && DenialY+20<=300 && DenialX+20==60) || (DenialY>=300 && DenialY<=420 && DenialX+20==60) || (DenialY+20>=300 && DenialY+20<=420 && DenialX+20==60) || (DenialY>=400 && DenialY<=420 && DenialX+20==20) || (DenialY+20>=400 && DenialY+20<=420 && DenialX+20==20) || (DenialY>=180 && DenialY<=200 && DenialX+20==340) || (DenialY+20>=180 && DenialY+20<=200 && DenialX+20==340) || (DenialY>=180 && DenialY<=240 && DenialX+20==440) || (DenialY+20>=180 && DenialY+20<=240 && DenialX+20==440) || (DenialY>=240 && DenialY<=260 && DenialX+20==240) || (DenialY+20>=240 && DenialY+20<=260 && DenialX+20==240) || (DenialY>=260 && DenialY<=300 && DenialX+20==440) || (DenialY+20>=260 && DenialY+20<=300 && DenialX+20==440) || (DenialY>=300 && DenialY<=320 && DenialX+20==200) || (DenialY+20>=300 && DenialY+20<=320 && DenialX+20==200) || (DenialY>=240 && DenialY<=320 && DenialX+20==180) || (DenialY+20>=240 && DenialY+20<=320 && DenialX+20==180) || (DenialY>=320 && DenialY<=360 && DenialX+20==300) || (DenialY+20>=320 && DenialY+20<=360 && DenialX+20==300) || (DenialY>=360 && DenialY<=380 && DenialX+20==260) || (DenialY+20>=360 && DenialY+20<=380 && DenialX+20==260) || (DenialY>=360 && DenialY<=420 && DenialX+20==240) || (DenialY+20>=360 && DenialY+20<=420 && DenialX+20==240) || (DenialY>=400 && DenialY<=420 && DenialX+20==120) || (DenialY+20>=400 && DenialY+20<=420 && DenialX+20==120) || (DenialY>=360 && DenialY<=400 && DenialX+20==160) || (DenialY+20>=360 && DenialY+20<=400 && DenialX+20==160) || (DenialY>=420 && DenialY<=460 && DenialX+20==300) || (DenialY+20>=420 && DenialY+20<=460 && DenialX+20==300) || (DenialY>=440 && DenialY<=460 && DenialX+20==320) || (DenialY+20>=440 && DenialY+20<=460 && DenialX+20==320) || (DenialY>=420 && DenialY<=460 && DenialX+20==440) || (DenialY+20>=420 && DenialY+20<=460 && DenialX+20==440) || (DenialY>=420 && DenialY<=460 && DenialX+20==500) || (DenialY+20>=420 && DenialY+20<=460 && DenialX+20==500) || (DenialY>=420 && DenialY<=460 && DenialX+20==560) || (DenialY+20>=420 && DenialY+20<=460 && DenialX+20==560) || (DenialY>=0 && DenialY<=20 && DenialX+20==0) || (DenialY+20>=0 && DenialY+20<=20 && DenialX+20==0) || (DenialY>=60 && DenialY<=480 && DenialX+20==0) || (DenialY+20>=60 && DenialY+20<=480 && DenialX+20==0) || (DenialY>=620 && DenialY<=640 && DenialX+20==0) || (DenialY+20>=620 && DenialY+20<=640 && DenialX+20==0) || (DenialY>=460 && DenialY<=480 && DenialX+20==0) || (DenialY+20>=460 && DenialY+20<=480 && DenialX+20==0);
//    wire collisionL = (DenialY>=60 && DenialY<=120 && DenialX==80 ) || (DenialY+20>=60 && DenialY+20<=120 && DenialX==80)||(DenialY>=60 && DenialY<=80 && DenialX==220 ) || (DenialY+20>=60 && DenialY+20<=80 && DenialX==220)||(DenialY>=20 && DenialY<=80 && DenialX==240 ) || (DenialY+20>=20 && DenialY+20<=80 && DenialX==240)||(DenialY>=120 && DenialY<=140 && DenialX==280 ) || (DenialY+20>=120 && DenialY+20<=140 && DenialX==280)||(DenialY>=60 && DenialY<=200 && DenialX==300 ) || (DenialY+20>=60 && DenialY+20<=200 && DenialX==300)||(DenialY>=180 && DenialY<=200 && DenialX==280 ) || (DenialY+20>=180 && DenialY+20<=200 && DenialX==280)||(DenialY>=120 && DenialY<=140 && DenialX==460 ) || (DenialY+20>=120 && DenialY+20<=140 && DenialX==460)||(DenialY>=60 && DenialY<=120 && DenialX==360 ) || (DenialY+20>=60 && DenialY+20<=120 && DenialX==360)||(DenialY>=60 && DenialY<=80 && DenialX==400 ) || (DenialY+20>=60 && DenialY+20<=80 && DenialX==400)||(DenialY>=60 && DenialY<=120 && DenialX==460 ) || (DenialY+20>=60 && DenialY+20<=120 && DenialX==460)||(DenialY>=60 && DenialY<=120 && DenialX==520 ) || (DenialY+20>=60 && DenialY+20<=120 && DenialX==520)||(DenialY>=100 && DenialY<=120 && DenialX==560 ) || (DenialY+20>=100 && DenialY+20<=120 && DenialX==560)||(DenialY>=60 && DenialY<=120 && DenialX==580 ) || (DenialY+20>=60 && DenialY+20<=120 && DenialX==580)||(DenialY>=100 && DenialY<=120 && DenialX==620 ) || (DenialY+20>=100 && DenialY+20<=120 && DenialX==620)||(DenialY>=160 && DenialY<=320 && DenialX==520 ) || (DenialY+20>=160 && DenialY+20<=320 && DenialX==520)||(DenialY>=160 && DenialY<=180 && DenialX==620 ) || (DenialY+20>=160 && DenialY+20<=180 && DenialX==620)||(DenialY>=180 && DenialY<=220 && DenialX==580 ) || (DenialY+20>=180 && DenialY+20<=220 && DenialX==580)||(DenialY>=240 && DenialY<=380 && DenialX==580 ) || (DenialY+20>=240 && DenialY+20<=380 && DenialX==580)||(DenialY>=360 && DenialY<=380 && DenialX==560 ) || (DenialY+20>=360 && DenialY+20<=380 && DenialX==560)||(DenialY>=360 && DenialY<=380 && DenialX==620 ) || (DenialY+20>=360 && DenialY+20<=380 && DenialX==620)||(DenialY>=160 && DenialY<=240 && DenialX==80 ) || (DenialY+20>=160 && DenialY+20<=240 && DenialX==80)||(DenialY>=220 && DenialY<=240 && DenialX==120 ) || (DenialY+20>=220 && DenialY+20<=240 && DenialX==120)||(DenialY>=180 && DenialY<=300 && DenialX==140 ) || (DenialY+20>=180 && DenialY+20<=300 && DenialX==140)||(DenialY>=280 && DenialY<=300 && DenialX==120 ) || (DenialY+20>=280 && DenialY+20<=300 && DenialX==120)||(DenialY>=300 && DenialY<=420  && DenialX==80 ) || (DenialY+20>=300 && DenialY+20<=420 && DenialX==80)||(DenialY>=400 && DenialY<=420 && DenialX==60 ) || (DenialY+20>=400 && DenialY+20<=420 && DenialX==60)||(DenialY>=180 && DenialY<=200 && DenialX==440 ) || (DenialY+20>=180 && DenialY+20<=200 && DenialX==440)||(DenialY>=180 && DenialY<=240 && DenialX==460 ) || (DenialY+20>=180 && DenialY+20<=240 && DenialX==460)||(DenialY>=240 && DenialY<=260 && DenialX==460 ) || (DenialY+20>=240 && DenialY+20<=260 && DenialX==460)||(DenialY>=260 && DenialY<=300 && DenialX==460 ) || (DenialY+20>=260 && DenialY+20<=300 && DenialX==460)||(DenialY>=300 && DenialY<=320 && DenialX==460 ) || (DenialY+20>=300 && DenialY+20<=320 && DenialX==460)||(DenialY>=240 && DenialY<=320 && DenialX==200 ) || (DenialY+20>=240 && DenialY+20<=320 && DenialX==200)||(DenialY>=320 && DenialY<=360 && DenialX==320 ) || (DenialY+20>=320 && DenialY+20<=360 && DenialX==320)||(DenialY>=360 && DenialY<=380 && DenialX==460 ) || (DenialY+20>=360 && DenialY+20<=380 && DenialX==460)||(DenialY>=360 && DenialY<=420 && DenialX==260 ) || (DenialY+20>=360 && DenialY+20<=420 && DenialX==260)||(DenialY>=400 && DenialY<=420 && DenialX==240 ) || (DenialY+20>=400 && DenialY+20<=420 && DenialX==240)||(DenialY>=360 && DenialY<=400 && DenialX==180 ) || (DenialY+20>=360 && DenialY+20<=400 && DenialX==180)||(DenialY>=420 && DenialY<=460 && DenialX==320 ) || (DenialY+20>=420 && DenialY+20<=460 && DenialX==320)||(DenialY>=440 && DenialY<=460 && DenialX==440 ) || (DenialY+20>=440 && DenialY+20<=460 && DenialX==440)||(DenialY>=420 && DenialY<=460 && DenialX==460 ) || (DenialY+20>=420 && DenialY+20<=460 && DenialX==460)||(DenialY>=420 && DenialY<=460 && DenialX==520 ) || (DenialY+20>=420 && DenialY+20<=460 && DenialX==520)||(DenialY>=420 && DenialY<=460 && DenialX==580 ) || (DenialY+20>=420 && DenialY+20<=460 && DenialX==580)||(DenialY>=0 && DenialY<=20 && DenialX==640 ) || (DenialY+20>=0 && DenialY+20<=20 && DenialX==640)||(DenialY>=60 && DenialY<=480 && DenialX==20 ) || (DenialY+20>=60 && DenialY+20<=480 && DenialX==20)||(DenialY>=620 && DenialY<=640 && DenialX==420 ) || (DenialY+20>=620 && DenialY+20<=640 && DenialX==420)||(DenialY>=460 && DenialY<=480 && DenialX==640 ) || (DenialY+20>=460 && DenialY+20<=480 && DenialX==640);
//    wire collisionU = (DenialX>=60 && DenialX<=80 && DenialY==120 ) || (DenialX+20>=60 && DenialX+20<=80 && DenialY==120)||(DenialX>=80 && DenialX<=220 && DenialY==80 ) || (DenialX+20>=80 && DenialX+20<=220 && DenialY==80)||(DenialX>=220 && DenialX<=240 && DenialY==80 ) || (DenialX+20>=220 && DenialX+20<=240 && DenialY==80)||(DenialX>=120 && DenialX<=280 && DenialY==140 ) || (DenialX+20>=120 && DenialX+20<=180 && DenialY==140)||(DenialX>=280 && DenialX<=300 && DenialY==200 ) || (DenialX+20>=280 && DenialX+20<=300 && DenialY==200)||(DenialX>=180 && DenialX<=280 && DenialY==200 ) || (DenialX+20>=180 && DenialX+20<=280 && DenialY==200)||(DenialX>=300 && DenialX<=460 && DenialY==140 ) || (DenialX+20>=300 && DenialX+20<=460 && DenialY==140)||(DenialX>=340 && DenialX<=360 && DenialY==120 ) || (DenialX+20>=340 && DenialX+20<=360 && DenialY==120)||(DenialX>=360 && DenialX<=400 && DenialY==80 ) || (DenialX+20>=360 && DenialX+20<=400 && DenialY==80)||(DenialX>=440 && DenialX<=460 && DenialY==120 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY==120)||(DenialX>=500 && DenialX<=520 && DenialY==120 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY==120)||(DenialX>=520 && DenialX<=560 && DenialY==120 ) || (DenialX+20>=520 && DenialX+20<=560 && DenialY==120)||(DenialX>=560 && DenialX<=580 && DenialY==120 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY==120)||(DenialX>=580 && DenialX<=620 && DenialY==120 ) || (DenialX+20>=580 && DenialX+20<=620 && DenialY==120)||(DenialX>=500 && DenialX<=520 && DenialY==320 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY==320)||(DenialX>=520 && DenialX<=620 && DenialY==180 ) || (DenialX+20>=520 && DenialX+20<=620 && DenialY==180)||(DenialX>=560 && DenialX<=580 && DenialY==220 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY==220)||(DenialX>=560 && DenialX<=580 && DenialY==380 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY==380)||(DenialX>=500 && DenialX<=560 && DenialY==380 ) || (DenialX+20>=500 && DenialX+20<=560 && DenialY==380)||(DenialX>=580 && DenialX<=620 && DenialY==380 ) || (DenialX+20>=580 && DenialX+20<=620 && DenialY==380)||(DenialX>=60 && DenialX<=80 && DenialY==240 ) || (DenialX+20>=60 && DenialX+20<=80 && DenialY==240)||(DenialX>=80 && DenialX<=120 && DenialY==240 ) || (DenialX+20>=80 && DenialX+20<=120 && DenialY==240)||(DenialX>=120 && DenialX<=140 && DenialY==300 ) || (DenialX+20>=120 && DenialX+20<=140 && DenialY==300)||(DenialX>=60 && DenialX<=120 && DenialY==300 ) || (DenialX+20>=60 && DenialX+20<=120 && DenialY==300)||(DenialX>=60 && DenialX<=80 && DenialY==420 ) || (DenialX+20>=60 && DenialX+20<=80 && DenialY==420)||(DenialX>=20 && DenialX<=60 && DenialY==420 ) || (DenialX+20>=20 && DenialX+20<=60 && DenialY==420)||(DenialX>=340 && DenialX<=440 && DenialY==200 ) || (DenialX+20>=340 && DenialX+20<=440 && DenialY==200)||(DenialX>=440 && DenialX<=460 && DenialY==240 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY==240)||(DenialX>=240 && DenialX<=460 && DenialY==260 ) || (DenialX+20>=240 && DenialX+20<=460 && DenialY==260)||(DenialX>=440 && DenialX<=460 && DenialY==300 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY==300)||(DenialX>=200 && DenialX<=460 && DenialY==320 ) || (DenialX+20>=200 && DenialX+20<=460 && DenialY==320)||(DenialX>=180 && DenialX<=200 && DenialY==320 ) || (DenialX+20>=180 && DenialX+20<=200 && DenialY==320)||(DenialX>=300 && DenialX<=320 && DenialY==360 ) || (DenialX+20>=300 && DenialX+20<=320 && DenialY==360)||(DenialX>=260 && DenialX<=460 && DenialY==380 ) || (DenialX+20>=260 && DenialX+20<=460 && DenialY==380)||(DenialX>=240 && DenialX<=260 && DenialY==420 ) || (DenialX+20>=240 && DenialX+20<=260 && DenialY==420)||(DenialX>=120 && DenialX<=240 && DenialY==420 ) || (DenialX+20>=120 && DenialX+20<=240 && DenialY==420)||(DenialX>=160 && DenialX<=180 && DenialY==400 ) || (DenialX+20>=160 && DenialX+20<=180 && DenialY==400)||(DenialX>=300 && DenialX<=320 && DenialY==460 ) || (DenialX+20>=300 && DenialX+20<=320 && DenialY==460)||(DenialX>=320 && DenialX<=440 && DenialY==460 ) || (DenialX+20>=320 && DenialX+20<=440 && DenialY==460)||(DenialX>=440 && DenialX<=460 && DenialY==460 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY==460)||(DenialX>=500 && DenialX<=520 && DenialY==460 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY==460)||(DenialX>=560 && DenialX<=580 && DenialY==460 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY==460)||(DenialX>=0 && DenialX<=640 && DenialY==20 ) || (DenialX+20>=0 && DenialX+20<=640 && DenialY==20)||(DenialX>=0 && DenialX<=20 && DenialY==480 ) || (DenialX+20>=0 && DenialX+20<=20 && DenialY==480)||(DenialX>=0 && DenialX<=420 && DenialY==640 ) || (DenialX+20>=0 && DenialX+20<=420 && DenialY==640)||(DenialX>=0 && DenialX<=640 && DenialY==480 ) || (DenialX+20>=0 && DenialX+20<=640 && DenialY==480);
//    wire collisionD = (DenialX>=60 && DenialX<=80 && DenialY+20==60 ) || (DenialX+20>=60 && DenialX+20<=80 && DenialY+20==60)||(DenialX>=80 && DenialX<=220 && DenialY+20==60 ) || (DenialX+20>=80 && DenialX+20<=220 && DenialY+20==60)||(DenialX>=220 && DenialX<=240 && DenialY+20==20 ) || (DenialX+20>=220 && DenialX+20<=240 && DenialY+20==20)||(DenialX>=120 && DenialX<=280 && DenialY+20==120 ) || (DenialX+20>=120 && DenialX+20<=280 && DenialY+20==120)||(DenialX>=280 && DenialX<=300 && DenialY+20==60 ) || (DenialX+20>=280 && DenialX+20<=300 && DenialY+20==60)||(DenialX>=180 && DenialX<=280 && DenialY+20==180 ) || (DenialX+20>=180 && DenialX+20<=280 && DenialY+20==180)||(DenialX>=300 && DenialX<=460 && DenialY+20==120 ) || (DenialX+20>=300 && DenialX+20<=460 && DenialY+20==120)||(DenialX>=340 && DenialX<=360 && DenialY+20==60 ) || (DenialX+20>=340 && DenialX+20<=360 && DenialY+20==60)||(DenialX>=360 && DenialX<=400 && DenialY+20==60 ) || (DenialX+20>=360 && DenialX+20<=400 && DenialY+20==60)||(DenialX>=440 && DenialX<=460 && DenialY+20==60 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY+20==60)||(DenialX>=500 && DenialX<=520 && DenialY+20==60 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY+20==60)||(DenialX>=520 && DenialX<=560 && DenialY+20==100 ) || (DenialX+20>=520 && DenialX+20<=560 && DenialY+20==100)||(DenialX>=560 && DenialX<=580 && DenialY+20==60 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY+20==60)||(DenialX>=580 && DenialX<=620 && DenialY+20==100 ) || (DenialX+20>=580 && DenialX+20<=620 && DenialY+20==100)||(DenialX>=500 && DenialX<=520 && DenialY+20==160 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY+20==160)||(DenialX>=520 && DenialX<=620 && DenialY+20==160 ) || (DenialX+20>=520 && DenialX+20<=620 && DenialY+20==160)||(DenialX>=560 && DenialX<=580 && DenialY+20==180 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY+20==180)||(DenialX>=560 && DenialX<=580 && DenialY+20==240 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY+20==240)||(DenialX>=500 && DenialX<=560 && DenialY+20==360 ) || (DenialX+20>=500 && DenialX+20<=560 && DenialY+20==360)||(DenialX>=580 && DenialX<=620 && DenialY+20==360 ) || (DenialX+20>=580 && DenialX+20<=620 && DenialY+20==360)||(DenialX>=60 && DenialX<=80 && DenialY+20==160 ) || (DenialX+20>=60  && DenialX+20<=80     && DenialY+20==160)||(DenialX>=80 && DenialX<=120 && DenialY+20==220 ) || (DenialX+20>=80 && DenialX+20<=120 && DenialY+20==220)||(DenialX>=120 && DenialX<=140 && DenialY+20==180 ) || (DenialX+20>=120 && DenialX+20<=140 && DenialY+20==180)||(DenialX>=60 && DenialX<=120 && DenialY+20==280 ) || (DenialX+20>=60 && DenialX+20<=120 && DenialY+20==280)||(DenialX>=60 && DenialX<=80 && DenialY+20==300 ) || (DenialX+20>=60 && DenialX+20<=80 && DenialY+20==300)||(DenialX>=20 && DenialX<=60 && DenialY+20==400 ) || (DenialX+20>=20 && DenialX+20<=60 && DenialY+20==400)||(DenialX>=340 && DenialX<=440 && DenialY+20==180 ) || (DenialX+20>=340 && DenialX+20<=440 && DenialY+20==180)||(DenialX>=440 && DenialX<=460 && DenialY+20==180 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY+20==180)||(DenialX>=240 && DenialX<=460 && DenialY+20==240 ) || (DenialX+20>=240 && DenialX+20<=460 && DenialY+20==240)||(DenialX>=440 && DenialX<=460 && DenialY+20==260 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY+20==260)||(DenialX>=200 && DenialX<=460 && DenialY+20==300 ) || (DenialX+20>=200 && DenialX+20<=460 && DenialY+20==300)||(DenialX>=180 && DenialX<=200 && DenialY+20==240 ) || (DenialX+20>=180 && DenialX+20<=200 && DenialY+20==240)||(DenialX>=300 && DenialX<=320 && DenialY+20==320 ) || (DenialX+20>=300 && DenialX+20<=320 && DenialY+20==320)||(DenialX>=260 && DenialX<=460 && DenialY+20==360 ) || (DenialX+20>=260 && DenialX+20<=460 && DenialY+20==360)||(DenialX>=240 && DenialX<=260 && DenialY+20==420 ) || (DenialX+20>=240 && DenialX+20<=260 && DenialY+20==420)||(DenialX>=120 && DenialX<=240 && DenialY+20==400 ) || (DenialX+20>=120 && DenialX+20<=240 && DenialY+20==400)||(DenialX>=160 && DenialX<=180 && DenialY+20==360 ) || (DenialX+20>=160 && DenialX+20<=180 && DenialY+20==360)||(DenialX>=300 && DenialX<=320 && DenialY+20==420 ) || (DenialX+20>=300 && DenialX+20<=320 && DenialY+20==420)||(DenialX>=320 && DenialX<=440 && DenialY+20==440 ) || (DenialX+20>=320 && DenialX+20<=440 && DenialY+20==440)||(DenialX>=440 && DenialX<=460 && DenialY+20==420 ) || (DenialX+20>=440 && DenialX+20<=460 && DenialY+20==420)||(DenialX>=500 && DenialX<=520 && DenialY+20==420 ) || (DenialX+20>=500 && DenialX+20<=520 && DenialY+20==420)||(DenialX>=560 && DenialX<=580 && DenialY+20==420 ) || (DenialX+20>=560 && DenialX+20<=580 && DenialY+20==420)||(DenialX>=0 && DenialX<=640 && DenialY+20==0 ) || (DenialX+20>=0 && DenialX+20<=640 && DenialY+20==0)||(DenialX>=0 && DenialX<=20 && DenialY+20==60 ) || (DenialX+20>=0 && DenialX+20<=20 && DenialY+20==60)||(DenialX>=0 && DenialX<=420 && DenialY+20==620 ) || (DenialX+20>=0 && DenialX+20<=20 && DenialY+20==620)||(DenialX>=0 && DenialX<=640 && DenialY+20==460 ) || (DenialX+20>=0 && DenialX+20<=640 && DenialY+20==460);
   
//    wire d1 = (pixel_x > DenialX & pixel_y > DenialY & (pixel_x < DenialX + DenialWidth) & (pixel_y < DenialY + DenialHeight));
   
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
   
    wire m40 = (pixel_x > 320 & pixel_y > 440 & (pixel_x <= 440 ) & (pixel_y <= 460));
   
    wire m41 = (pixel_x > 440 & pixel_y > 420 & (pixel_x <= 460 ) & (pixel_y <= 460));
   
    wire m42 = (pixel_x > 500 & pixel_y > 420 & (pixel_x <= 520 ) & (pixel_y <= 460));
   
    wire m43 = (pixel_x > 560 & pixel_y > 420 & (pixel_x <= 580 ) & (pixel_y <= 460));
   
   
   
always @(posedge clk_d) begin
        if ((pixel_x == 0) || (pixel_x == 639) || (pixel_y == 0) || (pixel_y == 479)) begin
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
            end
        else begin
       
            red <= ((video_on & b1)|| (video_on & b2) || (video_on & b3) || (video_on & b4) || (video_on & m1)) || (video_on & m2) || (video_on & m3) || (video_on & m4) || (video_on & m5) || (video_on & m6) || (video_on & m7) || (video_on & m8) || (video_on & m9) || (video_on & m10) || (video_on & m11) || (video_on & m12) || (video_on & m13) || (video_on & m14) || (video_on & m15) || (video_on & m16) || (video_on & m17) || (video_on & m18) || (video_on & m19) || (video_on & m20) || (video_on & m21) || (video_on & m22) || (video_on & m23) || (video_on & m24) || (video_on & m25) || (video_on & m27) || (video_on & m28) || (video_on & m29) || (video_on & m30) || (video_on & m31) || (video_on & m32) || (video_on & m33) || (video_on & m34) || (video_on & m35) || (video_on & m36) || (video_on & m37) || (video_on & m38) || (video_on & m39) || (video_on & m40) || (video_on & m41) || (video_on & m42) || (video_on & m43)  ? 4'hF : 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
//            green <= (video_on & d1) ? 4'hF : 4'h0;
//            blue <= (video_on & b4) ? 4'hF :4'h0;
        end
//        if (pixel_x==639 && pixel_y==479) // check for movement once every frame
//             begin
//             if (sig_right == 1 && ~collisionR) // Check for right button
//                DenialX<=DenialX+1;
//             else
//             if (sig_left == 1 && ~collisionL) // Check for left button
//                DenialX<=DenialX-1;
//             if (sig_up == 1 && ~collisionU) // Check for right button
//                DenialY<=DenialY-1;
//             else
//             if (sig_down == 1 && ~collisionD) // Check for left button
//                DenialY<=DenialY+1;
//        end
//        if (restart == 1)
//            begin
//                DenialX <= 0;
//                DenialY <= 33;
////                restart <= 0;
//            end
end    
   
endmodule