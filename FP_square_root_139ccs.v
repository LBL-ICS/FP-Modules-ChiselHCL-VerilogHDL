module multiplier(
  input  [23:0] io_in_a,
  input  [23:0] io_in_b,
  output [47:0] io_out_s
);
  assign io_out_s = io_in_a * io_in_b; // @[BinaryDesigns.scala 81:23]
endmodule
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
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 1732:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 1732:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 1732:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 1732:24]
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
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
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
  assign subber_io_in_a = 8'h7f; // @[FloatingPointDesigns.scala 1733:20]
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
module full_adder_9(
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
module FP_adder_13ccs(
  input         clock,
  input         reset,
  input         io_in_en,
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
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
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] subber_io_in_a; // @[FloatingPointDesigns.scala 1460:24]
  wire [7:0] subber_io_in_b; // @[FloatingPointDesigns.scala 1460:24]
  wire [7:0] subber_io_out_s; // @[FloatingPointDesigns.scala 1460:24]
  wire  subber_io_out_c; // @[FloatingPointDesigns.scala 1460:24]
  wire [23:0] adder_io_in_a; // @[FloatingPointDesigns.scala 1466:23]
  wire [23:0] adder_io_in_b; // @[FloatingPointDesigns.scala 1466:23]
  wire [23:0] adder_io_out_s; // @[FloatingPointDesigns.scala 1466:23]
  wire  adder_io_out_c; // @[FloatingPointDesigns.scala 1466:23]
  wire [7:0] subber2_io_in_a; // @[FloatingPointDesigns.scala 1527:25]
  wire [7:0] subber2_io_in_b; // @[FloatingPointDesigns.scala 1527:25]
  wire [7:0] subber2_io_out_s; // @[FloatingPointDesigns.scala 1527:25]
  wire  subber2_io_out_c; // @[FloatingPointDesigns.scala 1527:25]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 1390:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1393:64]
  wire [8:0] _GEN_1 = 9'h7f > _T_2 ? _T_2 : 9'h7f; // @[FloatingPointDesigns.scala 1393:71 1394:14]
  wire [8:0] _GEN_167 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1400:36]
  wire [7:0] _GEN_2 = io_in_b[30:23] < 8'h1 ? 8'h1 : io_in_b[30:23]; // @[FloatingPointDesigns.scala 1402:45 1403:14 1405:14]
  wire [8:0] _GEN_3 = _GEN_167 > _T_2 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 1400:71 1401:14]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1411:23]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 1416:26]
  reg  sign_reg_0_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_1_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_2_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_3_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_4_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_5_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_6_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_7_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_8_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_9_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_10_1; // @[FloatingPointDesigns.scala 1418:28]
  reg [7:0] exp_reg_0_0; // @[FloatingPointDesigns.scala 1419:28]
  reg [7:0] exp_reg_0_1; // @[FloatingPointDesigns.scala 1419:28]
  reg [7:0] exp_reg_1_0; // @[FloatingPointDesigns.scala 1419:28]
  reg [7:0] exp_reg_1_1; // @[FloatingPointDesigns.scala 1419:28]
  reg [7:0] exp_reg_2_0; // @[FloatingPointDesigns.scala 1419:28]
  reg [7:0] exp_reg_2_1; // @[FloatingPointDesigns.scala 1419:28]
  reg [22:0] frac_reg_0_0; // @[FloatingPointDesigns.scala 1420:28]
  reg [22:0] frac_reg_0_1; // @[FloatingPointDesigns.scala 1420:28]
  reg [22:0] frac_reg_1_0; // @[FloatingPointDesigns.scala 1420:28]
  reg [22:0] frac_reg_1_1; // @[FloatingPointDesigns.scala 1420:28]
  reg [22:0] frac_reg_2_0; // @[FloatingPointDesigns.scala 1420:28]
  reg [22:0] frac_reg_2_1; // @[FloatingPointDesigns.scala 1420:28]
  reg [23:0] wfrac_reg_0_0; // @[FloatingPointDesigns.scala 1421:28]
  reg [23:0] wfrac_reg_0_1; // @[FloatingPointDesigns.scala 1421:28]
  reg [23:0] wfrac_reg_1_0; // @[FloatingPointDesigns.scala 1421:28]
  reg [23:0] wfrac_reg_1_1; // @[FloatingPointDesigns.scala 1421:28]
  reg [23:0] wfrac_reg_2_0; // @[FloatingPointDesigns.scala 1421:28]
  reg [23:0] wfrac_reg_2_1; // @[FloatingPointDesigns.scala 1421:28]
  reg [7:0] subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1423:35]
  reg [7:0] subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1423:35]
  reg  subber_out_c_reg_0; // @[FloatingPointDesigns.scala 1424:35]
  reg  subber_out_c_reg_1; // @[FloatingPointDesigns.scala 1424:35]
  reg [23:0] wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1426:39]
  reg [23:0] wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1426:39]
  reg [23:0] wire_temp_add_in_reg_1_0; // @[FloatingPointDesigns.scala 1426:39]
  reg [23:0] wire_temp_add_in_reg_1_1; // @[FloatingPointDesigns.scala 1426:39]
  reg  ref_s_reg_0; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_1; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_2; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_3; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_4; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_5; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_6; // @[FloatingPointDesigns.scala 1428:31]
  reg  ref_s_reg_7; // @[FloatingPointDesigns.scala 1428:31]
  reg [22:0] ref_frac_reg_0; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_1; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_2; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_3; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_4; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_5; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_6; // @[FloatingPointDesigns.scala 1429:31]
  reg [22:0] ref_frac_reg_7; // @[FloatingPointDesigns.scala 1429:31]
  reg [7:0] ref_exp_reg_0; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_1; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_2; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_3; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_4; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_5; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_6; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] ref_exp_reg_7; // @[FloatingPointDesigns.scala 1430:31]
  reg [7:0] sub_exp_reg_0; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_1; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_2; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_3; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_4; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_5; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_6; // @[FloatingPointDesigns.scala 1431:31]
  reg [7:0] sub_exp_reg_7; // @[FloatingPointDesigns.scala 1431:31]
  reg [23:0] adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1433:37]
  reg [23:0] adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1433:37]
  reg [23:0] adder_io_out_s_reg_2; // @[FloatingPointDesigns.scala 1433:37]
  reg  adder_io_out_c_reg_0; // @[FloatingPointDesigns.scala 1434:37]
  reg  new_s_reg_0; // @[FloatingPointDesigns.scala 1436:35]
  reg  new_s_reg_1; // @[FloatingPointDesigns.scala 1436:35]
  reg  new_s_reg_2; // @[FloatingPointDesigns.scala 1436:35]
  reg  new_s_reg_3; // @[FloatingPointDesigns.scala 1436:35]
  reg  new_s_reg_4; // @[FloatingPointDesigns.scala 1436:35]
  reg  new_s_reg_5; // @[FloatingPointDesigns.scala 1436:35]
  reg [22:0] new_out_frac_reg_0; // @[FloatingPointDesigns.scala 1437:35]
  reg [7:0] new_out_exp_reg_0; // @[FloatingPointDesigns.scala 1438:35]
  reg  E_reg_0; // @[FloatingPointDesigns.scala 1439:24]
  reg  E_reg_1; // @[FloatingPointDesigns.scala 1439:24]
  reg  E_reg_2; // @[FloatingPointDesigns.scala 1439:24]
  reg  E_reg_3; // @[FloatingPointDesigns.scala 1439:24]
  reg  E_reg_4; // @[FloatingPointDesigns.scala 1439:24]
  reg  D_reg_0; // @[FloatingPointDesigns.scala 1440:24]
  reg  D_reg_1; // @[FloatingPointDesigns.scala 1440:24]
  reg  D_reg_2; // @[FloatingPointDesigns.scala 1440:24]
  reg  D_reg_3; // @[FloatingPointDesigns.scala 1440:24]
  reg  D_reg_4; // @[FloatingPointDesigns.scala 1440:24]
  reg [23:0] adder_result_reg_0; // @[FloatingPointDesigns.scala 1442:35]
  reg [23:0] adder_result_reg_1; // @[FloatingPointDesigns.scala 1442:35]
  reg [23:0] adder_result_reg_2; // @[FloatingPointDesigns.scala 1442:35]
  reg [5:0] leadingOne_reg_0; // @[FloatingPointDesigns.scala 1444:33]
  reg [5:0] leadingOne_reg_1; // @[FloatingPointDesigns.scala 1444:33]
  reg [31:0] io_in_a_reg_0; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_1; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_2; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_3; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_4; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_5; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_6; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_7; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_8; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_9; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_a_reg_10; // @[FloatingPointDesigns.scala 1446:30]
  reg [31:0] io_in_b_reg_0; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_1; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_2; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_3; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_4; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_5; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_6; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_7; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_8; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_9; // @[FloatingPointDesigns.scala 1447:30]
  reg [31:0] io_in_b_reg_10; // @[FloatingPointDesigns.scala 1447:30]
  reg [7:0] subber2_out_s_reg_0; // @[FloatingPointDesigns.scala 1449:36]
  reg  subber2_out_c_reg_0; // @[FloatingPointDesigns.scala 1450:36]
  reg [7:0] cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1471:40]
  wire [7:0] _cmpl_subber_out_s_reg_0_T = ~subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1473:41]
  wire [7:0] _cmpl_subber_out_s_reg_0_T_2 = 8'h1 + _cmpl_subber_out_s_reg_0_T; // @[FloatingPointDesigns.scala 1473:39]
  wire [23:0] _wire_temp_add_in_0_T = wfrac_reg_2_0 >> cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1481:46]
  wire [23:0] _wire_temp_add_in_1_T = wfrac_reg_2_1 >> subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1489:46]
  wire  ref_s = subber_out_c_reg_1 & sign_reg_2_1; // @[FloatingPointDesigns.scala 1476:39 1479:13 1486:13]
  reg [23:0] cmpl_wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1492:44]
  reg [23:0] cmpl_wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1492:44]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T = ~wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1494:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_0_T; // @[FloatingPointDesigns.scala 1494:46]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T = ~wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1495:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_1_T; // @[FloatingPointDesigns.scala 1495:46]
  wire [1:0] _adder_io_in_a_T = {sign_reg_4_1,1'h0}; // @[FloatingPointDesigns.scala 1498:38]
  wire  _new_s_T = ~adder_io_out_c_reg_0; // @[FloatingPointDesigns.scala 1505:15]
  wire  new_s = ~adder_io_out_c_reg_0 & sign_reg_5_1; // @[FloatingPointDesigns.scala 1505:38]
  wire  D = _new_s_T | sign_reg_5_1; // @[FloatingPointDesigns.scala 1512:35]
  wire  E = _new_s_T & ~adder_io_out_s_reg_0[23] | _new_s_T & ~sign_reg_5_1 | adder_io_out_c_reg_0 &
    adder_io_out_s_reg_0[23] & sign_reg_5_1; // @[FloatingPointDesigns.scala 1514:134]
  reg [23:0] cmpl_adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1516:42]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T = ~adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1519:43]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T_2 = 24'h1 + _cmpl_adder_io_out_s_reg_0_T; // @[FloatingPointDesigns.scala 1519:41]
  wire [1:0] _adder_result_T = {sign_reg_7_1,1'h0}; // @[FloatingPointDesigns.scala 1523:53]
  wire [1:0] _leadingOne_T_25 = adder_result_reg_0[2] ? 2'h2 : {{1'd0}, adder_result_reg_0[1]}; // @[FloatingPointDesigns.scala 1526:70]
  wire [1:0] _leadingOne_T_26 = adder_result_reg_0[3] ? 2'h3 : _leadingOne_T_25; // @[FloatingPointDesigns.scala 1526:70]
  wire [2:0] _leadingOne_T_27 = adder_result_reg_0[4] ? 3'h4 : {{1'd0}, _leadingOne_T_26}; // @[FloatingPointDesigns.scala 1526:70]
  wire [2:0] _leadingOne_T_28 = adder_result_reg_0[5] ? 3'h5 : _leadingOne_T_27; // @[FloatingPointDesigns.scala 1526:70]
  wire [2:0] _leadingOne_T_29 = adder_result_reg_0[6] ? 3'h6 : _leadingOne_T_28; // @[FloatingPointDesigns.scala 1526:70]
  wire [2:0] _leadingOne_T_30 = adder_result_reg_0[7] ? 3'h7 : _leadingOne_T_29; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_31 = adder_result_reg_0[8] ? 4'h8 : {{1'd0}, _leadingOne_T_30}; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_32 = adder_result_reg_0[9] ? 4'h9 : _leadingOne_T_31; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_33 = adder_result_reg_0[10] ? 4'ha : _leadingOne_T_32; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_34 = adder_result_reg_0[11] ? 4'hb : _leadingOne_T_33; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_35 = adder_result_reg_0[12] ? 4'hc : _leadingOne_T_34; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_36 = adder_result_reg_0[13] ? 4'hd : _leadingOne_T_35; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_37 = adder_result_reg_0[14] ? 4'he : _leadingOne_T_36; // @[FloatingPointDesigns.scala 1526:70]
  wire [3:0] _leadingOne_T_38 = adder_result_reg_0[15] ? 4'hf : _leadingOne_T_37; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_39 = adder_result_reg_0[16] ? 5'h10 : {{1'd0}, _leadingOne_T_38}; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_40 = adder_result_reg_0[17] ? 5'h11 : _leadingOne_T_39; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_41 = adder_result_reg_0[18] ? 5'h12 : _leadingOne_T_40; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_42 = adder_result_reg_0[19] ? 5'h13 : _leadingOne_T_41; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_43 = adder_result_reg_0[20] ? 5'h14 : _leadingOne_T_42; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_44 = adder_result_reg_0[21] ? 5'h15 : _leadingOne_T_43; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_45 = adder_result_reg_0[22] ? 5'h16 : _leadingOne_T_44; // @[FloatingPointDesigns.scala 1526:70]
  wire [4:0] _leadingOne_T_46 = adder_result_reg_0[23] ? 5'h17 : _leadingOne_T_45; // @[FloatingPointDesigns.scala 1526:70]
  wire [5:0] leadingOne = _leadingOne_T_46 + 5'h1; // @[FloatingPointDesigns.scala 1526:77]
  wire [5:0] _subber2_io_in_b_T_1 = 6'h18 - leadingOne_reg_0; // @[FloatingPointDesigns.scala 1529:42]
  wire [7:0] exp_0 = _GEN_1[7:0]; // @[FloatingPointDesigns.scala 1391:19]
  wire [7:0] exp_1 = _GEN_3[7:0]; // @[FloatingPointDesigns.scala 1391:19]
  reg [31:0] reg_out_s; // @[FloatingPointDesigns.scala 1600:28]
  wire [8:0] _GEN_168 = {{1'd0}, ref_exp_reg_7}; // @[FloatingPointDesigns.scala 1617:29]
  wire [23:0] _new_out_frac_reg_0_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 1619:60]
  wire [7:0] _new_out_exp_reg_0_T_3 = ref_exp_reg_7 + 8'h1; // @[FloatingPointDesigns.scala 1621:48]
  wire [8:0] _GEN_142 = _GEN_168 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_reg_0_T_3}; // @[FloatingPointDesigns.scala 1617:66 1618:30 1621:30]
  wire [23:0] _GEN_143 = _GEN_168 == _T_2 ? _new_out_frac_reg_0_T_2 : {{1'd0}, adder_result_reg_2[23:1]}; // @[FloatingPointDesigns.scala 1617:66 1619:31 1622:31]
  wire [5:0] _new_out_frac_reg_0_T_6 = 6'h18 - leadingOne_reg_1; // @[FloatingPointDesigns.scala 1635:94]
  wire [85:0] _GEN_0 = {{63'd0}, adder_result_reg_2[22:0]}; // @[FloatingPointDesigns.scala 1635:73]
  wire [85:0] _new_out_frac_reg_0_T_7 = _GEN_0 << _new_out_frac_reg_0_T_6; // @[FloatingPointDesigns.scala 1635:73]
  wire [7:0] _GEN_144 = subber2_out_c_reg_0 ? 8'h1 : subber2_out_s_reg_0; // @[FloatingPointDesigns.scala 1630:46 1631:32 1634:32]
  wire [85:0] _GEN_145 = subber2_out_c_reg_0 ? 86'h0 : _new_out_frac_reg_0_T_7; // @[FloatingPointDesigns.scala 1630:46 1632:33 1635:33]
  wire [7:0] _GEN_146 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & (sign_reg_10_1 & io_in_a_reg_10[30:0]
     == io_in_b_reg_10[30:0]) ? 8'h0 : _GEN_144; // @[FloatingPointDesigns.scala 1626:184 1627:30]
  wire [85:0] _GEN_147 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & (sign_reg_10_1 & io_in_a_reg_10[30:0]
     == io_in_b_reg_10[30:0]) ? 86'h0 : _GEN_145; // @[FloatingPointDesigns.scala 1626:184 1628:31]
  wire  _GEN_148 = D_reg_4 ? new_s_reg_4 : new_s_reg_5; // @[FloatingPointDesigns.scala 1624:36 1625:22 1436:35]
  wire [7:0] _GEN_149 = D_reg_4 ? _GEN_146 : new_out_exp_reg_0; // @[FloatingPointDesigns.scala 1438:35 1624:36]
  wire [85:0] _GEN_150 = D_reg_4 ? _GEN_147 : {{63'd0}, new_out_frac_reg_0}; // @[FloatingPointDesigns.scala 1437:35 1624:36]
  wire  _GEN_151 = ~D_reg_4 ? new_s_reg_4 : _GEN_148; // @[FloatingPointDesigns.scala 1615:36 1616:22]
  wire [8:0] _GEN_152 = ~D_reg_4 ? _GEN_142 : {{1'd0}, _GEN_149}; // @[FloatingPointDesigns.scala 1615:36]
  wire [85:0] _GEN_153 = ~D_reg_4 ? {{62'd0}, _GEN_143} : _GEN_150; // @[FloatingPointDesigns.scala 1615:36]
  wire  _GEN_154 = E_reg_4 ? new_s_reg_4 : _GEN_151; // @[FloatingPointDesigns.scala 1611:36 1612:22]
  wire [8:0] _GEN_155 = E_reg_4 ? {{1'd0}, ref_exp_reg_7} : _GEN_152; // @[FloatingPointDesigns.scala 1611:36 1613:28]
  wire [85:0] _GEN_156 = E_reg_4 ? {{63'd0}, adder_result_reg_2[22:0]} : _GEN_153; // @[FloatingPointDesigns.scala 1611:36 1614:29]
  wire [85:0] _GEN_158 = sub_exp_reg_7 >= 8'h17 ? {{63'd0}, ref_frac_reg_7} : _GEN_156; // @[FloatingPointDesigns.scala 1607:48 1609:29]
  wire [8:0] _GEN_159 = sub_exp_reg_7 >= 8'h17 ? {{1'd0}, ref_exp_reg_7} : _GEN_155; // @[FloatingPointDesigns.scala 1607:48 1610:28]
  wire [8:0] _GEN_161 = io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0 ? 9'h0 : _GEN_159; // @[FloatingPointDesigns.scala 1603:86 1605:28]
  wire [85:0] _GEN_162 = io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0 ? 86'h0 : _GEN_158; // @[FloatingPointDesigns.scala 1603:86 1606:29]
  wire [31:0] _reg_out_s_T_1 = {new_s_reg_5,new_out_exp_reg_0,new_out_frac_reg_0}; // @[FloatingPointDesigns.scala 1639:55]
  wire [8:0] _GEN_164 = io_in_en ? _GEN_161 : {{1'd0}, new_out_exp_reg_0}; // @[FloatingPointDesigns.scala 1602:20 1438:35]
  wire [85:0] _GEN_165 = io_in_en ? _GEN_162 : {{63'd0}, new_out_frac_reg_0}; // @[FloatingPointDesigns.scala 1602:20 1437:35]
  wire [85:0] _GEN_169 = reset ? 86'h0 : _GEN_165; // @[FloatingPointDesigns.scala 1437:{35,35}]
  wire [8:0] _GEN_170 = reset ? 9'h0 : _GEN_164; // @[FloatingPointDesigns.scala 1438:{35,35}]
  full_subber subber ( // @[FloatingPointDesigns.scala 1460:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  full_adder_9 adder ( // @[FloatingPointDesigns.scala 1466:23]
    .io_in_a(adder_io_in_a),
    .io_in_b(adder_io_in_b),
    .io_out_s(adder_io_out_s),
    .io_out_c(adder_io_out_c)
  );
  full_subber subber2 ( // @[FloatingPointDesigns.scala 1527:25]
    .io_in_a(subber2_io_in_a),
    .io_in_b(subber2_io_in_b),
    .io_out_s(subber2_io_out_s),
    .io_out_c(subber2_io_out_c)
  );
  assign io_out_s = reg_out_s; // @[FloatingPointDesigns.scala 1601:14]
  assign subber_io_in_a = exp_reg_0_0; // @[FloatingPointDesigns.scala 1461:20]
  assign subber_io_in_b = exp_reg_0_1; // @[FloatingPointDesigns.scala 1462:20]
  assign adder_io_in_a = _adder_io_in_a_T == 2'h1 ? cmpl_wire_temp_add_in_reg_0_0 : wire_temp_add_in_reg_1_0; // @[FloatingPointDesigns.scala 1498:25]
  assign adder_io_in_b = _adder_io_in_a_T == 2'h2 ? cmpl_wire_temp_add_in_reg_0_1 : wire_temp_add_in_reg_1_1; // @[FloatingPointDesigns.scala 1499:25]
  assign subber2_io_in_a = ref_exp_reg_6; // @[FloatingPointDesigns.scala 1528:21]
  assign subber2_io_in_b = {{2'd0}, _subber2_io_in_b_T_1}; // @[FloatingPointDesigns.scala 1529:21]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_0_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_0_1 <= sign_1; // @[FloatingPointDesigns.scala 1537:19]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_1_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_1_1 <= sign_reg_0_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_2_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_2_1 <= sign_reg_1_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_3_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_3_1 <= sign_reg_2_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_4_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_4_1 <= sign_reg_3_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_5_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_5_1 <= sign_reg_4_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_6_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_6_1 <= sign_reg_5_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_7_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_7_1 <= sign_reg_6_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_8_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_8_1 <= sign_reg_7_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_9_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_9_1 <= sign_reg_8_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_10_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_10_1 <= sign_reg_9_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_0_0 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_0_0 <= exp_0; // @[FloatingPointDesigns.scala 1538:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_0_1 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_0_1 <= exp_1; // @[FloatingPointDesigns.scala 1538:18]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_1_0 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_1_0 <= exp_reg_0_0; // @[FloatingPointDesigns.scala 1588:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_1_1 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_1_1 <= exp_reg_0_1; // @[FloatingPointDesigns.scala 1588:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_2_0 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_2_0 <= exp_reg_1_0; // @[FloatingPointDesigns.scala 1588:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1419:28]
      exp_reg_2_1 <= 8'h0; // @[FloatingPointDesigns.scala 1419:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      exp_reg_2_1 <= exp_reg_1_1; // @[FloatingPointDesigns.scala 1588:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_0_0 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_0_0 <= 23'h400000; // @[FloatingPointDesigns.scala 1539:19]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_0_1 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_0_1 <= frac_1; // @[FloatingPointDesigns.scala 1539:19]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_1_0 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_1_0 <= frac_reg_0_0; // @[FloatingPointDesigns.scala 1589:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_1_1 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_1_1 <= frac_reg_0_1; // @[FloatingPointDesigns.scala 1589:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_2_0 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_2_0 <= frac_reg_1_0; // @[FloatingPointDesigns.scala 1589:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1420:28]
      frac_reg_2_1 <= 23'h0; // @[FloatingPointDesigns.scala 1420:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      frac_reg_2_1 <= frac_reg_1_1; // @[FloatingPointDesigns.scala 1589:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_0_0 <= 24'hc00000; // @[FloatingPointDesigns.scala 1540:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_0_1 <= whole_frac_1; // @[FloatingPointDesigns.scala 1540:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_1_0 <= wfrac_reg_0_0; // @[FloatingPointDesigns.scala 1590:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_1_1 <= wfrac_reg_0_1; // @[FloatingPointDesigns.scala 1590:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_2_0 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_2_0 <= wfrac_reg_1_0; // @[FloatingPointDesigns.scala 1590:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1421:28]
      wfrac_reg_2_1 <= 24'h0; // @[FloatingPointDesigns.scala 1421:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wfrac_reg_2_1 <= wfrac_reg_1_1; // @[FloatingPointDesigns.scala 1590:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1423:35]
      subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1423:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber_out_s_reg_0 <= subber_io_out_s; // @[FloatingPointDesigns.scala 1542:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1423:35]
      subber_out_s_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1423:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber_out_s_reg_1 <= subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1593:31]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:35]
      subber_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1424:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber_out_c_reg_0 <= subber_io_out_c; // @[FloatingPointDesigns.scala 1543:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1424:35]
      subber_out_c_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1424:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber_out_c_reg_1 <= subber_out_c_reg_0; // @[FloatingPointDesigns.scala 1594:31]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:39]
      wire_temp_add_in_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1426:39]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        wire_temp_add_in_reg_0_0 <= _wire_temp_add_in_0_T; // @[FloatingPointDesigns.scala 1481:27]
      end else begin
        wire_temp_add_in_reg_0_0 <= wfrac_reg_2_0; // @[FloatingPointDesigns.scala 1488:27]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:39]
      wire_temp_add_in_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1426:39]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        wire_temp_add_in_reg_0_1 <= wfrac_reg_2_1; // @[FloatingPointDesigns.scala 1482:27]
      end else begin
        wire_temp_add_in_reg_0_1 <= _wire_temp_add_in_1_T; // @[FloatingPointDesigns.scala 1489:27]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:39]
      wire_temp_add_in_reg_1_0 <= 24'h0; // @[FloatingPointDesigns.scala 1426:39]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wire_temp_add_in_reg_1_0 <= wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1596:35]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1426:39]
      wire_temp_add_in_reg_1_1 <= 24'h0; // @[FloatingPointDesigns.scala 1426:39]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      wire_temp_add_in_reg_1_1 <= wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1596:35]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_0 <= ref_s; // @[FloatingPointDesigns.scala 1545:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_1 <= ref_s_reg_0; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_2 <= ref_s_reg_1; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_3 <= ref_s_reg_2; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_4 <= ref_s_reg_3; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_5 <= ref_s_reg_4; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_6 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_6 <= ref_s_reg_5; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1428:31]
      ref_s_reg_7 <= 1'h0; // @[FloatingPointDesigns.scala 1428:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_s_reg_7 <= ref_s_reg_6; // @[FloatingPointDesigns.scala 1575:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_0 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        ref_frac_reg_0 <= frac_reg_2_1; // @[FloatingPointDesigns.scala 1480:16]
      end else begin
        ref_frac_reg_0 <= frac_reg_2_0; // @[FloatingPointDesigns.scala 1487:16]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_1 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_1 <= ref_frac_reg_0; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_2 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_2 <= ref_frac_reg_1; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_3 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_3 <= ref_frac_reg_2; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_4 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_4 <= ref_frac_reg_3; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_5 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_5 <= ref_frac_reg_4; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_6 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_6 <= ref_frac_reg_5; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1429:31]
      ref_frac_reg_7 <= 23'h0; // @[FloatingPointDesigns.scala 1429:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_frac_reg_7 <= ref_frac_reg_6; // @[FloatingPointDesigns.scala 1576:27]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        ref_exp_reg_0 <= exp_reg_2_1; // @[FloatingPointDesigns.scala 1477:15]
      end else begin
        ref_exp_reg_0 <= exp_reg_2_0; // @[FloatingPointDesigns.scala 1484:15]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_1 <= ref_exp_reg_0; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_2 <= ref_exp_reg_1; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_3 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_3 <= ref_exp_reg_2; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_4 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_4 <= ref_exp_reg_3; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_5 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_5 <= ref_exp_reg_4; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_6 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_6 <= ref_exp_reg_5; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1430:31]
      ref_exp_reg_7 <= 8'h0; // @[FloatingPointDesigns.scala 1430:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      ref_exp_reg_7 <= ref_exp_reg_6; // @[FloatingPointDesigns.scala 1577:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        sub_exp_reg_0 <= cmpl_subber_out_s_reg_0; // @[FloatingPointDesigns.scala 1478:15]
      end else begin
        sub_exp_reg_0 <= subber_out_s_reg_1; // @[FloatingPointDesigns.scala 1485:15]
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_1 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_1 <= sub_exp_reg_0; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_2 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_2 <= sub_exp_reg_1; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_3 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_3 <= sub_exp_reg_2; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_4 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_4 <= sub_exp_reg_3; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_5 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_5 <= sub_exp_reg_4; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_6 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_6 <= sub_exp_reg_5; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1431:31]
      sub_exp_reg_7 <= 8'h0; // @[FloatingPointDesigns.scala 1431:31]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sub_exp_reg_7 <= sub_exp_reg_6; // @[FloatingPointDesigns.scala 1578:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1433:37]
      adder_io_out_s_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1433:37]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_io_out_s_reg_0 <= adder_io_out_s; // @[FloatingPointDesigns.scala 1558:29]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1433:37]
      adder_io_out_s_reg_1 <= 24'h0; // @[FloatingPointDesigns.scala 1433:37]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_io_out_s_reg_1 <= adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1587:33]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1433:37]
      adder_io_out_s_reg_2 <= 24'h0; // @[FloatingPointDesigns.scala 1433:37]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_io_out_s_reg_2 <= adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1587:33]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1434:37]
      adder_io_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1434:37]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_io_out_c_reg_0 <= adder_io_out_c; // @[FloatingPointDesigns.scala 1559:29]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      new_s_reg_0 <= new_s; // @[FloatingPointDesigns.scala 1552:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      new_s_reg_1 <= new_s_reg_0; // @[FloatingPointDesigns.scala 1583:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      new_s_reg_2 <= new_s_reg_1; // @[FloatingPointDesigns.scala 1583:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      new_s_reg_3 <= new_s_reg_2; // @[FloatingPointDesigns.scala 1583:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      new_s_reg_4 <= new_s_reg_3; // @[FloatingPointDesigns.scala 1583:24]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1436:35]
      new_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1436:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1602:20]
      if (io_in_a_reg_10[30:0] == 31'h0 & io_in_b_reg_10[30:0] == 31'h0) begin // @[FloatingPointDesigns.scala 1603:86]
        new_s_reg_5 <= 1'h0; // @[FloatingPointDesigns.scala 1604:22]
      end else if (sub_exp_reg_7 >= 8'h17) begin // @[FloatingPointDesigns.scala 1607:48]
        new_s_reg_5 <= ref_s_reg_7; // @[FloatingPointDesigns.scala 1608:22]
      end else begin
        new_s_reg_5 <= _GEN_154;
      end
    end
    new_out_frac_reg_0 <= _GEN_169[22:0]; // @[FloatingPointDesigns.scala 1437:{35,35}]
    new_out_exp_reg_0 <= _GEN_170[7:0]; // @[FloatingPointDesigns.scala 1438:{35,35}]
    if (reset) begin // @[FloatingPointDesigns.scala 1439:24]
      E_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1439:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      E_reg_0 <= E; // @[FloatingPointDesigns.scala 1555:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1439:24]
      E_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1439:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      E_reg_1 <= E_reg_0; // @[FloatingPointDesigns.scala 1581:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1439:24]
      E_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1439:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      E_reg_2 <= E_reg_1; // @[FloatingPointDesigns.scala 1581:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1439:24]
      E_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1439:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      E_reg_3 <= E_reg_2; // @[FloatingPointDesigns.scala 1581:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1439:24]
      E_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1439:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      E_reg_4 <= E_reg_3; // @[FloatingPointDesigns.scala 1581:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:24]
      D_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1440:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      D_reg_0 <= D; // @[FloatingPointDesigns.scala 1556:16]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:24]
      D_reg_1 <= 1'h0; // @[FloatingPointDesigns.scala 1440:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      D_reg_1 <= D_reg_0; // @[FloatingPointDesigns.scala 1582:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:24]
      D_reg_2 <= 1'h0; // @[FloatingPointDesigns.scala 1440:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      D_reg_2 <= D_reg_1; // @[FloatingPointDesigns.scala 1582:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:24]
      D_reg_3 <= 1'h0; // @[FloatingPointDesigns.scala 1440:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      D_reg_3 <= D_reg_2; // @[FloatingPointDesigns.scala 1582:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1440:24]
      D_reg_4 <= 1'h0; // @[FloatingPointDesigns.scala 1440:24]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      D_reg_4 <= D_reg_3; // @[FloatingPointDesigns.scala 1582:20]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:35]
      adder_result_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1442:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      if (new_s_reg_1 & ^_adder_result_T) begin // @[FloatingPointDesigns.scala 1523:24]
        adder_result_reg_0 <= cmpl_adder_io_out_s_reg_0;
      end else begin
        adder_result_reg_0 <= adder_io_out_s_reg_2;
      end
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:35]
      adder_result_reg_1 <= 24'h0; // @[FloatingPointDesigns.scala 1442:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_result_reg_1 <= adder_result_reg_0; // @[FloatingPointDesigns.scala 1586:31]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1442:35]
      adder_result_reg_2 <= 24'h0; // @[FloatingPointDesigns.scala 1442:35]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      adder_result_reg_2 <= adder_result_reg_1; // @[FloatingPointDesigns.scala 1586:31]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1444:33]
      leadingOne_reg_0 <= 6'h0; // @[FloatingPointDesigns.scala 1444:33]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      leadingOne_reg_0 <= leadingOne; // @[FloatingPointDesigns.scala 1563:25]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1444:33]
      leadingOne_reg_1 <= 6'h0; // @[FloatingPointDesigns.scala 1444:33]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      leadingOne_reg_1 <= leadingOne_reg_0; // @[FloatingPointDesigns.scala 1595:29]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_0 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_0 <= 32'h3fc00000; // @[FloatingPointDesigns.scala 1534:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_1 <= io_in_a_reg_0; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_2 <= io_in_a_reg_1; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_3 <= io_in_a_reg_2; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_4 <= io_in_a_reg_3; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_5 <= io_in_a_reg_4; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_6 <= io_in_a_reg_5; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_7 <= io_in_a_reg_6; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_8 <= io_in_a_reg_7; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_9 <= io_in_a_reg_8; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1446:30]
      io_in_a_reg_10 <= 32'h0; // @[FloatingPointDesigns.scala 1446:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_a_reg_10 <= io_in_a_reg_9; // @[FloatingPointDesigns.scala 1571:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_0 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_0 <= io_in_b; // @[FloatingPointDesigns.scala 1535:22]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_1 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_1 <= io_in_b_reg_0; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_2 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_2 <= io_in_b_reg_1; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_3 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_3 <= io_in_b_reg_2; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_4 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_4 <= io_in_b_reg_3; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_5 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_5 <= io_in_b_reg_4; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_6 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_6 <= io_in_b_reg_5; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_7 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_7 <= io_in_b_reg_6; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_8 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_8 <= io_in_b_reg_7; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_9 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_9 <= io_in_b_reg_8; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1447:30]
      io_in_b_reg_10 <= 32'h0; // @[FloatingPointDesigns.scala 1447:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      io_in_b_reg_10 <= io_in_b_reg_9; // @[FloatingPointDesigns.scala 1572:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1449:36]
      subber2_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1449:36]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber2_out_s_reg_0 <= subber2_io_out_s; // @[FloatingPointDesigns.scala 1565:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1450:36]
      subber2_out_c_reg_0 <= 1'h0; // @[FloatingPointDesigns.scala 1450:36]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      subber2_out_c_reg_0 <= subber2_io_out_c; // @[FloatingPointDesigns.scala 1566:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1471:40]
      cmpl_subber_out_s_reg_0 <= 8'h0; // @[FloatingPointDesigns.scala 1471:40]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1472:19]
      cmpl_subber_out_s_reg_0 <= _cmpl_subber_out_s_reg_0_T_2; // @[FloatingPointDesigns.scala 1473:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1492:44]
      cmpl_wire_temp_add_in_reg_0_0 <= 24'h0; // @[FloatingPointDesigns.scala 1492:44]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1493:19]
      cmpl_wire_temp_add_in_reg_0_0 <= _cmpl_wire_temp_add_in_reg_0_0_T_2; // @[FloatingPointDesigns.scala 1494:39]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1492:44]
      cmpl_wire_temp_add_in_reg_0_1 <= 24'h0; // @[FloatingPointDesigns.scala 1492:44]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1493:19]
      cmpl_wire_temp_add_in_reg_0_1 <= _cmpl_wire_temp_add_in_reg_0_1_T_2; // @[FloatingPointDesigns.scala 1495:39]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1516:42]
      cmpl_adder_io_out_s_reg_0 <= 24'h0; // @[FloatingPointDesigns.scala 1516:42]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1518:19]
      cmpl_adder_io_out_s_reg_0 <= _cmpl_adder_io_out_s_reg_0_T_2; // @[FloatingPointDesigns.scala 1519:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1600:28]
      reg_out_s <= 32'h0; // @[FloatingPointDesigns.scala 1600:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1602:20]
      reg_out_s <= _reg_out_s_T_1; // @[FloatingPointDesigns.scala 1639:17]
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
  sign_reg_0_1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sign_reg_1_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sign_reg_2_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sign_reg_3_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_reg_4_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sign_reg_5_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sign_reg_6_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sign_reg_7_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sign_reg_8_1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sign_reg_9_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  sign_reg_10_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  exp_reg_0_0 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  exp_reg_0_1 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  exp_reg_1_0 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  exp_reg_1_1 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  exp_reg_2_0 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  exp_reg_2_1 = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  frac_reg_0_0 = _RAND_17[22:0];
  _RAND_18 = {1{`RANDOM}};
  frac_reg_0_1 = _RAND_18[22:0];
  _RAND_19 = {1{`RANDOM}};
  frac_reg_1_0 = _RAND_19[22:0];
  _RAND_20 = {1{`RANDOM}};
  frac_reg_1_1 = _RAND_20[22:0];
  _RAND_21 = {1{`RANDOM}};
  frac_reg_2_0 = _RAND_21[22:0];
  _RAND_22 = {1{`RANDOM}};
  frac_reg_2_1 = _RAND_22[22:0];
  _RAND_23 = {1{`RANDOM}};
  wfrac_reg_0_0 = _RAND_23[23:0];
  _RAND_24 = {1{`RANDOM}};
  wfrac_reg_0_1 = _RAND_24[23:0];
  _RAND_25 = {1{`RANDOM}};
  wfrac_reg_1_0 = _RAND_25[23:0];
  _RAND_26 = {1{`RANDOM}};
  wfrac_reg_1_1 = _RAND_26[23:0];
  _RAND_27 = {1{`RANDOM}};
  wfrac_reg_2_0 = _RAND_27[23:0];
  _RAND_28 = {1{`RANDOM}};
  wfrac_reg_2_1 = _RAND_28[23:0];
  _RAND_29 = {1{`RANDOM}};
  subber_out_s_reg_0 = _RAND_29[7:0];
  _RAND_30 = {1{`RANDOM}};
  subber_out_s_reg_1 = _RAND_30[7:0];
  _RAND_31 = {1{`RANDOM}};
  subber_out_c_reg_0 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  subber_out_c_reg_1 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_0 = _RAND_33[23:0];
  _RAND_34 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_1 = _RAND_34[23:0];
  _RAND_35 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_0 = _RAND_35[23:0];
  _RAND_36 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_1 = _RAND_36[23:0];
  _RAND_37 = {1{`RANDOM}};
  ref_s_reg_0 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  ref_s_reg_1 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  ref_s_reg_2 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  ref_s_reg_3 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  ref_s_reg_4 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  ref_s_reg_5 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  ref_s_reg_6 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  ref_s_reg_7 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  ref_frac_reg_0 = _RAND_45[22:0];
  _RAND_46 = {1{`RANDOM}};
  ref_frac_reg_1 = _RAND_46[22:0];
  _RAND_47 = {1{`RANDOM}};
  ref_frac_reg_2 = _RAND_47[22:0];
  _RAND_48 = {1{`RANDOM}};
  ref_frac_reg_3 = _RAND_48[22:0];
  _RAND_49 = {1{`RANDOM}};
  ref_frac_reg_4 = _RAND_49[22:0];
  _RAND_50 = {1{`RANDOM}};
  ref_frac_reg_5 = _RAND_50[22:0];
  _RAND_51 = {1{`RANDOM}};
  ref_frac_reg_6 = _RAND_51[22:0];
  _RAND_52 = {1{`RANDOM}};
  ref_frac_reg_7 = _RAND_52[22:0];
  _RAND_53 = {1{`RANDOM}};
  ref_exp_reg_0 = _RAND_53[7:0];
  _RAND_54 = {1{`RANDOM}};
  ref_exp_reg_1 = _RAND_54[7:0];
  _RAND_55 = {1{`RANDOM}};
  ref_exp_reg_2 = _RAND_55[7:0];
  _RAND_56 = {1{`RANDOM}};
  ref_exp_reg_3 = _RAND_56[7:0];
  _RAND_57 = {1{`RANDOM}};
  ref_exp_reg_4 = _RAND_57[7:0];
  _RAND_58 = {1{`RANDOM}};
  ref_exp_reg_5 = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  ref_exp_reg_6 = _RAND_59[7:0];
  _RAND_60 = {1{`RANDOM}};
  ref_exp_reg_7 = _RAND_60[7:0];
  _RAND_61 = {1{`RANDOM}};
  sub_exp_reg_0 = _RAND_61[7:0];
  _RAND_62 = {1{`RANDOM}};
  sub_exp_reg_1 = _RAND_62[7:0];
  _RAND_63 = {1{`RANDOM}};
  sub_exp_reg_2 = _RAND_63[7:0];
  _RAND_64 = {1{`RANDOM}};
  sub_exp_reg_3 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  sub_exp_reg_4 = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  sub_exp_reg_5 = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  sub_exp_reg_6 = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  sub_exp_reg_7 = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  adder_io_out_s_reg_0 = _RAND_69[23:0];
  _RAND_70 = {1{`RANDOM}};
  adder_io_out_s_reg_1 = _RAND_70[23:0];
  _RAND_71 = {1{`RANDOM}};
  adder_io_out_s_reg_2 = _RAND_71[23:0];
  _RAND_72 = {1{`RANDOM}};
  adder_io_out_c_reg_0 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  new_s_reg_0 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  new_s_reg_1 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  new_s_reg_2 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  new_s_reg_3 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  new_s_reg_4 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  new_s_reg_5 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  new_out_frac_reg_0 = _RAND_79[22:0];
  _RAND_80 = {1{`RANDOM}};
  new_out_exp_reg_0 = _RAND_80[7:0];
  _RAND_81 = {1{`RANDOM}};
  E_reg_0 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  E_reg_1 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  E_reg_2 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  E_reg_3 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  E_reg_4 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  D_reg_0 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  D_reg_1 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  D_reg_2 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  D_reg_3 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  D_reg_4 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  adder_result_reg_0 = _RAND_91[23:0];
  _RAND_92 = {1{`RANDOM}};
  adder_result_reg_1 = _RAND_92[23:0];
  _RAND_93 = {1{`RANDOM}};
  adder_result_reg_2 = _RAND_93[23:0];
  _RAND_94 = {1{`RANDOM}};
  leadingOne_reg_0 = _RAND_94[5:0];
  _RAND_95 = {1{`RANDOM}};
  leadingOne_reg_1 = _RAND_95[5:0];
  _RAND_96 = {1{`RANDOM}};
  io_in_a_reg_0 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  io_in_a_reg_1 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  io_in_a_reg_2 = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  io_in_a_reg_3 = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  io_in_a_reg_4 = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  io_in_a_reg_5 = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  io_in_a_reg_6 = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  io_in_a_reg_7 = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  io_in_a_reg_8 = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  io_in_a_reg_9 = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  io_in_a_reg_10 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  io_in_b_reg_0 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  io_in_b_reg_1 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  io_in_b_reg_2 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  io_in_b_reg_3 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  io_in_b_reg_4 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  io_in_b_reg_5 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  io_in_b_reg_6 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  io_in_b_reg_7 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  io_in_b_reg_8 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  io_in_b_reg_9 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  io_in_b_reg_10 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  subber2_out_s_reg_0 = _RAND_118[7:0];
  _RAND_119 = {1{`RANDOM}};
  subber2_out_c_reg_0 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  cmpl_subber_out_s_reg_0 = _RAND_120[7:0];
  _RAND_121 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_0 = _RAND_121[23:0];
  _RAND_122 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_1 = _RAND_122[23:0];
  _RAND_123 = {1{`RANDOM}};
  cmpl_adder_io_out_s_reg_0 = _RAND_123[23:0];
  _RAND_124 = {1{`RANDOM}};
  reg_out_s = _RAND_124[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FP_subtractor_13ccs(
  input         clock,
  input         reset,
  input         io_in_en,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 1654:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 1654:26]
  wire  FP_adder_io_in_en; // @[FloatingPointDesigns.scala 1654:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 1654:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1654:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 1657:23]
  FP_adder_13ccs FP_adder ( // @[FloatingPointDesigns.scala 1654:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_en(FP_adder_io_in_en),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1661:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1658:23]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 1657:41]
endmodule
module FP_square_root_139ccs(
  input         clock,
  input         reset,
  input         io_in_en,
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
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
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
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [31:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
`endif // RANDOMIZE_REG_INIT
  wire  FP_multiplier_10ccs_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_1_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_1_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_1_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_1_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_2_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_2_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_2_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_2_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_3_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_3_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_3_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_3_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_3_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_4_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_4_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_4_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_4_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_4_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_5_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_5_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_5_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_5_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_5_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_6_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_6_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_6_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_6_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_6_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_7_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_7_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_7_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_7_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_7_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_8_clock; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_8_reset; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_multiplier_10ccs_8_io_in_en; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_8_io_in_a; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_8_io_in_b; // @[FloatingPointDesigns.scala 1880:65]
  wire [31:0] FP_multiplier_10ccs_8_io_out_s; // @[FloatingPointDesigns.scala 1880:65]
  wire  FP_subtractor_13ccs_clock; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_reset; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_io_in_en; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_io_in_b; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_1_clock; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_1_reset; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_1_io_in_en; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_1_io_in_b; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_2_clock; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_2_reset; // @[FloatingPointDesigns.scala 1881:50]
  wire  FP_subtractor_13ccs_2_io_in_en; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_2_io_in_b; // @[FloatingPointDesigns.scala 1881:50]
  wire [31:0] FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1881:50]
  wire  multiplier4_clock; // @[FloatingPointDesigns.scala 1949:29]
  wire  multiplier4_reset; // @[FloatingPointDesigns.scala 1949:29]
  wire  multiplier4_io_in_en; // @[FloatingPointDesigns.scala 1949:29]
  wire [31:0] multiplier4_io_in_a; // @[FloatingPointDesigns.scala 1949:29]
  wire [31:0] multiplier4_io_in_b; // @[FloatingPointDesigns.scala 1949:29]
  wire [31:0] multiplier4_io_out_s; // @[FloatingPointDesigns.scala 1949:29]
  wire [30:0] _number_T_1 = {{1'd0}, io_in_a[30:1]}; // @[FloatingPointDesigns.scala 1864:36]
  wire [30:0] _GEN_0 = io_in_a[30:0] > 31'h7ef477d4 ? 31'h3f7a3bea : _number_T_1; // @[FloatingPointDesigns.scala 1861:46 1862:14 1864:14]
  wire [31:0] number = {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1858:22]
  wire [31:0] result = 32'h5f3759df - number; // @[FloatingPointDesigns.scala 1871:25]
  reg [31:0] x_n_0; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_1; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_2; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_4; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_5; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_6; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_8; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_9; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] x_n_10; // @[FloatingPointDesigns.scala 1873:22]
  reg [31:0] a_2_0; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_1; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_2; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_3; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_4; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_5; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_6; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_7; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_8; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_9; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_10; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] a_2_11; // @[FloatingPointDesigns.scala 1874:22]
  reg [31:0] stage1_regs_0_0_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_0_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_0_1_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_0_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_1_1_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_0_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_0; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_1; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_2; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_3; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_4; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_5; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_6; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_7; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage1_regs_2_1_8; // @[FloatingPointDesigns.scala 1875:30]
  reg [31:0] stage2_regs_0_0_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_0_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_0_1_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_0_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_1_1_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_0_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_0; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_1; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_2; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_3; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_4; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_5; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_6; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_7; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage2_regs_2_1_8; // @[FloatingPointDesigns.scala 1876:30]
  reg [31:0] stage3_regs_0_0_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_0_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_0_1_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_0_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_1_1_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_0_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_0; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_1; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_2; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_3; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_4; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_5; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_6; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_7; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_8; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_9; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_10; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage3_regs_2_1_11; // @[FloatingPointDesigns.scala 1877:30]
  reg [31:0] stage4_regs_0_1_0; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_1; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_2; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_3; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_4; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_5; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_6; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_7; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_0_1_8; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_0; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_1; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_2; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_3; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_4; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_5; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_6; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_7; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_1_1_8; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_0; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_1; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_2; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_3; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_4; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_5; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_6; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_7; // @[FloatingPointDesigns.scala 1878:30]
  reg [31:0] stage4_regs_2_1_8; // @[FloatingPointDesigns.scala 1878:30]
  wire [7:0] _a_2_0_T_3 = io_in_a[30:23] - 8'h1; // @[FloatingPointDesigns.scala 1903:75]
  wire [31:0] _a_2_0_T_6 = {io_in_a[31],_a_2_0_T_3,io_in_a[22:0]}; // @[FloatingPointDesigns.scala 1903:82]
  wire [7:0] _restore_a_T_3 = stage4_regs_2_1_8[30:23] + 8'h1; // @[FloatingPointDesigns.scala 1948:106]
  wire [8:0] _restore_a_T_4 = {stage4_regs_2_1_8[31],_restore_a_T_3}; // @[FloatingPointDesigns.scala 1948:55]
  FP_multiplier_10ccs FP_multiplier_10ccs ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_clock),
    .reset(FP_multiplier_10ccs_reset),
    .io_in_en(FP_multiplier_10ccs_io_in_en),
    .io_in_a(FP_multiplier_10ccs_io_in_a),
    .io_in_b(FP_multiplier_10ccs_io_in_b),
    .io_out_s(FP_multiplier_10ccs_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_1 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_1_clock),
    .reset(FP_multiplier_10ccs_1_reset),
    .io_in_en(FP_multiplier_10ccs_1_io_in_en),
    .io_in_a(FP_multiplier_10ccs_1_io_in_a),
    .io_in_b(FP_multiplier_10ccs_1_io_in_b),
    .io_out_s(FP_multiplier_10ccs_1_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_2 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_2_clock),
    .reset(FP_multiplier_10ccs_2_reset),
    .io_in_en(FP_multiplier_10ccs_2_io_in_en),
    .io_in_a(FP_multiplier_10ccs_2_io_in_a),
    .io_in_b(FP_multiplier_10ccs_2_io_in_b),
    .io_out_s(FP_multiplier_10ccs_2_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_3 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_3_clock),
    .reset(FP_multiplier_10ccs_3_reset),
    .io_in_en(FP_multiplier_10ccs_3_io_in_en),
    .io_in_a(FP_multiplier_10ccs_3_io_in_a),
    .io_in_b(FP_multiplier_10ccs_3_io_in_b),
    .io_out_s(FP_multiplier_10ccs_3_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_4 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_4_clock),
    .reset(FP_multiplier_10ccs_4_reset),
    .io_in_en(FP_multiplier_10ccs_4_io_in_en),
    .io_in_a(FP_multiplier_10ccs_4_io_in_a),
    .io_in_b(FP_multiplier_10ccs_4_io_in_b),
    .io_out_s(FP_multiplier_10ccs_4_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_5 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_5_clock),
    .reset(FP_multiplier_10ccs_5_reset),
    .io_in_en(FP_multiplier_10ccs_5_io_in_en),
    .io_in_a(FP_multiplier_10ccs_5_io_in_a),
    .io_in_b(FP_multiplier_10ccs_5_io_in_b),
    .io_out_s(FP_multiplier_10ccs_5_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_6 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_6_clock),
    .reset(FP_multiplier_10ccs_6_reset),
    .io_in_en(FP_multiplier_10ccs_6_io_in_en),
    .io_in_a(FP_multiplier_10ccs_6_io_in_a),
    .io_in_b(FP_multiplier_10ccs_6_io_in_b),
    .io_out_s(FP_multiplier_10ccs_6_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_7 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_7_clock),
    .reset(FP_multiplier_10ccs_7_reset),
    .io_in_en(FP_multiplier_10ccs_7_io_in_en),
    .io_in_a(FP_multiplier_10ccs_7_io_in_a),
    .io_in_b(FP_multiplier_10ccs_7_io_in_b),
    .io_out_s(FP_multiplier_10ccs_7_io_out_s)
  );
  FP_multiplier_10ccs FP_multiplier_10ccs_8 ( // @[FloatingPointDesigns.scala 1880:65]
    .clock(FP_multiplier_10ccs_8_clock),
    .reset(FP_multiplier_10ccs_8_reset),
    .io_in_en(FP_multiplier_10ccs_8_io_in_en),
    .io_in_a(FP_multiplier_10ccs_8_io_in_a),
    .io_in_b(FP_multiplier_10ccs_8_io_in_b),
    .io_out_s(FP_multiplier_10ccs_8_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs ( // @[FloatingPointDesigns.scala 1881:50]
    .clock(FP_subtractor_13ccs_clock),
    .reset(FP_subtractor_13ccs_reset),
    .io_in_en(FP_subtractor_13ccs_io_in_en),
    .io_in_b(FP_subtractor_13ccs_io_in_b),
    .io_out_s(FP_subtractor_13ccs_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_1 ( // @[FloatingPointDesigns.scala 1881:50]
    .clock(FP_subtractor_13ccs_1_clock),
    .reset(FP_subtractor_13ccs_1_reset),
    .io_in_en(FP_subtractor_13ccs_1_io_in_en),
    .io_in_b(FP_subtractor_13ccs_1_io_in_b),
    .io_out_s(FP_subtractor_13ccs_1_io_out_s)
  );
  FP_subtractor_13ccs FP_subtractor_13ccs_2 ( // @[FloatingPointDesigns.scala 1881:50]
    .clock(FP_subtractor_13ccs_2_clock),
    .reset(FP_subtractor_13ccs_2_reset),
    .io_in_en(FP_subtractor_13ccs_2_io_in_en),
    .io_in_b(FP_subtractor_13ccs_2_io_in_b),
    .io_out_s(FP_subtractor_13ccs_2_io_out_s)
  );
  FP_multiplier_10ccs multiplier4 ( // @[FloatingPointDesigns.scala 1949:29]
    .clock(multiplier4_clock),
    .reset(multiplier4_reset),
    .io_in_en(multiplier4_io_in_en),
    .io_in_a(multiplier4_io_in_a),
    .io_in_b(multiplier4_io_in_b),
    .io_out_s(multiplier4_io_out_s)
  );
  assign io_out_s = {{1'd0}, multiplier4_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1953:14]
  assign FP_multiplier_10ccs_clock = clock;
  assign FP_multiplier_10ccs_reset = reset;
  assign FP_multiplier_10ccs_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_io_in_a = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 1907:48]
  assign FP_multiplier_10ccs_io_in_b = {1'h0,result[30:0]}; // @[FloatingPointDesigns.scala 1908:48]
  assign FP_multiplier_10ccs_1_clock = clock;
  assign FP_multiplier_10ccs_1_reset = reset;
  assign FP_multiplier_10ccs_1_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_1_io_in_a = FP_multiplier_10ccs_io_out_s; // @[FloatingPointDesigns.scala 1920:34]
  assign FP_multiplier_10ccs_1_io_in_b = {1'h0,stage1_regs_0_1_8[30:0]}; // @[FloatingPointDesigns.scala 1921:46]
  assign FP_multiplier_10ccs_2_clock = clock;
  assign FP_multiplier_10ccs_2_reset = reset;
  assign FP_multiplier_10ccs_2_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_2_io_in_a = {1'h0,stage3_regs_0_0_11[30:0]}; // @[FloatingPointDesigns.scala 1938:46]
  assign FP_multiplier_10ccs_2_io_in_b = FP_subtractor_13ccs_io_out_s; // @[FloatingPointDesigns.scala 1939:34]
  assign FP_multiplier_10ccs_3_clock = clock;
  assign FP_multiplier_10ccs_3_reset = reset;
  assign FP_multiplier_10ccs_3_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_3_io_in_a = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1916:48]
  assign FP_multiplier_10ccs_3_io_in_b = {1'h0,FP_multiplier_10ccs_2_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1917:48]
  assign FP_multiplier_10ccs_4_clock = clock;
  assign FP_multiplier_10ccs_4_reset = reset;
  assign FP_multiplier_10ccs_4_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_4_io_in_a = FP_multiplier_10ccs_3_io_out_s; // @[FloatingPointDesigns.scala 1920:34]
  assign FP_multiplier_10ccs_4_io_in_b = {1'h0,stage1_regs_1_1_8[30:0]}; // @[FloatingPointDesigns.scala 1921:46]
  assign FP_multiplier_10ccs_5_clock = clock;
  assign FP_multiplier_10ccs_5_reset = reset;
  assign FP_multiplier_10ccs_5_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_5_io_in_a = {1'h0,stage3_regs_1_0_11[30:0]}; // @[FloatingPointDesigns.scala 1938:46]
  assign FP_multiplier_10ccs_5_io_in_b = FP_subtractor_13ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1939:34]
  assign FP_multiplier_10ccs_6_clock = clock;
  assign FP_multiplier_10ccs_6_reset = reset;
  assign FP_multiplier_10ccs_6_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_6_io_in_a = {1'h0,FP_multiplier_10ccs_5_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1916:48]
  assign FP_multiplier_10ccs_6_io_in_b = {1'h0,FP_multiplier_10ccs_5_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1917:48]
  assign FP_multiplier_10ccs_7_clock = clock;
  assign FP_multiplier_10ccs_7_reset = reset;
  assign FP_multiplier_10ccs_7_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_7_io_in_a = FP_multiplier_10ccs_6_io_out_s; // @[FloatingPointDesigns.scala 1920:34]
  assign FP_multiplier_10ccs_7_io_in_b = {1'h0,stage1_regs_2_1_8[30:0]}; // @[FloatingPointDesigns.scala 1921:46]
  assign FP_multiplier_10ccs_8_clock = clock;
  assign FP_multiplier_10ccs_8_reset = reset;
  assign FP_multiplier_10ccs_8_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1882:41]
  assign FP_multiplier_10ccs_8_io_in_a = {1'h0,stage3_regs_2_0_11[30:0]}; // @[FloatingPointDesigns.scala 1938:46]
  assign FP_multiplier_10ccs_8_io_in_b = FP_subtractor_13ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1939:34]
  assign FP_subtractor_13ccs_clock = clock;
  assign FP_subtractor_13ccs_reset = reset;
  assign FP_subtractor_13ccs_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1883:32]
  assign FP_subtractor_13ccs_io_in_b = FP_multiplier_10ccs_1_io_out_s; // @[FloatingPointDesigns.scala 1930:31]
  assign FP_subtractor_13ccs_1_clock = clock;
  assign FP_subtractor_13ccs_1_reset = reset;
  assign FP_subtractor_13ccs_1_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1883:32]
  assign FP_subtractor_13ccs_1_io_in_b = FP_multiplier_10ccs_4_io_out_s; // @[FloatingPointDesigns.scala 1930:31]
  assign FP_subtractor_13ccs_2_clock = clock;
  assign FP_subtractor_13ccs_2_reset = reset;
  assign FP_subtractor_13ccs_2_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1883:32]
  assign FP_subtractor_13ccs_2_io_in_b = FP_multiplier_10ccs_7_io_out_s; // @[FloatingPointDesigns.scala 1930:31]
  assign multiplier4_clock = clock;
  assign multiplier4_reset = reset;
  assign multiplier4_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1950:26]
  assign multiplier4_io_in_a = {1'h0,FP_multiplier_10ccs_8_io_out_s[30:0]}; // @[FloatingPointDesigns.scala 1951:37]
  assign multiplier4_io_in_b = {_restore_a_T_4,stage4_regs_2_1_8[22:0]}; // @[FloatingPointDesigns.scala 1948:113]
  always @(posedge clock) begin
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_0 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1901:28]
      x_n_0 <= result; // @[FloatingPointDesigns.scala 1902:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_1 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      x_n_1 <= stage1_regs_0_0_8; // @[FloatingPointDesigns.scala 1924:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_2 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      x_n_2 <= stage2_regs_0_0_8; // @[FloatingPointDesigns.scala 1933:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_4 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      x_n_4 <= FP_multiplier_10ccs_2_io_out_s; // @[FloatingPointDesigns.scala 1911:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_5 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      x_n_5 <= stage1_regs_1_0_8; // @[FloatingPointDesigns.scala 1924:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_6 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      x_n_6 <= stage2_regs_1_0_8; // @[FloatingPointDesigns.scala 1933:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_8 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      x_n_8 <= FP_multiplier_10ccs_5_io_out_s; // @[FloatingPointDesigns.scala 1911:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_9 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      x_n_9 <= stage1_regs_2_0_8; // @[FloatingPointDesigns.scala 1924:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1873:22]
      x_n_10 <= 32'h0; // @[FloatingPointDesigns.scala 1873:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      x_n_10 <= stage2_regs_2_0_8; // @[FloatingPointDesigns.scala 1933:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_0 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1901:28]
      a_2_0 <= _a_2_0_T_6; // @[FloatingPointDesigns.scala 1903:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_1 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      a_2_1 <= stage1_regs_0_1_8; // @[FloatingPointDesigns.scala 1923:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_2 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      a_2_2 <= stage2_regs_0_1_8; // @[FloatingPointDesigns.scala 1932:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_3 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      a_2_3 <= stage3_regs_0_1_11; // @[FloatingPointDesigns.scala 1941:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_4 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      a_2_4 <= stage4_regs_0_1_8; // @[FloatingPointDesigns.scala 1912:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_5 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      a_2_5 <= stage1_regs_1_1_8; // @[FloatingPointDesigns.scala 1923:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_6 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      a_2_6 <= stage2_regs_1_1_8; // @[FloatingPointDesigns.scala 1932:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_7 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      a_2_7 <= stage3_regs_1_1_11; // @[FloatingPointDesigns.scala 1941:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_8 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      a_2_8 <= stage4_regs_1_1_8; // @[FloatingPointDesigns.scala 1912:26]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_9 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      a_2_9 <= stage1_regs_2_1_8; // @[FloatingPointDesigns.scala 1923:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_10 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      a_2_10 <= stage2_regs_2_1_8; // @[FloatingPointDesigns.scala 1932:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1874:22]
      a_2_11 <= 32'h0; // @[FloatingPointDesigns.scala 1874:22]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      a_2_11 <= stage3_regs_2_1_11; // @[FloatingPointDesigns.scala 1941:28]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1901:28]
      stage1_regs_0_0_0 <= x_n_0; // @[FloatingPointDesigns.scala 1904:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_1 <= stage1_regs_0_0_0; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_2 <= stage1_regs_0_0_1; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_3 <= stage1_regs_0_0_2; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_4 <= stage1_regs_0_0_3; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_5 <= stage1_regs_0_0_4; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_6 <= stage1_regs_0_0_5; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_7 <= stage1_regs_0_0_6; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_0_8 <= stage1_regs_0_0_7; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1901:28]
      stage1_regs_0_1_0 <= a_2_0; // @[FloatingPointDesigns.scala 1905:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_1 <= stage1_regs_0_1_0; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_2 <= stage1_regs_0_1_1; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_3 <= stage1_regs_0_1_2; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_4 <= stage1_regs_0_1_3; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_5 <= stage1_regs_0_1_4; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_6 <= stage1_regs_0_1_5; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_7 <= stage1_regs_0_1_6; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_0_1_8 <= stage1_regs_0_1_7; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      stage1_regs_1_0_0 <= x_n_4; // @[FloatingPointDesigns.scala 1913:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_1 <= stage1_regs_1_0_0; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_2 <= stage1_regs_1_0_1; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_3 <= stage1_regs_1_0_2; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_4 <= stage1_regs_1_0_3; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_5 <= stage1_regs_1_0_4; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_6 <= stage1_regs_1_0_5; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_7 <= stage1_regs_1_0_6; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_0_8 <= stage1_regs_1_0_7; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      stage1_regs_1_1_0 <= a_2_4; // @[FloatingPointDesigns.scala 1914:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_1 <= stage1_regs_1_1_0; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_2 <= stage1_regs_1_1_1; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_3 <= stage1_regs_1_1_2; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_4 <= stage1_regs_1_1_3; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_5 <= stage1_regs_1_1_4; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_6 <= stage1_regs_1_1_5; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_7 <= stage1_regs_1_1_6; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_1_1_8 <= stage1_regs_1_1_7; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      stage1_regs_2_0_0 <= x_n_8; // @[FloatingPointDesigns.scala 1913:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_1 <= stage1_regs_2_0_0; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_2 <= stage1_regs_2_0_1; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_3 <= stage1_regs_2_0_2; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_4 <= stage1_regs_2_0_3; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_5 <= stage1_regs_2_0_4; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_6 <= stage1_regs_2_0_5; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_7 <= stage1_regs_2_0_6; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_0_8 <= stage1_regs_2_0_7; // @[FloatingPointDesigns.scala 1890:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1910:28]
      stage1_regs_2_1_0 <= a_2_8; // @[FloatingPointDesigns.scala 1914:36]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_1 <= stage1_regs_2_1_0; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_2 <= stage1_regs_2_1_1; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_3 <= stage1_regs_2_1_2; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_4 <= stage1_regs_2_1_3; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_5 <= stage1_regs_2_1_4; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_6 <= stage1_regs_2_1_5; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_7 <= stage1_regs_2_1_6; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1875:30]
      stage1_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1875:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage1_regs_2_1_8 <= stage1_regs_2_1_7; // @[FloatingPointDesigns.scala 1891:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_0_0_0 <= x_n_1; // @[FloatingPointDesigns.scala 1925:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_1 <= stage2_regs_0_0_0; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_2 <= stage2_regs_0_0_1; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_3 <= stage2_regs_0_0_2; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_4 <= stage2_regs_0_0_3; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_5 <= stage2_regs_0_0_4; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_6 <= stage2_regs_0_0_5; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_7 <= stage2_regs_0_0_6; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_0_8 <= stage2_regs_0_0_7; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_0_1_0 <= a_2_1; // @[FloatingPointDesigns.scala 1926:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_1 <= stage2_regs_0_1_0; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_2 <= stage2_regs_0_1_1; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_3 <= stage2_regs_0_1_2; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_4 <= stage2_regs_0_1_3; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_5 <= stage2_regs_0_1_4; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_6 <= stage2_regs_0_1_5; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_7 <= stage2_regs_0_1_6; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_0_1_8 <= stage2_regs_0_1_7; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_1_0_0 <= x_n_5; // @[FloatingPointDesigns.scala 1925:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_1 <= stage2_regs_1_0_0; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_2 <= stage2_regs_1_0_1; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_3 <= stage2_regs_1_0_2; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_4 <= stage2_regs_1_0_3; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_5 <= stage2_regs_1_0_4; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_6 <= stage2_regs_1_0_5; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_7 <= stage2_regs_1_0_6; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_0_8 <= stage2_regs_1_0_7; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_1_1_0 <= a_2_5; // @[FloatingPointDesigns.scala 1926:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_1 <= stage2_regs_1_1_0; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_2 <= stage2_regs_1_1_1; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_3 <= stage2_regs_1_1_2; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_4 <= stage2_regs_1_1_3; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_5 <= stage2_regs_1_1_4; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_6 <= stage2_regs_1_1_5; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_7 <= stage2_regs_1_1_6; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_1_1_8 <= stage2_regs_1_1_7; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_2_0_0 <= x_n_9; // @[FloatingPointDesigns.scala 1925:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_1 <= stage2_regs_2_0_0; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_2 <= stage2_regs_2_0_1; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_3 <= stage2_regs_2_0_2; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_4 <= stage2_regs_2_0_3; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_5 <= stage2_regs_2_0_4; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_6 <= stage2_regs_2_0_5; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_7 <= stage2_regs_2_0_6; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_0_8 <= stage2_regs_2_0_7; // @[FloatingPointDesigns.scala 1892:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1922:26]
      stage2_regs_2_1_0 <= a_2_9; // @[FloatingPointDesigns.scala 1926:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_1 <= stage2_regs_2_1_0; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_2 <= stage2_regs_2_1_1; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_3 <= stage2_regs_2_1_2; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_4 <= stage2_regs_2_1_3; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_5 <= stage2_regs_2_1_4; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_6 <= stage2_regs_2_1_5; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_7 <= stage2_regs_2_1_6; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1876:30]
      stage2_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1876:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage2_regs_2_1_8 <= stage2_regs_2_1_7; // @[FloatingPointDesigns.scala 1893:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_0_0_0 <= x_n_2; // @[FloatingPointDesigns.scala 1934:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_1 <= stage3_regs_0_0_0; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_2 <= stage3_regs_0_0_1; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_3 <= stage3_regs_0_0_2; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_4 <= stage3_regs_0_0_3; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_5 <= stage3_regs_0_0_4; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_6 <= stage3_regs_0_0_5; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_7 <= stage3_regs_0_0_6; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_8 <= stage3_regs_0_0_7; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_9 <= stage3_regs_0_0_8; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_10 <= stage3_regs_0_0_9; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_0_11 <= stage3_regs_0_0_10; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_0_1_0 <= a_2_2; // @[FloatingPointDesigns.scala 1935:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_1 <= stage3_regs_0_1_0; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_2 <= stage3_regs_0_1_1; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_3 <= stage3_regs_0_1_2; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_4 <= stage3_regs_0_1_3; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_5 <= stage3_regs_0_1_4; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_6 <= stage3_regs_0_1_5; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_7 <= stage3_regs_0_1_6; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_8 <= stage3_regs_0_1_7; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_9 <= stage3_regs_0_1_8; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_10 <= stage3_regs_0_1_9; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_0_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_0_1_11 <= stage3_regs_0_1_10; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_1_0_0 <= x_n_6; // @[FloatingPointDesigns.scala 1934:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_1 <= stage3_regs_1_0_0; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_2 <= stage3_regs_1_0_1; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_3 <= stage3_regs_1_0_2; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_4 <= stage3_regs_1_0_3; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_5 <= stage3_regs_1_0_4; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_6 <= stage3_regs_1_0_5; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_7 <= stage3_regs_1_0_6; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_8 <= stage3_regs_1_0_7; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_9 <= stage3_regs_1_0_8; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_10 <= stage3_regs_1_0_9; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_0_11 <= stage3_regs_1_0_10; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_1_1_0 <= a_2_6; // @[FloatingPointDesigns.scala 1935:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_1 <= stage3_regs_1_1_0; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_2 <= stage3_regs_1_1_1; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_3 <= stage3_regs_1_1_2; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_4 <= stage3_regs_1_1_3; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_5 <= stage3_regs_1_1_4; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_6 <= stage3_regs_1_1_5; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_7 <= stage3_regs_1_1_6; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_8 <= stage3_regs_1_1_7; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_9 <= stage3_regs_1_1_8; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_10 <= stage3_regs_1_1_9; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_1_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_1_1_11 <= stage3_regs_1_1_10; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_2_0_0 <= x_n_10; // @[FloatingPointDesigns.scala 1934:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_1 <= stage3_regs_2_0_0; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_2 <= stage3_regs_2_0_1; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_3 <= stage3_regs_2_0_2; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_4 <= stage3_regs_2_0_3; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_5 <= stage3_regs_2_0_4; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_6 <= stage3_regs_2_0_5; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_7 <= stage3_regs_2_0_6; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_8 <= stage3_regs_2_0_7; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_9 <= stage3_regs_2_0_8; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_10 <= stage3_regs_2_0_9; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_0_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_0_11 <= stage3_regs_2_0_10; // @[FloatingPointDesigns.scala 1887:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1931:26]
      stage3_regs_2_1_0 <= a_2_10; // @[FloatingPointDesigns.scala 1935:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_1 <= stage3_regs_2_1_0; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_2 <= stage3_regs_2_1_1; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_3 <= stage3_regs_2_1_2; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_4 <= stage3_regs_2_1_3; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_5 <= stage3_regs_2_1_4; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_6 <= stage3_regs_2_1_5; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_7 <= stage3_regs_2_1_6; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_8 <= stage3_regs_2_1_7; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_9 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_9 <= stage3_regs_2_1_8; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_10 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_10 <= stage3_regs_2_1_9; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1877:30]
      stage3_regs_2_1_11 <= 32'h0; // @[FloatingPointDesigns.scala 1877:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage3_regs_2_1_11 <= stage3_regs_2_1_10; // @[FloatingPointDesigns.scala 1888:32]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      stage4_regs_0_1_0 <= a_2_3; // @[FloatingPointDesigns.scala 1942:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_1 <= stage4_regs_0_1_0; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_2 <= stage4_regs_0_1_1; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_3 <= stage4_regs_0_1_2; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_4 <= stage4_regs_0_1_3; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_5 <= stage4_regs_0_1_4; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_6 <= stage4_regs_0_1_5; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_7 <= stage4_regs_0_1_6; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_0_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_0_1_8 <= stage4_regs_0_1_7; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      stage4_regs_1_1_0 <= a_2_7; // @[FloatingPointDesigns.scala 1942:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_1 <= stage4_regs_1_1_0; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_2 <= stage4_regs_1_1_1; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_3 <= stage4_regs_1_1_2; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_4 <= stage4_regs_1_1_3; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_5 <= stage4_regs_1_1_4; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_6 <= stage4_regs_1_1_5; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_7 <= stage4_regs_1_1_6; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_1_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_1_1_8 <= stage4_regs_1_1_7; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_0 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1940:26]
      stage4_regs_2_1_0 <= a_2_11; // @[FloatingPointDesigns.scala 1942:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_1 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_1 <= stage4_regs_2_1_0; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_2 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_2 <= stage4_regs_2_1_1; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_3 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_3 <= stage4_regs_2_1_2; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_4 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_4 <= stage4_regs_2_1_3; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_5 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_5 <= stage4_regs_2_1_4; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_6 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_6 <= stage4_regs_2_1_5; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_7 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_7 <= stage4_regs_2_1_6; // @[FloatingPointDesigns.scala 1894:34]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1878:30]
      stage4_regs_2_1_8 <= 32'h0; // @[FloatingPointDesigns.scala 1878:30]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1885:22]
      stage4_regs_2_1_8 <= stage4_regs_2_1_7; // @[FloatingPointDesigns.scala 1894:34]
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
  x_n_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  x_n_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  x_n_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  x_n_4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  x_n_5 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  x_n_6 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  x_n_8 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  x_n_9 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  x_n_10 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  a_2_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  a_2_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  a_2_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  a_2_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  a_2_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  a_2_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  a_2_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  a_2_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  a_2_8 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  a_2_9 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  a_2_10 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  a_2_11 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  stage1_regs_0_0_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  stage1_regs_0_0_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  stage1_regs_0_0_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  stage1_regs_0_0_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  stage1_regs_0_0_4 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  stage1_regs_0_0_5 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  stage1_regs_0_0_6 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  stage1_regs_0_0_7 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  stage1_regs_0_0_8 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  stage1_regs_0_1_0 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  stage1_regs_0_1_1 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  stage1_regs_0_1_2 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  stage1_regs_0_1_3 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  stage1_regs_0_1_4 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  stage1_regs_0_1_5 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  stage1_regs_0_1_6 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  stage1_regs_0_1_7 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  stage1_regs_0_1_8 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  stage1_regs_1_0_0 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  stage1_regs_1_0_1 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  stage1_regs_1_0_2 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  stage1_regs_1_0_3 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  stage1_regs_1_0_4 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  stage1_regs_1_0_5 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  stage1_regs_1_0_6 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  stage1_regs_1_0_7 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  stage1_regs_1_0_8 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  stage1_regs_1_1_0 = _RAND_48[31:0];
  _RAND_49 = {1{`RANDOM}};
  stage1_regs_1_1_1 = _RAND_49[31:0];
  _RAND_50 = {1{`RANDOM}};
  stage1_regs_1_1_2 = _RAND_50[31:0];
  _RAND_51 = {1{`RANDOM}};
  stage1_regs_1_1_3 = _RAND_51[31:0];
  _RAND_52 = {1{`RANDOM}};
  stage1_regs_1_1_4 = _RAND_52[31:0];
  _RAND_53 = {1{`RANDOM}};
  stage1_regs_1_1_5 = _RAND_53[31:0];
  _RAND_54 = {1{`RANDOM}};
  stage1_regs_1_1_6 = _RAND_54[31:0];
  _RAND_55 = {1{`RANDOM}};
  stage1_regs_1_1_7 = _RAND_55[31:0];
  _RAND_56 = {1{`RANDOM}};
  stage1_regs_1_1_8 = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  stage1_regs_2_0_0 = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  stage1_regs_2_0_1 = _RAND_58[31:0];
  _RAND_59 = {1{`RANDOM}};
  stage1_regs_2_0_2 = _RAND_59[31:0];
  _RAND_60 = {1{`RANDOM}};
  stage1_regs_2_0_3 = _RAND_60[31:0];
  _RAND_61 = {1{`RANDOM}};
  stage1_regs_2_0_4 = _RAND_61[31:0];
  _RAND_62 = {1{`RANDOM}};
  stage1_regs_2_0_5 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  stage1_regs_2_0_6 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  stage1_regs_2_0_7 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  stage1_regs_2_0_8 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  stage1_regs_2_1_0 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  stage1_regs_2_1_1 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  stage1_regs_2_1_2 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  stage1_regs_2_1_3 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  stage1_regs_2_1_4 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  stage1_regs_2_1_5 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  stage1_regs_2_1_6 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  stage1_regs_2_1_7 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  stage1_regs_2_1_8 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  stage2_regs_0_0_0 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  stage2_regs_0_0_1 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  stage2_regs_0_0_2 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  stage2_regs_0_0_3 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  stage2_regs_0_0_4 = _RAND_79[31:0];
  _RAND_80 = {1{`RANDOM}};
  stage2_regs_0_0_5 = _RAND_80[31:0];
  _RAND_81 = {1{`RANDOM}};
  stage2_regs_0_0_6 = _RAND_81[31:0];
  _RAND_82 = {1{`RANDOM}};
  stage2_regs_0_0_7 = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  stage2_regs_0_0_8 = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  stage2_regs_0_1_0 = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  stage2_regs_0_1_1 = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  stage2_regs_0_1_2 = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  stage2_regs_0_1_3 = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  stage2_regs_0_1_4 = _RAND_88[31:0];
  _RAND_89 = {1{`RANDOM}};
  stage2_regs_0_1_5 = _RAND_89[31:0];
  _RAND_90 = {1{`RANDOM}};
  stage2_regs_0_1_6 = _RAND_90[31:0];
  _RAND_91 = {1{`RANDOM}};
  stage2_regs_0_1_7 = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  stage2_regs_0_1_8 = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  stage2_regs_1_0_0 = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  stage2_regs_1_0_1 = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  stage2_regs_1_0_2 = _RAND_95[31:0];
  _RAND_96 = {1{`RANDOM}};
  stage2_regs_1_0_3 = _RAND_96[31:0];
  _RAND_97 = {1{`RANDOM}};
  stage2_regs_1_0_4 = _RAND_97[31:0];
  _RAND_98 = {1{`RANDOM}};
  stage2_regs_1_0_5 = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  stage2_regs_1_0_6 = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  stage2_regs_1_0_7 = _RAND_100[31:0];
  _RAND_101 = {1{`RANDOM}};
  stage2_regs_1_0_8 = _RAND_101[31:0];
  _RAND_102 = {1{`RANDOM}};
  stage2_regs_1_1_0 = _RAND_102[31:0];
  _RAND_103 = {1{`RANDOM}};
  stage2_regs_1_1_1 = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  stage2_regs_1_1_2 = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  stage2_regs_1_1_3 = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  stage2_regs_1_1_4 = _RAND_106[31:0];
  _RAND_107 = {1{`RANDOM}};
  stage2_regs_1_1_5 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  stage2_regs_1_1_6 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  stage2_regs_1_1_7 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  stage2_regs_1_1_8 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  stage2_regs_2_0_0 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  stage2_regs_2_0_1 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  stage2_regs_2_0_2 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  stage2_regs_2_0_3 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  stage2_regs_2_0_4 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  stage2_regs_2_0_5 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  stage2_regs_2_0_6 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  stage2_regs_2_0_7 = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  stage2_regs_2_0_8 = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  stage2_regs_2_1_0 = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  stage2_regs_2_1_1 = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  stage2_regs_2_1_2 = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  stage2_regs_2_1_3 = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  stage2_regs_2_1_4 = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  stage2_regs_2_1_5 = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  stage2_regs_2_1_6 = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  stage2_regs_2_1_7 = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  stage2_regs_2_1_8 = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  stage3_regs_0_0_0 = _RAND_129[31:0];
  _RAND_130 = {1{`RANDOM}};
  stage3_regs_0_0_1 = _RAND_130[31:0];
  _RAND_131 = {1{`RANDOM}};
  stage3_regs_0_0_2 = _RAND_131[31:0];
  _RAND_132 = {1{`RANDOM}};
  stage3_regs_0_0_3 = _RAND_132[31:0];
  _RAND_133 = {1{`RANDOM}};
  stage3_regs_0_0_4 = _RAND_133[31:0];
  _RAND_134 = {1{`RANDOM}};
  stage3_regs_0_0_5 = _RAND_134[31:0];
  _RAND_135 = {1{`RANDOM}};
  stage3_regs_0_0_6 = _RAND_135[31:0];
  _RAND_136 = {1{`RANDOM}};
  stage3_regs_0_0_7 = _RAND_136[31:0];
  _RAND_137 = {1{`RANDOM}};
  stage3_regs_0_0_8 = _RAND_137[31:0];
  _RAND_138 = {1{`RANDOM}};
  stage3_regs_0_0_9 = _RAND_138[31:0];
  _RAND_139 = {1{`RANDOM}};
  stage3_regs_0_0_10 = _RAND_139[31:0];
  _RAND_140 = {1{`RANDOM}};
  stage3_regs_0_0_11 = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  stage3_regs_0_1_0 = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  stage3_regs_0_1_1 = _RAND_142[31:0];
  _RAND_143 = {1{`RANDOM}};
  stage3_regs_0_1_2 = _RAND_143[31:0];
  _RAND_144 = {1{`RANDOM}};
  stage3_regs_0_1_3 = _RAND_144[31:0];
  _RAND_145 = {1{`RANDOM}};
  stage3_regs_0_1_4 = _RAND_145[31:0];
  _RAND_146 = {1{`RANDOM}};
  stage3_regs_0_1_5 = _RAND_146[31:0];
  _RAND_147 = {1{`RANDOM}};
  stage3_regs_0_1_6 = _RAND_147[31:0];
  _RAND_148 = {1{`RANDOM}};
  stage3_regs_0_1_7 = _RAND_148[31:0];
  _RAND_149 = {1{`RANDOM}};
  stage3_regs_0_1_8 = _RAND_149[31:0];
  _RAND_150 = {1{`RANDOM}};
  stage3_regs_0_1_9 = _RAND_150[31:0];
  _RAND_151 = {1{`RANDOM}};
  stage3_regs_0_1_10 = _RAND_151[31:0];
  _RAND_152 = {1{`RANDOM}};
  stage3_regs_0_1_11 = _RAND_152[31:0];
  _RAND_153 = {1{`RANDOM}};
  stage3_regs_1_0_0 = _RAND_153[31:0];
  _RAND_154 = {1{`RANDOM}};
  stage3_regs_1_0_1 = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  stage3_regs_1_0_2 = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  stage3_regs_1_0_3 = _RAND_156[31:0];
  _RAND_157 = {1{`RANDOM}};
  stage3_regs_1_0_4 = _RAND_157[31:0];
  _RAND_158 = {1{`RANDOM}};
  stage3_regs_1_0_5 = _RAND_158[31:0];
  _RAND_159 = {1{`RANDOM}};
  stage3_regs_1_0_6 = _RAND_159[31:0];
  _RAND_160 = {1{`RANDOM}};
  stage3_regs_1_0_7 = _RAND_160[31:0];
  _RAND_161 = {1{`RANDOM}};
  stage3_regs_1_0_8 = _RAND_161[31:0];
  _RAND_162 = {1{`RANDOM}};
  stage3_regs_1_0_9 = _RAND_162[31:0];
  _RAND_163 = {1{`RANDOM}};
  stage3_regs_1_0_10 = _RAND_163[31:0];
  _RAND_164 = {1{`RANDOM}};
  stage3_regs_1_0_11 = _RAND_164[31:0];
  _RAND_165 = {1{`RANDOM}};
  stage3_regs_1_1_0 = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  stage3_regs_1_1_1 = _RAND_166[31:0];
  _RAND_167 = {1{`RANDOM}};
  stage3_regs_1_1_2 = _RAND_167[31:0];
  _RAND_168 = {1{`RANDOM}};
  stage3_regs_1_1_3 = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  stage3_regs_1_1_4 = _RAND_169[31:0];
  _RAND_170 = {1{`RANDOM}};
  stage3_regs_1_1_5 = _RAND_170[31:0];
  _RAND_171 = {1{`RANDOM}};
  stage3_regs_1_1_6 = _RAND_171[31:0];
  _RAND_172 = {1{`RANDOM}};
  stage3_regs_1_1_7 = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  stage3_regs_1_1_8 = _RAND_173[31:0];
  _RAND_174 = {1{`RANDOM}};
  stage3_regs_1_1_9 = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  stage3_regs_1_1_10 = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  stage3_regs_1_1_11 = _RAND_176[31:0];
  _RAND_177 = {1{`RANDOM}};
  stage3_regs_2_0_0 = _RAND_177[31:0];
  _RAND_178 = {1{`RANDOM}};
  stage3_regs_2_0_1 = _RAND_178[31:0];
  _RAND_179 = {1{`RANDOM}};
  stage3_regs_2_0_2 = _RAND_179[31:0];
  _RAND_180 = {1{`RANDOM}};
  stage3_regs_2_0_3 = _RAND_180[31:0];
  _RAND_181 = {1{`RANDOM}};
  stage3_regs_2_0_4 = _RAND_181[31:0];
  _RAND_182 = {1{`RANDOM}};
  stage3_regs_2_0_5 = _RAND_182[31:0];
  _RAND_183 = {1{`RANDOM}};
  stage3_regs_2_0_6 = _RAND_183[31:0];
  _RAND_184 = {1{`RANDOM}};
  stage3_regs_2_0_7 = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  stage3_regs_2_0_8 = _RAND_185[31:0];
  _RAND_186 = {1{`RANDOM}};
  stage3_regs_2_0_9 = _RAND_186[31:0];
  _RAND_187 = {1{`RANDOM}};
  stage3_regs_2_0_10 = _RAND_187[31:0];
  _RAND_188 = {1{`RANDOM}};
  stage3_regs_2_0_11 = _RAND_188[31:0];
  _RAND_189 = {1{`RANDOM}};
  stage3_regs_2_1_0 = _RAND_189[31:0];
  _RAND_190 = {1{`RANDOM}};
  stage3_regs_2_1_1 = _RAND_190[31:0];
  _RAND_191 = {1{`RANDOM}};
  stage3_regs_2_1_2 = _RAND_191[31:0];
  _RAND_192 = {1{`RANDOM}};
  stage3_regs_2_1_3 = _RAND_192[31:0];
  _RAND_193 = {1{`RANDOM}};
  stage3_regs_2_1_4 = _RAND_193[31:0];
  _RAND_194 = {1{`RANDOM}};
  stage3_regs_2_1_5 = _RAND_194[31:0];
  _RAND_195 = {1{`RANDOM}};
  stage3_regs_2_1_6 = _RAND_195[31:0];
  _RAND_196 = {1{`RANDOM}};
  stage3_regs_2_1_7 = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  stage3_regs_2_1_8 = _RAND_197[31:0];
  _RAND_198 = {1{`RANDOM}};
  stage3_regs_2_1_9 = _RAND_198[31:0];
  _RAND_199 = {1{`RANDOM}};
  stage3_regs_2_1_10 = _RAND_199[31:0];
  _RAND_200 = {1{`RANDOM}};
  stage3_regs_2_1_11 = _RAND_200[31:0];
  _RAND_201 = {1{`RANDOM}};
  stage4_regs_0_1_0 = _RAND_201[31:0];
  _RAND_202 = {1{`RANDOM}};
  stage4_regs_0_1_1 = _RAND_202[31:0];
  _RAND_203 = {1{`RANDOM}};
  stage4_regs_0_1_2 = _RAND_203[31:0];
  _RAND_204 = {1{`RANDOM}};
  stage4_regs_0_1_3 = _RAND_204[31:0];
  _RAND_205 = {1{`RANDOM}};
  stage4_regs_0_1_4 = _RAND_205[31:0];
  _RAND_206 = {1{`RANDOM}};
  stage4_regs_0_1_5 = _RAND_206[31:0];
  _RAND_207 = {1{`RANDOM}};
  stage4_regs_0_1_6 = _RAND_207[31:0];
  _RAND_208 = {1{`RANDOM}};
  stage4_regs_0_1_7 = _RAND_208[31:0];
  _RAND_209 = {1{`RANDOM}};
  stage4_regs_0_1_8 = _RAND_209[31:0];
  _RAND_210 = {1{`RANDOM}};
  stage4_regs_1_1_0 = _RAND_210[31:0];
  _RAND_211 = {1{`RANDOM}};
  stage4_regs_1_1_1 = _RAND_211[31:0];
  _RAND_212 = {1{`RANDOM}};
  stage4_regs_1_1_2 = _RAND_212[31:0];
  _RAND_213 = {1{`RANDOM}};
  stage4_regs_1_1_3 = _RAND_213[31:0];
  _RAND_214 = {1{`RANDOM}};
  stage4_regs_1_1_4 = _RAND_214[31:0];
  _RAND_215 = {1{`RANDOM}};
  stage4_regs_1_1_5 = _RAND_215[31:0];
  _RAND_216 = {1{`RANDOM}};
  stage4_regs_1_1_6 = _RAND_216[31:0];
  _RAND_217 = {1{`RANDOM}};
  stage4_regs_1_1_7 = _RAND_217[31:0];
  _RAND_218 = {1{`RANDOM}};
  stage4_regs_1_1_8 = _RAND_218[31:0];
  _RAND_219 = {1{`RANDOM}};
  stage4_regs_2_1_0 = _RAND_219[31:0];
  _RAND_220 = {1{`RANDOM}};
  stage4_regs_2_1_1 = _RAND_220[31:0];
  _RAND_221 = {1{`RANDOM}};
  stage4_regs_2_1_2 = _RAND_221[31:0];
  _RAND_222 = {1{`RANDOM}};
  stage4_regs_2_1_3 = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  stage4_regs_2_1_4 = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  stage4_regs_2_1_5 = _RAND_224[31:0];
  _RAND_225 = {1{`RANDOM}};
  stage4_regs_2_1_6 = _RAND_225[31:0];
  _RAND_226 = {1{`RANDOM}};
  stage4_regs_2_1_7 = _RAND_226[31:0];
  _RAND_227 = {1{`RANDOM}};
  stage4_regs_2_1_8 = _RAND_227[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

