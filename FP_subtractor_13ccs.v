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
module FP_adder_13ccs(
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
  wire  sign_0 = io_in_a[31]; // @[FloatingPointDesigns.scala 1389:23]
  wire  sign_1 = io_in_b[31]; // @[FloatingPointDesigns.scala 1390:23]
  wire [8:0] _T_2 = 9'h100 - 9'h2; // @[FloatingPointDesigns.scala 1393:64]
  wire [8:0] _GEN_167 = {{1'd0}, io_in_a[30:23]}; // @[FloatingPointDesigns.scala 1393:36]
  wire [7:0] _GEN_0 = io_in_a[30:23] < 8'h1 ? 8'h1 : io_in_a[30:23]; // @[FloatingPointDesigns.scala 1395:46 1396:14 1398:14]
  wire [8:0] _GEN_1 = _GEN_167 > _T_2 ? _T_2 : {{1'd0}, _GEN_0}; // @[FloatingPointDesigns.scala 1393:71 1394:14]
  wire [8:0] _GEN_168 = {{1'd0}, io_in_b[30:23]}; // @[FloatingPointDesigns.scala 1400:36]
  wire [7:0] _GEN_2 = io_in_b[30:23] < 8'h1 ? 8'h1 : io_in_b[30:23]; // @[FloatingPointDesigns.scala 1402:45 1403:14 1405:14]
  wire [8:0] _GEN_3 = _GEN_168 > _T_2 ? _T_2 : {{1'd0}, _GEN_2}; // @[FloatingPointDesigns.scala 1400:71 1401:14]
  wire [22:0] frac_0 = io_in_a[22:0]; // @[FloatingPointDesigns.scala 1410:23]
  wire [22:0] frac_1 = io_in_b[22:0]; // @[FloatingPointDesigns.scala 1411:23]
  wire [23:0] whole_frac_0 = {1'h1,frac_0}; // @[FloatingPointDesigns.scala 1415:26]
  wire [23:0] whole_frac_1 = {1'h1,frac_1}; // @[FloatingPointDesigns.scala 1416:26]
  reg  sign_reg_0_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_0_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_1_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_1_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_2_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_2_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_3_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_3_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_4_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_4_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_5_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_5_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_6_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_6_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_7_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_7_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_8_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_8_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_9_0; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_9_1; // @[FloatingPointDesigns.scala 1418:28]
  reg  sign_reg_10_0; // @[FloatingPointDesigns.scala 1418:28]
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
  reg [23:0] cmpl_wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1492:44]
  reg [23:0] cmpl_wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1492:44]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T = ~wire_temp_add_in_reg_0_0; // @[FloatingPointDesigns.scala 1494:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_0_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_0_T; // @[FloatingPointDesigns.scala 1494:46]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T = ~wire_temp_add_in_reg_0_1; // @[FloatingPointDesigns.scala 1495:48]
  wire [23:0] _cmpl_wire_temp_add_in_reg_0_1_T_2 = 24'h1 + _cmpl_wire_temp_add_in_reg_0_1_T; // @[FloatingPointDesigns.scala 1495:46]
  wire [1:0] _adder_io_in_a_T = {sign_reg_4_1,sign_reg_4_0}; // @[FloatingPointDesigns.scala 1498:38]
  wire  _new_s_T = ~adder_io_out_c_reg_0; // @[FloatingPointDesigns.scala 1505:15]
  wire  new_s = ~adder_io_out_c_reg_0 & (sign_reg_5_0 | sign_reg_5_1) | sign_reg_5_0 & sign_reg_5_1; // @[FloatingPointDesigns.scala 1505:75]
  wire  _D_T_1 = sign_reg_5_0 ^ sign_reg_5_1; // @[FloatingPointDesigns.scala 1512:53]
  wire  D = _new_s_T | sign_reg_5_0 ^ sign_reg_5_1; // @[FloatingPointDesigns.scala 1512:35]
  wire  E = _new_s_T & ~adder_io_out_s_reg_0[23] | _new_s_T & ~_D_T_1 | adder_io_out_c_reg_0 & adder_io_out_s_reg_0[23]
     & _D_T_1; // @[FloatingPointDesigns.scala 1514:134]
  reg [23:0] cmpl_adder_io_out_s_reg_0; // @[FloatingPointDesigns.scala 1516:42]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T = ~adder_io_out_s_reg_1; // @[FloatingPointDesigns.scala 1519:43]
  wire [23:0] _cmpl_adder_io_out_s_reg_0_T_2 = 24'h1 + _cmpl_adder_io_out_s_reg_0_T; // @[FloatingPointDesigns.scala 1519:41]
  wire [1:0] _adder_result_T = {sign_reg_7_1,sign_reg_7_0}; // @[FloatingPointDesigns.scala 1523:53]
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
  wire [8:0] _GEN_169 = {{1'd0}, ref_exp_reg_7}; // @[FloatingPointDesigns.scala 1617:29]
  wire [23:0] _new_out_frac_reg_0_T_2 = 24'h800000 - 24'h1; // @[FloatingPointDesigns.scala 1619:60]
  wire [7:0] _new_out_exp_reg_0_T_3 = ref_exp_reg_7 + 8'h1; // @[FloatingPointDesigns.scala 1621:48]
  wire [8:0] _GEN_142 = _GEN_169 == _T_2 ? _T_2 : {{1'd0}, _new_out_exp_reg_0_T_3}; // @[FloatingPointDesigns.scala 1617:66 1618:30 1621:30]
  wire [23:0] _GEN_143 = _GEN_169 == _T_2 ? _new_out_frac_reg_0_T_2 : {{1'd0}, adder_result_reg_2[23:1]}; // @[FloatingPointDesigns.scala 1617:66 1619:31 1622:31]
  wire [5:0] _new_out_frac_reg_0_T_6 = 6'h18 - leadingOne_reg_1; // @[FloatingPointDesigns.scala 1635:94]
  wire [85:0] _GEN_5 = {{63'd0}, adder_result_reg_2[22:0]}; // @[FloatingPointDesigns.scala 1635:73]
  wire [85:0] _new_out_frac_reg_0_T_7 = _GEN_5 << _new_out_frac_reg_0_T_6; // @[FloatingPointDesigns.scala 1635:73]
  wire [7:0] _GEN_144 = subber2_out_c_reg_0 ? 8'h1 : subber2_out_s_reg_0; // @[FloatingPointDesigns.scala 1630:46 1631:32 1634:32]
  wire [85:0] _GEN_145 = subber2_out_c_reg_0 ? 86'h0 : _new_out_frac_reg_0_T_7; // @[FloatingPointDesigns.scala 1630:46 1632:33 1635:33]
  wire [7:0] _GEN_146 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & ((sign_reg_10_0 ^ sign_reg_10_1) &
    io_in_a_reg_10[30:0] == io_in_b_reg_10[30:0]) ? 8'h0 : _GEN_144; // @[FloatingPointDesigns.scala 1626:184 1627:30]
  wire [85:0] _GEN_147 = leadingOne_reg_1 == 6'h1 & adder_result_reg_2 == 24'h0 & ((sign_reg_10_0 ^ sign_reg_10_1) &
    io_in_a_reg_10[30:0] == io_in_b_reg_10[30:0]) ? 86'h0 : _GEN_145; // @[FloatingPointDesigns.scala 1626:184 1628:31]
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
  wire [85:0] _GEN_170 = reset ? 86'h0 : _GEN_165; // @[FloatingPointDesigns.scala 1437:{35,35}]
  wire [8:0] _GEN_171 = reset ? 9'h0 : _GEN_164; // @[FloatingPointDesigns.scala 1438:{35,35}]
  full_subber subber ( // @[FloatingPointDesigns.scala 1460:24]
    .io_in_a(subber_io_in_a),
    .io_in_b(subber_io_in_b),
    .io_out_s(subber_io_out_s),
    .io_out_c(subber_io_out_c)
  );
  full_adder adder ( // @[FloatingPointDesigns.scala 1466:23]
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
      sign_reg_0_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_0_0 <= sign_0; // @[FloatingPointDesigns.scala 1537:19]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_0_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_0_1 <= sign_1; // @[FloatingPointDesigns.scala 1537:19]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_1_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_1_0 <= sign_reg_0_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_1_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_1_1 <= sign_reg_0_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_2_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_2_0 <= sign_reg_1_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_2_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_2_1 <= sign_reg_1_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_3_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_3_0 <= sign_reg_2_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_3_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_3_1 <= sign_reg_2_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_4_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_4_0 <= sign_reg_3_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_4_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_4_1 <= sign_reg_3_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_5_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_5_0 <= sign_reg_4_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_5_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_5_1 <= sign_reg_4_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_6_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_6_0 <= sign_reg_5_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_6_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_6_1 <= sign_reg_5_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_7_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_7_0 <= sign_reg_6_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_7_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_7_1 <= sign_reg_6_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_8_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_8_0 <= sign_reg_7_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_8_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_8_1 <= sign_reg_7_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_9_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_9_0 <= sign_reg_8_0; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_9_1 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_9_1 <= sign_reg_8_1; // @[FloatingPointDesigns.scala 1570:23]
    end
    if (reset) begin // @[FloatingPointDesigns.scala 1418:28]
      sign_reg_10_0 <= 1'h0; // @[FloatingPointDesigns.scala 1418:28]
    end else if (io_in_en) begin // @[FloatingPointDesigns.scala 1533:19]
      sign_reg_10_0 <= sign_reg_9_0; // @[FloatingPointDesigns.scala 1570:23]
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
      frac_reg_0_0 <= frac_0; // @[FloatingPointDesigns.scala 1539:19]
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
      wfrac_reg_0_0 <= whole_frac_0; // @[FloatingPointDesigns.scala 1540:20]
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
      if (subber_out_c_reg_1) begin // @[FloatingPointDesigns.scala 1476:39]
        ref_s_reg_0 <= sign_reg_2_1; // @[FloatingPointDesigns.scala 1479:13]
      end else begin
        ref_s_reg_0 <= sign_reg_2_0; // @[FloatingPointDesigns.scala 1486:13]
      end
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
    new_out_frac_reg_0 <= _GEN_170[22:0]; // @[FloatingPointDesigns.scala 1437:{35,35}]
    new_out_exp_reg_0 <= _GEN_171[7:0]; // @[FloatingPointDesigns.scala 1438:{35,35}]
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
      io_in_a_reg_0 <= io_in_a; // @[FloatingPointDesigns.scala 1534:22]
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
  sign_reg_0_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sign_reg_0_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  sign_reg_1_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sign_reg_1_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  sign_reg_2_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  sign_reg_2_1 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  sign_reg_3_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  sign_reg_3_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sign_reg_4_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sign_reg_4_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  sign_reg_5_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  sign_reg_5_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  sign_reg_6_0 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  sign_reg_6_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  sign_reg_7_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  sign_reg_7_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  sign_reg_8_0 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  sign_reg_8_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  sign_reg_9_0 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  sign_reg_9_1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  sign_reg_10_0 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  sign_reg_10_1 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exp_reg_0_0 = _RAND_22[7:0];
  _RAND_23 = {1{`RANDOM}};
  exp_reg_0_1 = _RAND_23[7:0];
  _RAND_24 = {1{`RANDOM}};
  exp_reg_1_0 = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  exp_reg_1_1 = _RAND_25[7:0];
  _RAND_26 = {1{`RANDOM}};
  exp_reg_2_0 = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  exp_reg_2_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  frac_reg_0_0 = _RAND_28[22:0];
  _RAND_29 = {1{`RANDOM}};
  frac_reg_0_1 = _RAND_29[22:0];
  _RAND_30 = {1{`RANDOM}};
  frac_reg_1_0 = _RAND_30[22:0];
  _RAND_31 = {1{`RANDOM}};
  frac_reg_1_1 = _RAND_31[22:0];
  _RAND_32 = {1{`RANDOM}};
  frac_reg_2_0 = _RAND_32[22:0];
  _RAND_33 = {1{`RANDOM}};
  frac_reg_2_1 = _RAND_33[22:0];
  _RAND_34 = {1{`RANDOM}};
  wfrac_reg_0_0 = _RAND_34[23:0];
  _RAND_35 = {1{`RANDOM}};
  wfrac_reg_0_1 = _RAND_35[23:0];
  _RAND_36 = {1{`RANDOM}};
  wfrac_reg_1_0 = _RAND_36[23:0];
  _RAND_37 = {1{`RANDOM}};
  wfrac_reg_1_1 = _RAND_37[23:0];
  _RAND_38 = {1{`RANDOM}};
  wfrac_reg_2_0 = _RAND_38[23:0];
  _RAND_39 = {1{`RANDOM}};
  wfrac_reg_2_1 = _RAND_39[23:0];
  _RAND_40 = {1{`RANDOM}};
  subber_out_s_reg_0 = _RAND_40[7:0];
  _RAND_41 = {1{`RANDOM}};
  subber_out_s_reg_1 = _RAND_41[7:0];
  _RAND_42 = {1{`RANDOM}};
  subber_out_c_reg_0 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  subber_out_c_reg_1 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_0 = _RAND_44[23:0];
  _RAND_45 = {1{`RANDOM}};
  wire_temp_add_in_reg_0_1 = _RAND_45[23:0];
  _RAND_46 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_0 = _RAND_46[23:0];
  _RAND_47 = {1{`RANDOM}};
  wire_temp_add_in_reg_1_1 = _RAND_47[23:0];
  _RAND_48 = {1{`RANDOM}};
  ref_s_reg_0 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  ref_s_reg_1 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  ref_s_reg_2 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  ref_s_reg_3 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  ref_s_reg_4 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  ref_s_reg_5 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  ref_s_reg_6 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  ref_s_reg_7 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  ref_frac_reg_0 = _RAND_56[22:0];
  _RAND_57 = {1{`RANDOM}};
  ref_frac_reg_1 = _RAND_57[22:0];
  _RAND_58 = {1{`RANDOM}};
  ref_frac_reg_2 = _RAND_58[22:0];
  _RAND_59 = {1{`RANDOM}};
  ref_frac_reg_3 = _RAND_59[22:0];
  _RAND_60 = {1{`RANDOM}};
  ref_frac_reg_4 = _RAND_60[22:0];
  _RAND_61 = {1{`RANDOM}};
  ref_frac_reg_5 = _RAND_61[22:0];
  _RAND_62 = {1{`RANDOM}};
  ref_frac_reg_6 = _RAND_62[22:0];
  _RAND_63 = {1{`RANDOM}};
  ref_frac_reg_7 = _RAND_63[22:0];
  _RAND_64 = {1{`RANDOM}};
  ref_exp_reg_0 = _RAND_64[7:0];
  _RAND_65 = {1{`RANDOM}};
  ref_exp_reg_1 = _RAND_65[7:0];
  _RAND_66 = {1{`RANDOM}};
  ref_exp_reg_2 = _RAND_66[7:0];
  _RAND_67 = {1{`RANDOM}};
  ref_exp_reg_3 = _RAND_67[7:0];
  _RAND_68 = {1{`RANDOM}};
  ref_exp_reg_4 = _RAND_68[7:0];
  _RAND_69 = {1{`RANDOM}};
  ref_exp_reg_5 = _RAND_69[7:0];
  _RAND_70 = {1{`RANDOM}};
  ref_exp_reg_6 = _RAND_70[7:0];
  _RAND_71 = {1{`RANDOM}};
  ref_exp_reg_7 = _RAND_71[7:0];
  _RAND_72 = {1{`RANDOM}};
  sub_exp_reg_0 = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  sub_exp_reg_1 = _RAND_73[7:0];
  _RAND_74 = {1{`RANDOM}};
  sub_exp_reg_2 = _RAND_74[7:0];
  _RAND_75 = {1{`RANDOM}};
  sub_exp_reg_3 = _RAND_75[7:0];
  _RAND_76 = {1{`RANDOM}};
  sub_exp_reg_4 = _RAND_76[7:0];
  _RAND_77 = {1{`RANDOM}};
  sub_exp_reg_5 = _RAND_77[7:0];
  _RAND_78 = {1{`RANDOM}};
  sub_exp_reg_6 = _RAND_78[7:0];
  _RAND_79 = {1{`RANDOM}};
  sub_exp_reg_7 = _RAND_79[7:0];
  _RAND_80 = {1{`RANDOM}};
  adder_io_out_s_reg_0 = _RAND_80[23:0];
  _RAND_81 = {1{`RANDOM}};
  adder_io_out_s_reg_1 = _RAND_81[23:0];
  _RAND_82 = {1{`RANDOM}};
  adder_io_out_s_reg_2 = _RAND_82[23:0];
  _RAND_83 = {1{`RANDOM}};
  adder_io_out_c_reg_0 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  new_s_reg_0 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  new_s_reg_1 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  new_s_reg_2 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  new_s_reg_3 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  new_s_reg_4 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  new_s_reg_5 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  new_out_frac_reg_0 = _RAND_90[22:0];
  _RAND_91 = {1{`RANDOM}};
  new_out_exp_reg_0 = _RAND_91[7:0];
  _RAND_92 = {1{`RANDOM}};
  E_reg_0 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  E_reg_1 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  E_reg_2 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  E_reg_3 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  E_reg_4 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  D_reg_0 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  D_reg_1 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  D_reg_2 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  D_reg_3 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  D_reg_4 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  adder_result_reg_0 = _RAND_102[23:0];
  _RAND_103 = {1{`RANDOM}};
  adder_result_reg_1 = _RAND_103[23:0];
  _RAND_104 = {1{`RANDOM}};
  adder_result_reg_2 = _RAND_104[23:0];
  _RAND_105 = {1{`RANDOM}};
  leadingOne_reg_0 = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  leadingOne_reg_1 = _RAND_106[5:0];
  _RAND_107 = {1{`RANDOM}};
  io_in_a_reg_0 = _RAND_107[31:0];
  _RAND_108 = {1{`RANDOM}};
  io_in_a_reg_1 = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  io_in_a_reg_2 = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  io_in_a_reg_3 = _RAND_110[31:0];
  _RAND_111 = {1{`RANDOM}};
  io_in_a_reg_4 = _RAND_111[31:0];
  _RAND_112 = {1{`RANDOM}};
  io_in_a_reg_5 = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  io_in_a_reg_6 = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  io_in_a_reg_7 = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  io_in_a_reg_8 = _RAND_115[31:0];
  _RAND_116 = {1{`RANDOM}};
  io_in_a_reg_9 = _RAND_116[31:0];
  _RAND_117 = {1{`RANDOM}};
  io_in_a_reg_10 = _RAND_117[31:0];
  _RAND_118 = {1{`RANDOM}};
  io_in_b_reg_0 = _RAND_118[31:0];
  _RAND_119 = {1{`RANDOM}};
  io_in_b_reg_1 = _RAND_119[31:0];
  _RAND_120 = {1{`RANDOM}};
  io_in_b_reg_2 = _RAND_120[31:0];
  _RAND_121 = {1{`RANDOM}};
  io_in_b_reg_3 = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  io_in_b_reg_4 = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  io_in_b_reg_5 = _RAND_123[31:0];
  _RAND_124 = {1{`RANDOM}};
  io_in_b_reg_6 = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  io_in_b_reg_7 = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  io_in_b_reg_8 = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  io_in_b_reg_9 = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  io_in_b_reg_10 = _RAND_128[31:0];
  _RAND_129 = {1{`RANDOM}};
  subber2_out_s_reg_0 = _RAND_129[7:0];
  _RAND_130 = {1{`RANDOM}};
  subber2_out_c_reg_0 = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  cmpl_subber_out_s_reg_0 = _RAND_131[7:0];
  _RAND_132 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_0 = _RAND_132[23:0];
  _RAND_133 = {1{`RANDOM}};
  cmpl_wire_temp_add_in_reg_0_1 = _RAND_133[23:0];
  _RAND_134 = {1{`RANDOM}};
  cmpl_adder_io_out_s_reg_0 = _RAND_134[23:0];
  _RAND_135 = {1{`RANDOM}};
  reg_out_s = _RAND_135[31:0];
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
  input  [31:0] io_in_a,
  input  [31:0] io_in_b,
  output [31:0] io_out_s
);
  wire  FP_adder_clock; // @[FloatingPointDesigns.scala 1654:26]
  wire  FP_adder_reset; // @[FloatingPointDesigns.scala 1654:26]
  wire  FP_adder_io_in_en; // @[FloatingPointDesigns.scala 1654:26]
  wire [31:0] FP_adder_io_in_a; // @[FloatingPointDesigns.scala 1654:26]
  wire [31:0] FP_adder_io_in_b; // @[FloatingPointDesigns.scala 1654:26]
  wire [31:0] FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1654:26]
  wire  _adjusted_in_b_T_1 = ~io_in_b[31]; // @[FloatingPointDesigns.scala 1657:23]
  FP_adder_13ccs FP_adder ( // @[FloatingPointDesigns.scala 1654:26]
    .clock(FP_adder_clock),
    .reset(FP_adder_reset),
    .io_in_en(FP_adder_io_in_en),
    .io_in_a(FP_adder_io_in_a),
    .io_in_b(FP_adder_io_in_b),
    .io_out_s(FP_adder_io_out_s)
  );
  assign io_out_s = FP_adder_io_out_s; // @[FloatingPointDesigns.scala 1661:14]
  assign FP_adder_clock = clock;
  assign FP_adder_reset = reset;
  assign FP_adder_io_in_en = io_in_en; // @[FloatingPointDesigns.scala 1658:23]
  assign FP_adder_io_in_a = io_in_a; // @[FloatingPointDesigns.scala 1659:22]
  assign FP_adder_io_in_b = {_adjusted_in_b_T_1,io_in_b[30:0]}; // @[FloatingPointDesigns.scala 1657:41]
endmodule

