module top(
  input [15:0]sw,
  input btnL,
  input btnU,
  input btnD,
  input btnR,
  input btnC,
  output [15:0]led
);
  wire [3:0] mux_out;
  wire [1:0] mux_sel;
  wire [1:0] demux_sel;

  assign mux_sel = {btnU, btnL};
  assign demux_sel = {btnR, btnD};

  mux mux_inst(
    .A (sw[3:0]),
    .B (sw[7:4]),
    .C (sw[11:8]),
    .D (sw[15:12]),
    .Sel (mux_sel),
    .Y (mux_out),
    .Enable(btnC)
  );
  
  demux demux_inst(
    .In  (mux_out),
    .Sel (demux_sel),
    .Y0  (led[3:0]),
    .Y1  (led[7:4]),
    .Y2  (led[11:8]),
    .Y3  (led[15:12]),
    .Enable(btnC)
  );

endmodule

module mux(
  input Enable,
  input [3:0] A, [3:0] B, [3:0] C, [3:0] D,
  input [1: 0] Sel,
  output [3:0] Y
);

  assign (Y = Sel[1] ? (Sel[0] ? D : C) : (Sel[0] ? B : A)) & Enable;

endmodule

module demux(
    input Enable,
    input [3:0] In,
    input [1:0] Sel,
    output [3:0] Y0, Y1, Y2, Y3
);
    
    assign Y0 = Enable & (~Sel[0] && ~Sel[1] ? In : 0); // Drive Y0 if Sel == 0
    assign Y1 = Enable & (Sel[0] && ~Sel[1] ? In : 0); // Drive Y1 if Sel == 1
    assign Y2 = Enable & (~Sel[0] &&  Sel[1] ? In : 0); // Drive Y3 if Sel == 1
    assign Y3 = Enable & (Sel[0] &&  Sel[1] ? In : 0); // Drive Y4 if Sel == 1

endmodule






















