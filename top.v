module ternary_4_mux_4_bits(
  input [3:0] A, [3:0] B, [3:0] C, [3:0] D,
  input Sel0, Sel1
  output [3:0] Y
);

  assign Y = Sel1 ? (Sel0 ? B : A) : (Sel0 ? D : C);

endmodule

module equivalence_check(
    input [1:0] select,
    output is_zero, is_one, is_two, is_three
);
    // Option one:
    assign is_zero  = ~select[0] && ~select[1]; // 0b00
    assign is_one   =  select[0] && ~select[1]; // 0b01
    assign is_two   = ~select[0] &&  select[1]; // 0b10
    assign is_three =  select[0] &&  select[1]; // 0b11
endmodule



