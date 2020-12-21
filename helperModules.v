module invert(input wire i, output wire o1);
	assign o1 = !i;
endmodule

module and2(input wire i0, i1, output wire o2);
	assign o2 = i0 & i1;
endmodule

module and3(input wire i0, i1, i2, output wire o6);
	assign o6 = i0 & i1 & i2;
endmodule

module or2(input wire i0, i1, output wire o3);
	assign o3 = i0 | i1;
endmodule

module xor2_v2(input wire i0, i1, output wire o3);
	assign o3 = ( i0 & (!i1) ) | ( i1 & (!i0) );
endmodule

module xor2(input wire i0, i1, output wire o4);
	assign o4 = i0 ^ i1;
endmodule

module xor3(input wire i0, i1, i2, output wire o7);
	assign o7 = i0 ^ i1 ^ i2;
endmodule

module xor3E(input wire i0, i1, i2, output wire o7);
	assign o7 = ( !i0 & !i1 & i2 ) | ( !i0 & i1 & !i2 ) | ( i0 & !i1 & !i2 );// | ( i0 & i1 & i2 );
endmodule

module or3(input wire i0, i1, i2, output wire o4);
	assign o4 = i0 | i1 | i2;
endmodule

module nand2(input wire i0, i1, output wire o5);
	wire t;
	and2 and2_0 (i0, i1, t);
	invert invert_0 (t, o5);
endmodule
