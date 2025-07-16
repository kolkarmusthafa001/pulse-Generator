`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2025 18:19:43
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator#( 
 parameter PULSE_DURATION =  3, 
 parameter PULSE_PERIOD   =  7 
 )( 
 input i_clk, 
 input i_rst, 
 output o_pulse 
 ); 
 /****** DECLARATION *****/ 
 reg pulse; 
 reg [6:0] pulse_counter; 
 /**** logic begin below ****/ 
 /* 
 the control on pulse period and  
 duration is through a 7- bit counter 
 since the max pulse period is 100clks 
 counter counts from 0 topulse period - 1  
 the pulse is high when 0<counter<pulse period-1 
 */ 
  
    always@(posedge i_clk)begin
        if (i_rst)begin 
            pulse_counter <= 1'b0; 
        end  
        else begin  
            if(pulse_counter == PULSE_PERIOD - 1 )begin 
                pulse_counter <= 7'b0; 
            end 
            else begin  
                pulse_counter <= pulse_counter + 1'b1; 
            end 
        end 
    end 
  
    always@(posedge i_clk)begin 
        if (i_rst)begin 
            pulse <= 1'b0; 
        end  
        else begin  
            if(pulse_counter >= 7'b0 && pulse_counter <= PULSE_DURATION-1)begin 
                pulse <= 1'b1; 
            end 
            else begin  
                pulse <= 1'b0; 
            end 
        end 
    end 

    assign o_pulse = pulse ; 

 endmodule 
 