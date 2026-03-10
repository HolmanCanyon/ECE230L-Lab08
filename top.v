module top(
  input [15:0]sw,
  output [15:0]led
);
    
  demux demux_inst(
    .In  (sw[3:0]),
    .Sel (sw[5:4]),
    .Y0  (led[3:0]),
    .Y1  (led[7:4]),
    .Y2  (led[11:8]),
    .Y3  (led[15:12])
  );

endmodule

module ternary_4_mux_4_bits(
  input [3:0] A, [3:0] B, [3:0] C, [3:0] D,
  input [1: 0] Sel
  output [3:0] Y
);

  assign Y = Sel[1] ? (Sel[0] ? B : A) : (Sel[0] ? D : C);

endmodule

module demux(
    input [3:0] In,
    input [1:0] Sel,
    output [3:0] Y1,
    output [3:0] Y2
);

    assign Y0 = (~Sel[0] && ~Sel[1] ? In : 0); // Drive Y0 if Sel == 0
    assign Y1 = (Sel[0] && ~Sel[1]; ? In : 0); // Drive Y1 if Sel == 1
    assign Y2 = (~Sel[0] &&  Sel[1] ? In : 0); // Drive Y3 if Sel == 1
    assign Y3 = (Sel[0] &&  Sel[1] ? In : 0); // Drive Y4 if Sel == 1

endmodule







