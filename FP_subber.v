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
module twoscomplement(
  input  [7:0] io_in,
  output [7:0] io_out
);
  wire [7:0] _x_T = ~io_in; // @[BinaryDesigns.scala 25:16]
  assign io_out = 8'h1 + _x_T; // @[BinaryDesigns.scala 25:14]
endmodule
module full_adder(
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
module twoscomplement_1(
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
module leadingOneDetector(
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
  full_adder adder ( // @[FloatingPointDesigns.scala 88:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  twoscomplement_1 complementN_0 ( // @[FloatingPointDesigns.scala 94:31]
    .io_in(complementN_0_io_in),
    .io_out(complementN_0_io_out)
  );
  twoscomplement_1 complementN_1 ( // @[FloatingPointDesigns.scala 96:31]
    .io_in(complementN_1_io_in),
    .io_out(complementN_1_io_out)
  );
  shifter shifter ( // @[FloatingPointDesigns.scala 100:25]
    .io_in_a(shifter_io_in_a),
    .io_in_b(shifter_io_in_b),
    .io_out_s(shifter_io_out_s)
  );
  twoscomplement_1 complementN_2 ( // @[FloatingPointDesigns.scala 145:31]
    .io_in(complementN_2_io_in),
    .io_out(complementN_2_io_out)
  );
  leadingOneDetector leadingOneFinder ( // @[FloatingPointDesigns.scala 165:34]
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
  input  [31:0] io_in_a,
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
  assign FP_adder_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 223:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 222:39]
endmodule

