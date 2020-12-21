module and_or2(input wire a, b, c, x, y, output wire d, e);
	and2 and2_d(a, b, t);
	or2 or2_d(t, c, d);
	and2 and2_e(x, y, e);
endmodule

module prefixAdder(
input [7:0] a,
input [7:0] b,
output [8:0] sum
);
	wire [15:0] p;
	wire [15:0] g;
	wire [15:0] cp1;
	wire [15:0] cg1;
	wire cp22;
	wire cg22;
	wire cp23;
	wire cg23;
	wire cp27;
	wire cg27;
	wire cp34;
	wire cg34;
	wire cp35;
	wire cg35;
	wire cp36;
	wire cg36;
	wire cp37;
	wire cg37;
	wire cp211;
	wire cg211;
	wire cp215;
	wire cg215;
	wire cp315;
	wire cg315;
	wire cp411;
	wire cg411;
	wire cp415;
	wire cg415;
	wire cp59;
	wire cg59;
	wire cp513;
	wire cg513;

	wire [8:0] s;
	// start fist level
	xor2 xor2_p0(a[0], b[0], p[0]);

	and2 a2(a[0], b[0], g[0]); //assign g[0] = a[0] & b[0];
	assign cp1[0] = p[0];
	assign cg1[0] = g[0]; //first level zero bit complete

	xor2 xor2_p1(a[1], b[1], p[1]); // assign p[1] = a[1] ^ b[1]; //first level first bit start
	and2 and2_g1(a[1], b[1], g[1]); // assign g[1] = a[1] & b[1];
	and_or2 and_or_cg1_1(p[1], g[0], g[1], p[1], g[0], cg1[1], cp1[1]); // first level first bit complete

	xor2 xor2_p2(a[2], b[2], p[2]); // assign p[2] = a[2] ^ b[2]; //first level 2nd bit start
	and2 and2_g2(a[2], b[2], g[2]); // assign g[2] = a[2] & b[2];
	assign cp1[2] = p[2];
	assign cg1[2] = g[2]; // first level 2nd bit complete

	xor2 xor2_p3(a[3], b[3], p[3]); //first level 3rd bit start
	and2 and2_g3(a[3], b[3], g[3]); 
	and_or2 and_or_cg1_3(p[3], g[2], g[3], p[3], p[2], cg1[3], cp1[3]); 
	//first level 3rd bit complete

	xor2 xpr2_p4(a[4], b[4], p[4]); 
	and2 and2_g4(a[4], b[4], g[4]);
	assign cg1[4] = g[4];
	assign cp1[4] = p[4];

	xor2 xor2_p5(a[5], b[5], p[5]); 
	and2 and2_g5(a[5], b[5], g[5]); 
	and_or2 and_or_cg1_5(p[5], g[4], g[5], p[5], p[4], cg1[5], cp1[5]);

	xor2 xor2_p6(a[6], b[6], p[6]);
	and2 and2_g6(a[6], b[6], g[6]);
	assign cg1[6] = g[6];
	assign cp1[6] = p[6];

	xor2 xor2_p7(a[7], b[7], p[7]);
	and2 and2_g7(a[7], b[7], g[7]); 
	and_or2 and_or_cg1_7(p[7], g[6], g[7], p[7], p[6], cg1[7], cp1[7]); 

	and_or2 and_or_cg2_2(cp1[2], cg1[1], cg1[2], cp1[2], cp1[1], cg22, cp22);
	and_or2 and_or_cg2_3(cp1[3], cg1[1], cg1[3], cp1[3], cp1[1], cg23, cp23);

	and_or2 and_or_cg2_7(cp1[7], cg1[5], cg1[7], cp1[7], cp1[5], cg27, cp27);

	and_or2 and_or_cg3_4(cp1[4], cg23, cg1[4], cp1[4], cp23, cg34, cp34); 

	and_or2 and_or_cg3_5(cp1[5], cg23, cg1[5], cp1[5], cp23, cg35, cp35); 

	and_or2 and_or_cg3_6(cp1[6], cg35, cg1[6], cp1[6], cp35, cg36, cp36);
	and_or2 and_or_cg3_7(cp27,   cg23, cg27,   cp27,   cp23, cg37, cp37);

	and_or2 and_or_cg2_11(cp1[11], cg1[9], cg1[11], cp1[11], cp1[9], cg211, cp211);

	and_or2 and_or_cg2_15(cp1[15], cg1[11], cg1[15], cp1[15], cp1[11], cg215, cp215);

	and_or2 and_or_cg3_15(cp215, cg211, cg215, cp215, cp211, cg315, cp315);

	and_or2 and_or_cg4_11(cp211, cg37, cg211, cp211, cp37, cg411, cp411);

	and_or2 and_or_cg4_15(cp315, cg37, cg315, cp315, cp37, cg415, cp415);

	and_or2 and_or_cg5_9(cp1[9], cg37, cg1[9], cp1[9], cp37 , cg59, cp59);

	and_or2 and_or_cg5_13(cp1[13], cg411, cg1[13], cp1[13], cp411, cg513, cp513);


	assign s[0] = p[0];
	xor2 xor2_s1(p[1], cg1[0], s[1]); 
	xor2 xor2_s2(p[2], cg1[1], s[2]); 
	xor2 xor2_s3(p[3], cg22, s[3]); 
	xor2 xor2_s4(p[4], cg23, s[4]); 
	xor2 xor2_s5(p[5], cg34, s[5]); 
	xor2 xor2_s6(p[6], cg35, s[6]); 
	xor2 xor2_s7(p[7], cg36, s[7]); 
	assign s[8] =  cg37;

	assign sum = {s[8:0]};

endmodule