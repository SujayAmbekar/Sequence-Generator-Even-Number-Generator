module even_seq_gen(input wire clock, reset, output wire [3:0]out);
	assign out[0] = 1'b0 ;
	wire s1, s2, s3, c1;

	invert i_0 (out[1], s1);
	xor2 x_0 (out[2], out[1], s2);
	and2 a_0 (out[2], out[1], c1);
	xor2 x_1 (c1, out[3], s3);

	dfr d_0 (clock, reset, s1, out[1]);
	dfr d_1 (clock, reset, s2, out[2]);
	dfr d_2 (clock, reset, s3, out[3]);
endmodule
