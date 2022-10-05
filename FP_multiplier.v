module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[BinaryDesigns.scala 81:23]
endmodule
module full_subber(
  input  [7:0] io_in_b,
  output [7:0] io_out_s
);
  wire [8:0] _result_T = 8'h7f - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [9:0] _result_T_2 = _result_T - 9'h0; // @[BinaryDesigns.scala 69:34]
  wire [8:0] result = _result_T_2[8:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 70:23]
endmodule
module twoscomplement(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 8'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module full_adder(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s
);
  wire [8:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [9:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [8:0] result = _result_T_1[8:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 56:23]
endmodule
module FP_multiplier(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] multiplier_io_in_a; // @[FloatingPointDesigns.scala 289:28]
  wire [23:0] multiplier_io_in_b; // @[FloatingPointDesigns.scala 289:28]
  wire [47:0] multiplier_io_out_s; // @[FloatingPointDesigns.scala 289:28]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 294:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 294:24]
  wire [7:0] complementN_io_in; // @[FloatingPointDesigns.scala 300:29]
  wire [7:0] complementN_io_out; // @[FloatingPointDesigns.scala 300:29]
  wire [7:0] adderN_io_in_a; // @[FloatingPointDesigns.scala 304:24]
  wire [7:0] adderN_io_in_b; // @[FloatingPointDesigns.scala 304:24]
  wire [7:0] adderN_io_out_s; // @[FloatingPointDesigns.scala 304:24]
  wire  s_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 254:20]
  wire  s_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 255:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 259:62]
  wire [8:0] _GEN_13 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 259:34]
  wire [8:0] _GEN_0 = _GEN_13 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 259:68 260:14 262:14]
  wire [8:0] _GEN_14 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 264:34]
  wire [8:0] _GEN_1 = _GEN_14 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 264:68 265:14 267:14]
  wire [22:0] exp_check_0 = {{15'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 270:25 271:18]
  wire [22:0] _cond_holder_T_1 = exp_check_0 + 23'h1; // @[FloatingPointDesigns.scala 275:34]
  wire [22:0] exp_check_1 = {{15'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 270:25 272:18]
  wire [22:0] _cond_holder_T_3 = 23'h7f - exp_check_1; // @[FloatingPointDesigns.scala 275:80]
  wire [22:0] _cond_holder_T_4 = ~_cond_holder_T_3; // @[FloatingPointDesigns.scala 275:42]
  wire [22:0] _cond_holder_T_6 = _cond_holder_T_1 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 275:40]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 279:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 280:23]
  wire  new_s = s_0 ^ s_1; // @[FloatingPointDesigns.scala 311:19]
  wire [7:0] _new_exp_T_1 = adderN_io_out_s + 8'h1; // @[FloatingPointDesigns.scala 322:34]
  wire [22:0] _cond_holder_T_8 = exp_check_0 + 23'h2; // @[FloatingPointDesigns.scala 324:36]
  wire [22:0] _cond_holder_T_13 = _cond_holder_T_8 + _cond_holder_T_4; // @[FloatingPointDesigns.scala 324:42]
  wire [23:0] _new_mant_T_2 = {multiplier_io_out_s[46:24], 1'h0}; // @[FloatingPointDesigns.scala 330:73]
  wire [7:0] _GEN_2 = multiplier_io_out_s[47] ? _new_exp_T_1 : adderN_io_out_s; // @[FloatingPointDesigns.scala 321:60 322:15 327:15]
  wire [22:0] cond_holder = multiplier_io_out_s[47] ? _cond_holder_T_13 : _cond_holder_T_6; // @[FloatingPointDesigns.scala 321:60 324:19 329:19]
  wire [23:0] _GEN_5 = multiplier_io_out_s[47] ? {{1'd0}, multiplier_io_out_s[46:24]} : _new_mant_T_2; // @[FloatingPointDesigns.scala 321:60 325:16 330:16]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 332:28]
  wire [22:0] _T_12 = ~cond_holder; // @[FloatingPointDesigns.scala 334:51]
  wire [22:0] _T_14 = 23'h1 + _T_12; // @[FloatingPointDesigns.scala 334:49]
  wire [22:0] _GEN_15 = {{14'd0}, _T_2}; // @[FloatingPointDesigns.scala 334:42]
  wire [8:0] _GEN_6 = cond_holder > _GEN_15 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 339:63 340:17]
  wire [8:0] _GEN_9 = _GEN_15 >= _T_14 ? 9'h1 : _GEN_6; // @[FloatingPointDesigns.scala 334:67 335:15]
  wire [7:0] new_exp = _GEN_9[7:0]; // @[FloatingPointDesigns.scala 314:23]
  wire [23:0] _new_mant_T_4 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 341:47]
  wire [23:0] _GEN_7 = cond_holder > _GEN_15 ? _new_mant_T_4 : _GEN_5; // @[FloatingPointDesigns.scala 339:63 341:18]
  wire [23:0] _GEN_10 = _GEN_15 >= _T_14 ? 24'h400000 : _GEN_7; // @[FloatingPointDesigns.scala 334:67 336:16]
  wire [22:0] new_mant = _GEN_10[22:0]; // @[FloatingPointDesigns.scala 316:24]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_exp,new_mant}; // @[FloatingPointDesigns.scala 337:37]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 258:19]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 258:19]
  multiplier multiplier ( // @[FloatingPointDesigns.scala 289:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FloatingPointDesigns.scala 294:24]
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s)
  );
  twoscomplement complementN ( // @[FloatingPointDesigns.scala 300:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder adderN ( // @[FloatingPointDesigns.scala 304:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 349:14]
  assign multiplier_io_in_a = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 284:24]
  assign multiplier_io_in_b = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 285:24]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 258:19]
  assign complementN_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 301:23]
  assign adderN_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 258:19]
  assign adderN_io_in_b = complementN_io_out; // @[FloatingPointDesigns.scala 306:20]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 332:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 332:28]
    end else if (exp_0 == 8'h0 | exp_1 == 8'h0) begin // @[FloatingPointDesigns.scala 344:43]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 345:17]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 347:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_out_s = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

