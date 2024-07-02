package FP_Modules
import Binary_Modules.BinaryDesigns._
import chisel3._
import chisel3.util.{ShiftRegister, log2Floor}

import java.io.PrintWriter
import scala.collection.mutable

object FloatingPointDesigns {
  //-------------------- original floating point units ---------------------------------
  class FP_adder_13ccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    override def desiredName = s"FP_adder_bw${bw}"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }
    // sign part of ieee number
    val sign_wire = Wire(Vec(2, UInt(1.W)))
    sign_wire(0) := io.in_a(bw - 1)
    sign_wire(1) := io.in_b(bw - 1)
    val exp_wire = Wire(Vec(2, UInt(exponent.W)))

    when(io.in_a(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) { // largest normal exponent
      exp_wire(0) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_a(bw-2, mantissa) < 1.U){ // smallest normal exponent
      exp_wire(0) := 1.U
    }.otherwise {
      exp_wire(0) := io.in_a(bw - 2, mantissa)
    }
    when(io.in_b(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) {
      exp_wire(1) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_b(bw-2,mantissa) < 1.U){
      exp_wire(1) := 1.U
    }.otherwise {
      exp_wire(1) := io.in_b(bw - 2, mantissa)
    }

    val frac_wire = Wire(Vec(2, UInt(mantissa.W)))
    frac_wire(0) := io.in_a(mantissa - 1, 0)
    frac_wire(1) := io.in_b(mantissa - 1, 0)

    val whole_frac_wire = Wire(Vec(2, UInt((mantissa + 1).W)))
    whole_frac_wire(0) := 1.U ## frac_wire(0)
    whole_frac_wire(1) := 1.U ## frac_wire(1)

    val sign_reg = RegInit(VecInit.fill(11)(VecInit.fill(2)(0.U(1.W))))
    val exp_reg = RegInit(VecInit.fill(3)(VecInit.fill(2)(0.U(exponent.W))))
    val frac_reg = RegInit(VecInit.fill(3)(VecInit.fill(2)(0.U(mantissa.W))))
    val whole_frac_reg = RegInit(VecInit.fill(3)(VecInit.fill(2)(0.U((mantissa+1).W))))

    val exp_diff_out_sum_reg = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    val exp_diff_out_carry_reg = RegInit(VecInit.fill(2)(0.U(1.W)))

    val frac_adder_inp_reg = RegInit(VecInit.fill(2)(VecInit.fill(2)(0.U((mantissa+1).W))))

    val ref_sign_wire    = Wire(UInt(1.W))
    val ref_frac_wire = Wire(UInt(mantissa.W))
    val ref_exp_wire = Wire(UInt(exponent.W))
    val ref_exp_diff_wire = Wire(UInt(exponent.W))

    val ref_sign_reg = RegInit(VecInit.fill(8)(0.U(1.W)))
    val ref_frac_reg = RegInit(VecInit.fill(8)(0.U(mantissa.W)))
    val ref_exp_reg = RegInit(VecInit.fill(8)(0.U(exponent.W)))
    val ref_exp_diff_reg = RegInit(VecInit.fill(8)(0.U(exponent.W)))

    val frac_adder_out_sum_reg = RegInit(VecInit.fill(3)(0.U((mantissa+1).W)))
    val frac_adder_out_carry_reg = RegInit(VecInit.fill(1)(0.U(1.W)))

    val new_sign_wire = Wire(UInt(1.W))
    val new_frac_wire = Wire(UInt(mantissa.W))
    val new_exp_wire = Wire(UInt(exponent.W))

    val new_sign_reg = RegInit(VecInit.fill(6)(0.U(1.W)))
    val new_frac_reg = RegInit(VecInit.fill(1)(0.U(mantissa.W)))
    val new_exp_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))

    val noPostProcess_wire = Wire(UInt(1.W))
    val postProcessInstruction_wire = Wire(UInt(1.W))

    val noPostProcess_reg = RegInit(VecInit.fill(5)(0.U(1.W)))
    val postProcessInstruction_reg = RegInit(VecInit.fill(5)(0.U(1.W)))

    val ref_frac_adder_sum_reg = RegInit(VecInit.fill(3)(0.U((mantissa+1).W)))

    val leadingOne_reg = RegInit(VecInit.fill(2)(0.U((log2Floor(bw) + 1).W)))

    val input_a_reg = RegInit(VecInit.fill(11)(0.U(bw.W)))
    val input_b_reg = RegInit(VecInit.fill(11)(0.U(bw.W)))

    val postProcess_exp_diff_out_sum_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))
    val postProcess_exp_diff_out_carry_reg = RegInit(VecInit.fill(1)(0.U(1.W)))

    // computing exponent difference
    val exp_diff_subtractor = Module(new full_subtractor(exponent))
    exp_diff_subtractor.io.in_a := exp_reg(0)(0)
    exp_diff_subtractor.io.in_b := exp_reg(0)(1)
    exp_diff_subtractor.io.in_c := 0.U

    // add the fractional/mantissa parts of the ieee numbers together
    val frac_adder = Module(new full_adder(mantissa + 1))
    frac_adder.io.in_c := 0.U

    val frac_adder_inp_wire = Wire(Vec(2, UInt((mantissa+1).W)))

    val cmpl_subber_out_s_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))
    when(io.in_en){
      cmpl_subber_out_s_reg(0) := 1.U + ~exp_diff_out_sum_reg(0)
    }

    when(exp_diff_out_carry_reg(1) === 1.U) {
      ref_exp_wire := exp_reg(2)(1)
      ref_exp_diff_wire := cmpl_subber_out_s_reg(0)
      ref_sign_wire := sign_reg(2)(1)
      ref_frac_wire := frac_reg(2)(1)
      frac_adder_inp_wire(0) := whole_frac_reg(2)(0) >> cmpl_subber_out_s_reg(0)
      frac_adder_inp_wire(1) := whole_frac_reg(2)(1)
    }.otherwise {
      ref_exp_wire := exp_reg(2)(0)
      ref_exp_diff_wire := exp_diff_out_sum_reg(1)
      ref_sign_wire := sign_reg(2)(0)
      ref_frac_wire := frac_reg(2)(0)
      frac_adder_inp_wire(0) := whole_frac_reg(2)(0)
      frac_adder_inp_wire(1) := whole_frac_reg(2)(1) >> exp_diff_out_sum_reg(1)
    }

    val cmpl_frac_adder_inp_reg = RegInit(VecInit.fill(1)(VecInit.fill(2)(0.U((mantissa+1).W))))
    when(io.in_en){
      cmpl_frac_adder_inp_reg(0)(0) := 1.U + ~(frac_adder_inp_reg(0)(0))
      cmpl_frac_adder_inp_reg(0)(1) := 1.U + ~(frac_adder_inp_reg(0)(1))
    }

    frac_adder.io.in_a := Mux(sign_reg(4).asUInt === 1.U, cmpl_frac_adder_inp_reg(0)(0), frac_adder_inp_reg(1)(0))
    frac_adder.io.in_b := Mux(sign_reg(4).asUInt === 2.U, cmpl_frac_adder_inp_reg(0)(1), frac_adder_inp_reg(1)(1))

    new_sign_wire := (~frac_adder_out_carry_reg(0) & (sign_reg(5)(0) | sign_reg(5)(1))) | (sign_reg(5)(0) & sign_reg(5)(1))
    new_exp_wire := 0.U
    new_frac_wire := 0.U

    noPostProcess_wire := (~frac_adder_out_carry_reg(0) & ~frac_adder_out_sum_reg(0)(mantissa)) | (~frac_adder_out_carry_reg(0) & ~(sign_reg(5)(0) ^ sign_reg(5)(1))) | (frac_adder_out_carry_reg(0) & frac_adder_out_sum_reg(0)(mantissa) & (sign_reg(5)(0) ^ sign_reg(5)(1)))
    postProcessInstruction_wire := (~frac_adder_out_carry_reg(0)) | (sign_reg(5)(0) ^ sign_reg(5)(1))

    val cmpl_frac_adder_out_sum_reg = RegInit(VecInit.fill(1)(0.U((mantissa+1).W)))
    when(io.in_en){
      cmpl_frac_adder_out_sum_reg(0) := 1.U + ~frac_adder_out_sum_reg(1)
    }

    val ref_frac_adder_sum_wire = Wire(UInt((mantissa + 1).W))
    ref_frac_adder_sum_wire := Mux((new_sign_reg(1) & sign_reg(7).asUInt.xorR).asBool, cmpl_frac_adder_out_sum_reg(0), frac_adder_out_sum_reg(2))

    val leadingOne_wire = Wire(UInt((log2Floor(bw) + 1).W))
    leadingOne_wire := VecInit(ref_frac_adder_sum_reg(0).asBools).lastIndexWhere(x=>x) +& 1.U
    val postProcess_exp_diff_subtractor = Module(new full_subtractor(exponent))
    postProcess_exp_diff_subtractor.io.in_a := ref_exp_reg(6)
    postProcess_exp_diff_subtractor.io.in_b := ((mantissa + 1).U - leadingOne_reg(0))
    postProcess_exp_diff_subtractor.io.in_c := 0.U

    when(io.in_en){
      input_a_reg(0) := io.in_a
      input_b_reg(0) := io.in_b
      sign_reg(0) := sign_wire
      exp_reg(0) := exp_wire
      frac_reg(0) := frac_wire
      whole_frac_reg(0) := whole_frac_wire
      exp_diff_out_sum_reg(0) := exp_diff_subtractor.io.out_s
      exp_diff_out_carry_reg(0) := exp_diff_subtractor.io.out_c
      ref_sign_reg(0) := ref_sign_wire
      ref_frac_reg(0) := ref_frac_wire
      ref_exp_reg(0) := ref_exp_wire
      ref_exp_diff_reg(0) := ref_exp_diff_wire
      frac_adder_inp_reg(0) := frac_adder_inp_wire
      new_sign_reg(0) := new_sign_wire
      noPostProcess_reg(0) := noPostProcess_wire
      postProcessInstruction_reg(0) := postProcessInstruction_wire
      frac_adder_out_sum_reg(0) := frac_adder.io.out_s
      frac_adder_out_carry_reg(0) := frac_adder.io.out_c
      ref_frac_adder_sum_reg(0) := ref_frac_adder_sum_wire
      leadingOne_reg(0) := leadingOne_wire
      postProcess_exp_diff_out_sum_reg(0) := postProcess_exp_diff_subtractor.io.out_s
      postProcess_exp_diff_out_carry_reg(0) := postProcess_exp_diff_subtractor.io.out_c
      for(i <- 1 until 11 ){
        if(i < 11){
          sign_reg(i) := sign_reg(i-1)
          input_a_reg(i) := input_a_reg(i-1)
          input_b_reg(i) := input_b_reg(i-1)
        }
        if(i < 8){
          ref_sign_reg(i) := ref_sign_reg(i-1)
          ref_frac_reg(i) := ref_frac_reg(i-1)
          ref_exp_reg(i) := ref_exp_reg(i-1)
          ref_exp_diff_reg(i) := ref_exp_diff_reg(i-1)
        }
        if(i < 5){
          noPostProcess_reg(i) := noPostProcess_reg(i-1)
          postProcessInstruction_reg(i) := postProcessInstruction_reg(i-1)
          new_sign_reg(i) := new_sign_reg(i-1)
        }
        if(i < 3){
          ref_frac_adder_sum_reg(i) := ref_frac_adder_sum_reg(i-1)
          frac_adder_out_sum_reg(i) := frac_adder_out_sum_reg(i-1)
          exp_reg(i) := exp_reg(i-1)
          frac_reg(i) := frac_reg(i-1)
          whole_frac_reg(i) := whole_frac_reg(i-1)
        }
        if(i < 2){
          exp_diff_out_sum_reg(i) := exp_diff_out_sum_reg(i-1)
          exp_diff_out_carry_reg(i) := exp_diff_out_carry_reg(i-1)
          leadingOne_reg(i) := leadingOne_reg(i-1)
          frac_adder_inp_reg(i) := frac_adder_inp_reg(i-1)
        }
      }
    }
    val output_sum_reg = RegInit(0.U(bw.W))
    io.out_s := output_sum_reg
    when(io.in_en) {
      when(input_a_reg(10)(bw - 2, 0) === 0.U && input_b_reg(10)(bw - 2, 0) === 0.U) {
        new_sign_reg(5) := 0.U
        new_exp_reg(0) := 0.U
        new_frac_reg(0) := 0.U
      }.elsewhen(ref_exp_diff_reg(7) >= mantissa.U) { // if the difference between the exponents is too large, larger than mantissa size.
        new_sign_reg(5) := ref_sign_reg(7)
        new_frac_reg(0) := ref_frac_reg(7)
        new_exp_reg(0) := ref_exp_reg(7)
      }.elsewhen(noPostProcess_reg(4) === 1.U) { // if the exponent should stay the same size as the largest exponent
        new_sign_reg(5) := new_sign_reg(4)
        new_exp_reg(0) := ref_exp_reg(7)
        new_frac_reg(0) := ref_frac_adder_sum_reg(2)(mantissa - 1, 0)
      }.elsewhen(postProcessInstruction_reg(4) === 0.U) { // if exponent needs to be increased by 1
        new_sign_reg(5) := new_sign_reg(4)
        when(ref_exp_reg(7) === BigInt(2).pow(exponent).U - 2.U) { // accounting for overflows
          new_exp_reg(0) := BigInt(2).pow(exponent).U - 2.U
          new_frac_reg(0) := BigInt(2).pow(mantissa).U - 1.U
        }.otherwise {
          new_exp_reg(0) := ref_exp_reg(7) + 1.U
          new_frac_reg(0) := ref_frac_adder_sum_reg(2)(mantissa, 1)
        }
      }.elsewhen(postProcessInstruction_reg(4) === 1.U) { // if exponent needs to be decreased by 1 or more
        new_sign_reg(5) := new_sign_reg(4)
        when(leadingOne_reg(1) === 1.U && ref_frac_adder_sum_reg(2) === 0.U && ((1.U === (sign_reg(10)(0) ^ sign_reg(10)(1)) && input_a_reg(10)(bw - 2, 0) === input_b_reg(10)(bw - 2, 0)))) {
          new_exp_reg(0) := 0.U
          new_frac_reg(0) := 0.U
        }.otherwise {
          when(postProcess_exp_diff_out_carry_reg(0) === 1.U) { // accounting for underflows
            new_exp_reg(0) := 1.U(exponent.W)
            new_frac_reg(0) := 0.U
          }.otherwise {
            new_exp_reg(0) := postProcess_exp_diff_out_sum_reg(0)
            new_frac_reg(0) := ref_frac_adder_sum_reg(2)(mantissa - 1, 0) << ((mantissa + 1).U - leadingOne_reg(1))
          }
        }
      }
      output_sum_reg := new_sign_reg(5) ## new_exp_reg(0) ## new_frac_reg(0)
    }

  }

  class FP_subtractor_13ccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    override def desiredName = s"FP_subtractor_bw${bw}"
    val FP_adder = Module(new FP_adder_13ccs(bw))
    val adjusted_in_b = WireInit(0.U(bw.W))
    adjusted_in_b := (~io.in_b(bw - 1)) ## io.in_b(bw - 2, 0)
    FP_adder.io.in_en := io.in_en
    FP_adder.io.in_a := io.in_a
    FP_adder.io.in_b := adjusted_in_b
    io.out_s := FP_adder.io.out_s
  }

  class FP_multiplier_10ccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    override def desiredName = s"FP_multiplier_bw${bw}"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }
    // get the sign bit of the two inptus
    val sign_wire = Wire(Vec(2, UInt(1.W)))
    sign_wire(0) := io.in_a(bw - 1)
    sign_wire(1) := io.in_b(bw - 1)

    // get the exponents of the two inputs
    val exp_wire = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) {
      exp_wire(0) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_a(bw-2,mantissa) < 1.U){
      exp_wire(0) := 1.U
    }.otherwise {
      exp_wire(0) := io.in_a(bw - 2, mantissa)
    }
    when(io.in_b(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) {
      exp_wire(1) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_b(bw-2,mantissa) < 1.U){
      exp_wire(1) := 1.U
    }.otherwise {
      exp_wire(1) := io.in_b(bw - 2, mantissa)
    }

    // get the mantissa parts of the two inputs
    val frac_wire = Wire(Vec(2, UInt(mantissa.W)))
    frac_wire(0) := io.in_a(mantissa - 1, 0)
    frac_wire(1) := io.in_b(mantissa - 1, 0)

    // 1.0 + mantissa part of the two numbers
    val whole_frac_wire = Wire(Vec(2, UInt((mantissa + 1).W)))
    whole_frac_wire(0) := 1.U ## frac_wire(0)
    whole_frac_wire(1) := 1.U ## frac_wire(1)

    val sign_reg = RegInit(VecInit.fill(5)(VecInit.fill(2)(0.U(1.W))))
    val exp_reg = RegInit(VecInit.fill(9)(VecInit.fill(2)(0.U(exponent.W))))
    val whole_frac_reg = RegInit(VecInit.fill(2)(VecInit.fill(2)(0.U((mantissa+1).W))))

    val frac_multiplier = Module(new multiplier(mantissa + 1))
    frac_multiplier.io.in_a := whole_frac_reg(1)(0)
    frac_multiplier.io.in_b := whole_frac_reg(1)(1)

    val frac_multiplier_out_reg = RegInit(VecInit.fill(6)(0.U(((mantissa+1)*2).W)))

    // subtract exponent value of the second input from the bias value
    val postProcess_exp_subtractor = Module(new full_subtractor(exponent))
    postProcess_exp_subtractor.io.in_a := (BigInt(2).pow(exponent - 1) - 1).U // the bias
    postProcess_exp_subtractor.io.in_b := exp_reg(2)(1) // the second input
    postProcess_exp_subtractor.io.in_c := 0.U

    val postProcess_exp_sub_out_sum_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))
    val postProcess_exp_sub_out_carry_reg = RegInit(VecInit.fill(1)(0.U(1.W)))

    // will take twoscomplement of subtraction result
    val postProcess_cmpl = Module(new twoscomplement(exponent))
    postProcess_cmpl.io.in := postProcess_exp_sub_out_sum_reg(0)

    val postProcess_cmpl_out_reg = RegInit(VecInit.fill(3)(0.U(exponent.W)))

    val new_sign_wire = Wire(UInt(1.W))
    new_sign_wire := sign_reg(4)(0) ^ sign_reg(4)(1)

    val new_sign_reg = RegInit(VecInit.fill(4)(0.U(1.W)))

    val postProcessInstruction_wire = Wire(Bool())
    postProcessInstruction_wire :=  exp_reg(5)(1) < (BigInt(2).pow(exponent-1) - 1).U

    val postProcessInstruction_reg = RegInit(VecInit.fill(2)(false.B))


    // will add the twoscomplement result to the first input exponent
    val postProcess_exp_adder = Module(new full_adder(exponent))
    postProcess_exp_adder.io.in_c := 0.U

    when(frac_multiplier_out_reg(4)(((mantissa + 1) * 2) - 1) === 1.U) {
      postProcess_exp_adder.io.in_a := exp_reg(6)(0) + 1.U
      postProcess_exp_adder.io.in_b := postProcess_cmpl_out_reg(2)
    }.otherwise {
      postProcess_exp_adder.io.in_a := exp_reg(6)(0)
      postProcess_exp_adder.io.in_b := postProcess_cmpl_out_reg(2)
    }

    val postProcess_exp_adder_out_sum_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))
    val postProcess_exp_adder_out_carry_reg = RegInit(VecInit.fill(1)(0.U(1.W)))

    val new_exp_reg = RegInit(VecInit.fill(1)(0.U(exponent.W)))
    val new_frac_reg = RegInit(VecInit.fill(1)(0.U(mantissa.W)))

    val output_result_reg = RegInit(0.U(bw.W))

    when(io.in_en){
      new_exp_reg(0) := Mux(postProcessInstruction_reg(1), Mux(!postProcess_exp_adder_out_carry_reg(0).asBool, 1.U, postProcess_exp_adder_out_sum_reg(0)), Mux(postProcess_exp_adder_out_carry_reg(0).asBool || postProcess_exp_adder_out_sum_reg(0) > (BigInt(2).pow(exponent) - 2).U, (BigInt(2).pow(exponent) - 2).U, postProcess_exp_adder_out_sum_reg(0)))
      when(frac_multiplier_out_reg(5)(((mantissa + 1) * 2) - 1) === 1.U) {
        new_frac_reg(0) := Mux(postProcessInstruction_reg(1), Mux(!postProcess_exp_adder_out_carry_reg(0).asBool, 0.U, frac_multiplier_out_reg(5)(((mantissa + 1) * 2) - 2, mantissa + 1)), Mux(postProcess_exp_adder_out_carry_reg(0).asBool || postProcess_exp_adder_out_sum_reg(0) > (BigInt(2).pow(exponent) - 2).U, (BigInt(2).pow(mantissa) - 1).U, frac_multiplier_out_reg(5)(((mantissa + 1) * 2) - 2, mantissa + 1)))
      }.otherwise {
        new_frac_reg(0) := Mux(postProcessInstruction_reg(1), Mux(!postProcess_exp_adder_out_carry_reg(0).asBool, 0.U, frac_multiplier_out_reg(5)(((mantissa + 1) * 2) - 3, mantissa)), Mux(postProcess_exp_adder_out_carry_reg(0).asBool || postProcess_exp_adder_out_sum_reg(0) > (BigInt(2).pow(exponent) - 2).U, (BigInt(2).pow(mantissa) - 1).U, frac_multiplier_out_reg(5)(((mantissa + 1) * 2) - 3, mantissa)))
      }
      sign_reg(0) := sign_wire
      exp_reg(0) := exp_wire
      whole_frac_reg(0) := whole_frac_wire
      frac_multiplier_out_reg(0) := frac_multiplier.io.out_s
      postProcess_exp_sub_out_sum_reg(0) := postProcess_exp_subtractor.io.out_s
      postProcess_exp_sub_out_carry_reg(0) := postProcess_exp_subtractor.io.out_c
      postProcess_cmpl_out_reg(0) := postProcess_cmpl.io.out
      new_sign_reg(0) := new_sign_wire
      postProcessInstruction_reg(0) := postProcessInstruction_wire
      postProcess_exp_adder_out_sum_reg(0) := postProcess_exp_adder.io.out_s
      postProcess_exp_adder_out_carry_reg(0) := postProcess_exp_adder.io.out_c
      for(i <- 1 until 9){
        exp_reg(i) := exp_reg(i-1)
        if(i < 6){
          frac_multiplier_out_reg(i) := frac_multiplier_out_reg(i-1)
          if(i < 5){
            sign_reg(i) := sign_reg(i-1)
            if(i < 4){
              new_sign_reg(i) := new_sign_reg(i-1)
              if(i < 3){
                postProcess_cmpl_out_reg(i) := postProcess_cmpl_out_reg(i-1)
                if(i <2){
                  whole_frac_reg(i) := whole_frac_reg(i-1)
                  postProcessInstruction_reg(i) := postProcessInstruction_reg(i-1)
                }
              }
            }
          }
        }
      }
      when(exp_reg(8)(0) === 0.U || exp_reg(8)(1) === 0.U) {
        output_result_reg := 0.U
      }.otherwise {
        output_result_reg := new_sign_reg(3) ## new_exp_reg(0) ## new_frac_reg(0)
      }
    }
    io.out_s := output_result_reg
  }



  // ------------------------ Newer versions of adders,dividers, and multipliers (still experimental)-------------------------------
  // - reimplemented logic for overflows/underflow handling, so might not be perfect
  // I used the following strategies for vivado synthesis: (Synth Strategy = perfthresholdcarry, Impl Strategy = Netdelay_low)

  // Digit recurrence based division (cycles equivalent to bw) - 430 Mhz
  // 25 cycles for single precision
  class FP_div_bwccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_divider_bw${bw}"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }
    val max_exp = (BigInt(2).pow(exponent) - 2).U(exponent.W)
    val min_exp = 1.U(exponent.W)
    val max_frac = (BigInt(2).pow(mantissa) - 1).U(mantissa.W)
    val min_frac = 0.U(mantissa.W)
    val bias = (BigInt(2).pow(exponent - 1) - 1).U(exponent.W)
    // get the sign bit of the two inptus
    val sign_wire = Wire(Vec(2, UInt(1.W)))
    sign_wire(0) := io.in_a(bw - 1)
    sign_wire(1) := io.in_b(bw - 1)

    // get the exponents of the two inputs
    val exp_wire = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw - 2, mantissa) > max_exp) {
      exp_wire(0) := max_exp
    }.elsewhen(io.in_a(bw-2,mantissa) < min_exp){ // saturating inputs
      exp_wire(0) := min_exp
    }.otherwise {
      exp_wire(0) := io.in_a(bw - 2, mantissa)
    }
    when(io.in_b(bw - 2, mantissa) > max_exp) {
      exp_wire(1) := max_exp
    }.elsewhen(io.in_b(bw-2,mantissa) < min_exp){
      exp_wire(1) := min_exp
    }.otherwise {
      exp_wire(1) := io.in_b(bw - 2, mantissa)
    }

    // get the mantissa parts of the two inputs
    val frac_wire = Wire(Vec(2, UInt(mantissa.W)))
    frac_wire(0) := io.in_a(mantissa - 1, 0)
    frac_wire(1) := io.in_b(mantissa - 1, 0)

    // 1.0 + mantissa part of the two numbers
    val whole_frac_wire = Wire(Vec(2, UInt((mantissa + 1).W)))
    whole_frac_wire(0) := 1.U ## frac_wire(0)
    whole_frac_wire(1) := 1.U ## frac_wire(1)

    val new_sign_wire = Wire(UInt(1.W))
    new_sign_wire := sign_wire(0) ^ sign_wire(1)

    // subtract exponent value of the second input from the bias value
    val postProcess_exp_subtractor = Module(new full_subtractor(exponent))
    postProcess_exp_subtractor.io.in_a := exp_wire(0) // the bias
    postProcess_exp_subtractor.io.in_b := exp_wire(1) - bias // the second input
    postProcess_exp_subtractor.io.in_c := 0.U

    val frac_divider = Module(new frac_div((mantissa + 2))).io
    frac_divider.in_ready := io.in_en
    frac_divider.in_reset := false.B
    frac_divider.in_valid := io.in_valid
    frac_divider.in_a := whole_frac_wire(0) ## (0.U((1).W))
    frac_divider.in_b := whole_frac_wire(1) ## (0.U((1).W))

    val uo_check = ShiftRegister(exp_wire(1) < bias, mantissa + 2, io.in_en) //  if yes means we add to exp(0) else we do reg subtraction
    val carry_flag = ShiftRegister(postProcess_exp_subtractor.io.out_c.asBool, mantissa + 2, io.in_en) // if(y0check) then lookout for cflag low implies overflow, else cflag high implies underflow
    val msb_check = frac_divider.out_s((mantissa + 1))
    val exp_sum = ShiftRegister(postProcess_exp_subtractor.io.out_s, mantissa + 2, io.in_en)

    val new_sign_reg = ShiftRegister(new_sign_wire,mantissa + 2,io.in_en)


    val u_flag_reg = Mux(uo_check,!carry_flag || ((exp_sum -& (!msb_check).asUInt) > max_exp), false.B) // if true, overflow detected
    val o_flag_reg = Mux(!uo_check,carry_flag || ((exp_sum -& (!msb_check).asUInt) < min_exp), false.B) // if true, underflow detected
    val new_exp_reg = exp_sum
    val new_frac_reg = frac_divider.out_s

    io.out_valid := frac_divider.out_valid
    val out_sign = new_sign_reg
    val out_exp = Mux(u_flag_reg, max_exp, Mux(o_flag_reg, min_exp, Mux(msb_check, new_exp_reg, new_exp_reg - 1.U)))
    val out_frac = Mux(u_flag_reg, max_frac, Mux(o_flag_reg, min_frac,Mux(msb_check, new_frac_reg(mantissa, 1), new_frac_reg((mantissa - 1), 0))))
    io.out_s := out_sign ## out_exp ## out_frac
  }


  // digit recurrence based fp square root - 470 MHz
  // 23 cycles for single precision
  class FP_sqrt_bwccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_sqrt_bw${bw}"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }
    val bias = (BigInt(2).pow(exponent - 1) - 1).U(exponent.W)
    val sign = io.in_a(bw - 1)
    val exp = io.in_a(bw-2, mantissa) -& bias
    val frac = 1.U(2.W) ## io.in_a(mantissa - 1, 0)

    //    printf(p"sign: ${sign}\n")
    //    printf(p"exp: ${exp}\n")
    //    printf(p"frac: ${frac}\n")

    val ref_exp = Mux(exp(exponent).asBool,((~exp(exponent-1,0)).asUInt + 1.U), exp(exponent-1,0))
    val exp_new = Mux(ref_exp(0).asBool,(ref_exp - 1.U) >> 1, ref_exp >> 1).asUInt

    val ref_frac = Mux(ref_exp(0).asBool, frac << 1, frac).asUInt

    val fsqrt = Module(new frac_sqrt(mantissa)).io
    fsqrt.in_en := io.in_en
    fsqrt.in_valid := io.in_valid
    fsqrt.in_a := ref_frac

    val out_sign = ShiftRegister(sign, mantissa, io.in_en)
    val out_exp = ShiftRegister(exp_new, mantissa, io.in_en) + bias
    val out_frac = fsqrt.out_s

    io.out_valid := fsqrt.out_valid
    io.out_s := out_sign ## out_exp(exponent - 1, 0) ## out_frac
  }

  // Low cycle multiplier - 340 MHz MOF (with DSP enabled)
  // 3 cycles
  class FP_mult_3ccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_multiplier_bw${bw}_v3"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }

    val sign_wire = Wire(Vec(2, UInt(1.W)))
    sign_wire(0) := io.in_a(bw - 1)
    sign_wire(1) := io.in_b(bw - 1)

    val max_exp = (BigInt(2).pow(exponent) - 2).U(exponent.W)
    val min_exp = 1.U(exponent.W)
    val max_frac = (BigInt(2).pow(mantissa) - 1).U(mantissa.W)
    val min_frac = 0.U(mantissa.W)
    val bias = (BigInt(2).pow(exponent - 1) - 1).U(exponent.W)

    // get the exponents of the two inputs
    val exp_wire = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw - 2, mantissa) > max_exp) {
      exp_wire(0) := max_exp
    }.elsewhen(io.in_a(bw-2,mantissa) < min_exp){ // saturating inputs
      exp_wire(0) := min_exp
    }.otherwise {
      exp_wire(0) := io.in_a(bw - 2, mantissa)
    }
    when(io.in_b(bw - 2, mantissa) > max_exp) {
      exp_wire(1) := max_exp
    }.elsewhen(io.in_b(bw-2,mantissa) < min_exp){
      exp_wire(1) := min_exp
    }.otherwise {
      exp_wire(1) := io.in_b(bw - 2, mantissa)
    }

    // get the mantissa parts of the two inputs
    val frac_wire = Wire(Vec(2, UInt(mantissa.W)))
    frac_wire(0) := io.in_a(mantissa - 1, 0)
    frac_wire(1) := io.in_b(mantissa - 1, 0)

    // 1.0 + mantissa part of the two numbers
    val whole_frac_wire = Wire(Vec(2, UInt((mantissa + 1).W)))
    whole_frac_wire(0) := 1.U ## frac_wire(0)
    whole_frac_wire(1) := 1.U ## frac_wire(1)

    val new_sign_wire = Wire(UInt(1.W))
    new_sign_wire := sign_wire(0) ^ sign_wire(1)

    // subtract exponent value of the second input from the bias value
    val postProcess_exp_subtractor = Module(new full_adder(exponent))
    postProcess_exp_subtractor.io.in_a := exp_wire(0) // the bias
    postProcess_exp_subtractor.io.in_b := exp_wire(1) - bias // the second input
    postProcess_exp_subtractor.io.in_c := 0.U

    val frac_multiplier = Module(new multiplier((mantissa + 1))).io
    frac_multiplier.in_a := ShiftRegister(whole_frac_wire(0), 1, io.in_en)
    frac_multiplier.in_b := ShiftRegister(whole_frac_wire(1), 1, io.in_en)
    val uo_check = ShiftRegister(exp_wire(1),2, io.in_en) < bias
    val carry_flag = ShiftRegister(postProcess_exp_subtractor.io.out_c.asBool, 2, io.in_en)
    val msb_check = ShiftRegister(frac_multiplier.out_s((mantissa + 1) * 2 - 1),1,io.in_en)
    val exp_sum = ShiftRegister(postProcess_exp_subtractor.io.out_s, 2, io.in_en)

    val u_flag_reg = ShiftRegister(Mux(uo_check,!carry_flag || ((exp_sum +& msb_check.asUInt) < min_exp), false.B), 0, io.in_en) // if true, underflow detected
    val o_flag_reg = ShiftRegister(Mux(!uo_check,carry_flag || ((exp_sum +& msb_check.asUInt) > max_exp), false.B), 0, io.in_en) // if true, overflow detected
    val new_sign_reg = ShiftRegister(new_sign_wire,2,io.in_en)
    val new_exp_reg = ShiftRegister(exp_sum,0,io.in_en)
    val new_frac_reg = ShiftRegister(frac_multiplier.out_s,1,io.in_en)

    io.out_valid := ShiftRegister(io.in_valid, 3, io.in_en)
    val out_sign = new_sign_reg
    val out_exp = Mux(u_flag_reg, min_exp, Mux(o_flag_reg, max_exp, Mux(new_frac_reg((mantissa + 1) * 2 - 1).asBool, new_exp_reg + 1.U, new_exp_reg)))
    val out_frac = Mux(u_flag_reg, min_frac, Mux(o_flag_reg, max_frac,Mux(new_frac_reg((mantissa + 1) * 2 - 1).asBool, new_frac_reg((mantissa + 1) * 2 - 2, mantissa + 1), new_frac_reg((mantissa + 1) * 2 - 3, mantissa))))
    io.out_s := ShiftRegister(out_sign ## out_exp ## out_frac,1,io.in_en)
  }

  // Low cycle adder (I seem to get comparable MOF to my original 13 cycle adder) - 370 MHz
  class FP_add_3ccs(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_adder_bw${bw}_v2"
    val (exponent, mantissa) = bw match {
      case 16 => (5,10)
      case 32 => (8,23)
      case 64 => (11,52)
      case 128 => (15,112)
    }
    val max_exp = (BigInt(2).pow(exponent) - 2).U(exponent.W)
    val min_exp = 1.U(exponent.W)
    val max_frac = (BigInt(2).pow(mantissa) - 1).U(mantissa.W)
    val min_frac = 0.U(mantissa.W)

    // get the sign bit of the two inptus
    val sign_wire = Wire(Vec(2, UInt(1.W)))
    sign_wire(0) := io.in_a(bw - 1)
    sign_wire(1) := io.in_b(bw - 1)

    // get the exponents of the two inputs
    val exp_wire = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) {
      exp_wire(0) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_a(bw-2,mantissa) < 1.U){ // saturating inputs
      exp_wire(0) := 1.U
    }.otherwise {
      exp_wire(0) := io.in_a(bw - 2, mantissa)
    }
    when(io.in_b(bw - 2, mantissa) > BigInt(2).pow(exponent).U - 2.U) {
      exp_wire(1) := BigInt(2).pow(exponent).U - 2.U
    }.elsewhen(io.in_b(bw-2,mantissa) < 1.U){
      exp_wire(1) := 1.U
    }.otherwise {
      exp_wire(1) := io.in_b(bw - 2, mantissa)
    }

    // get the mantissa parts of the two inputs
    val frac_wire = Wire(Vec(2, UInt(mantissa.W)))
    frac_wire(0) := io.in_a(mantissa - 1, 0)
    frac_wire(1) := io.in_b(mantissa - 1, 0)

    // 1.0 + mantissa part of the two numbers
    val whole_frac_wire = Wire(Vec(2, UInt((mantissa + 1).W)))
    whole_frac_wire(0) := 1.U ## frac_wire(0)
    whole_frac_wire(1) := 1.U ## frac_wire(1)

    val postProcess_exp_subtractor = Module(new full_subtractor(exponent))
    postProcess_exp_subtractor.io.in_a := exp_wire(0)
    postProcess_exp_subtractor.io.in_b := exp_wire(1)
    postProcess_exp_subtractor.io.in_c := 0.U

    val eqexp_arrange = Mux(exp_wire(0)===exp_wire(1),whole_frac_wire(1) > whole_frac_wire(0),false.B)
    val redundant_op = ShiftRegister(Mux(postProcess_exp_subtractor.io.out_c.asBool, (~postProcess_exp_subtractor.io.out_s).asUInt + 1.U, postProcess_exp_subtractor.io.out_s) > mantissa.U,1,io.in_en)
    val fracadd_in_a = ShiftRegister(Mux(postProcess_exp_subtractor.io.out_c.asBool, whole_frac_wire(1), whole_frac_wire(eqexp_arrange)),1,io.in_en) // selects the larger num of the two
    val fracadd_in_b = ShiftRegister(Mux(postProcess_exp_subtractor.io.out_c.asBool, whole_frac_wire(0) >> ((~postProcess_exp_subtractor.io.out_s).asUInt + 1.U), whole_frac_wire(!eqexp_arrange) >> postProcess_exp_subtractor.io.out_s),1,io.in_en)
    val ref_exp = ShiftRegister(Mux(postProcess_exp_subtractor.io.out_c.asBool, exp_wire(1),exp_wire(0)),2,io.in_en) // the larger exp of the two is reference
    val ref_sign = ShiftRegister(Mux(postProcess_exp_subtractor.io.out_c.asBool, sign_wire(1),sign_wire(eqexp_arrange)),1,io.in_en) // same with sign and so
    val diff_sign = ShiftRegister(sign_wire(0) ^ sign_wire(1), 1, io.in_en) // need to check if signs are diff, if yes then we know result cannot grow so look out for leading zeros in frac sum else result may grow so check for frac sum carry


    val frac_adder = Module(new full_adder((mantissa + 1))).io
    frac_adder.in_a := fracadd_in_a
    frac_adder.in_b := Mux(diff_sign.asBool, (~fracadd_in_b).asUInt + 1.U, fracadd_in_b) // note that if signs are diff we need to two complement the smaller inp regardless if it is actually negative or not
    frac_adder.in_c := 0.U

    val sign_out = ShiftRegister(Mux(diff_sign.asBool && !redundant_op, Mux(frac_adder.out_c.asBool, ref_sign, !ref_sign), ref_sign),1,io.in_en) // from observation, if diff signs, then frac sum carry = 0 implies a sign change, otherwise same sign stays
    val fracadd_outs = ShiftRegister(frac_adder.out_s,1,io.in_en)
    val fracadd_outc = ShiftRegister(frac_adder.out_c,1,io.in_en)
    val diff_sign_2 = ShiftRegister(diff_sign, 1, io.in_en)

    val LZC_inst = Module(new LZC(bw,2)).io
    LZC_inst.in_d := fracadd_outs ## (VecInit.fill(bw - (mantissa + 1))(true.B)).asUInt
    val leadzeroindex = LZC_inst.out_c // this lead zero index is computed bc diff_sign imply result could be smaller which may introduce lead zeros in fracsum
    val red = ref_exp -& leadzeroindex
    val inc = ref_exp +& 1.U
    val shifted_left = fracadd_outs(mantissa - 1, 0) << leadzeroindex
    val norm_out_frac = (ShiftRegister(Mux(diff_sign_2.asBool,
      Mux(fracadd_outs(mantissa).asBool, fracadd_outs(mantissa-1,0), Mux(red(exponent) || (red < min_exp), min_frac, shifted_left)),
      Mux(fracadd_outc.asBool, Mux(inc(exponent) || (inc > max_exp), max_frac, fracadd_outs(mantissa,1)), fracadd_outs(mantissa-1,0))), 1, io.in_en))(mantissa - 1,0)
    val norm_out_exp = ShiftRegister(Mux(diff_sign_2.asBool,
      Mux(fracadd_outs(mantissa).asBool, ref_exp, Mux(red(exponent) || (red < min_exp), min_exp, red(exponent-1,0))),
      Mux(fracadd_outc.asBool, Mux(inc(exponent) || (inc > max_exp), max_exp, inc(exponent-1,0)), ref_exp)),
      1, io.in_en)
    val norm_out_sign = ShiftRegister(sign_out, 1, io.in_en)


    io.out_valid := ShiftRegister(io.in_valid, 3, io.in_en)
    io.out_s := norm_out_sign ## norm_out_exp ## norm_out_frac
  }






  // -------------------------------- new designs for approximation based FP Units using Newton's method -----------------------------
  // - using the newer (experimental) adders and multipliers, if you want just change out the instantiations for old fp units and values for adder/mult latency
  val mult_latency = 3
  val add_latency = 3
  class FP_recip_appx(bw: Int, NR: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })

    override def desiredName = s"FP_recip_appx_${bw}"
    var limit = scala.BigInt("0", 10)
    // approximation of the reciprocal using the fast inverse square root trick
    // however has some limitations for really large numbers from my observation
    val (exponent, mantissa, magic) = bw match {
      case 16 => (5,10,scala.BigInt("23040", 10))
      case 32 => (8,23,scala.BigInt("1597463007", 10))
      case 64 => (11,52,scala.BigInt("6910469410427058089", 10))
      case 128 => (15,112,scala.BigInt("127598099150064121557322682042419249152", 10))
    }
    limit = (magic * 2) / 3

    val number = Wire(UInt((bw).W))
    val two = Wire(UInt(bw.W))
    two := convert_string_to_IEEE_754("2.0", bw).U
    when(io.in_a(bw - 2, 0) > (limit * 2).U) {
      number := limit.U
    }.otherwise {
      number := io.in_a(bw - 2, 0) >> 1.U
    }

    // get the magic number
    val magic_num = magic.U((bw).W)
    // calculating the fast inverse square root approximation
    val result = Wire(UInt(bw.W)) // subtract the adjusted input from the magic number and we have the inverse square root immediately (although an approximation)
    result := magic_num - number

    val recip_appx_mult = Module(new FP_mult_3ccs(bw)).io
    recip_appx_mult.in_en := io.in_en
    recip_appx_mult.in_valid := io.in_valid
    recip_appx_mult.in_a := result
    recip_appx_mult.in_b := result

    val yn = recip_appx_mult.out_s
    val xin = ShiftRegister(io.in_a, mult_latency, io.in_en)

    val NR_components = (0 until NR).map(i=>{
      (Module(new FP_mult_3ccs(bw)).io,
        Module(new FP_add_3ccs(bw)).io,
        Module(new FP_mult_3ccs(bw)).io,
        Wire(UInt(bw.W)))
    })

    for(i <- 0 until NR){
      if(i==0){
        NR_components(0)._1.in_en := io.in_en
        NR_components(0)._1.in_valid := recip_appx_mult.out_valid
        NR_components(0)._1.in_a := 0.U(1.W) ## xin(bw-2,0)
        NR_components(0)._1.in_b := 0.U(1.W) ## yn(bw-2,0)
        NR_components(0)._2.in_en := io.in_en
        NR_components(0)._2.in_valid := NR_components(0)._1.out_valid
        NR_components(0)._2.in_a := two
        NR_components(0)._2.in_b := 1.U(1.W) ## NR_components(0)._1.out_s(bw-2,0)
        NR_components(0)._3.in_en := io.in_en
        NR_components(0)._3.in_valid := NR_components(0)._2.out_valid
        NR_components(0)._3.in_a := 0.U(1.W) ## ShiftRegister(yn,mult_latency+add_latency,io.in_en)(bw-2,0)
        NR_components(0)._3.in_b := 0.U(1.W) ## NR_components(0)._2.out_s(bw-2,0)
        NR_components(0)._4 := ShiftRegister(xin,mult_latency+add_latency+mult_latency,io.in_en)
      }else{
        NR_components(i)._1.in_en := io.in_en
        NR_components(i)._1.in_valid := NR_components(i-1)._3.out_valid
        NR_components(i)._1.in_a := 0.U(1.W) ## NR_components(i-1)._4(bw-2,0) // xin
        NR_components(i)._1.in_b := 0.U(1.W) ## NR_components(i-1)._3.out_s(bw-2,0) // yn
        NR_components(i)._2.in_en := io.in_en
        NR_components(i)._2.in_valid := NR_components(i)._1.out_valid
        NR_components(i)._2.in_a := two
        NR_components(i)._2.in_b := 1.U(1.W) ## NR_components(i)._1.out_s(bw-2,0)
        NR_components(i)._3.in_en := io.in_en
        NR_components(i)._3.in_valid := NR_components(i)._2.out_valid
        NR_components(i)._3.in_a := 0.U(1.W) ## ShiftRegister(NR_components(i-1)._3.out_s,mult_latency+add_latency,io.in_en)(bw-2,0)
        NR_components(i)._3.in_b := 0.U(1.W) ## NR_components(i)._2.out_s(bw-2,0)
        NR_components(i)._4 := ShiftRegister(NR_components(i-1)._4,mult_latency+add_latency+mult_latency,io.in_en)
      }
    }

    io.out_valid := NR_components.last._3.out_valid
    io.out_s := NR_components.last._4(bw-1) ## NR_components.last._3.out_s(bw-2,0)
  }

  class FP_div_appx(bw: Int, NR: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_div_appx_${bw}"
    val recip_appx = Module(new FP_recip_appx(bw,NR)).io
    val mult = Module(new FP_mult_3ccs(bw)).io
    recip_appx.in_en := io.in_en
    recip_appx.in_valid := io.in_valid
    recip_appx.in_a := io.in_b
    mult.in_en := io.in_en
    mult.in_valid := recip_appx.out_valid
    mult.in_a := ShiftRegister(io.in_a, mult_latency+(mult_latency+add_latency+mult_latency)*NR ,io.in_en)
    mult.in_b := recip_appx.out_s
    io.out_valid := mult.out_valid
    io.out_s := mult.out_s
  }

  class FP_isqrt_appx(bw: Int, NR: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_isqrt_appx_${bw}"
    var limit = scala.BigInt("0", 10)
    // approximation of the reciprocal using the fast inverse square root trick
    // however has some limitations for really large numbers from my observation
    val (exponent, mantissa, magic) = bw match {
      case 16 => (5,10,scala.BigInt("23040", 10))
      case 32 => (8,23,scala.BigInt("1597463007", 10))
      case 64 => (11,52,scala.BigInt("6910469410427058089", 10))
      case 128 => (15,112,scala.BigInt("127598099150064121557322682042419249152", 10))
    }
    limit = (magic * 2) / 3

    val number = Wire(UInt((bw).W))
    val threehalfs = Wire(UInt(bw.W))
    threehalfs := convert_string_to_IEEE_754("1.5", bw).U
    when(io.in_a(bw - 2, 0) > (limit * 2).U) {
      number := limit.U
    }.otherwise {
      number := io.in_a(bw - 2, 0) >> 1.U
    }

    // get the magic number
    val magic_num = magic.U((bw).W)
    // calculating the fast inverse square root approximation
    val result = Wire(UInt(bw.W)) // subtract the adjusted input from the magic number and we have the inverse square root immediately (although an approximation)
    result := magic_num - number

    val yn = result
    val xin = io.in_a(bw-1) ## (io.in_a(bw-2,mantissa) - 1.U) ## io.in_a(mantissa - 1, 0)

    val NR_components = (0 until NR).map(i=>{
      (Module(new FP_mult_3ccs(bw)).io,
        Module(new FP_mult_3ccs(bw)).io,
        Module(new FP_add_3ccs(bw)).io,
        Module(new FP_mult_3ccs(bw)).io,
        Wire(UInt(bw.W)))
    })

    for(i <- 0 until NR){
      if(i==0){
        NR_components(0)._1.in_en := io.in_en
        NR_components(0)._1.in_valid := io.in_valid
        NR_components(0)._1.in_a := 0.U(1.W) ## yn(bw-2,0)
        NR_components(0)._1.in_b := 0.U(1.W) ## yn(bw-2,0)
        NR_components(0)._2.in_en := io.in_en
        NR_components(0)._2.in_valid := NR_components(0)._1.out_valid
        NR_components(0)._2.in_a := 0.U(1.W) ## ShiftRegister(xin,mult_latency,io.in_en)(bw-2,0)
        NR_components(0)._2.in_b := 0.U(1.W) ## NR_components(0)._1.out_s(bw-2,0)
        NR_components(0)._3.in_en := io.in_en
        NR_components(0)._3.in_valid := NR_components(0)._2.out_valid
        NR_components(0)._3.in_a := threehalfs
        NR_components(0)._3.in_b := 1.U(1.W) ## NR_components(0)._2.out_s(bw-2,0)
        NR_components(0)._4.in_en := io.in_en
        NR_components(0)._4.in_valid := NR_components(0)._3.out_valid
        NR_components(0)._4.in_a := 0.U(1.W) ## ShiftRegister(yn,mult_latency+mult_latency+add_latency,io.in_en)(bw-2,0)
        NR_components(0)._4.in_b := 0.U(1.W) ## NR_components(0)._3.out_s(bw-2,0)
        NR_components(0)._5 := ShiftRegister(xin,mult_latency+mult_latency+add_latency+mult_latency,io.in_en)
      }else{
        NR_components(i)._1.in_en := io.in_en
        NR_components(i)._1.in_valid := NR_components(i-1)._4.out_valid
        NR_components(i)._1.in_a := 0.U(1.W) ## NR_components(i-1)._4.out_s(bw-2,0) // yn
        NR_components(i)._1.in_b := 0.U(1.W) ## NR_components(i-1)._4.out_s(bw-2,0) // yn
        NR_components(i)._2.in_en := io.in_en
        NR_components(i)._2.in_valid := NR_components(i)._1.out_valid
        NR_components(i)._2.in_a := 0.U(1.W) ## ShiftRegister(NR_components(i-1)._5,mult_latency,io.in_en)(bw-2,0) // xin
        NR_components(i)._2.in_b := 0.U(1.W) ## NR_components(i)._1.out_s(bw-2,0)
        NR_components(i)._3.in_en := io.in_en
        NR_components(i)._3.in_valid := NR_components(i)._2.out_valid
        NR_components(i)._3.in_a := threehalfs
        NR_components(i)._3.in_b := 1.U(1.W) ## NR_components(i)._2.out_s(bw-2,0)
        NR_components(i)._4.in_en := io.in_en
        NR_components(i)._4.in_valid := NR_components(i)._3.out_valid
        NR_components(i)._4.in_a := 0.U(1.W) ## ShiftRegister(NR_components(i-1)._4.out_s,mult_latency+mult_latency+add_latency,io.in_en)(bw-2,0)
        NR_components(i)._4.in_b := 0.U(1.W) ## NR_components(i)._3.out_s(bw-2,0)
        NR_components(i)._5 := ShiftRegister(NR_components(i-1)._5,mult_latency+mult_latency+add_latency+mult_latency,io.in_en)
      }
    }

    io.out_valid := NR_components.last._4.out_valid
    io.out_s := NR_components.last._5(bw-1) ## NR_components.last._4.out_s(bw-2,0)
  }

  class FP_sqrt_appx(bw: Int, NR: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_en = Input(Bool())
      val in_valid = Input(Bool())
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
      val out_valid = Output(Bool())
    })
    override def desiredName = s"FP_sqrt_appx_${bw}"
    val isqrt_appx = Module(new FP_isqrt_appx(bw,NR)).io
    val mult = Module(new FP_mult_3ccs(bw)).io
    isqrt_appx.in_en := io.in_en
    isqrt_appx.in_valid := io.in_valid
    isqrt_appx.in_a := io.in_a
    mult.in_en := io.in_en
    mult.in_valid := isqrt_appx.out_valid
    mult.in_a := 0.U(1.W) ## ShiftRegister(io.in_a, (mult_latency+mult_latency+add_latency+mult_latency)*NR ,io.in_en)(bw-2,0)
    mult.in_b := isqrt_appx.out_s
    io.out_valid := mult.out_valid
    io.out_s := mult.out_s
  }









  // --------------------------------------- DDOT old designs----------------------------------------------------------
  class FPReg(depth: Int,bw: Int) extends Module{
    val io = IO(new Bundle() {
      val in = Input(UInt(bw.W))
      val out = Output(UInt(bw.W))
    })
    val reg = RegInit(VecInit.fill(depth)(0.U(bw.W)))
    //    val reg = RegInit(0.U.asTypeOf(new ComplexNum(bw)))
      reg(0) := io.in
      for(i <- 1 until depth){
        reg(i) := reg(i-1)
      }
    io.out := reg(depth - 1)
  }

  class FP_DDOT_dp(n: Int, bw: Int) extends Module {
    val io = IO(new Bundle{
      val in_a = Input(Vec(n, UInt(bw.W)))
      val in_b = Input(Vec(n, UInt(bw.W)))
      val out_s = Output(UInt(bw.W))
    })
    var temp_n = n
    val add_per_layer = mutable.ArrayBuffer[Int]()
    val regs_per_layer = mutable.ArrayBuffer[Int]()
    while(temp_n>1){
      if(temp_n % 2 == 1){
        add_per_layer += temp_n/2
        temp_n /= 2
        temp_n += 1
        regs_per_layer += 1
      }else{
        add_per_layer += temp_n/2
        temp_n /= 2
        regs_per_layer += 0
      }
    }
    val multipliers = Vector.fill(n)(Module(new FP_multiplier_10ccs(bw)).io)
    //    multipliers.map(x=>x.in_en := io.in_en)
    multipliers.zipWithIndex.map(x=>x._1.in_a := io.in_a(x._2))
    multipliers.zipWithIndex.map(x=>x._1.in_b := io.in_b(x._2))
    multipliers.map(_.in_en := true.B)
    if(add_per_layer.nonEmpty) {
      val regs_and_adds = for (i <- 0 until add_per_layer.length) yield {
        val adds = for (j <- 0 until add_per_layer(i)) yield {
          Module(new FP_adder_13ccs(bw)).io
        }
        adds.map(_.in_en := true.B)
        val regs = for (j <- 0 until regs_per_layer(i)) yield {
          //RegInit(0.U.asTypeOf(new ComplexNum(bw)))
          Module(new FPReg(13, bw)).io
        }
        (adds, regs)
      }
      //      regs_and_adds(0)._1.map(_.in_en := true.B)
      for (i <- 0 until regs_and_adds.length) {
        for (j <- 0 until add_per_layer(i) * 2 by 2) {
          val temp = if (i == 0) {
            multipliers(j).out_s
          } else {
            regs_and_adds(i - 1)._1(j).out_s
          }
          val temp2 = if (i == 0) {
            multipliers(j + 1).out_s
          } else {
            if (j / 2 == add_per_layer(i) - 1) {
              if (regs_per_layer(i - 1) == 1 && add_per_layer(i - 1) % 2 == 1) {
                regs_and_adds(i - 1)._2(0).out
              } else {
                regs_and_adds(i - 1)._1(j + 1).out_s
              }
            } else {
              regs_and_adds(i - 1)._1(j + 1).out_s
            }
          }
          //          regs_and_adds(i)._1(j / 2).in_en := io.in_en
          regs_and_adds(i)._1(j / 2).in_a := temp
          regs_and_adds(i)._1(j / 2).in_b := temp2
        }
        for (j <- 0 until regs_per_layer(i)) {
          val temp = if (i == 0) {
            multipliers(add_per_layer(i) * 2).out_s
          } else {
            if (regs_per_layer(i - 1) == 1) {
              regs_and_adds(i - 1)._2(0).out
            } else {
              regs_and_adds(i - 1)._1(add_per_layer(i) * 2).out_s
            }
          }
          //          regs_and_adds(i)._2(j).in_en := true.B
          regs_and_adds(i)._2(j).in := temp
        }
      }
      //      println(s"addper layer: ${add_per_layer}")
      io.out_s := regs_and_adds(add_per_layer.length - 1)._1(0).out_s
    }else{
      io.out_s := multipliers(0).out_s
    }
  }

  class axpy_dp(bw:Int,level:Int)extends Module {
    val io = IO {
      new Bundle() {
        val in_a = Input(UInt(bw.W))
        val in_b = Input(Vec((level), UInt(bw.W)))
        val in_c = Input(Vec((level), UInt(bw.W)))
        val out_s = Output(Vec((level), UInt(bw.W)))
      }
    }

    val multiply_layer = for(i <- 0 until level)yield{
      val multiply = Module(new FP_multiplier_10ccs(bw)).io
      multiply.in_en := true.B
      multiply
    }
    val adder_layer = for (i <- 0 until level) yield {
      val adder = Module(new FP_adder_13ccs(bw)).io
      adder.in_en := true.B
      adder
    }
    val reg_array_h = Vector.fill(level)(Module(new FPReg(10, 32)).io)
    for(i <- 0 until level){
      multiply_layer(i).in_a := io.in_a
      multiply_layer(i).in_b := io.in_b(i)
      reg_array_h(i).in := io.in_c(i)
      adder_layer(i).in_a :=  multiply_layer(i).out_s
      adder_layer(i).in_b := reg_array_h(i).out
      io.out_s(i) := adder_layer(i).out_s
    }
  }



  // FP conversion IEEE 754
  def convert_IEEE754_to_Decimal(num: BigInt, bw: Int): BigDecimal = {
    var exponent = 0
    var mantissa = 0
    var zero_1 = BigInt(0)
    if (bw == 16) {
      exponent = 5
      mantissa = 10
      zero_1 = BigInt("8000", 16)
    } else if (bw == 32) {
      exponent = 8
      mantissa = 23
      zero_1 = BigInt("80000000", 16)
    } else if (bw == 64) {
      exponent = 11
      mantissa = 52
      zero_1 = BigInt("8000000000000000", 16)
    } else if (bw == 128) {
      exponent = 15
      mantissa = 112
      zero_1 = BigInt("80000000000000000000000000000000", 16)
    }
    if (num == zero_1) {
      return BigDecimal(0)
    }
    var n = num
    var list = mutable.ArrayBuffer[String]()
    while (n != 0) {
      list += (n % 2).toString
      n = n / 2
    }
    while (list.length < bw) {
      list += 0.toString
    }
    val sign = list.toList(bw - 1)
    val exp = list.slice(mantissa, bw - 1).reduce(_ + _)
    var sum = binary_string_to_Double(exp, bw)
    var mant = list.slice(0, mantissa).reduce(_ + _).reverse
    var new_mant = binary_string_to_Double_Frac(mant, bw)
    new_mant = new_mant * BigDecimal(2).pow((sum - (Math.pow(2, exponent - 1) - 1)).toInt) //Math.pow(2, (sum-(Math.pow(2, exponent - 1) - 1)).toDouble)
    if (sign.toInt == 1)
      new_mant = new_mant * -1
    if (BigInt(num.toString().slice(0, bw - 1)) == 0)
      scala.BigDecimal(0.0)
    else
      new_mant
  }

  def binary_string_to_Double(str: String, bw: Int): BigDecimal = {
    var sum: BigDecimal = 0.0
    for (i <- 0 until str.length) {
      if (str(i).equals('1')) {
        sum += scala.BigDecimal(2).pow(i)
      }
    }
    sum
  }

  def binary_string_to_Double_Frac(str: String, bw: Int): BigDecimal = {
    var sum: BigDecimal = 0.0
    for (i <- 1 to str.length) {
      if (str(i - 1).equals('1')) {
        sum += scala.BigDecimal(2).pow(-1 * i)
      }
    }
    sum + 1.0
  }

  def convert_string_to_IEEE_754(str: String, bw: Int): BigInt = {
    var exponent = 0
    var mantissa = 0
    var bias = 0
    if (bw == 16) {
      exponent = 5
      mantissa = 10
      bias = 15
    } else if (bw == 32) {
      exponent = 8
      mantissa = 23
      bias = 127
    } else if (bw == 64) {
      exponent = 11
      mantissa = 52
      bias = 1023
    } else if (bw == 128) {
      exponent = 15
      mantissa = 112
      bias = 16383
    }
    val max_val = (BigDecimal(2) - BigDecimal(2).pow(-1 * mantissa)) * BigDecimal(2).pow(bias)
    val min_val = BigDecimal(2).pow(-1 * (bias - 1))
    if (str.equals("0.0") || str.equals('0')) {
      return scala.BigInt(0)
    }
    var sign = '0'
    var num = str
    if (str(0).equals('-')) {
      sign = '1'
      num = str.slice(1, str.length)
    }
    if (num.contains('E')) {
      num = convert_E(num)
    }
    var new_val = BigDecimal(num)
    if (new_val.abs > max_val) {
      if (new_val < 0)
        new_val = -1 * max_val
      else
        new_val = max_val
    } else if (new_val.abs < min_val) {
      if (new_val < 0)
        new_val = -1 * min_val
      else
        new_val = min_val
    }
    if (new_val.toString().contains('E')) {
      num = convert_E(new_val.toString())
    } else {
      num = new_val.toString()
    }
    var part = num.split('.')
    var whole = scala.BigInt(part(0))
    var frac = scala.BigDecimal(("0." + part(1)))
    var list1 = mutable.ArrayBuffer[String]()
    while (whole != 0) {
      list1 += (whole % 2).toString
      whole = whole / 2
    }
    var whole_str = ""
    if (list1.isEmpty) {
      whole_str = "0"
    } else {
      whole_str = list1.reverse.reduce(_ + _)
    }

    var new_exp = (whole_str.length - 1 + Math.pow(2, exponent - 1) - 1).toInt
    var list2 = mutable.ArrayBuffer[String]()
    for (i <- 0 until mantissa) {
      frac = frac * 2
      if (frac >= 1.0) {
        list2 += 1.toString
        frac = frac - 1.0
      } else {
        list2 += 0.toString
      }
    }
    var frac_str = list2.reduce(_ + _)
    var exp_adj = 0
    var offset = 0
    var slicefrac = ""
    var fullstr = whole_str + frac_str
    if (BigInt(fullstr) == BigInt(0)) {
      while (frac < 1.0) {
        frac = frac * 2
        offset += 1
      }
      frac -= 1
      exp_adj = mantissa + offset
      list2 = mutable.ArrayBuffer[String]()
      for (i <- 0 until mantissa) {
        frac = frac * 2
        if (frac >= 1.0) {
          list2 += 1.toString
          frac = frac - 1.0
        } else {
          list2 += 0.toString
        }
      }
      slicefrac = list2.reduce(_ + _)
    } else {
      var i = -1
      do {
        i += 1
        if (fullstr(i) == '0') {
          exp_adj += 1
        } else {
          slicefrac = fullstr.slice(i + 1, fullstr.length)
        }
      } while (fullstr(i) != '1')

      while (slicefrac.length < mantissa) {
        slicefrac += '0'
      }
    }
    new_exp -= exp_adj
    var list5 = mutable.ArrayBuffer[String]()
    while (new_exp != 0) {
      list5 += (new_exp % 2).toString
      new_exp /= 2
    }
    while (list5.length < exponent) {
      list5 += "0"
    }
    var final_exp = list5.reverse.reduce(_ + _)
    var final_str = sign + final_exp + slicefrac.slice(0, mantissa)
    (binary_string_to_Double(final_str.reverse, bw)).toBigInt

  }

  def convert_E(x: String): String = {
    var split = x.split('E')
    var whole_frac = split(0).split('.')
    var full_num = split(0).split('.').reduce(_ + _)
    var num = ""
    if (split(1).toInt < 0) {
      full_num = full_num.reverse
      for (i <- 0 until split(1).toInt.abs.toInt - 1) {
        full_num += '0'
      }
      full_num += ".0"
      full_num = full_num.reverse
      num = full_num
    } else if (split(1).toInt > 0) {
      var new_frac = ""
      for (i <- 0 until split(1).toInt) {
        if (i < whole_frac(1).length) {
          new_frac += whole_frac(1)(i)
        } else {
          new_frac += '0'
        }
      }
      new_frac += '.'
      if (whole_frac(1).length > split(1).toInt) {
        for (i <- split(1).toInt until whole_frac(1).length) {
          new_frac += whole_frac(1)(i)
        }
      } else {
        new_frac += '0'
      }
      num = whole_frac(0) ++ new_frac
    }
    return num
  }







  //-- old designs unchanged from 2022
  //  class FP_exponential(bw: Int) extends Module {
  //    val io = IO(new Bundle{
  //      val in_a = Input(UInt(bw.W))
  //      val out_s = Output(UInt(bw.W))
  //    })
  //    var exponent = 0
  //    var mantissa = 0
  //    var bias = 0
  //    var highest_useful_value = 0.0
  //    if (bw == 16){
  //      exponent = 5
  //      mantissa = 10
  //      bias = 15
  //      highest_useful_value = 12.0
  //    }else if (bw == 32){
  //      exponent = 8
  //      mantissa = 23
  //      bias = 127
  //      highest_useful_value = 90.0
  //    }else if(bw == 64){
  //      exponent = 11
  //      mantissa = 52
  //      bias = 1023
  //      highest_useful_value = 712.0
  //    }else if(bw == 128){
  //      exponent = 15
  //      mantissa = 112
  //      bias = 16383
  //      highest_useful_value = 11360.0
  //    }
  //    val max_val = convert_string_to_IEEE_754(highest_useful_value.toString, bw).U(bw.W)
  //    val inputvalue = Wire(UInt(bw.W))
  //    inputvalue := 0.U
  //    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
  //      val ne = Wire(UInt(exponent.W))
  //      val nf = Wire(UInt(mantissa.W))
  //      ne := BigInt(2).pow(exponent).U - 2.U
  //      nf := BigInt(2).pow(mantissa).U - 1.U
  //      inputvalue := io.in_a(bw-1) ## ne ## nf
  //    }.otherwise{
  //      inputvalue := io.in_a
  //    }
  //    val comparator =  Module(new FP_comparator(bw)).io
  //    comparator.in_a := max_val
  //    comparator.in_b := 0.U(1.W) ## inputvalue(bw-2,0)
  //    val inputvalue2 = Wire(UInt(bw.W))
  //    inputvalue2 := 0.U
  //    when(comparator.out_s =/= max_val){
  //      inputvalue2 := max_val
  //    }.otherwise{
  //      inputvalue2 := inputvalue
  //    }
  //    val LN2 = convert_string_to_IEEE_754(Math.log(2).toString, bw).U(bw.W)
  //    val lN2_inverse = convert_string_to_IEEE_754((1/Math.log(2)).toString, bw).U(bw.W)
  //    val exp2 = convert_string_to_IEEE_754("1.0", bw).U(bw.W)
  //    val multiplier1 = Module(new FP_multiplier_1ccs(bw)).io
  //    multiplier1.in_a := lN2_inverse
  //    multiplier1.in_b := 0.U(1.W) ## inputvalue2(bw-2,0)
  //    val get_whole_frac = Module(new FP_extract(bw)).io
  //    get_whole_frac.in_a := multiplier1.out_s
  //
  //    val multiplier2 = Module(new FP_multiplier_1ccs(bw)).io
  //    multiplier2.in_a := LN2
  //    multiplier2.in_b := get_whole_frac.out_frac
  //    val taylor_exp = Module(new FP_exponential2(bw)).io
  //    taylor_exp.in_a := multiplier2.out_s
  //    val multiplier3 = Module(new FP_multiplier_1ccs(bw)).io
  //    val check_exp = Wire(UInt(bw.W))
  //    check_exp := (exp2(bw-2, mantissa)+get_whole_frac.out)
  //    val new_exp = Wire(UInt(exponent.W))
  //    new_exp := 0.U
  //    val new_frac = Wire(UInt(mantissa.W))
  //    new_frac := 0.U
  //    when(check_exp > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
  //      new_exp := BigInt(2).pow(exponent).U - 2.U
  //      new_frac := BigInt(2).pow(mantissa).U - 1.U
  //    }.otherwise{
  //      new_exp := check_exp
  //      new_frac := exp2(mantissa-1, 0)
  //    }
  //    multiplier3.in_a := exp2(bw-1) ## new_exp ## new_frac
  //    multiplier3.in_b := taylor_exp.out_s
  //
  //
  //    val result = Wire(UInt(bw.W))
  //    result := multiplier3.out_s
  //
  //    val recip = Module(new FP_reciprocal_9ccs(bw)).io
  //    recip.in_a := result
  //
  //    when(io.in_a(bw-1) === 1.U){
  //      io.out_s := recip.out_s
  //    }.otherwise{
  //      io.out_s := result
  //    }
  //  }
  //
  //  // subcomponent of FP-exponential
  //  class FP_exponential2(bw: Int) extends Module{
  //    //require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
  //    val io = IO(new Bundle() {
  //      val in_a = Input(UInt(bw.W))
  //      val out_s = Output(UInt(bw.W))
  //    })
  //    var magic = scala.BigInt("0", 10)
  //    var exponent = 0
  //    var mantissa = 0
  //    var factorial_constants:Array[BigInt] = Array(scala.BigInt("15360", 10), scala.BigInt("15360", 10), scala.BigInt("14336", 10), scala.BigInt("12624", 10), scala.BigInt("10560", 10), scala.BigInt("8192", 10))
  //    // based on the taylor series approximation for e^x
  //    // im just using the first 6 terms of the series for now
  //
  //    // some constants for each precision size
  //    if (bw == 16){
  //      exponent = 5
  //      mantissa = 10
  //    }else if (bw == 32){
  //      exponent = 8
  //      mantissa = 23
  //      factorial_constants(0) = scala.BigInt("1065353216", 10) // 1/0!
  //      factorial_constants(1) = scala.BigInt("1065353216", 10) // 1/1!
  //      factorial_constants(2) = scala.BigInt("1056964608", 10) // 1/2!
  //      factorial_constants(3) = scala.BigInt("1042983616", 10) // 1/3!
  //      factorial_constants(4) = scala.BigInt("1026206368", 10) // 1/4!
  //      factorial_constants(5) = scala.BigInt("1007191808", 10) // 1/5!
  //    }else if(bw == 64){
  //      exponent = 11
  //      mantissa = 52
  //      factorial_constants(0) = scala.BigInt("4607182418800017458", 10)
  //      factorial_constants(1) = scala.BigInt("4607182418800017458", 10)
  //      factorial_constants(2) = scala.BigInt("4602678819172646962", 10)
  //      factorial_constants(3) = scala.BigInt("4595172831803295138", 10)
  //      factorial_constants(4) = scala.BigInt("4586165625342794738", 10)
  //      factorial_constants(5) = scala.BigInt("4575957269229997874", 10)
  //    }else if(bw == 128){
  //      exponent = 15
  //      mantissa = 112
  //      factorial_constants(0) = scala.BigInt("85065399433376083102600000000000000000", 10)
  //      factorial_constants(1) = scala.BigInt("85065399433376083102600000000000000000", 10)
  //      factorial_constants(2) = scala.BigInt("85060207136517548275000000000000000000", 10)
  //      factorial_constants(3) = scala.BigInt("85051553322266115185296344079871440000", 10)
  //      factorial_constants(4) = scala.BigInt("85041168720241370556640618099810700000", 10)
  //      factorial_constants(5) = scala.BigInt("85029399286952242334358719431136460000", 10)
  //    }
  //
  //    // get the inverse factorial values
  //    val inverse_factorials = Wire(Vec(6, UInt(bw.W)))
  //    inverse_factorials(0) := factorial_constants(0).U
  //    inverse_factorials(1) := factorial_constants(1).U
  //    inverse_factorials(2) := factorial_constants(2).U
  //    inverse_factorials(3) := factorial_constants(3).U
  //    inverse_factorials(4) := factorial_constants(4).U
  //    inverse_factorials(5) := factorial_constants(5).U
  //
  //    val multiplier0 = Module(new FP_multiplier_1ccs(bw)) // 1 cycle
  //    multiplier0.io.in_a := inverse_factorials(5)
  //    multiplier0.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)
  //
  //    val adder0 = Module(new FP_adder_1ccs(bw)) // 2 cycle
  //    adder0.io.in_a := inverse_factorials(4)
  //    adder0.io.in_b := multiplier0.io.out_s
  //    val multiplier1 = Module(new FP_multiplier_1ccs(bw)) // 3 cycle
  //    multiplier1.io.in_a := adder0.io.out_s
  //    multiplier1.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)
  //
  //    val adder1 = Module(new FP_adder_1ccs(bw)) // 4 cycle
  //    adder1.io.in_a := inverse_factorials(3)
  //    adder1.io.in_b := multiplier1.io.out_s
  //    val multiplier2 = Module(new FP_multiplier_1ccs(bw)) // 5 cycle
  //    multiplier2.io.in_a := adder1.io.out_s
  //    multiplier2.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)
  //
  //    val adder2 = Module(new FP_adder_1ccs(bw)) // 6 cycle
  //    adder2.io.in_a := inverse_factorials(2)
  //    adder2.io.in_b := multiplier2.io.out_s
  //    val multiplier3 = Module(new FP_multiplier_1ccs(bw)) // 7 cycle
  //    multiplier3.io.in_a := adder2.io.out_s
  //    multiplier3.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)
  //
  //    val adder3 = Module(new FP_adder_1ccs(bw)) // 8 cycle
  //    adder3.io.in_a := inverse_factorials(1)
  //    adder3.io.in_b := multiplier3.io.out_s
  //    val multiplier4 = Module(new FP_multiplier_1ccs(bw)) // 9 cycle
  //    multiplier4.io.in_a := adder3.io.out_s
  //    multiplier4.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)
  //
  //    val adder4 = Module(new FP_adder_1ccs(bw)) // 10 cycle
  //    adder4.io.in_a := inverse_factorials(0)
  //    adder4.io.in_b := multiplier4.io.out_s
  //
  //    val result = Wire(UInt(bw.W))
  //    result := adder4.io.out_s
  //
  //    val recip = Module(new FP_reciprocal_9ccs(bw))
  //    recip.io.in_a := adder4.io.out_s
  //
  //    when(io.in_a(bw-1) === 1.U){ // if the sign of the input was negative, then just take the reciprocal
  //      result := recip.io.out_s
  //    }
  //
  //    io.out_s := result
  //  }
  //
  //  // this module is used for separating the whole part from the fractional part of the floating point number
  //  class FP_extract(bw:Int) extends Module{
  //    val io = IO(new Bundle{
  //      val in_a = Input(UInt(bw.W))
  //      val out_frac = Output(UInt(bw.W))
  //      val out = Output(UInt(bw.W))
  //    })
  //    var exponent = 0
  //    var mantissa = 0
  //    var bias = 0
  //    if (bw == 16){
  //      exponent = 5
  //      mantissa = 10
  //      bias = 15
  //    }else if (bw == 32){
  //      exponent = 8
  //      mantissa = 23
  //      bias = 127
  //    }else if(bw == 64){
  //      exponent = 11
  //      mantissa = 52
  //      bias = 1023
  //    }else if(bw == 128){
  //      exponent = 15
  //      mantissa = 112
  //      bias = 16383
  //    }
  //    val result_frac = Wire(UInt(bw.W))
  //    val expr = Wire(UInt(bw.W))
  //    expr := 0.U
  //    val exp = Wire(UInt(exponent.W))
  //    exp := io.in_a(bw-2, mantissa)
  //    val mant = Wire(UInt(mantissa.W))
  //    mant := io.in_a(mantissa-1, 0)
  //    val whole_mant = Wire(UInt((mantissa+1).W))
  //    whole_mant := 1.U(1.W) ## io.in_a(mantissa-1,0)
  //    result_frac := io.in_a
  //    val leadingOne = Module(new leadingOneDetector(mantissa))
  //    leadingOne.io.in := mant
  //    when(exp > bias.U) {
  //      val subres = Wire(UInt(exponent.W))
  //      subres := exp - bias.U
  //      expr := whole_mant >> (mantissa.U - subres)
  //      val firstshiftf = Wire(UInt(mantissa.W))
  //      firstshiftf := mant << (subres)
  //      leadingOne.io.in := firstshiftf
  //      val new_exp = Wire(UInt(exponent.W))
  //      new_exp := bias.U - (mantissa.U - leadingOne.io.out + 1.U)
  //      val new_mant = Wire(UInt(mantissa.W))
  //      new_mant := firstshiftf << (mantissa.U - leadingOne.io.out + 1.U)
  //      result_frac := io.in_a(bw-1) ## new_exp ## new_mant
  //    }.elsewhen(exp < bias.U){
  //      result_frac := io.in_a
  //    }.otherwise{
  //      expr := 1.U
  //      val new_exp = Wire(UInt(exponent.W))
  //      new_exp := exp - (mantissa.U - leadingOne.io.out + 1.U)
  //      val new_mant = Wire(UInt(mantissa.W))
  //      new_mant := mant << (mantissa.U - leadingOne.io.out + 1.U)
  //      result_frac := io.in_a(bw-1) ## new_exp ## new_mant
  //    }
  //    io.out_frac := result_frac
  //    io.out := expr
  //  }
  //
  //  // this module is used for comparing a pair of numbers (determines which one is larger)
  //  class FP_comparator(bw: Int) extends Module{
  //    val io = IO(new Bundle{
  //      val in_a = Input(UInt(bw.W))
  //      val in_b = Input(UInt(bw.W))
  //      val out_s = Output(UInt(bw.W))
  //    })
  //    var exponent = 0
  //    var mantissa = 0
  //    var bias = 0
  //    if (bw == 16){
  //      exponent = 5
  //      mantissa = 10
  //      bias = 15
  //    }else if (bw == 32){
  //      exponent = 8
  //      mantissa = 23
  //      bias = 127
  //    }else if(bw == 64){
  //      exponent = 11
  //      mantissa = 52
  //      bias = 1023
  //    }else if(bw == 128){
  //      exponent = 15
  //      mantissa = 112
  //      bias = 16383
  //    }
  //    val sign = Wire(Vec(2, UInt(1.W)))
  //    sign(0) := io.in_a(bw-1)
  //    sign(1) := io.in_b(bw-1)
  //
  //    // exponent part of ieee number
  //    val exp = Wire(Vec(2, UInt(exponent.W)))
  //    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
  //      exp(0) := BigInt(2).pow(exponent).U - 2.U
  //    }.otherwise{
  //      exp(0) := io.in_a(bw-2, mantissa)
  //    }
  //    when(io.in_b(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){
  //      exp(1) := BigInt(2).pow(exponent).U - 2.U
  //    }.otherwise{
  //      exp(1) := io.in_b(bw-2, mantissa)
  //    }
  //
  //    //fractional part of ieee number
  //    val frac = Wire(Vec(2, UInt(mantissa.W)))
  //    frac(0) := io.in_a(mantissa-1,0)
  //    frac(1) := io.in_b(mantissa-1,0)
  //
  //    // 1.0 + fractional part
  //    val whole_frac = Wire(Vec(2, UInt((mantissa+1).W)))
  //    whole_frac(0) := 1.U ## frac(0)
  //    whole_frac(1) := 1.U ## frac(1)
  //
  //    val subber = Module(new full_subtractor(exponent)).io
  //    subber.in_a := exp(0)
  //    subber.in_b := exp(1)
  //    subber.in_c := 0.U
  //
  //    val subber2 = Module(new full_subtractor(mantissa)).io
  //    subber2.in_a := frac(0)
  //    subber2.in_b := frac(1)
  //    subber2.in_c := 0.U
  //
  //    when(subber.out_c === 1.U){
  //      io.out_s := io.in_b
  //    }.elsewhen(subber.out_s > 0.U){
  //      io.out_s := io.in_a
  //    }.otherwise{
  //      when(subber2.out_c === 1.U){
  //        io.out_s := io.in_b
  //      }.otherwise{
  //        io.out_s := io.in_a
  //      }
  //    }
  //  }
}
