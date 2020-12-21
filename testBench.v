`timescale 1 ns / 100 ps
`define TESTVECS 8

module tb;
  reg clk, reset;
  reg [7:0] i0, i1;
  wire [8:0] o; wire cout;
  reg [31:0] test_vecs [0:(`TESTVECS-1)];
  integer i;
  initial begin $dumpfile("prefixAdder.vcd"); $dumpvars(0,tb); end
  initial begin reset = 1'b1; #12.5 reset = 1'b0; end
  initial clk = 1'b0; always #5 clk =~ clk;
  initial begin
  	//test_vecs[0][33:32] = 2'b00; test_vecs[0][31:8] = 16'h00;test_vecs[0][15:0] = 16'h00;
    
    test_vecs[0][15:8] = 16'b01;  test_vecs[0][7:0] = 16'b00;
    test_vecs[1][15:8] = 16'b01;  test_vecs[1][7:0] = 16'b01;
    test_vecs[2][15:8] = 16'hff;  test_vecs[2][7:0] = 16'b01;
    test_vecs[3][15:8] = 16'hff;  test_vecs[3][7:0] = 16'hff;
    test_vecs[4][15:8] = 16'haf;  test_vecs[4][7:0] = 16'hfa;
    test_vecs[5][15:8] = 16'hf1;  test_vecs[5][7:0] = 16'hf9;
    test_vecs[6][15:8] = 16'hcc;  test_vecs[6][7:0] = 16'hbb;
    test_vecs[7][15:8] = 16'hff;  test_vecs[7][7:0] = 16'h00;
    
  end
  initial {i0, i1} = 0;
  prefixAdder PA_0 (i0, i1, o);
  initial begin
    #6 for(i=0;i<`TESTVECS;i=i+1)
      begin #10 {i0, i1}=test_vecs[i]; end
    #100 $finish;
  end
endmodule
