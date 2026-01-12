`timescale 1ns / 1ps
/////////////////////////////////////////////
module line_buffer(
    input clk,
    input reset,
    input res_conv, // Input to indicate convolution completion
    input [7:0] image0,
    input [7:0] image1,
    input [7:0] image2,
    input [7:0] image3,
    input [7:0] image4,
    input [7:0] image5,
    input [7:0] image6,
    input [7:0] image7,
    input [7:0] image8, 
    output reg [7:0] lb_out0,
    output reg [7:0] lb_out1,
    output reg [7:0] lb_out2,
    output reg [7:0] lb_out3,
    output reg [7:0] lb_out4,
    output reg [7:0] lb_out5,
    output reg [7:0] lb_out6,
    output reg [7:0] lb_out7,
    output reg [7:0] lb_out8,
    output reg result_rdy,
    output reg pixel_end
);

// flag
    reg idle = 1 ;
always @(posedge clk or posedge reset) begin
  	//idle <= 1;
    if (reset) begin

        pixel_end <= 0;
        result_rdy <= 0;
    end else if (res_conv || idle ) begin // Check for convolution completion
      // Check bounds and update line buffer
      if ((!pixel_end)&&(!pixel_end)) begin
        lb_out0 <= image0;
	    lb_out1 <= image1;
	    lb_out2 <= image2;
	    lb_out3 <= image3;
	    lb_out4 <= image4;
	    lb_out5 <= image5;
	    lb_out6 <= image6;
	    lb_out7 <= image7;
	    lb_out8 <= image8;
            result_rdy <= 1;
        end 
      	else begin
        	result_rdy <= 0;
        end
      
        // Turn off idle
      	idle <=0;  
      	
      	end
    end

endmodule
