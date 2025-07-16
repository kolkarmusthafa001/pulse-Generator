`timescale 1ns/1ps 
 
module pulse_generator_tb; 
    reg i_clk; 
    reg i_rst; 
    wire o_pulse; 
    initial begin  
        i_clk <= 1'b0; 
        i_rst <= 1'b1;
    end 
    pulse_generator #( 
            .PULSE_DURATION(3), 
            .PULSE_PERIOD(7) 
        ) 
        pulse_generator_inst( 
            .i_clk(i_clk), 
            .i_rst(i_rst), 
            .o_pulse(o_pulse) 
        ); 
        
        initial begin  
            i_rst = 0     ; 
            #15 i_rst = 1 ; 
        end 
        initial begin 
            i_clk = 0;  
            forever #5 i_clk = ~i_clk; 
        end 
        initial begin 
            @(posedge i_clk); 
            @(posedge i_clk); 
            @(posedge i_clk); 
            @(posedge i_clk); 
            i_rst <= 0; 
        end 
        
endmodule
