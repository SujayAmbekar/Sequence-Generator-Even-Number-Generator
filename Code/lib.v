module invert(input wire ip, output wire out);
	assign out = ! ip;
endmodule

module and2(input wire ip0, ip1, output wire out);
	assign out = ip0 & ip1;
endmodule

module xor2(input wire ip0, ip1, output wire out);
	assign out = ip0 ^ ip1;
endmodule

module and3(input wire ip0, ip1, ip2, output wire out);
	wire t;
	and2 and2_0 (ip0, ip1, t);
	and2 and2_1 (ip2, t, out);
endmodule

module df(input wire clk, in, output wire out);
	reg df_out;
	always @( posedge clk) df_out <= in;
	assign out = df_out;
endmodule

module dfr(input wire clk, reset, in, output wire out);
	wire reset_, df_in;
	invert invert_0 (reset, reset_);
	and2 and2_0 (in, reset_, df_in);
	df df_0 (clk, df_in, out);
endmodule
