module full_subber(
  input  [7:0] io_in_a,
  input  [7:0] io_in_b,
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [9:0] _result_T_2 = _result_T - 9'h0; // @[BinaryDesigns.scala 69:34]
  wire [8:0] result = _result_T_2[8:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 70:23]
  assign io_out_c = result[8]; // @[BinaryDesigns.scala 71:23]
endmodule
module full_subber_1(
  input  [22:0] io_in_b,
  output        io_out_c
);
  wire [23:0] _result_T = 23'h340000 - io_in_b; // @[BinaryDesigns.scala 69:23]
  wire [24:0] _result_T_2 = _result_T - 24'h0; // @[BinaryDesigns.scala 69:34]
  wire [23:0] result = _result_T_2[23:0]; // @[BinaryDesigns.scala 68:22 69:12]
  assign io_out_c = result[23]; // @[BinaryDesigns.scala 71:23]
endmodule
module FP_comparator(
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire [7:0] full_subber_io_in_a; // @[FloatingPointDesigns.scala 972:24]
  wire [7:0] full_subber_io_in_b; // @[FloatingPointDesigns.scala 972:24]
  wire [7:0] full_subber_io_out_s; // @[FloatingPointDesigns.scala 972:24]
  wire  full_subber_io_out_c; // @[FloatingPointDesigns.scala 972:24]
  wire [22:0] full_subber_1_io_in_b; // @[FloatingPointDesigns.scala 977:25]
  wire  full_subber_1_io_out_c; // @[FloatingPointDesigns.scala 977:25]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 951:62]
  wire [8:0] _GEN_0 = 9'h85 > _T_2 ? _T_2 : 9'h85; // @[FloatingPointDesigns.scala 951:68 952:14 954:14]
  wire [8:0] _GEN_5 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 956:34]
  wire [8:0] _GEN_1 = _GEN_5 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 956:68 957:14 959:14]
  wire [31:0] _GEN_2 = full_subber_1_io_out_c ? io_in_b : 32'h42b40000; // @[FloatingPointDesigns.scala 987:34 988:18 990:18]
  wire [31:0] _GEN_3 = full_subber_io_out_s > 8'h0 ? 32'h42b40000 : _GEN_2; // @[FloatingPointDesigns.scala 984:35 985:16]
  full_subber full_subber ( // @[FloatingPointDesigns.scala 972:24]
    .io_in_a(full_subber_io_in_a),
    .io_in_b(full_subber_io_in_b),
    .io_out_s(full_subber_io_out_s),
    .io_out_c(full_subber_io_out_c)
  );
  full_subber_1 full_subber_1 ( // @[FloatingPointDesigns.scala 977:25]
    .io_in_b(full_subber_1_io_in_b),
    .io_out_c(full_subber_1_io_out_c)
  );
  assign io_out_s = full_subber_io_out_c ? io_in_b : _GEN_3; // @[FloatingPointDesigns.scala 982:31 983:16]
  assign full_subber_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 950:19]
  assign full_subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 950:19]
  assign full_subber_1_io_in_b = io_in_b[22:0]; // @[FloatingPointDesigns.scala 965:23]
