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
  output [7:0] io_out_s,
  output       io_out_c
);
  wire [8:0] _result_T = io_in_a + io_in_b; // @[BinaryDesigns.scala 55:23]
  wire [9:0] _result_T_1 = {{1'd0}, _result_T}; // @[BinaryDesigns.scala 55:34]
  wire [8:0] result = _result_T_1[8:0]; // @[BinaryDesigns.scala 54:22 55:12]
  assign io_out_s = result[7:0]; // @[BinaryDesigns.scala 56:23]
  assign io_out_c = result[8]; // @[BinaryDesigns.scala 57:23]
endmodule
module FP_multiplier_10ccs(
  input         clock,
  input         reset,
  input         io_in_en,
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
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
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
`endif // RANDOMIZE_REG_INIT
  wire [23:0] multiplier_io_in_a; // @[FloatingPointDesigns.scala 1725:28]
  wire [23:0] multiplier_io_in_b; // @[FloatingPointDesigns.scala 1725:28]
  wire [47:0] multiplier_io_out_s; // @[FloatingPointDesigns.scala 1725:28]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 1732:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 1732:24]
  wire [7:0] complementN_io_in; // @[FloatingPointDesigns.scala 1741:29]
  wire [7:0] complementN_io_out; // @[FloatingPointDesigns.scala 1741:29]
  wire [7:0] adderN_io_in_a; // @[FloatingPointDesigns.scala 1758:24]
  wire [7:0] adderN_io_in_b; // @[FloatingPointDesigns.scala 1758:24]
  wire [7:0] adderN_io_out_s; // @[FloatingPointDesigns.scala 1758:24]
  wire  adderN_io_out_c; // @[FloatingPointDesigns.scala 1758:24]
  wire  s_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 1691:20]
  wire  s_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 1692:20]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1696:64]
  wire [8:0] _GEN_63 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 1696:36]
  wire [7:0] _GEN_0 = io_in_a[30:23] < 8'h1 ? 8'h1 : io_in_a[30:23]; // @[FloatingPointDesigns.scala 1698:45 1699:14 1701:14]
  wire [8:0] _GEN_1 = _GEN_63 > _T_2 ? _T_2 : {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1696:71 1697:14]
  wire [8:0] _GEN_64 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1703:36]
  wire [7:0] _GEN_2 = io_in_b[30:23] < 8'h1 ? 8'h1 : io_in_b[30:23]; // @[FloatingPointDesigns.scala 1705:45 1706:14 1708:14]
  wire [8:0] _GEN_3 = _GEN_64 > _T_2 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 1703:71 1704:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 1713:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1714:23]
  wire [23:0] new_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 1718:24]
  wire [23:0] new_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 1719:24]
  reg  s_reg_0_0; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_0_1; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_1_0; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_1_1; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_2_0; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_2_1; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_3_0; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_3_1; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_4_0; // @[FloatingPointDesigns.scala 1721:24]
  reg  s_reg_4_1; // @[FloatingPointDesigns.scala 1721:24]
  reg [7:0] exp_reg_0_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_0_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_1_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_1_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_2_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_2_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_3_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_3_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_4_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_4_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_5_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_5_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_6_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_6_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_7_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_7_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_8_0; // @[FloatingPointDesigns.scala 1722:26]
  reg [7:0] exp_reg_8_1; // @[FloatingPointDesigns.scala 1722:26]
  reg [23:0] new_frac_reg_0_0; // @[FloatingPointDesigns.scala 1723:31]
  reg [23:0] new_frac_reg_0_1; // @[FloatingPointDesigns.scala 1723:31]
  reg [23:0] new_frac_reg_1_0; // @[FloatingPointDesigns.scala 1723:31]
  reg [23:0] new_frac_reg_1_1; // @[FloatingPointDesigns.scala 1723:31]
  reg [47:0] multipplier_out_s_reg_0; // @[FloatingPointDesigns.scala 1729:40]
  reg [47:0] multipplier_out_s_reg_1; // @[FloatingPointDesigns.scala 1729:40]
  reg [47:0] multipplier_out_s_reg_2; // @[FloatingPointDesigns.scala 1729:40]
  reg [47:0] multipplier_out_s_reg_3; // @[FloatingPointDesigns.scala 1729:40]
  reg [47:0] multipplier_out_s_reg_4; // @[FloatingPointDesigns.scala 1729:40]
  reg [47:0] multipplier_out_s_reg_5; // @[FloatingPointDesigns.scala 1729:40]
  reg [7:0] subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1737:35]
  reg [7:0] complementN_out_reg_0; // @[FloatingPointDesigns.scala 1744:38]
  reg [7:0] complementN_out_reg_1; // @[FloatingPointDesigns.scala 1744:38]
  reg [7:0] complementN_out_reg_2; // @[FloatingPointDesigns.scala 1744:38]
  wire  new_s = s_reg_4_0 ^ s_reg_4_1; // @[FloatingPointDesigns.scala 1747:26]
  reg  new_s_reg_0; // @[FloatingPointDesigns.scala 1749:28]
  reg  new_s_reg_1; // @[FloatingPointDesigns.scala 1749:28]
  reg  new_s_reg_2; // @[FloatingPointDesigns.scala 1749:28]
  reg  new_s_reg_3; // @[FloatingPointDesigns.scala 1749:28]
  wire  is_exp1_neg_wire = exp_reg_5_1 < 8'h7f; // @[FloatingPointDesigns.scala 1752:40]
  reg  is_exp1_neg_reg_0; // @[FloatingPointDesigns.scala 1754:34]
  reg  is_exp1_neg_reg_1; // @[FloatingPointDesigns.scala 1754:34]
  wire [7:0] _adderN_io_in_a_T_1 = exp_reg_6_0 + 8'h1; // @[FloatingPointDesigns.scala 1762:39]
  reg [7:0] adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1769:35]
  reg  adderN_out_c_reg_0; // @[FloatingPointDesigns.scala 1770:35]
  reg [7:0] new_exp_reg_0; // @[FloatingPointDesigns.scala 1772:30]
  reg [22:0] new_mant_reg_0; // @[FloatingPointDesigns.scala 1773:31]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 1775:28]
  wire  _new_exp_reg_0_T_1 = ~adderN_out_c_reg_0; // @[FloatingPointDesigns.scala 1779:55]
  wire [7:0] _new_exp_reg_0_T_2 = ~adderN_out_c_reg_0 ? 8'h1 : adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1779:54]
  wire  _new_exp_reg_0_T_5 = adderN_out_c_reg_0 | adderN_out_s_reg_0 > 8'hfe; // @[FloatingPointDesigns.scala 1779:142]
  wire [7:0] _new_exp_reg_0_T_6 = adderN_out_c_reg_0 | adderN_out_s_reg_0 > 8'hfe ? 8'hfe : adderN_out_s_reg_0; // @[FloatingPointDesigns.scala 1779:114]
  wire [7:0] _new_exp_reg_0_T_7 = is_exp1_neg_reg_1 ? _new_exp_reg_0_T_2 : _new_exp_reg_0_T_6; // @[FloatingPointDesigns.scala 1779:30]
  wire [22:0] _new_mant_reg_0_T_3 = _new_exp_reg_0_T_1 ? 23'h0 : multipplier_out_s_reg_5[46:24]; // @[FloatingPointDesigns.scala 1780:55]
  wire [22:0] _new_mant_reg_0_T_8 = _new_exp_reg_0_T_5 ? 23'h7fffff : multipplier_out_s_reg_5[46:24]; // @[FloatingPointDesigns.scala 1780:160]
  wire [22:0] _new_mant_reg_0_T_13 = _new_exp_reg_0_T_1 ? 23'h0 : multipplier_out_s_reg_5[45:23]; // @[FloatingPointDesigns.scala 1783:55]
  wire [22:0] _new_mant_reg_0_T_18 = _new_exp_reg_0_T_5 ? 23'h7fffff : multipplier_out_s_reg_5[45:23]; // @[FloatingPointDesigns.scala 1783:156]
  wire [31:0] _reg_out_s_T_1 = {new_s_reg_3,new_exp_reg_0,new_mant_reg_0}; // @[FloatingPointDesigns.scala 1821:53]
  wire [7:0] exp_0 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 1695:19]
  wire [7:0] exp_1 = _GEN_3[7:0]; // @[FloatingPointDesigns.scala 1695:19]
  multiplier multiplier ( // @[FloatingPointDesigns.scala 1725:28]
    .io_in_a(multiplier_io_in_a),
    .io_in_b(multiplier_io_in_b),
    .io_out_s(multiplier_io_out_s)
  );
  full_subber subber ( // @[FloatingPointDesigns.scala 1732:24]
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s)
  );
  twoscomplement complementN ( // @[FloatingPointDesigns.scala 1741:29]
    .io_in(complementN_io_in),
    .io_out(complementN_io_out)
  );
  full_adder adderN ( // @[FloatingPointDesigns.scala 1758:24]
    .io_in_a(adderN_io_in_a),
    .io_in_b(adderN_io_in_b),
    .io_out_s(adderN_io_out_s),
    .io_out_c(adderN_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 1824:14]
  assign multiplier_io_in_a = new_frac_reg_1_0; // @[FloatingPointDesigns.scala 1726:24]
  assign multiplier_io_in_b = new_frac_reg_1_1; // @[FloatingPointDesigns.scala 1727:24]
  assign subber_io_in_b = exp_reg_2_1; // @[FloatingPointDesigns.scala 1734:20]
  assign complementN_io_in = subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1742:23]
  assign adderN_io_in_a = multipplier_out_s_reg_4[47] ? _adderN_io_in_a_T_1 : exp_reg_6_0; // @[FloatingPointDesigns.scala 1761:70 1762:22 1765:22]
  assign adderN_io_in_b = complementN_out_reg_2; // @[FloatingPointDesigns.scala 1761:70 1763:22 1766:22]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_0_0 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_0_0 <= s_0; // @[FloatingPointDesigns.scala 1786:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_0_1 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_0_1 <= s_1; // @[FloatingPointDesigns.scala 1786:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_1_0 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_1_0 <= s_reg_0_0; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_1_1 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_1_1 <= s_reg_0_1; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_2_0 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_2_0 <= s_reg_1_0; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_2_1 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_2_1 <= s_reg_1_1; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_3_0 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_3_0 <= s_reg_2_0; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_3_1 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_3_1 <= s_reg_2_1; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_4_0 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_4_0 <= s_reg_3_0; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1721:24]
      s_reg_4_1 <= 1'h0; // @[FloatingPointDesigns.scala 1721:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      s_reg_4_1 <= s_reg_3_1; // @[FloatingPointDesigns.scala 1803:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_0_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_0_0 <= exp_0; // @[FloatingPointDesigns.scala 1787:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_0_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_0_1 <= exp_1; // @[FloatingPointDesigns.scala 1787:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_1_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_1_0 <= exp_reg_0_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_1_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_1_1 <= exp_reg_0_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_2_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_2_0 <= exp_reg_1_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_2_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_2_1 <= exp_reg_1_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_3_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_3_0 <= exp_reg_2_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_3_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_3_1 <= exp_reg_2_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_4_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_4_0 <= exp_reg_3_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_4_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_4_1 <= exp_reg_3_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_5_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_5_0 <= exp_reg_4_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_5_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_5_1 <= exp_reg_4_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_6_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_6_0 <= exp_reg_5_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_6_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_6_1 <= exp_reg_5_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_7_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_7_0 <= exp_reg_6_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_7_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_7_1 <= exp_reg_6_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_8_0 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_8_0 <= exp_reg_7_0; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1722:26]
      exp_reg_8_1 <= 8'h0; // @[FloatingPointDesigns.scala 1722:26]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      exp_reg_8_1 <= exp_reg_7_1; // @[FloatingPointDesigns.scala 1799:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1723:31]
      new_frac_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1723:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_frac_reg_0_0 <= new_frac_0; // @[FloatingPointDesigns.scala 1788:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1723:31]
      new_frac_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1723:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_frac_reg_0_1 <= new_frac_1; // @[FloatingPointDesigns.scala 1788:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1723:31]
      new_frac_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1723:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_frac_reg_1_0 <= new_frac_reg_0_0; // @[FloatingPointDesigns.scala 1809:35]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1723:31]
      new_frac_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1723:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_frac_reg_1_1 <= new_frac_reg_0_1; // @[FloatingPointDesigns.scala 1809:35]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_0 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_0 <= multiplier_io_out_s; // @[FloatingPointDesigns.scala 1789:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_1 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_1 <= multipplier_out_s_reg_0; // @[FloatingPointDesigns.scala 1801:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_2 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_2 <= multipplier_out_s_reg_1; // @[FloatingPointDesigns.scala 1801:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_3 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_3 <= multipplier_out_s_reg_2; // @[FloatingPointDesigns.scala 1801:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_4 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_4 <= multipplier_out_s_reg_3; // @[FloatingPointDesigns.scala 1801:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1729:40]
      multipplier_out_s_reg_5 <= 48'h0; // @[FloatingPointDesigns.scala 1729:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      multipplier_out_s_reg_5 <= multipplier_out_s_reg_4; // @[FloatingPointDesigns.scala 1801:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1737:35]
      subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1737:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      subber_out_s_reg_0 <= subber_io_out_s; // @[FloatingPointDesigns.scala 1790:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1744:38]
      complementN_out_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1744:38]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      complementN_out_reg_0 <= complementN_io_out; // @[FloatingPointDesigns.scala 1792:30]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1744:38]
      complementN_out_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1744:38]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      complementN_out_reg_1 <= complementN_out_reg_0; // @[FloatingPointDesigns.scala 1807:40]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1744:38]
      complementN_out_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1744:38]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      complementN_out_reg_2 <= complementN_out_reg_1; // @[FloatingPointDesigns.scala 1807:40]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1749:28]
      new_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1749:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_s_reg_0 <= new_s; // @[FloatingPointDesigns.scala 1793:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1749:28]
      new_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1749:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_s_reg_1 <= new_s_reg_0; // @[FloatingPointDesigns.scala 1805:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1749:28]
      new_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1749:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_s_reg_2 <= new_s_reg_1; // @[FloatingPointDesigns.scala 1805:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1749:28]
      new_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1749:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      new_s_reg_3 <= new_s_reg_2; // @[FloatingPointDesigns.scala 1805:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1754:34]
      is_exp1_neg_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1754:34]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      is_exp1_neg_reg_0 <= is_exp1_neg_wire; // @[FloatingPointDesigns.scala 1794:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1754:34]
      is_exp1_neg_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1754:34]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      is_exp1_neg_reg_1 <= is_exp1_neg_reg_0; // @[FloatingPointDesigns.scala 1810:38]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1769:35]
      adderN_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1769:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      adderN_out_s_reg_0 <= adderN_io_out_s; // @[FloatingPointDesigns.scala 1795:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1770:35]
      adderN_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1770:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      adderN_out_c_reg_0 <= adderN_io_out_c; // @[FloatingPointDesigns.scala 1796:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1772:30]
      new_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1772:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      if (multipplier_out_s_reg_5[47]) begin // @[FloatingPointDesigns.scala 1778:72]
        new_exp_reg_0 <= _new_exp_reg_0_T_7; // @[FloatingPointDesigns.scala 1779:24]
      end else begin
        new_exp_reg_0 <= _new_exp_reg_0_T_7; // @[FloatingPointDesigns.scala 1782:24]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1773:31]
      new_mant_reg_0 <= 23'h0; // @[FloatingPointDesigns.scala 1773:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      if (multipplier_out_s_reg_5[47]) begin // @[FloatingPointDesigns.scala 1778:72]
        if (is_exp1_neg_reg_1) begin // @[FloatingPointDesigns.scala 1780:31]
          new_mant_reg_0 <= _new_mant_reg_0_T_3;
        end else begin
          new_mant_reg_0 <= _new_mant_reg_0_T_8;
        end
      end else if (is_exp1_neg_reg_1) begin // @[FloatingPointDesigns.scala 1783:31]
        new_mant_reg_0 <= _new_mant_reg_0_T_13;
      end else begin
        new_mant_reg_0 <= _new_mant_reg_0_T_18;
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1775:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1775:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1777:19]
      if (exp_reg_8_0 == 8'h0 | exp_reg_8_1 == 8'h0) begin // @[FloatingPointDesigns.scala 1818:60]
        reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1819:19]
      end else begin
        reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 1821:19]
      end
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
  s_reg_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s_reg_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s_reg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s_reg_1_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  s_reg_2_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s_reg_2_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s_reg_3_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s_reg_3_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s_reg_4_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s_reg_4_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  exp_reg_0_0 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  exp_reg_0_1 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  exp_reg_1_0 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  exp_reg_1_1 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  exp_reg_2_0 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  exp_reg_2_1 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  exp_reg_3_0 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  exp_reg_3_1 = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  exp_reg_4_0 = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  exp_reg_4_1 = _RAND_19[7:0];
  _RAND_20 = {1{`RANDOM}};
  exp_reg_5_0 = _RAND_20[7:0];
  _RAND_21 = {1{`RANDOM}};
  exp_reg_5_1 = _RAND_21[7:0];
  _RAND_22 = {1{`RANDOM}};
  exp_reg_6_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  exp_reg_6_1 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  exp_reg_7_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  exp_reg_7_1 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  exp_reg_8_0 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  exp_reg_8_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  new_frac_reg_0_0 = _RAND_28[23:0];
  _RAND_29 = {1{`RANDOM}};
  new_frac_reg_0_1 = _RAND_29[23:0];
  _RAND_30 = {1{`RANDOM}};
  new_frac_reg_1_0 = _RAND_30[23:0];
  _RAND_31 = {1{`RANDOM}};
  new_frac_reg_1_1 = _RAND_31[23:0];
  _RAND_32 = {2{`RANDOM}};
  multipplier_out_s_reg_0 = _RAND_32[47:0];
  _RAND_33 = {2{`RANDOM}};
  multipplier_out_s_reg_1 = _RAND_33[47:0];
  _RAND_34 = {2{`RANDOM}};
  multipplier_out_s_reg_2 = _RAND_34[47:0];
  _RAND_35 = {2{`RANDOM}};
  multipplier_out_s_reg_3 = _RAND_35[47:0];
  _RAND_36 = {2{`RANDOM}};
  multipplier_out_s_reg_4 = _RAND_36[47:0];
  _RAND_37 = {2{`RANDOM}};
  multipplier_out_s_reg_5 = _RAND_37[47:0];
  _RAND_38 = {1{`RANDOM}};
  subber_out_s_reg_0 = _RAND_38[7:0];
  _RAND_39 = {1{`RANDOM}};
  complementN_out_reg_0 = _RAND_39[7:0];
  _RAND_40 = {1{`RANDOM}};
  complementN_out_reg_1 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  complementN_out_reg_2 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  new_s_reg_0 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  new_s_reg_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  new_s_reg_2 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  new_s_reg_3 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  is_exp1_neg_reg_0 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  is_exp1_neg_reg_1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  adderN_out_s_reg_0 = _RAND_48[7:0];
  _RAND_49 = {1{`RANDOM}};
  adderN_out_c_reg_0 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  new_exp_reg_0 = _RAND_50[7:0];
  _RAND_51 = {1{`RANDOM}};
  new_mant_reg_0 = _RAND_51[22:0];
  _RAND_52 = {1{`RANDOM}};
  reg_out_s = _RAND_52[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

