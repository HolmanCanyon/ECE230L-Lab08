module ternary_2_mux_2_bits(
  input [3:0] A, [3:0] B,
  input Sel,
  output [3:0] Y
);

    assign Y = (Sel ? B : A);

endmodule