endmodule
module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[BinaryDesigns.scala 81:23]
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
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 294:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 294:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 294:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 294:24]
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
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
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
  assign subber_io_in_a = 8'h7f; // @[FloatingPointDesigns.scala 295:20]
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
module leadingOneDetector(
  input  [22:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] _hotValue_T = io_in[1] ? 2'h2 : 2'h1; // @[Mux.scala 47:70]
  wire [1:0] _hotValue_T_1 = io_in[2] ? 2'h3 : _hotValue_T; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_2 = io_in[3] ? 3'h4 : {{1'd0}, _hotValue_T_1}; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_3 = io_in[4] ? 3'h5 : _hotValue_T_2; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_4 = io_in[5] ? 3'h6 : _hotValue_T_3; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_5 = io_in[6] ? 3'h7 : _hotValue_T_4; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_6 = io_in[7] ? 4'h8 : {{1'd0}, _hotValue_T_5}; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_7 = io_in[8] ? 4'h9 : _hotValue_T_6; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_8 = io_in[9] ? 4'ha : _hotValue_T_7; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_9 = io_in[10] ? 4'hb : _hotValue_T_8; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_10 = io_in[11] ? 4'hc : _hotValue_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_11 = io_in[12] ? 4'hd : _hotValue_T_10; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_12 = io_in[13] ? 4'he : _hotValue_T_11; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_13 = io_in[14] ? 4'hf : _hotValue_T_12; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_14 = io_in[15] ? 5'h10 : {{1'd0}, _hotValue_T_13}; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_15 = io_in[16] ? 5'h11 : _hotValue_T_14; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_16 = io_in[17] ? 5'h12 : _hotValue_T_15; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_17 = io_in[18] ? 5'h13 : _hotValue_T_16; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_18 = io_in[19] ? 5'h14 : _hotValue_T_17; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_19 = io_in[20] ? 5'h15 : _hotValue_T_18; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_20 = io_in[21] ? 5'h16 : _hotValue_T_19; // @[Mux.scala 47:70]
  assign io_out = io_in[22] ? 5'h17 : _hotValue_T_20; // @[Mux.scala 47:70]
endmodule
module FP_extract(
  input  [31:0] io_in_a,
  output [31:0] io_out_frac,
  output [31:0] io_out
);
  wire [22:0] leadingOne_io_in; // @[FloatingPointDesigns.scala 890:28]
  wire [4:0] leadingOne_io_out; // @[FloatingPointDesigns.scala 890:28]
  wire [7:0] exp = io_in_a[30:23]; // @[FloatingPointDesigns.scala 884:19]
  wire [22:0] mant = io_in_a[22:0]; // @[FloatingPointDesigns.scala 886:20]
  wire [23:0] whole_mant = {1'h1,mant}; // @[FloatingPointDesigns.scala 888:28]
  wire [7:0] subres = exp - 8'h7f; // @[FloatingPointDesigns.scala 894:21]
  wire [7:0] _expr_T_1 = 8'h17 - subres; // @[FloatingPointDesigns.scala 895:41]
  wire [23:0] _expr_T_2 = whole_mant >> _expr_T_1; // @[FloatingPointDesigns.scala 895:26]
  wire [277:0] _GEN_3 = {{255'd0}, mant}; // @[FloatingPointDesigns.scala 897:27]
  wire [277:0] _firstshiftf_T = _GEN_3 << subres; // @[FloatingPointDesigns.scala 897:27]
  wire [4:0] _new_exp_T_1 = 5'h17 - leadingOne_io_out; // @[FloatingPointDesigns.scala 900:39]
  wire [4:0] _new_exp_T_3 = _new_exp_T_1 + 5'h1; // @[FloatingPointDesigns.scala 900:59]
  wire [6:0] _GEN_5 = {{2'd0}, _new_exp_T_3}; // @[FloatingPointDesigns.scala 900:25]
  wire [6:0] _new_exp_T_5 = 7'h7f - _GEN_5; // @[FloatingPointDesigns.scala 900:25]
  wire [22:0] firstshiftf = _firstshiftf_T[22:0]; // @[FloatingPointDesigns.scala 896:29 897:19]
  wire [53:0] _GEN_4 = {{31'd0}, firstshiftf}; // @[FloatingPointDesigns.scala 902:31]
  wire [53:0] _new_mant_T_4 = _GEN_4 << _new_exp_T_3; // @[FloatingPointDesigns.scala 902:31]
  wire [7:0] new_exp = {{1'd0}, _new_exp_T_5}; // @[FloatingPointDesigns.scala 899:25 900:15]
  wire [22:0] new_mant = _new_mant_T_4[22:0]; // @[FloatingPointDesigns.scala 901:26 902:16]
  wire [31:0] _result_frac_T_2 = {io_in_a[31],new_exp,new_mant}; // @[FloatingPointDesigns.scala 903:47]
  wire [7:0] _GEN_6 = {{3'd0}, _new_exp_T_3}; // @[FloatingPointDesigns.scala 909:22]
  wire [7:0] new_exp_1 = exp - _GEN_6; // @[FloatingPointDesigns.scala 909:22]
  wire [53:0] _GEN_7 = {{31'd0}, mant}; // @[FloatingPointDesigns.scala 911:24]
  wire [53:0] _new_mant_T_9 = _GEN_7 << _new_exp_T_3; // @[FloatingPointDesigns.scala 911:24]
  wire [22:0] new_mant_1 = _new_mant_T_9[22:0]; // @[FloatingPointDesigns.scala 910:26 911:16]
  wire [31:0] _result_frac_T_5 = {io_in_a[31],new_exp_1,new_mant_1}; // @[FloatingPointDesigns.scala 912:47]
  wire [31:0] _GEN_0 = exp < 8'h7f ? io_in_a : _result_frac_T_5; // @[FloatingPointDesigns.scala 904:29 905:19 912:19]
  wire  _GEN_1 = exp < 8'h7f ? 1'h0 : 1'h1; // @[FloatingPointDesigns.scala 882:10 904:29 907:12]
  wire [23:0] _GEN_2 = exp > 8'h7f ? _expr_T_2 : {{23'd0}, _GEN_1}; // @[FloatingPointDesigns.scala 892:24 895:12]
  leadingOneDetector leadingOne ( // @[FloatingPointDesigns.scala 890:28]
    .io_in(leadingOne_io_in),
    .io_out(leadingOne_io_out)
  );
  assign io_out_frac = exp > 8'h7f ? _result_frac_T_2 : _GEN_0; // @[FloatingPointDesigns.scala 892:24 903:19]
  assign io_out = {{8'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 881:20]
  assign leadingOne_io_in = exp > 8'h7f ? firstshiftf : mant; // @[FloatingPointDesigns.scala 891:22 892:24 898:24]
endmodule
module full_adder_3(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [23:0] io_out_s,
  output        io_out_c
);
  wire [24:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [25:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [24:0] result = _result_T_1[24:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[23:0]; // @[BinaryDesigns.scala 56:23]
  assign io_out_c = result[24]; // @[BinaryDesigns.scala 57:23]
endmodule
module twoscomplement_4(
  input  [23:0] io_in,
  output [23:0] io_out
);
  wire [23:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 24'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module shifter(
  input  [23:0] io_in_a,
  input  [4:0]  io_in_b,
  output [23:0] io_out_s
);
  wire [23:0] _result_T = io_in_a >> io_in_b; // @[BinaryDesigns.scala 39:25]
  wire [54:0] _GEN_0 = {{31'd0}, _result_T}; // @[BinaryDesigns.scala 38:26 39:14 41:14]
  assign io_out_s = _GEN_0[23:0]; // @[BinaryDesigns.scala 36:22]
endmodule
module leadingOneDetector_1(
  input  [23:0] io_in,
  output [4:0]  io_out
);
  wire [1:0] _hotValue_T = io_in[1] ? 2'h2 : 2'h1; // @[Mux.scala 47:70]
  wire [1:0] _hotValue_T_1 = io_in[2] ? 2'h3 : _hotValue_T; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_2 = io_in[3] ? 3'h4 : {{1'd0}, _hotValue_T_1}; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_3 = io_in[4] ? 3'h5 : _hotValue_T_2; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_4 = io_in[5] ? 3'h6 : _hotValue_T_3; // @[Mux.scala 47:70]
  wire [2:0] _hotValue_T_5 = io_in[6] ? 3'h7 : _hotValue_T_4; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_6 = io_in[7] ? 4'h8 : {{1'd0}, _hotValue_T_5}; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_7 = io_in[8] ? 4'h9 : _hotValue_T_6; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_8 = io_in[9] ? 4'ha : _hotValue_T_7; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_9 = io_in[10] ? 4'hb : _hotValue_T_8; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_10 = io_in[11] ? 4'hc : _hotValue_T_9; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_11 = io_in[12] ? 4'hd : _hotValue_T_10; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_12 = io_in[13] ? 4'he : _hotValue_T_11; // @[Mux.scala 47:70]
  wire [3:0] _hotValue_T_13 = io_in[14] ? 4'hf : _hotValue_T_12; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_14 = io_in[15] ? 5'h10 : {{1'd0}, _hotValue_T_13}; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_15 = io_in[16] ? 5'h11 : _hotValue_T_14; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_16 = io_in[17] ? 5'h12 : _hotValue_T_15; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_17 = io_in[18] ? 5'h13 : _hotValue_T_16; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_18 = io_in[19] ? 5'h14 : _hotValue_T_17; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_19 = io_in[20] ? 5'h15 : _hotValue_T_18; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_20 = io_in[21] ? 5'h16 : _hotValue_T_19; // @[Mux.scala 47:70]
  wire [4:0] _hotValue_T_21 = io_in[22] ? 5'h17 : _hotValue_T_20; // @[Mux.scala 47:70]
  assign io_out = io_in[23] ? 5'h18 : _hotValue_T_21; // @[Mux.scala 47:70]
endmodule
module FP_adder(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 78:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 78:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 78:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 78:24]
  wire [7:0] complement_io_in; // @[FloatingPointDesigns.scala 84:28]
  wire [7:0] complement_io_out; // @[FloatingPointDesigns.scala 84:28]
  wire [23:0] adder_io_in_a; // @[FloatingPointDesigns.scala 88:23]
  wire [23:0] adder_io_in_b; // @[FloatingPointDesigns.scala 88:23]
  wire [23:0] adder_io_out_s; // @[FloatingPointDesigns.scala 88:23]
  wire  adder_io_out_c; // @[FloatingPointDesigns.scala 88:23]
  wire [23:0] complementN_0_io_in; // @[FloatingPointDesigns.scala 94:31]
  wire [23:0] complementN_0_io_out; // @[FloatingPointDesigns.scala 94:31]
  wire [23:0] complementN_1_io_in; // @[FloatingPointDesigns.scala 96:31]
  wire [23:0] complementN_1_io_out; // @[FloatingPointDesigns.scala 96:31]
  wire [23:0] shifter_io_in_a; // @[FloatingPointDesigns.scala 100:25]
  wire [4:0] shifter_io_in_b; // @[FloatingPointDesigns.scala 100:25]
  wire [23:0] shifter_io_out_s; // @[FloatingPointDesigns.scala 100:25]
  wire [23:0] complementN_2_io_in; // @[FloatingPointDesigns.scala 145:31]
  wire [23:0] complementN_2_io_out; // @[FloatingPointDesigns.scala 145:31]
  wire [23:0] leadingOneFinder_io_in; // @[FloatingPointDesigns.scala 165:34]
  wire [4:0] leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 165:34]
  wire [7:0] subber2_io_in_a; // @[FloatingPointDesigns.scala 167:25]
  wire [7:0] subber2_io_in_b; // @[FloatingPointDesigns.scala 167:25]
  wire [7:0] subber2_io_out_s; // @[FloatingPointDesigns.scala 167:25]
  wire  subber2_io_out_c; // @[FloatingPointDesigns.scala 167:25]
  wire  sign_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 40:23]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 41:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 45:62]
  wire [8:0] _GEN_31 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 45:34]
  wire [8:0] _GEN_0 = _GEN_31 > _T_2 ? _T_2 : {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 45:68 46:14 48:14]
  wire [8:0] _GEN_32 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 50:34]
  wire [8:0] _GEN_1 = _GEN_32 > _T_2 ? _T_2 : {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 50:68 51:14 53:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 58:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 59:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 63:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 64:26]
  wire [7:0] exp_1 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 44:19]
  wire [7:0] exp_0 = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 44:19]
  wire [7:0] out_exp = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 106:34 107:15 117:15]
  wire [7:0] sub_exp = subber_io_out_c ? complement_io_out : subber_io_out_s; // @[FloatingPointDesigns.scala 106:34 108:15 118:15]
  wire  out_s = subber_io_out_c ? sign_1 : sign_0; // @[FloatingPointDesigns.scala 106:34 109:13 119:13]
  wire [22:0] out_frac = subber_io_out_c ? frac_1 : frac_0; // @[FloatingPointDesigns.scala 106:34 110:16 120:16]
  wire [23:0] _GEN_8 = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 106:34 114:21 89:19]
  wire [23:0] _GEN_9 = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 106:34 90:19 124:21]
  wire  _new_s_T = ~adder_io_out_c; // @[FloatingPointDesigns.scala 140:15]
  wire  _D_T_1 = sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 153:39]
  wire  D = _new_s_T | sign_0 ^ sign_1; // @[FloatingPointDesigns.scala 153:28]
  wire  E = _new_s_T & ~adder_io_out_s[23] | _new_s_T & ~_D_T_1 | adder_io_out_c & adder_io_out_s[23] & _D_T_1; // @[FloatingPointDesigns.scala 156:99]
  wire  _GEN_25 = sub_exp >= 8'h17 ? out_s : ~adder_io_out_c & sign_0 | sign_0 & sign_1 | ~adder_io_out_c & sign_1; // @[FloatingPointDesigns.scala 140:11 175:39 176:13]
  wire  new_s = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 1'h0 : _GEN_25; // @[FloatingPointDesigns.scala 171:62 172:13]
  wire [23:0] adder_result = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 159:18 160:47 161:20]
  wire [4:0] _subber2_io_in_b_T_1 = 5'h18 - leadingOneFinder_io_out; // @[FloatingPointDesigns.scala 169:42]
  wire [8:0] _GEN_33 = {{1'd0}, out_exp}; // @[FloatingPointDesigns.scala 183:20]
  wire [23:0] _new_out_frac_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 185:51]
  wire [7:0] _new_out_exp_T_3 = out_exp + 8'h1; // @[FloatingPointDesigns.scala 187:32]
  wire [8:0] _GEN_13 = _GEN_33 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_T_3}; // @[FloatingPointDesigns.scala 183:56 184:21 187:21]
  wire [23:0] _GEN_14 = _GEN_33 == _T_2 ? _new_out_frac_T_2 : {{1'd0}, adder_result[23:1]}; // @[FloatingPointDesigns.scala 183:56 185:22 188:22]
  wire [53:0] _GEN_2 = {{31'd0}, adder_result[22:0]}; // @[FloatingPointDesigns.scala 199:57]
  wire [53:0] _new_out_frac_T_7 = _GEN_2 << _subber2_io_in_b_T_1; // @[FloatingPointDesigns.scala 199:57]
  wire [7:0] _GEN_15 = subber2_io_out_c ? 8'h1 : subber2_io_out_s; // @[FloatingPointDesigns.scala 194:39 195:23 198:23]
  wire [53:0] _GEN_16 = subber2_io_out_c ? 54'h400000 : _new_out_frac_T_7; // @[FloatingPointDesigns.scala 194:39 196:24 199:24]
  wire [7:0] _GEN_17 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:0
    ]) ? 8'h0 : _GEN_15; // @[FloatingPointDesigns.scala 191:141 192:21]
  wire [53:0] _GEN_18 = leadingOneFinder_io_out == 5'h1 & adder_result == 24'h0 & (_D_T_1 & io_in_a[30:0] == io_in_b[30:
    0]) ? 54'h0 : _GEN_16; // @[FloatingPointDesigns.scala 191:141 141:18]
  wire [7:0] _GEN_19 = D ? _GEN_17 : 8'h0; // @[FloatingPointDesigns.scala 142:17 190:26]
  wire [53:0] _GEN_20 = D ? _GEN_18 : 54'h0; // @[FloatingPointDesigns.scala 141:18 190:26]
  wire [8:0] _GEN_21 = ~D ? _GEN_13 : {{1'd0}, _GEN_19}; // @[FloatingPointDesigns.scala 182:26]
  wire [53:0] _GEN_22 = ~D ? {{30'd0}, _GEN_14} : _GEN_20; // @[FloatingPointDesigns.scala 182:26]
  wire [8:0] _GEN_23 = E ? {{1'd0}, out_exp} : _GEN_21; // @[FloatingPointDesigns.scala 179:26 180:19]
  wire [53:0] _GEN_24 = E ? {{31'd0}, adder_result[22:0]} : _GEN_22; // @[FloatingPointDesigns.scala 179:26 181:20]
  wire [53:0] _GEN_26 = sub_exp >= 8'h17 ? {{31'd0}, out_frac} : _GEN_24; // @[FloatingPointDesigns.scala 175:39 177:20]
  wire [8:0] _GEN_27 = sub_exp >= 8'h17 ? {{1'd0}, out_exp} : _GEN_23; // @[FloatingPointDesigns.scala 175:39 178:19]
  wire [8:0] _GEN_29 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 9'h0 : _GEN_27; // @[FloatingPointDesigns.scala 171:62 173:19]
  wire [53:0] _GEN_30 = io_in_a[30:0] == 31'h0 & io_in_b[30:0] == 31'h0 ? 54'h0 : _GEN_26; // @[FloatingPointDesigns.scala 171:62 174:20]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 203:28]
  wire [7:0] new_out_exp = _GEN_29[7:0]; // @[FloatingPointDesigns.scala 139:27]
  wire [22:0] new_out_frac = _GEN_30[22:0]; // @[FloatingPointDesigns.scala 138:28]
  wire [31:0] _reg_out_s_T_1 = {new_s,new_out_exp,new_out_frac}; // @[FloatingPointDesigns.scala 205:39]
  full_subber subber ( // @[FloatingPointDesigns.scala 78:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  twoscomplement complement ( // @[FloatingPointDesigns.scala 84:28]
    .io_in(complement_io_in),
    .io_out(complement_io_out)
  );
  full_adder_3 adder ( // @[FloatingPointDesigns.scala 88:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  twoscomplement_4 complementN_0 ( // @[FloatingPointDesigns.scala 94:31]
    .io_in(complementN_0_io_in),
    .io_out(complementN_0_io_out)
  );
  twoscomplement_4 complementN_1 ( // @[FloatingPointDesigns.scala 96:31]
    .io_in(complementN_1_io_in),
    .io_out(complementN_1_io_out)
  );
  shifter shifter ( // @[FloatingPointDesigns.scala 100:25]
    .io_in_a(shifter_io_in_a),
    .io_in_b(shifter_io_in_b),
    .io_out_s(shifter_io_out_s)
  );
  twoscomplement_4 complementN_2 ( // @[FloatingPointDesigns.scala 145:31]
    .io_in(complementN_2_io_in),
    .io_out(complementN_2_io_out)
  );
  leadingOneDetector_1 leadingOneFinder ( // @[FloatingPointDesigns.scala 165:34]
    .io_in(leadingOneFinder_io_in),
    .io_out(leadingOneFinder_io_out)
  );
  full_subber subber2 ( // @[FloatingPointDesigns.scala 167:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 207:14]
  assign subber_io_in_a = _GEN_0[7:0]; // @[FloatingPointDesigns.scala 44:19]
  assign subber_io_in_b = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 44:19]
  assign complement_io_in = subber_io_out_s; // @[FloatingPointDesigns.scala 85:22]
  assign adder_io_in_a = sign_0 & ~sign_1 ? complementN_0_io_out : _GEN_8; // @[FloatingPointDesigns.scala 129:45 130:21]
  assign adder_io_in_b = sign_1 & ~sign_0 ? complementN_1_io_out : _GEN_9; // @[FloatingPointDesigns.scala 133:45 134:21]
  assign complementN_0_io_in = subber_io_out_c ? shifter_io_out_s : whole_frac_0; // @[FloatingPointDesigns.scala 106:34 114:21 89:19]
  assign complementN_1_io_in = subber_io_out_c ? whole_frac_1 : shifter_io_out_s; // @[FloatingPointDesigns.scala 106:34 90:19 124:21]
  assign shifter_io_in_a = subber_io_out_c ? whole_frac_0 : whole_frac_1; // @[FloatingPointDesigns.scala 106:34 111:23 121:23]
  assign shifter_io_in_b = sub_exp[4:0];
  assign complementN_2_io_in = adder_io_out_s; // @[FloatingPointDesigns.scala 146:25]
  assign leadingOneFinder_io_in = new_s & sign_0 != sign_1 ? complementN_2_io_out : adder_io_out_s; // @[FloatingPointDesigns.scala 159:18 160:47 161:20]
  assign subber2_io_in_a = subber_io_out_c ? exp_1 : exp_0; // @[FloatingPointDesigns.scala 106:34 107:15 117:15]
  assign subber2_io_in_b = {{3'd0}, _subber2_io_in_b_T_1}; // @[FloatingPointDesigns.scala 169:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 203:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 203:28]
    end else begin
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 205:15]
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
module FP_subber(
  input         clock,
  input         reset,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 219:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 219:26]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 219:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 219:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 219:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 222:23]
  FP_adder FP_adder ( // @[FloatingPointDesigns.scala 219:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 225:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_a = 32'h3fc00000; // @[FloatingPointDesigns.scala 223:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 222:39]
endmodule
module FP_reciprocal(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 413:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 413:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 413:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 413:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 413:29]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 423:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 423:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 423:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 423:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 423:29]
  wire  sub_clock; // @[FloatingPointDesigns.scala 434:21]
  wire  sub_reset; // @[FloatingPointDesigns.scala 434:21]
  wire [31:0] sub_io_in_b; // @[FloatingPointDesigns.scala 434:21]
  wire [31:0] sub_io_out_s; // @[FloatingPointDesigns.scala 434:21]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 442:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 442:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 442:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 442:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 442:29]
  wire  multiplier5_clock; // @[FloatingPointDesigns.scala 453:29]
  wire  multiplier5_reset; // @[FloatingPointDesigns.scala 453:29]
  wire [31:0] multiplier5_io_in_a; // @[FloatingPointDesigns.scala 453:29]
  wire [31:0] multiplier5_io_in_b; // @[FloatingPointDesigns.scala 453:29]
  wire [31:0] multiplier5_io_out_s; // @[FloatingPointDesigns.scala 453:29]
  wire  multiplier6_clock; // @[FloatingPointDesigns.scala 462:29]
  wire  multiplier6_reset; // @[FloatingPointDesigns.scala 462:29]
  wire [31:0] multiplier6_io_in_a; // @[FloatingPointDesigns.scala 462:29]
  wire [31:0] multiplier6_io_in_b; // @[FloatingPointDesigns.scala 462:29]
  wire [31:0] multiplier6_io_out_s; // @[FloatingPointDesigns.scala 462:29]
  wire  sub2_clock; // @[FloatingPointDesigns.scala 471:22]
  wire  sub2_reset; // @[FloatingPointDesigns.scala 471:22]
  wire [31:0] sub2_io_in_b; // @[FloatingPointDesigns.scala 471:22]
  wire [31:0] sub2_io_out_s; // @[FloatingPointDesigns.scala 471:22]
  wire  multiplier7_clock; // @[FloatingPointDesigns.scala 480:29]
  wire  multiplier7_reset; // @[FloatingPointDesigns.scala 480:29]
  wire [31:0] multiplier7_io_in_a; // @[FloatingPointDesigns.scala 480:29]
  wire [31:0] multiplier7_io_in_b; // @[FloatingPointDesigns.scala 480:29]
  wire [31:0] multiplier7_io_out_s; // @[FloatingPointDesigns.scala 480:29]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 487:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 487:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 487:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 487:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 487:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 390:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 387:46 388:14 390:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 384:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 398:25]
  wire [7:0] exp = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 401:38]
  wire [31:0] half_input = {io_in_a[31],exp,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 404:42]
  reg [31:0] half_input_reg_1; // @[FloatingPointDesigns.scala 406:35]
  reg [31:0] result_reg_1; // @[FloatingPointDesigns.scala 408:31]
  reg [31:0] input_reg_1; // @[FloatingPointDesigns.scala 410:30]
  reg [31:0] half_input_reg_2; // @[FloatingPointDesigns.scala 417:35]
  reg [31:0] result_reg_2; // @[FloatingPointDesigns.scala 419:31]
  reg [31:0] input_reg_2; // @[FloatingPointDesigns.scala 421:30]
  reg [31:0] half_input_reg_3; // @[FloatingPointDesigns.scala 428:35]
  reg [31:0] result_reg_3; // @[FloatingPointDesigns.scala 430:31]
  reg [31:0] input_reg_3; // @[FloatingPointDesigns.scala 432:30]
  reg [31:0] half_input_reg_4; // @[FloatingPointDesigns.scala 438:35]
  reg [31:0] input_reg_4; // @[FloatingPointDesigns.scala 440:30]
  reg [31:0] mult3_reg_1; // @[FloatingPointDesigns.scala 447:30]
  reg [31:0] half_input_reg_5; // @[FloatingPointDesigns.scala 449:35]
  reg [31:0] input_reg_5; // @[FloatingPointDesigns.scala 451:30]
  reg [31:0] mult3_reg_2; // @[FloatingPointDesigns.scala 458:30]
  reg [31:0] input_reg_6; // @[FloatingPointDesigns.scala 460:30]
  reg [31:0] mult3_reg_3; // @[FloatingPointDesigns.scala 467:30]
  reg [31:0] input_reg_7; // @[FloatingPointDesigns.scala 469:30]
  reg [31:0] input_reg_8; // @[FloatingPointDesigns.scala 478:30]
  reg [31:0] input_reg_9; // @[FloatingPointDesigns.scala 484:30]
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 413:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 423:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_subber sub ( // @[FloatingPointDesigns.scala 434:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_in_b(sub_io_in_b),
    .io_out_s(sub_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 442:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_multiplier multiplier5 ( // @[FloatingPointDesigns.scala 453:29]
    .clock(multiplier5_clock),
    .reset(multiplier5_reset),
    .io_in_a(multiplier5_io_in_a),
    .io_in_b(multiplier5_io_in_b),
    .io_out_s(multiplier5_io_out_s)
  );
  FP_multiplier multiplier6 ( // @[FloatingPointDesigns.scala 462:29]
    .clock(multiplier6_clock),
    .reset(multiplier6_reset),
    .io_in_a(multiplier6_io_in_a),
    .io_in_b(multiplier6_io_in_b),
    .io_out_s(multiplier6_io_out_s)
  );
  FP_subber sub2 ( // @[FloatingPointDesigns.scala 471:22]
    .clock(sub2_clock),
    .reset(sub2_reset),
    .io_in_b(sub2_io_in_b),
    .io_out_s(sub2_io_out_s)
  );
  FP_multiplier multiplier7 ( // @[FloatingPointDesigns.scala 480:29]
    .clock(multiplier7_clock),
    .reset(multiplier7_reset),
    .io_in_a(multiplier7_io_in_a),
    .io_in_b(multiplier7_io_in_b),
    .io_out_s(multiplier7_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 487:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {input_reg_9[31],multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 490:37]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 414:37]
  assign multiplier1_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 415:37]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 424:25]
  assign multiplier2_io_in_b = {1'h0,half_input_reg_1[30:0]}; // @[FloatingPointDesigns.scala 425:37]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 436:17]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = sub_io_out_s; // @[FloatingPointDesigns.scala 443:25]
  assign multiplier3_io_in_b = {1'h0,result_reg_3[30:0]}; // @[FloatingPointDesigns.scala 444:37]
  assign multiplier5_clock = clock;
  assign multiplier5_reset = reset;
  assign multiplier5_io_in_a = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 454:37]
  assign multiplier5_io_in_b = {1'h0,multiplier3_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 455:37]
  assign multiplier6_clock = clock;
  assign multiplier6_reset = reset;
  assign multiplier6_io_in_a = multiplier5_io_out_s; // @[FloatingPointDesigns.scala 463:25]
  assign multiplier6_io_in_b = {1'h0,half_input_reg_5[30:0]}; // @[FloatingPointDesigns.scala 464:37]
  assign sub2_clock = clock;
  assign sub2_reset = reset;
  assign sub2_io_in_b = multiplier6_io_out_s; // @[FloatingPointDesigns.scala 473:18]
  assign multiplier7_clock = clock;
  assign multiplier7_reset = reset;
  assign multiplier7_io_in_a = sub2_io_out_s; // @[FloatingPointDesigns.scala 481:25]
  assign multiplier7_io_in_b = {1'h0,mult3_reg_3[30:0]}; // @[FloatingPointDesigns.scala 482:37]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 488:37]
  assign multiplier4_io_in_b = {1'h0,multiplier7_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 489:37]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 406:35]
      half_input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 406:35]
    end else begin
      half_input_reg_1 <= half_input; // @[FloatingPointDesigns.scala 407:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 408:31]
      result_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 408:31]
    end else begin
      result_reg_1 <= result; // @[FloatingPointDesigns.scala 409:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 410:30]
      input_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 410:30]
    end else begin
      input_reg_1 <= io_in_a; // @[FloatingPointDesigns.scala 411:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 417:35]
      half_input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 417:35]
    end else begin
      half_input_reg_2 <= half_input_reg_1; // @[FloatingPointDesigns.scala 418:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 419:31]
      result_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 419:31]
    end else begin
      result_reg_2 <= result_reg_1; // @[FloatingPointDesigns.scala 420:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 421:30]
      input_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 421:30]
    end else begin
      input_reg_2 <= input_reg_1; // @[FloatingPointDesigns.scala 422:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 428:35]
      half_input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 428:35]
    end else begin
      half_input_reg_3 <= half_input_reg_2; // @[FloatingPointDesigns.scala 429:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 430:31]
      result_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 430:31]
    end else begin
      result_reg_3 <= result_reg_2; // @[FloatingPointDesigns.scala 431:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 432:30]
      input_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 432:30]
    end else begin
      input_reg_3 <= input_reg_2; // @[FloatingPointDesigns.scala 433:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 438:35]
      half_input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 438:35]
    end else begin
      half_input_reg_4 <= half_input_reg_3; // @[FloatingPointDesigns.scala 439:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 440:30]
      input_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 440:30]
    end else begin
      input_reg_4 <= input_reg_3; // @[FloatingPointDesigns.scala 441:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 447:30]
      mult3_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 447:30]
    end else begin
      mult3_reg_1 <= multiplier3_io_out_s; // @[FloatingPointDesigns.scala 448:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 449:35]
      half_input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 449:35]
    end else begin
      half_input_reg_5 <= half_input_reg_4; // @[FloatingPointDesigns.scala 450:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 451:30]
      input_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 451:30]
    end else begin
      input_reg_5 <= input_reg_4; // @[FloatingPointDesigns.scala 452:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 458:30]
      mult3_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 458:30]
    end else begin
      mult3_reg_2 <= mult3_reg_1; // @[FloatingPointDesigns.scala 459:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 460:30]
      input_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 460:30]
    end else begin
      input_reg_6 <= input_reg_5; // @[FloatingPointDesigns.scala 461:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 467:30]
      mult3_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 467:30]
    end else begin
      mult3_reg_3 <= mult3_reg_2; // @[FloatingPointDesigns.scala 468:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 469:30]
      input_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 469:30]
    end else begin
      input_reg_7 <= input_reg_6; // @[FloatingPointDesigns.scala 470:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 478:30]
      input_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 478:30]
    end else begin
      input_reg_8 <= input_reg_7; // @[FloatingPointDesigns.scala 479:17]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 484:30]
      input_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 484:30]
    end else begin
      input_reg_9 <= input_reg_8; // @[FloatingPointDesigns.scala 485:17]
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
  half_input_reg_1 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  result_reg_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  input_reg_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  half_input_reg_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  result_reg_2 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  input_reg_2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  half_input_reg_3 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  result_reg_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  input_reg_3 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  half_input_reg_4 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  input_reg_4 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  mult3_reg_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  half_input_reg_5 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  input_reg_5 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  mult3_reg_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  input_reg_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  mult3_reg_3 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  input_reg_7 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  input_reg_8 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  input_reg_9 = _RAND_19[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP_exponential2(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
  wire  multiplier0_clock; // @[FloatingPointDesigns.scala 804:29]
  wire  multiplier0_reset; // @[FloatingPointDesigns.scala 804:29]
  wire [31:0] multiplier0_io_in_a; // @[FloatingPointDesigns.scala 804:29]
  wire [31:0] multiplier0_io_in_b; // @[FloatingPointDesigns.scala 804:29]
  wire [31:0] multiplier0_io_out_s; // @[FloatingPointDesigns.scala 804:29]
  wire  adder0_clock; // @[FloatingPointDesigns.scala 808:24]
  wire  adder0_reset; // @[FloatingPointDesigns.scala 808:24]
  wire [31:0] adder0_io_in_a; // @[FloatingPointDesigns.scala 808:24]
  wire [31:0] adder0_io_in_b; // @[FloatingPointDesigns.scala 808:24]
  wire [31:0] adder0_io_out_s; // @[FloatingPointDesigns.scala 808:24]
  wire  multiplier1_clock; // @[FloatingPointDesigns.scala 811:29]
  wire  multiplier1_reset; // @[FloatingPointDesigns.scala 811:29]
  wire [31:0] multiplier1_io_in_a; // @[FloatingPointDesigns.scala 811:29]
  wire [31:0] multiplier1_io_in_b; // @[FloatingPointDesigns.scala 811:29]
  wire [31:0] multiplier1_io_out_s; // @[FloatingPointDesigns.scala 811:29]
  wire  adder1_clock; // @[FloatingPointDesigns.scala 815:24]
  wire  adder1_reset; // @[FloatingPointDesigns.scala 815:24]
  wire [31:0] adder1_io_in_a; // @[FloatingPointDesigns.scala 815:24]
  wire [31:0] adder1_io_in_b; // @[FloatingPointDesigns.scala 815:24]
  wire [31:0] adder1_io_out_s; // @[FloatingPointDesigns.scala 815:24]
  wire  multiplier2_clock; // @[FloatingPointDesigns.scala 818:29]
  wire  multiplier2_reset; // @[FloatingPointDesigns.scala 818:29]
  wire [31:0] multiplier2_io_in_a; // @[FloatingPointDesigns.scala 818:29]
  wire [31:0] multiplier2_io_in_b; // @[FloatingPointDesigns.scala 818:29]
  wire [31:0] multiplier2_io_out_s; // @[FloatingPointDesigns.scala 818:29]
  wire  adder2_clock; // @[FloatingPointDesigns.scala 822:24]
  wire  adder2_reset; // @[FloatingPointDesigns.scala 822:24]
  wire [31:0] adder2_io_in_a; // @[FloatingPointDesigns.scala 822:24]
  wire [31:0] adder2_io_in_b; // @[FloatingPointDesigns.scala 822:24]
  wire [31:0] adder2_io_out_s; // @[FloatingPointDesigns.scala 822:24]
  wire  multiplier3_clock; // @[FloatingPointDesigns.scala 825:29]
  wire  multiplier3_reset; // @[FloatingPointDesigns.scala 825:29]
  wire [31:0] multiplier3_io_in_a; // @[FloatingPointDesigns.scala 825:29]
  wire [31:0] multiplier3_io_in_b; // @[FloatingPointDesigns.scala 825:29]
  wire [31:0] multiplier3_io_out_s; // @[FloatingPointDesigns.scala 825:29]
  wire  adder3_clock; // @[FloatingPointDesigns.scala 829:24]
  wire  adder3_reset; // @[FloatingPointDesigns.scala 829:24]
  wire [31:0] adder3_io_in_a; // @[FloatingPointDesigns.scala 829:24]
  wire [31:0] adder3_io_in_b; // @[FloatingPointDesigns.scala 829:24]
  wire [31:0] adder3_io_out_s; // @[FloatingPointDesigns.scala 829:24]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 832:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 832:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 832:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 832:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 832:29]
  wire  adder4_clock; // @[FloatingPointDesigns.scala 836:24]
  wire  adder4_reset; // @[FloatingPointDesigns.scala 836:24]
  wire [31:0] adder4_io_in_a; // @[FloatingPointDesigns.scala 836:24]
  wire [31:0] adder4_io_in_b; // @[FloatingPointDesigns.scala 836:24]
  wire [31:0] adder4_io_out_s; // @[FloatingPointDesigns.scala 836:24]
  wire  recip_clock; // @[FloatingPointDesigns.scala 843:23]
  wire  recip_reset; // @[FloatingPointDesigns.scala 843:23]
  wire [31:0] recip_io_in_a; // @[FloatingPointDesigns.scala 843:23]
  wire [31:0] recip_io_out_s; // @[FloatingPointDesigns.scala 843:23]
  FP_multiplier multiplier0 ( // @[FloatingPointDesigns.scala 804:29]
    .clock(multiplier0_clock),
    .reset(multiplier0_reset),
    .io_in_a(multiplier0_io_in_a),
    .io_in_b(multiplier0_io_in_b),
    .io_out_s(multiplier0_io_out_s)
  );
  FP_adder adder0 ( // @[FloatingPointDesigns.scala 808:24]
    .clock(adder0_clock),
    .reset(adder0_reset),
    .io_in_a(adder0_io_in_a),
    .io_in_b(adder0_io_in_b),
    .io_out_s(adder0_io_out_s)
  );
  FP_multiplier multiplier1 ( // @[FloatingPointDesigns.scala 811:29]
    .clock(multiplier1_clock),
    .reset(multiplier1_reset),
    .io_in_a(multiplier1_io_in_a),
    .io_in_b(multiplier1_io_in_b),
    .io_out_s(multiplier1_io_out_s)
  );
  FP_adder adder1 ( // @[FloatingPointDesigns.scala 815:24]
    .clock(adder1_clock),
    .reset(adder1_reset),
    .io_in_a(adder1_io_in_a),
    .io_in_b(adder1_io_in_b),
    .io_out_s(adder1_io_out_s)
  );
  FP_multiplier multiplier2 ( // @[FloatingPointDesigns.scala 818:29]
    .clock(multiplier2_clock),
    .reset(multiplier2_reset),
    .io_in_a(multiplier2_io_in_a),
    .io_in_b(multiplier2_io_in_b),
    .io_out_s(multiplier2_io_out_s)
  );
  FP_adder adder2 ( // @[FloatingPointDesigns.scala 822:24]
    .clock(adder2_clock),
    .reset(adder2_reset),
    .io_in_a(adder2_io_in_a),
    .io_in_b(adder2_io_in_b),
    .io_out_s(adder2_io_out_s)
  );
  FP_multiplier multiplier3 ( // @[FloatingPointDesigns.scala 825:29]
    .clock(multiplier3_clock),
    .reset(multiplier3_reset),
    .io_in_a(multiplier3_io_in_a),
    .io_in_b(multiplier3_io_in_b),
    .io_out_s(multiplier3_io_out_s)
  );
  FP_adder adder3 ( // @[FloatingPointDesigns.scala 829:24]
    .clock(adder3_clock),
    .reset(adder3_reset),
    .io_in_a(adder3_io_in_a),
    .io_in_b(adder3_io_in_b),
    .io_out_s(adder3_io_out_s)
  );
  FP_multiplier multiplier4 ( // @[FloatingPointDesigns.scala 832:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  FP_adder adder4 ( // @[FloatingPointDesigns.scala 836:24]
    .clock(adder4_clock),
    .reset(adder4_reset),
    .io_in_a(adder4_io_in_a),
    .io_in_b(adder4_io_in_b),
    .io_out_s(adder4_io_out_s)
  );
  FP_reciprocal recip ( // @[FloatingPointDesigns.scala 843:23]
    .clock(recip_clock),
    .reset(recip_reset),
    .io_in_a(recip_io_in_a),
    .io_out_s(recip_io_out_s)
  );
  assign io_out_s = io_in_a[31] ? recip_io_out_s : adder4_io_out_s; // @[FloatingPointDesigns.scala 841:12 846:32 847:14]
  assign multiplier0_clock = clock;
  assign multiplier0_reset = reset;
  assign multiplier0_io_in_a = 32'h3c088700; // @[FloatingPointDesigns.scala 796:34 802:27]
  assign multiplier0_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 806:37]
  assign adder0_clock = clock;
  assign adder0_reset = reset;
  assign adder0_io_in_a = 32'h3d2aaaa0; // @[FloatingPointDesigns.scala 796:34 801:27]
  assign adder0_io_in_b = multiplier0_io_out_s; // @[FloatingPointDesigns.scala 810:20]
  assign multiplier1_clock = clock;
  assign multiplier1_reset = reset;
  assign multiplier1_io_in_a = adder0_io_out_s; // @[FloatingPointDesigns.scala 812:25]
  assign multiplier1_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 813:37]
  assign adder1_clock = clock;
  assign adder1_reset = reset;
  assign adder1_io_in_a = 32'h3e2aaac0; // @[FloatingPointDesigns.scala 796:34 800:27]
  assign adder1_io_in_b = multiplier1_io_out_s; // @[FloatingPointDesigns.scala 817:20]
  assign multiplier2_clock = clock;
  assign multiplier2_reset = reset;
  assign multiplier2_io_in_a = adder1_io_out_s; // @[FloatingPointDesigns.scala 819:25]
  assign multiplier2_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 820:37]
  assign adder2_clock = clock;
  assign adder2_reset = reset;
  assign adder2_io_in_a = 32'h3f000000; // @[FloatingPointDesigns.scala 796:34 799:27]
  assign adder2_io_in_b = multiplier2_io_out_s; // @[FloatingPointDesigns.scala 824:20]
  assign multiplier3_clock = clock;
  assign multiplier3_reset = reset;
  assign multiplier3_io_in_a = adder2_io_out_s; // @[FloatingPointDesigns.scala 826:25]
  assign multiplier3_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 827:37]
  assign adder3_clock = clock;
  assign adder3_reset = reset;
  assign adder3_io_in_a = 32'h3f800000; // @[FloatingPointDesigns.scala 796:34 798:27]
  assign adder3_io_in_b = multiplier3_io_out_s; // @[FloatingPointDesigns.scala 831:20]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_a = adder3_io_out_s; // @[FloatingPointDesigns.scala 833:25]
  assign multiplier4_io_in_b = {1'h0,io_in_a[30:0]}; // @[FloatingPointDesigns.scala 834:37]
  assign adder4_clock = clock;
  assign adder4_reset = reset;
  assign adder4_io_in_a = 32'h3f800000; // @[FloatingPointDesigns.scala 796:34 797:27]
  assign adder4_io_in_b = multiplier4_io_out_s; // @[FloatingPointDesigns.scala 838:20]
  assign recip_clock = clock;
  assign recip_reset = reset;
  assign recip_io_in_a = adder4_io_out_s; // @[FloatingPointDesigns.scala 844:19]
endmodule
module FP_exponential(
  input         clock,
  input         reset,
  input  [31:0] io_in_a,
  output [31:0] io_out_s
);
  wire [31:0] FP_comparator_io_in_b; // @[FloatingPointDesigns.scala 693:29]
  wire [31:0] FP_comparator_io_out_s; // @[FloatingPointDesigns.scala 693:29]
  wire  FP_multiplier_clock; // @[FloatingPointDesigns.scala 706:29]
  wire  FP_multiplier_reset; // @[FloatingPointDesigns.scala 706:29]
  wire [31:0] FP_multiplier_io_in_a; // @[FloatingPointDesigns.scala 706:29]
  wire [31:0] FP_multiplier_io_in_b; // @[FloatingPointDesigns.scala 706:29]
  wire [31:0] FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 706:29]
  wire [31:0] FP_extract_io_in_a; // @[FloatingPointDesigns.scala 709:32]
  wire [31:0] FP_extract_io_out_frac; // @[FloatingPointDesigns.scala 709:32]
  wire [31:0] FP_extract_io_out; // @[FloatingPointDesigns.scala 709:32]
  wire  FP_multiplier_1_clock; // @[FloatingPointDesigns.scala 712:29]
  wire  FP_multiplier_1_reset; // @[FloatingPointDesigns.scala 712:29]
  wire [31:0] FP_multiplier_1_io_in_a; // @[FloatingPointDesigns.scala 712:29]
  wire [31:0] FP_multiplier_1_io_in_b; // @[FloatingPointDesigns.scala 712:29]
  wire [31:0] FP_multiplier_1_io_out_s; // @[FloatingPointDesigns.scala 712:29]
  wire  FP_exponential2_clock; // @[FloatingPointDesigns.scala 715:28]
  wire  FP_exponential2_reset; // @[FloatingPointDesigns.scala 715:28]
  wire [31:0] FP_exponential2_io_in_a; // @[FloatingPointDesigns.scala 715:28]
  wire [31:0] FP_exponential2_io_out_s; // @[FloatingPointDesigns.scala 715:28]
  wire  FP_multiplier_2_clock; // @[FloatingPointDesigns.scala 717:29]
  wire  FP_multiplier_2_reset; // @[FloatingPointDesigns.scala 717:29]
  wire [31:0] FP_multiplier_2_io_in_a; // @[FloatingPointDesigns.scala 717:29]
  wire [31:0] FP_multiplier_2_io_in_b; // @[FloatingPointDesigns.scala 717:29]
  wire [31:0] FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 717:29]
  wire  FP_reciprocal_clock; // @[FloatingPointDesigns.scala 738:23]
  wire  FP_reciprocal_reset; // @[FloatingPointDesigns.scala 738:23]
  wire [31:0] FP_reciprocal_io_in_a; // @[FloatingPointDesigns.scala 738:23]
  wire [31:0] FP_reciprocal_io_out_s; // @[FloatingPointDesigns.scala 738:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 684:62]
  wire [8:0] _GEN_5 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 684:34]
  wire [23:0] _nf_T_1 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 688:39]
  wire [7:0] ne = _T_2[7:0]; // @[FloatingPointDesigns.scala 685:20 687:10]
  wire [22:0] nf = _nf_T_1[22:0]; // @[FloatingPointDesigns.scala 686:20 688:10]
  wire [31:0] _inputvalue_T_2 = {io_in_a[31],ne,nf}; // @[FloatingPointDesigns.scala 689:41]
  wire [31:0] inputvalue = _GEN_5 > _T_2 ? _inputvalue_T_2 : io_in_a; // @[FloatingPointDesigns.scala 684:68 689:18 691:18]
  wire [31:0] inputvalue2 = FP_comparator_io_out_s != 32'h42b40000 ? 32'h42b40000 : inputvalue; // @[FloatingPointDesigns.scala 698:39 699:19 701:19]
  wire [31:0] check_exp = 32'h7f + FP_extract_io_out; // @[FloatingPointDesigns.scala 719:39]
  wire [31:0] _GEN_6 = {{23'd0}, _T_2}; // @[FloatingPointDesigns.scala 724:20]
  wire [31:0] _GEN_2 = check_exp > _GEN_6 ? {{23'd0}, _T_2} : check_exp; // @[FloatingPointDesigns.scala 724:54 725:15 728:15]
  wire [23:0] _GEN_3 = check_exp > _GEN_6 ? _nf_T_1 : 24'h0; // @[FloatingPointDesigns.scala 724:54 726:16 729:16]
  wire [7:0] new_exp = _GEN_2[7:0]; // @[FloatingPointDesigns.scala 720:23]
  wire [8:0] _T_12 = {1'h0,new_exp}; // @[FloatingPointDesigns.scala 731:36]
  wire [22:0] new_frac = _GEN_3[22:0]; // @[FloatingPointDesigns.scala 722:24]
  wire [31:0] result = FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 735:22 736:12]
  FP_comparator FP_comparator ( // @[FloatingPointDesigns.scala 693:29]
    .io_in_b(FP_comparator_io_in_b),
    .io_out_s(FP_comparator_io_out_s)
  );
  FP_multiplier FP_multiplier ( // @[FloatingPointDesigns.scala 706:29]
    .clock(FP_multiplier_clock),
    .reset(FP_multiplier_reset),
    .io_in_a(FP_multiplier_io_in_a),
    .io_in_b(FP_multiplier_io_in_b),
    .io_out_s(FP_multiplier_io_out_s)
  );
  FP_extract FP_extract ( // @[FloatingPointDesigns.scala 709:32]
    .io_in_a(FP_extract_io_in_a),
    .io_out_frac(FP_extract_io_out_frac),
    .io_out(FP_extract_io_out)
  );
  FP_multiplier FP_multiplier_1 ( // @[FloatingPointDesigns.scala 712:29]
    .clock(FP_multiplier_1_clock),
    .reset(FP_multiplier_1_reset),
    .io_in_a(FP_multiplier_1_io_in_a),
    .io_in_b(FP_multiplier_1_io_in_b),
    .io_out_s(FP_multiplier_1_io_out_s)
  );
  FP_exponential2 FP_exponential2 ( // @[FloatingPointDesigns.scala 715:28]
    .clock(FP_exponential2_clock),
    .reset(FP_exponential2_reset),
    .io_in_a(FP_exponential2_io_in_a),
    .io_out_s(FP_exponential2_io_out_s)
  );
  FP_multiplier FP_multiplier_2 ( // @[FloatingPointDesigns.scala 717:29]
    .clock(FP_multiplier_2_clock),
    .reset(FP_multiplier_2_reset),
    .io_in_a(FP_multiplier_2_io_in_a),
    .io_in_b(FP_multiplier_2_io_in_b),
    .io_out_s(FP_multiplier_2_io_out_s)
  );
  FP_reciprocal FP_reciprocal ( // @[FloatingPointDesigns.scala 738:23]
    .clock(FP_reciprocal_clock),
    .reset(FP_reciprocal_reset),
    .io_in_a(FP_reciprocal_io_in_a),
    .io_out_s(FP_reciprocal_io_out_s)
  );
  assign io_out_s = io_in_a[31] ? FP_reciprocal_io_out_s : result; // @[FloatingPointDesigns.scala 741:32 742:16 744:16]
  assign FP_comparator_io_in_b = {1'h0,inputvalue[30:0]}; // @[FloatingPointDesigns.scala 695:33]
  assign FP_multiplier_clock = clock;
  assign FP_multiplier_reset = reset;
  assign FP_multiplier_io_in_a = 32'h3fb8aa3b; // @[FloatingPointDesigns.scala 707:22]
  assign FP_multiplier_io_in_b = {1'h0,inputvalue2[30:0]}; // @[FloatingPointDesigns.scala 708:34]
  assign FP_extract_io_in_a = FP_multiplier_io_out_s; // @[FloatingPointDesigns.scala 710:25]
  assign FP_multiplier_1_clock = clock;
  assign FP_multiplier_1_reset = reset;
  assign FP_multiplier_1_io_in_a = 32'h3f317216; // @[FloatingPointDesigns.scala 713:22]
  assign FP_multiplier_1_io_in_b = FP_extract_io_out_frac; // @[FloatingPointDesigns.scala 714:22]
  assign FP_exponential2_clock = clock;
  assign FP_exponential2_reset = reset;
  assign FP_exponential2_io_in_a = FP_multiplier_1_io_out_s; // @[FloatingPointDesigns.scala 716:21]
  assign FP_multiplier_2_clock = clock;
  assign FP_multiplier_2_reset = reset;
  assign FP_multiplier_2_io_in_a = {_T_12,new_frac}; // @[FloatingPointDesigns.scala 731:47]
  assign FP_multiplier_2_io_in_b = FP_exponential2_io_out_s; // @[FloatingPointDesigns.scala 732:22]
  assign FP_reciprocal_clock = clock;
  assign FP_reciprocal_reset = reset;
  assign FP_reciprocal_io_in_a = FP_multiplier_2_io_out_s; // @[FloatingPointDesigns.scala 735:22 736:12]
endmodule

