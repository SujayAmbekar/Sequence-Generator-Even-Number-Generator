`timescale 1 ns / 100 ps
module tb;
// Initialising clock reset and output wires and sequence generator module
wire [ 3 : 0 ] out;
reg clk, reset;
even_seq_gen s_g0 (clk, reset, out);
// Generating a dump file and the dump variable
initial begin
$dumpfile ( "tb_seq_gen.vcd" );
$dumpvars ( 0 ,tb);
end
// executing the sequence generator module
initial begin
reset = 1'b1 ;
#10 reset = 1'b0 ;
end
initial clk = 1'b0 ;
always #5 clk =~ clk;
initial #200 $finish ;
endmodule
