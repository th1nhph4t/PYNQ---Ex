`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////

module combined_tb;
    // Inputs for line_buffer
    reg clk;
    reg reset;
  reg [7:0] image0;
  reg [7:0] image1;
  reg [7:0] image2;
  reg [7:0] image3;
  reg [7:0] image4;
  reg [7:0] image5;
  reg [7:0] image6;
  reg [7:0] image7;
  reg [7:0] image8;
  reg [7:0] kernel0;
  reg [7:0] kernel1;
  reg [7:0] kernel2;
  reg [7:0] kernel3;
  reg [7:0] kernel4;
  reg [7:0] kernel5;
  reg [7:0] kernel6;
  reg [7:0] kernel7;
  reg [7:0] kernel8;
  
    // Outputs for line_buffer
  wire [7:0] lb_out0;
  wire [7:0] lb_out1;
  wire [7:0] lb_out2;
  wire [7:0] lb_out3;
  wire [7:0] lb_out4;
  wire [7:0] lb_out5;
  wire [7:0] lb_out6;
  wire [7:0] lb_out7;
  wire [7:0] lb_out8;
  wire result_rdy;
  wire pixel_end;

    // Outputs for muladdtree3x3
 	wire [20:0] convolved_result;

    // Clock counter
    reg [31:0] clk_count;

	// Instantiate the line_buffer module
    line_buffer u_line_buffer (
        .clk(clk),
        .reset(reset),
        .res_conv(res_conv),
        .image0(image0),
        .image1(image1),
        .image2(image2),
        .image3(image3),
        .image4(image4),
        .image5(image5),
        .image6(image6),
        .image7(image7),
        .image8(image8),
        .lb_out0(lb_out0),
        .lb_out1(lb_out1),
        .lb_out2(lb_out2),
        .lb_out3(lb_out3),
        .lb_out4(lb_out4),
        .lb_out5(lb_out5),
        .lb_out6(lb_out6),
        .lb_out7(lb_out7),
        .lb_out8(lb_out8),
        .pixel_end(pixel_end),
        .result_rdy(result_rdy)
    );

    // Instantiate the muladdtree3x3 module
    muladdtree3x3 u_muladdtree3x3 (
        .clk(clk),
        .result_rdy(result_rdy),
      	.pixel_end(pixel_end),
        .kernel0(kernel0),
        .kernel1(kernel1),
        .kernel2(kernel2),
        .kernel3(kernel3),
        .kernel4(kernel4),
        .kernel5(kernel5),
        .kernel6(kernel6),
        .kernel7(kernel7),
        .kernel8(kernel8),
        .lb_ready0(lb_out0), 
        .lb_ready1(lb_out1), 
        .lb_ready2(lb_out2), 
        .lb_ready3(lb_out3), 
        .lb_ready4(lb_out4), 
        .lb_ready5(lb_out5), 
        .lb_ready6(lb_out6), 
        .lb_ready7(lb_out7), 
        .lb_ready8(lb_out8), 
        .convolved_result(convolved_result),
        .res_conv(res_conv)
    );
  
   // Clock generation
initial begin
    clk = 0;
    clk_count =0 ;
    forever #5 clk = ~clk; // Clock period of 10 units

end
 always @(posedge clk) begin
        clk_count <= clk_count + 1;
    end
// Test sequence
initial begin
    // Initialize inputs
    reset = 1;
    image0 = 8'd1;
    image1 = 8'd2;
    image2 = 8'd3;
    image3 = 8'd4;
    image4 = 8'd5;
    image5 = 8'd6;
    image6 = 8'd7;
    image7 = 8'd8;
    image8 = 8'd9;
    
    kernel0 = 8'd1;
    kernel1 = 8'd0;
    kernel2 = 8'd0;
    kernel3 = 8'd0;
    kernel4 = 8'd1;
    kernel5 = 8'd0;
    kernel6 = 8'd0;
    kernel7 = 8'd0;
    kernel8 = 8'd1;

    #30 reset = 0;
    
    #60 reset = 0;
    image0 = 8'd1;
    image1 = 8'd3;
    image2 = 8'd5;
    image3 = 8'd7;
    image4 = 8'd6;
    image5 = 8'd8;
    image6 = 8'd22;
    image7 = 8'd13;
    image8 = 8'd9;
    
    #90 reset = 0;
    image0 = 8'd12;
    image1 = 8'd3;
    image2 = 8'd5;
    image3 = 8'd0;
    image4 = 8'd3;
    image5 = 8'd8;
    image6 = 8'd2;
    image7 = 8'd3;
    image8 = 8'd2;
     
    // Wait for some time to observe the results
    #120 reset = 0;
    image0 = 8'd12;
    image1 = 8'd3;
    image2 = 8'd5;
    image3 = 8'd0;
    image4 = 8'd4;
    image5 = 8'd8;
    image6 = 8'd2;
    image7 = 8'd3;
    image8 = 8'd2;
    
    #150 reset = 0;
    image0 = 8'd12;
    image1 = 8'd3;
    image2 = 8'd5;
    image3 = 8'd0;
    image4 = 8'd4;
    image5 = 8'd8;
    image6 = 8'd2;
    image7 = 8'd3;
    image8 = 8'd3;
    
    #180 reset = 0;
    image0 = 8'd12;
    image1 = 8'd3;
    image2 = 8'd5;
    image3 = 8'd0;
    image4 = 8'd4;
    image5 = 8'd8;
    image6 = 8'd2;
    image7 = 8'd3;
    image8 = 8'd4;
    
    #200;
    // Add more test cases if needed

    $finish;
end
endmodule
