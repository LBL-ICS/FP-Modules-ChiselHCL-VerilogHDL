package FP_Modules
import Binary_Modules.BinaryDesigns._
import chisel3._
import Chisel.log2Ceil

import scala.collection.mutable

object FloatingPointDesigns {
  //floating point adder
  class FP_adder(bw: Int) extends Module{
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0
    if (bw == 16){
      exponent = 5
      mantissa = 10
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
    }

    //    val reg_in_a = Reg(UInt(bw.W))
    //    val reg_in_b = Reg(UInt(bw.W))
    //    reg_in_a := io.in_a
    //    reg_in_b := io.in_b

    // sign part of ieee number
    val sign = Wire(Vec(2, UInt(1.W)))
    sign(0) := io.in_a(bw-1)
    sign(1) := io.in_b(bw-1)

    // exponent part of ieee number
    val exp = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      exp(0) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(0) := io.in_a(bw-2, mantissa)
    }
    when(io.in_b(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){
      exp(1) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(1) := io.in_b(bw-2, mantissa)
    }

    //fractional part of ieee number
    val frac = Wire(Vec(2, UInt(mantissa.W)))
    frac(0) := io.in_a(mantissa-1,0)
    frac(1) := io.in_b(mantissa-1,0)

    // 1.0 + fractional part
    val whole_frac = Wire(Vec(2, UInt((mantissa+1).W)))
    whole_frac(0) := 1.U ## frac(0)
    whole_frac(1) := 1.U ## frac(1)


    val out_s = Wire(UInt(1.W)) // sign of the larger input
    val out_frac = Wire(UInt(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp = Wire(UInt(exponent.W)) // exponent of larger inpui
    val sub_exp = Wire(UInt(exponent.W)) // temporarily holds the result of exp(0) - exp(1) (difference in exponents)
    // just set to 0 initially
    out_exp := 0.U
    sub_exp := 0.U
    out_frac := 0.U
    out_s := 0.U

    // subtracts the exponent of second input from the first input
    val subber = Module(new full_subber(exponent))
    subber.io.in_a := exp(0)
    subber.io.in_b := exp(1)
    subber.io.in_c := 0.U

    // in case the exponent difference is negative, take the twos complement of subtraction result
    val complement = Module(new twoscomplement(exponent))
    complement.io.in := subber.io.out_s

    // add the fractional/mantissa parts of the ieee numbers together
    val adder = Module(new full_adder(mantissa+1))
    adder.io.in_a := whole_frac(0)
    adder.io.in_b := whole_frac(1)
    adder.io.in_c := 0.U

    // these instantiations of twoscomplement are when there are negative number inputs
    val complementN_0 = Module(new twoscomplement(mantissa + 1))
    complementN_0.io.in := whole_frac(0)
    val complementN_1 = Module(new twoscomplement(mantissa + 1))
    complementN_1.io.in := whole_frac(1)

    // before we add the mantissa parts together, we need to align the exponents by shifting by the exponent difference
    val shifter = Module(new shifter(mantissa + 1))
    shifter.io.in_a := whole_frac(0)
    shifter.io.in_b := subber.io.out_s
    shifter.io.in_c := 1.U

    // if the exponent difference resulted in a borrow, then the second input has a larger exponent than the first
    when(subber.io.out_c === 1.U){
      out_exp := exp(1)
      sub_exp := complement.io.out // the exponent difference is in the negative form, so take the twos complement
      out_s := sign(1)
      out_frac := frac(1)
      shifter.io.in_a := whole_frac(0) // shift the smaller exponent input to the right for aligning
      shifter.io.in_b := complement.io.out
      shifter.io.in_c := 1.U
      adder.io.in_a := shifter.io.out_s // now we can add the two aligned mantissa/fractional parts
      complementN_0.io.in := shifter.io.out_s
    }.otherwise { // otherwise the first input has a larger exponent or the same as the second input
      out_exp := exp(0)
      sub_exp := subber.io.out_s // the exponent difference is not negative, so just leave it alone
      out_s := sign(0)
      out_frac := frac(0)
      shifter.io.in_a := whole_frac(1) // shift the smaller exponent input to the right for aligning
      shifter.io.in_b := subber.io.out_s
      shifter.io.in_c := 1.U
      adder.io.in_b := shifter.io.out_s // now we can dd the two aligned mantissa parts
      complementN_1.io.in := shifter.io.out_s
    }

    // if first input is negative, take twos complement
    when(sign(0) === 1.U && sign(1) === 0.U){
      adder.io.in_a := complementN_0.io.out
    }
    // if second input is negative, take twos complement, and compute mantissa addition
    when(sign(1) === 1.U && sign(0) === 0.U){
      adder.io.in_b := complementN_1.io.out
    }

    val new_s = Wire(UInt(1.W)) // will hold the final sign result
    val new_out_frac = Wire(UInt(mantissa.W)) // will hold the final mantissa result
    val new_out_exp = Wire(UInt(exponent.W)) // will hold the final exponent result
    new_s := (~adder.io.out_c & sign(0)) | (sign(0) & sign(1)) | (~adder.io.out_c & sign(1)) // this binary equation gives the new sign of the sum
    new_out_frac := 0.U // just temporarily setting to 0
    new_out_exp := 0.U

    // this twoscomplement is here to take the two complement of the mantissa sum in case the new sign of the sum is negative
    val complementN_2 = Module(new twoscomplement(mantissa + 1))
    complementN_2.io.in := adder.io.out_s


    val D = Wire(UInt(1.W)) // will indicate in which direction the mantissa sum will have to be shifted to be correct. (D = 0 indicates current exponent needs to be increased, D= 1 indicates that the current exponent needs to be decreased)
    val E = Wire(UInt(1.W)) // will indicate if there is no need for adjusting the mantissa sum and we can leave it as it is.

    // equation for describing the conditions in which the mantissa sum will need to be shifted
    D := (~adder.io.out_c) | (sign(0) ^ sign(1))

    // equation for the conditions in which the manstissa sum does not need to be shifted. This has higher priority than D
    E := (~adder.io.out_c & ~adder.io.out_s(mantissa)) | (~adder.io.out_c & ~(sign(0) ^ sign(1))) | (adder.io.out_c & adder.io.out_s(mantissa) & (sign(0) ^ sign(1)))

    val adder_result = Wire(UInt((mantissa+1).W))
    adder_result := adder.io.out_s
    when(new_s === 1.U && sign(0) =/= sign(1)){ // if the new sign of the sum is negative, then take the twos complement of the mantissa sum
      adder_result := complementN_2.io.out
    }

    // module finds the most significant 1 in the mantissa sum. This is used when E = 0, and D = 1, indicating a left shift
    val leadingOneFinder = Module(new leadingOneDetector(mantissa + 1))
    leadingOneFinder.io.in := adder_result
    val subber2 = Module(new full_subber(exponent))
    subber2.io.in_a := out_exp
    subber2.io.in_b := ((mantissa + 1).U - leadingOneFinder.io.out)
    subber2.io.in_c := 0.U
    when(io.in_a(bw-2,0) === 0.U && io.in_b(bw-2, 0) === 0.U){
      new_s := 0.U
      new_out_exp := 0.U
      new_out_frac := 0.U
    }.elsewhen( sub_exp >= mantissa.U){// if the difference between the exponents is too large, larger than mantissa size.
      new_s := out_s
      new_out_frac := out_frac
      new_out_exp := out_exp
    }.elsewhen(E === 1.U){ // if the exponent should stay the same size as the largest exponent
      new_out_exp := out_exp
      new_out_frac := adder_result(mantissa-1,0)
    }.elsewhen(D === 0.U){ // if exponent needs to be increased by 1
      when(out_exp === BigInt(2).pow(exponent).U - 2.U){
        new_out_exp := BigInt(2).pow(exponent).U - 2.U
        new_out_frac := BigInt(2).pow(mantissa).U - 1.U
      }.otherwise{
        new_out_exp := out_exp + 1.U
        new_out_frac := adder_result(mantissa,1)
      }
    }.elsewhen(D === 1.U){ // if exponent needs to be decreased by 1 or more
      when(leadingOneFinder.io.out === 1.U && adder_result === 0.U && ((1.U === (sign(0) ^ sign(1)) && io.in_a(bw-2, 0)===io.in_b(bw-2,0)))){
        new_out_exp := 0.U
      }.otherwise{
        when(subber2.io.out_c === 1.U){
          new_out_exp := 1.U(exponent.W)
          new_out_frac := BigInt(2).pow(mantissa-1).U(mantissa.W)
        }.otherwise {
          new_out_exp := subber2.io.out_s
          new_out_frac := adder_result(mantissa - 1, 0) << ((mantissa + 1).U - leadingOneFinder.io.out)
        }
      }
    }
    val reg_out_s = RegInit(0.U(bw.W))
    //val reg_out_s = Reg(UInt(bw.W))
    reg_out_s := new_s ## new_out_exp ## new_out_frac
    // combine all of the final results
    io.out_s := reg_out_s
  }

  // FP subtraction
  class FP_subber(bw: Int) extends Module{
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    // the subtraction is just a special case of the adder
    val FP_adder = Module(new FP_adder(bw))
    val adjusted_in_b = WireInit(0.U(bw.W))
    // the second input needs to have its sign bit inverted for using the adder for subtraction
    adjusted_in_b := (~io.in_b(bw-1)) ## io.in_b(bw-2,0)
    FP_adder.io.in_a := io.in_a
    FP_adder.io.in_b := adjusted_in_b
    io.out_s := FP_adder.io.out_s
  }

  // multiplier
  class FP_multiplier(bw: Int) extends Module{
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0

    if (bw == 16){
      exponent = 5
      mantissa = 10
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
    }
    // get the sign bit of the two inptus
    val s = Wire(Vec(2, UInt(1.W)))
    s(0) := io.in_a(bw-1)
    s(1) := io.in_b(bw-1)

    // get the exponents of the two inputs
    val exp = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      exp(0) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(0) := io.in_a(bw-2, mantissa)
    }
    when(io.in_b(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){
      exp(1) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(1) := io.in_b(bw-2, mantissa)
    }

    val exp_check = Wire(Vec(2, UInt(mantissa.W)))
    exp_check(0) := io.in_a(bw-2,mantissa)
    exp_check(1) := io.in_b(bw-2, mantissa)

    val cond_holder = Wire(UInt(mantissa.W))
    cond_holder :=  exp_check(0) + 1.U + ~((BigInt(2).pow(exponent - 1) - 1).U - exp_check(1))

    // get the mantissa parts of the two inputs
    val frac = Wire(Vec(2, UInt(mantissa.W)))
    frac(0) := io.in_a(mantissa - 1,0)
    frac(1) := io.in_b(mantissa - 1,0)

    // 1.0 + mantissa part of the two numbers
    val new_frac = Wire(Vec(2, UInt((mantissa + 1).W)))
    new_frac(0) := 1.U ## frac(0)
    new_frac(1) := 1.U ## frac(1)

    // use normal multiplier for multiplying the fractional/mantissa parts of the two inputs

    val multiplier = Module(new multiplier(mantissa + 1))
    multiplier.io.in_a := new_frac(0)
    multiplier.io.in_b := new_frac(1)

    // subtract exponent value of the second input from the bias value
    val subber = Module(new full_subber(exponent))
    subber.io.in_a := (BigInt(2).pow(exponent - 1) - 1).U // the bias
    subber.io.in_b := exp(1) // the second input
    subber.io.in_c := 0.U

    // will take twoscomplement of subtraction result
    val complementN = Module(new twoscomplement(exponent))
    complementN.io.in := subber.io.out_s

    // will add the twoscomplement result to the first input exponent
    val adderN = Module(new full_adder(exponent))
    adderN.io.in_a := exp(0) // the first input
    adderN.io.in_b := complementN.io.out // the twoscomplement result
    adderN.io.in_c := 0.U

    // equation for determining the sign of the multiplication result
    val new_s = Wire(UInt(1.W))
    new_s := s(0) ^ s(1)


    val new_exp = Wire(UInt(exponent.W))// holds the final exponent value
    new_exp := 0.U
    val new_mant = Wire(UInt(mantissa.W)) //holds the final mantissa value
    new_mant := 0.U
    val cond_check = Wire(UInt((mantissa ).W))
    cond_check := 0.U
    // if the msb of the mantissa multiplication result is 1, then we must add one to the exponent
    when(multiplier.io.out_s(((mantissa+1)*2) - 1) === 1.U){
      new_exp := adderN.io.out_s + 1.U
      cond_check := adderN.io.out_s + 1.U
      cond_holder :=  exp_check(0) + 2.U + ~((BigInt(2).pow(exponent - 1) - 1).U - exp_check(1))
      new_mant := multiplier.io.out_s(((mantissa+1)*2) - 2, mantissa+1)
    }.otherwise{ // otherwise, leave everything as it is and just store the results
      new_exp := adderN.io.out_s
      cond_check := adderN.io.out_s
      cond_holder :=  exp_check(0) + 1.U + ~((BigInt(2).pow(exponent - 1) - 1).U - exp_check(1))
      new_mant := multiplier.io.out_s(((mantissa+1)*2) - 2, mantissa+1) << (1).U
    }
    val reg_out_s = RegInit(0.U(bw.W))
    //val reg_out_s = Reg(UInt(bw.W))
    when(BigInt(2).pow(exponent).U - 2.U >= 1.U + ~(cond_holder) ){
      new_exp := 1.U(exponent.W)
      new_mant := BigInt(2).pow(mantissa-1).U(mantissa.W)
      reg_out_s := new_s ## new_exp ## new_mant
    }
      .elsewhen(cond_holder > BigInt(2).pow(exponent).U - 2.U){
        new_exp := BigInt(2).pow(exponent).U - 2.U
        new_mant := BigInt(2).pow(mantissa).U - 1.U
        reg_out_s := new_s ## new_exp ## new_mant
      }
    when(exp(0) === 0.U || exp(1) === 0.U){ // if multiplication by 0, output is 0
      reg_out_s := 0.U
    }.otherwise{ // otherwise just output the computed value
      reg_out_s := new_s ## new_exp ## new_mant
    }
    io.out_s := reg_out_s
  }

  // 9 cycle reciprocal
  class FP_reciprocal(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var magic = scala.BigInt("0", 10)
    var exponent = 0
    var mantissa = 0
    var limit = scala.BigInt("0", 10)
    // approximation of the reciprocal using the fast inverse square root trick
    // however has some limitations for really large numbers
    if (bw == 16) {
      exponent = 5
      mantissa = 10
      magic = scala.BigInt("23040", 10)
    } else if (bw == 32) {
      exponent = 8
      mantissa = 23
      magic = scala.BigInt("1597463007", 10)
    } else if (bw == 64) {
      exponent = 11
      mantissa = 52
      magic = scala.BigInt("6910469410427058089", 10)
    } else if (bw == 128) {
      exponent = 15
      mantissa = 112
      magic = scala.BigInt("127598099150064121557322682042419249152", 10)
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
    // we need to multiply the inverse square root by itself to get the reciprocal of the original input
    val exp = Wire(UInt(exponent.W))
    exp := io.in_a(bw - 2, mantissa) - 1.U

    val half_input = Wire(UInt(bw.W))
    half_input := io.in_a(bw - 1) ## exp ## io.in_a(mantissa - 1, 0)

    val half_input_reg_1 = RegInit(0.U(bw.W))
    half_input_reg_1 := half_input
    val result_reg_1 = RegInit(0.U(bw.W))
    result_reg_1 := result
    val input_reg_1 = RegInit(0.U(bw.W))
    input_reg_1 := io.in_a
    // applying one iteration of newtons method to improve the fast inverse square root approximation
    val multiplier1 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier1.io.in_a := 0.U(1.W) ## result(bw - 2, 0)
    multiplier1.io.in_b := 0.U(1.W) ## result(bw - 2, 0)

    val half_input_reg_2 = RegInit(0.U(bw.W))
    half_input_reg_2 := half_input_reg_1
    val result_reg_2 = RegInit(0.U(bw.W))
    result_reg_2 := result_reg_1
    val input_reg_2 = RegInit(0.U(bw.W))
    input_reg_2 := input_reg_1
    val multiplier2 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier2.io.in_a := multiplier1.io.out_s
    multiplier2.io.in_b := 0.U(1.W) ## half_input_reg_1(bw - 2, 0)


    val half_input_reg_3 = RegInit(0.U(bw.W))
    half_input_reg_3 := half_input_reg_2
    val result_reg_3 = RegInit(0.U(bw.W))
    result_reg_3 := result_reg_2
    val input_reg_3 = RegInit(0.U(bw.W))
    input_reg_3 := input_reg_2
    val sub = Module(new FP_subber(bw)) // once cycle
    sub.io.in_a := threehalfs
    sub.io.in_b := multiplier2.io.out_s

    val half_input_reg_4 = RegInit(0.U(bw.W))
    half_input_reg_4 := half_input_reg_3
    val input_reg_4 = RegInit(0.U(bw.W))
    input_reg_4 := input_reg_3
    val multiplier3 = Module(new FP_multiplier(bw)) // one cycle
    multiplier3.io.in_a := sub.io.out_s
    multiplier3.io.in_b := 0.U(1.W) ## result_reg_3(bw - 2, 0)


    val mult3_reg_1 = RegInit(0.U(bw.W))
    mult3_reg_1 := multiplier3.io.out_s
    val half_input_reg_5 = RegInit(0.U(bw.W))
    half_input_reg_5 := half_input_reg_4
    val input_reg_5 = RegInit(0.U(bw.W))
    input_reg_5 := input_reg_4
    val multiplier5 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier5.io.in_a := 0.U(1.W) ## multiplier3.io.out_s(bw - 2, 0)
    multiplier5.io.in_b := 0.U(1.W) ## multiplier3.io.out_s(bw - 2, 0)


    val mult3_reg_2 = RegInit(0.U(bw.W))
    mult3_reg_2 := mult3_reg_1
    val input_reg_6 = RegInit(0.U(bw.W))
    input_reg_6 := input_reg_5
    val multiplier6 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier6.io.in_a := multiplier5.io.out_s
    multiplier6.io.in_b := 0.U(1.W) ## half_input_reg_5(bw - 2, 0)


    val mult3_reg_3 = RegInit(0.U(bw.W))
    mult3_reg_3 := mult3_reg_2
    val input_reg_7 = RegInit(0.U(bw.W))
    input_reg_7 := input_reg_6
    val sub2 = Module(new FP_subber(bw)) // once cycle
    sub2.io.in_a := threehalfs
    sub2.io.in_b := multiplier6.io.out_s


    val mult3_reg_4 = RegInit(0.U(bw.W))
    mult3_reg_4 := mult3_reg_3
    val input_reg_8 = RegInit(0.U(bw.W))
    input_reg_8 := input_reg_7
    val multiplier7 = Module(new FP_multiplier(bw)) // one cycle
    multiplier7.io.in_a := sub2.io.out_s
    multiplier7.io.in_b := 0.U(1.W) ## mult3_reg_3(bw - 2, 0)

    val input_reg_9 = RegInit(0.U(bw.W))
    input_reg_9 := input_reg_8

    val multiplier4 = Module(new FP_multiplier(bw)) // one cycle
    multiplier4.io.in_a := 0.U(1.W) ## multiplier7.io.out_s(bw - 2, 0)
    multiplier4.io.in_b := 0.U(1.W) ## multiplier7.io.out_s(bw - 2, 0)
    io.out_s := input_reg_9(bw - 1) ## multiplier4.io.out_s(bw - 2, 0)
  }

  //10 cycle divider
  class FP_divider(bw: Int) extends Module{
    val io = IO(new Bundle{
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    val reciprocal = Module(new FP_reciprocal(bw)).io
    val multiplier = Module(new FP_multiplier(bw)).io
    val regs = RegInit(VecInit.fill(9)(0.U(bw.W)))
    regs(0) := io.in_a
    for(i <-0 until 8){
      regs(i+1) := regs(i)
    }
    reciprocal.in_a := io.in_b
    multiplier.in_a := regs(8)
    multiplier.in_b := reciprocal.out_s //10 cycles divider
    io.out_s := multiplier.out_s
  }

  class FP_square_root(bw: Int) extends Module {
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var magic = scala.BigInt("0", 10)
    var exponent = 0
    var mantissa = 0
    var limit = scala.BigInt("0", 10)
    if (bw == 16) {
      exponent = 5
      mantissa = 10
      magic = scala.BigInt("23040", 10)
    } else if (bw == 32) {
      exponent = 8
      mantissa = 23
      magic = scala.BigInt("1597463007", 10)
    } else if (bw == 64) {
      exponent = 11
      mantissa = 52
      magic = scala.BigInt("6910469410427058089", 10)
    } else if (bw == 128) {
      exponent = 15
      mantissa = 112
      magic = scala.BigInt("127598099150064121557322682042419249152", 10)
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
    // we need to multiply the inverse square root by itself to get the reciprocal of the original input
    val exp = Wire(UInt(exponent.W))
    exp := io.in_a(bw - 2, mantissa) - 1.U

    val half_input = Wire(UInt(bw.W))
    half_input := io.in_a(bw - 1) ## exp ## io.in_a(mantissa - 1, 0)

    val half_input_reg_1 = RegInit(0.U(bw.W))
    half_input_reg_1 := half_input
    val result_reg_1 = RegInit(0.U(bw.W))
    result_reg_1 := result
    val input_reg_1 = RegInit(0.U(bw.W))
    input_reg_1 := io.in_a
    // applying one iteration of newtons method to improve the fast inverse square root approximation
    val multiplier1 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier1.io.in_a := 0.U(1.W) ## result(bw - 2, 0)
    multiplier1.io.in_b := 0.U(1.W) ## result(bw - 2, 0)

    val half_input_reg_2 = RegInit(0.U(bw.W))
    half_input_reg_2 := half_input_reg_1
    val result_reg_2 = RegInit(0.U(bw.W))
    result_reg_2 := result_reg_1
    val input_reg_2 = RegInit(0.U(bw.W))
    input_reg_2 := input_reg_1
    val multiplier2 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier2.io.in_a := multiplier1.io.out_s
    multiplier2.io.in_b := 0.U(1.W) ## half_input_reg_1(bw - 2, 0)


    val half_input_reg_3 = RegInit(0.U(bw.W))
    half_input_reg_3 := half_input_reg_2
    val result_reg_3 = RegInit(0.U(bw.W))
    result_reg_3 := result_reg_2
    val input_reg_3 = RegInit(0.U(bw.W))
    input_reg_3 := input_reg_2
    val sub = Module(new FP_subber(bw)) // once cycle
    sub.io.in_a := threehalfs
    sub.io.in_b := multiplier2.io.out_s

    val half_input_reg_4 = RegInit(0.U(bw.W))
    half_input_reg_4 := half_input_reg_3
    val input_reg_4 = RegInit(0.U(bw.W))
    input_reg_4 := input_reg_3
    val multiplier3 = Module(new FP_multiplier(bw)) // one cycle
    multiplier3.io.in_a := sub.io.out_s
    multiplier3.io.in_b := 0.U(1.W) ## result_reg_3(bw - 2, 0)


    val mult3_reg_1 = RegInit(0.U(bw.W))
    mult3_reg_1 := multiplier3.io.out_s
    val half_input_reg_5 = RegInit(0.U(bw.W))
    half_input_reg_5 := half_input_reg_4
    val input_reg_5 = RegInit(0.U(bw.W))
    input_reg_5 := input_reg_4
    val multiplier5 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier5.io.in_a := 0.U(1.W) ## multiplier3.io.out_s(bw - 2, 0)
    multiplier5.io.in_b := 0.U(1.W) ## multiplier3.io.out_s(bw - 2, 0)


    val mult3_reg_2 = RegInit(0.U(bw.W))
    mult3_reg_2 := mult3_reg_1
    val input_reg_6 = RegInit(0.U(bw.W))
    input_reg_6 := input_reg_5
    val multiplier6 = Module(new FP_multiplier(bw)) // latency of one cycle
    multiplier6.io.in_a := multiplier5.io.out_s
    multiplier6.io.in_b := 0.U(1.W) ## half_input_reg_5(bw - 2, 0)


    val mult3_reg_3 = RegInit(0.U(bw.W))
    mult3_reg_3 := mult3_reg_2
    val input_reg_7 = RegInit(0.U(bw.W))
    input_reg_7 := input_reg_6
    val sub2 = Module(new FP_subber(bw)) // once cycle
    sub2.io.in_a := threehalfs
    sub2.io.in_b := multiplier6.io.out_s


    val mult3_reg_4 = RegInit(0.U(bw.W))
    mult3_reg_4 := mult3_reg_3
    val input_reg_8 = RegInit(0.U(bw.W))
    input_reg_8 := input_reg_7
    val multiplier7 = Module(new FP_multiplier(bw)) // one cycle
    multiplier7.io.in_a := sub2.io.out_s
    multiplier7.io.in_b := 0.U(1.W) ## mult3_reg_3(bw - 2, 0)

    val input_reg_9 = RegInit(0.U(bw.W))
    input_reg_9 := input_reg_8

    val multiplier4 = Module(new FP_multiplier(bw)) // one cycle
    multiplier4.io.in_a := input_reg_8(bw - 1) ## multiplier7.io.out_s(bw - 2, 0)
    multiplier4.io.in_b := input_reg_8
    io.out_s := input_reg_9(bw - 1) ## multiplier4.io.out_s(bw - 2, 0)
  }

  class FP_exponential(bw: Int) extends Module {
    val io = IO(new Bundle{
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0
    var bias = 0
    var highest_useful_value = 0.0
    if (bw == 16){
      exponent = 5
      mantissa = 10
      bias = 15
      highest_useful_value = 12.0
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
      bias = 127
      highest_useful_value = 90.0
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
      bias = 1023
      highest_useful_value = 712.0
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
      bias = 16383
      highest_useful_value = 11360.0
    }
    val max_val = convert_string_to_IEEE_754(highest_useful_value.toString, bw).U(bw.W)
    val inputvalue = Wire(UInt(bw.W))
    inputvalue := 0.U
    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      val ne = Wire(UInt(exponent.W))
      val nf = Wire(UInt(mantissa.W))
      ne := BigInt(2).pow(exponent).U - 2.U
      nf := BigInt(2).pow(mantissa).U - 1.U
      inputvalue := io.in_a(bw-1) ## ne ## nf
    }.otherwise{
      inputvalue := io.in_a
    }
    val comparator =  Module(new FP_comparator(bw)).io
    comparator.in_a := max_val
    comparator.in_b := 0.U(1.W) ## inputvalue(bw-2,0)
    val inputvalue2 = Wire(UInt(bw.W))
    inputvalue2 := 0.U
    when(comparator.out_s =/= max_val){
      inputvalue2 := max_val
    }.otherwise{
      inputvalue2 := inputvalue
    }
    val LN2 = convert_string_to_IEEE_754(Math.log(2).toString, bw).U(bw.W)
    val lN2_inverse = convert_string_to_IEEE_754((1/Math.log(2)).toString, bw).U(bw.W)
    val exp2 = convert_string_to_IEEE_754("1.0", bw).U(bw.W)
    val multiplier1 = Module(new FP_multiplier(bw)).io
    multiplier1.in_a := lN2_inverse
    multiplier1.in_b := 0.U(1.W) ## inputvalue2(bw-2,0)
    val get_whole_frac = Module(new FP_extract(bw)).io
    get_whole_frac.in_a := multiplier1.out_s

    val multiplier2 = Module(new FP_multiplier(bw)).io
    multiplier2.in_a := LN2
    multiplier2.in_b := get_whole_frac.out_frac
    val taylor_exp = Module(new FP_exponential2(bw)).io
    taylor_exp.in_a := multiplier2.out_s
    val multiplier3 = Module(new FP_multiplier(bw)).io
    val check_exp = Wire(UInt(bw.W))
    check_exp := (exp2(bw-2, mantissa)+get_whole_frac.out)
    val new_exp = Wire(UInt(exponent.W))
    new_exp := 0.U
    val new_frac = Wire(UInt(mantissa.W))
    new_frac := 0.U
    when(check_exp > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      new_exp := BigInt(2).pow(exponent).U - 2.U
      new_frac := BigInt(2).pow(mantissa).U - 1.U
    }.otherwise{
      new_exp := check_exp
      new_frac := exp2(mantissa-1, 0)
    }
    multiplier3.in_a := exp2(bw-1) ## new_exp ## new_frac
    multiplier3.in_b := taylor_exp.out_s


    val result = Wire(UInt(bw.W))
    result := multiplier3.out_s

    val recip = Module(new FP_reciprocal(bw)).io
    recip.in_a := result

    when(io.in_a(bw-1) === 1.U){
      io.out_s := recip.out_s
    }.otherwise{
      io.out_s := result
    }
  }

  // subcomponent of FP-exponential
  class FP_exponential2(bw: Int) extends Module{
    //require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var magic = scala.BigInt("0", 10)
    var exponent = 0
    var mantissa = 0
    var factorial_constants:Array[BigInt] = Array(scala.BigInt("15360", 10), scala.BigInt("15360", 10), scala.BigInt("14336", 10), scala.BigInt("12624", 10), scala.BigInt("10560", 10), scala.BigInt("8192", 10))
    // based on the taylor series approximation for e^x
    // im just using the first 6 terms of the series for now

    // some constants for each precision size
    if (bw == 16){
      exponent = 5
      mantissa = 10
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
      factorial_constants(0) = scala.BigInt("1065353216", 10) // 1/0!
      factorial_constants(1) = scala.BigInt("1065353216", 10) // 1/1!
      factorial_constants(2) = scala.BigInt("1056964608", 10) // 1/2!
      factorial_constants(3) = scala.BigInt("1042983616", 10) // 1/3!
      factorial_constants(4) = scala.BigInt("1026206368", 10) // 1/4!
      factorial_constants(5) = scala.BigInt("1007191808", 10) // 1/5!
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
      factorial_constants(0) = scala.BigInt("4607182418800017458", 10)
      factorial_constants(1) = scala.BigInt("4607182418800017458", 10)
      factorial_constants(2) = scala.BigInt("4602678819172646962", 10)
      factorial_constants(3) = scala.BigInt("4595172831803295138", 10)
      factorial_constants(4) = scala.BigInt("4586165625342794738", 10)
      factorial_constants(5) = scala.BigInt("4575957269229997874", 10)
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
      factorial_constants(0) = scala.BigInt("85065399433376083102600000000000000000", 10)
      factorial_constants(1) = scala.BigInt("85065399433376083102600000000000000000", 10)
      factorial_constants(2) = scala.BigInt("85060207136517548275000000000000000000", 10)
      factorial_constants(3) = scala.BigInt("85051553322266115185296344079871440000", 10)
      factorial_constants(4) = scala.BigInt("85041168720241370556640618099810700000", 10)
      factorial_constants(5) = scala.BigInt("85029399286952242334358719431136460000", 10)
    }

    // get the inverse factorial values
    val inverse_factorials = Wire(Vec(6, UInt(bw.W)))
    inverse_factorials(0) := factorial_constants(0).U
    inverse_factorials(1) := factorial_constants(1).U
    inverse_factorials(2) := factorial_constants(2).U
    inverse_factorials(3) := factorial_constants(3).U
    inverse_factorials(4) := factorial_constants(4).U
    inverse_factorials(5) := factorial_constants(5).U

    val multiplier0 = Module(new FP_multiplier(bw)) // 1 cycle
    multiplier0.io.in_a := inverse_factorials(5)
    multiplier0.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)

    val adder0 = Module(new FP_adder(bw)) // 2 cycle
    adder0.io.in_a := inverse_factorials(4)
    adder0.io.in_b := multiplier0.io.out_s
    val multiplier1 = Module(new FP_multiplier(bw)) // 3 cycle
    multiplier1.io.in_a := adder0.io.out_s
    multiplier1.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)

    val adder1 = Module(new FP_adder(bw)) // 4 cycle
    adder1.io.in_a := inverse_factorials(3)
    adder1.io.in_b := multiplier1.io.out_s
    val multiplier2 = Module(new FP_multiplier(bw)) // 5 cycle
    multiplier2.io.in_a := adder1.io.out_s
    multiplier2.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)

    val adder2 = Module(new FP_adder(bw)) // 6 cycle
    adder2.io.in_a := inverse_factorials(2)
    adder2.io.in_b := multiplier2.io.out_s
    val multiplier3 = Module(new FP_multiplier(bw)) // 7 cycle
    multiplier3.io.in_a := adder2.io.out_s
    multiplier3.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)

    val adder3 = Module(new FP_adder(bw)) // 8 cycle
    adder3.io.in_a := inverse_factorials(1)
    adder3.io.in_b := multiplier3.io.out_s
    val multiplier4 = Module(new FP_multiplier(bw)) // 9 cycle
    multiplier4.io.in_a := adder3.io.out_s
    multiplier4.io.in_b := 0.U(1.W) ## io.in_a(bw-2,0)

    val adder4 = Module(new FP_adder(bw)) // 10 cycle
    adder4.io.in_a := inverse_factorials(0)
    adder4.io.in_b := multiplier4.io.out_s

    val result = Wire(UInt(bw.W))
    result := adder4.io.out_s

    val recip = Module(new FP_reciprocal(bw))
    recip.io.in_a := adder4.io.out_s

    when(io.in_a(bw-1) === 1.U){ // if the sign of the input was negative, then just take the reciprocal
      result := recip.io.out_s
    }

    io.out_s := result
  }

  // this module is used for separating the whole part from the fractional part of the floating point number
  class FP_extract(bw:Int) extends Module{
    val io = IO(new Bundle{
      val in_a = Input(UInt(bw.W))
      val out_frac = Output(UInt(bw.W))
      val out = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0
    var bias = 0
    if (bw == 16){
      exponent = 5
      mantissa = 10
      bias = 15
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
      bias = 127
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
      bias = 1023
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
      bias = 16383
    }
    val result_frac = Wire(UInt(bw.W))
    val expr = Wire(UInt(bw.W))
    expr := 0.U
    val exp = Wire(UInt(exponent.W))
    exp := io.in_a(bw-2, mantissa)
    val mant = Wire(UInt(mantissa.W))
    mant := io.in_a(mantissa-1, 0)
    val whole_mant = Wire(UInt((mantissa+1).W))
    whole_mant := 1.U(1.W) ## io.in_a(mantissa-1,0)
    result_frac := io.in_a
    val leadingOne = Module(new leadingOneDetector(mantissa))
    leadingOne.io.in := mant
    when(exp > bias.U) {
      val subres = Wire(UInt(exponent.W))
      subres := exp - bias.U
      expr := whole_mant >> (mantissa.U - subres)
      val firstshiftf = Wire(UInt(mantissa.W))
      firstshiftf := mant << (subres)
      leadingOne.io.in := firstshiftf
      val new_exp = Wire(UInt(exponent.W))
      new_exp := bias.U - (mantissa.U - leadingOne.io.out + 1.U)
      val new_mant = Wire(UInt(mantissa.W))
      new_mant := firstshiftf << (mantissa.U - leadingOne.io.out + 1.U)
      result_frac := io.in_a(bw-1) ## new_exp ## new_mant
    }.elsewhen(exp < bias.U){
      result_frac := io.in_a
    }.otherwise{
      expr := 1.U
      val new_exp = Wire(UInt(exponent.W))
      new_exp := exp - (mantissa.U - leadingOne.io.out + 1.U)
      val new_mant = Wire(UInt(mantissa.W))
      new_mant := mant << (mantissa.U - leadingOne.io.out + 1.U)
      result_frac := io.in_a(bw-1) ## new_exp ## new_mant
    }
    io.out_frac := result_frac
    io.out := expr
  }

  // this module is used for comparing a pair of numbers (determines which one is larger)
  class FP_comparator(bw: Int) extends Module{
    val io = IO(new Bundle{
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0
    var bias = 0
    if (bw == 16){
      exponent = 5
      mantissa = 10
      bias = 15
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
      bias = 127
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
      bias = 1023
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
      bias = 16383
    }
    val sign = Wire(Vec(2, UInt(1.W)))
    sign(0) := io.in_a(bw-1)
    sign(1) := io.in_b(bw-1)

    // exponent part of ieee number
    val exp = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      exp(0) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(0) := io.in_a(bw-2, mantissa)
    }
    when(io.in_b(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){
      exp(1) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(1) := io.in_b(bw-2, mantissa)
    }

    //fractional part of ieee number
    val frac = Wire(Vec(2, UInt(mantissa.W)))
    frac(0) := io.in_a(mantissa-1,0)
    frac(1) := io.in_b(mantissa-1,0)

    // 1.0 + fractional part
    val whole_frac = Wire(Vec(2, UInt((mantissa+1).W)))
    whole_frac(0) := 1.U ## frac(0)
    whole_frac(1) := 1.U ## frac(1)

    val subber = Module(new full_subber(exponent)).io
    subber.in_a := exp(0)
    subber.in_b := exp(1)
    subber.in_c := 0.U

    val subber2 = Module(new full_subber(mantissa)).io
    subber2.in_a := frac(0)
    subber2.in_b := frac(1)
    subber2.in_c := 0.U

    when(subber.out_c === 1.U){
      io.out_s := io.in_b
    }.elsewhen(subber.out_s > 0.U){
      io.out_s := io.in_a
    }.otherwise{
      when(subber2.out_c === 1.U){
        io.out_s := io.in_b
      }.otherwise{
        io.out_s := io.in_a
      }
    }
  }


  //Experimental Designs

  // 7 cycle adder
  class FP_adder_multi_cycle(bw: Int) extends Module{
    require(bw == 16 || bw == 32 || bw == 64 || bw == 128)
    val io = IO(new Bundle() {
      val in_a = Input(UInt(bw.W))
      val in_b = Input(UInt(bw.W))
      val out_s = Output(UInt(bw.W))
    })
    var exponent = 0
    var mantissa = 0
    if (bw == 16){
      exponent = 5
      mantissa = 10
    }else if (bw == 32){
      exponent = 8
      mantissa = 23
    }else if(bw == 64){
      exponent = 11
      mantissa = 52
    }else if(bw == 128){
      exponent = 15
      mantissa = 112
    }

    //    val reg_in_a = Reg(UInt(bw.W))
    //    val reg_in_b = Reg(UInt(bw.W))
    //    reg_in_a := io.in_a
    //    reg_in_b := io.in_b

    // sign part of ieee number
    val sign = Wire(Vec(2, UInt(1.W)))
    sign(0) := io.in_a(bw-1)
    sign(1) := io.in_b(bw-1)

    // exponent part of ieee number
    val exp = Wire(Vec(2, UInt(exponent.W)))
    when(io.in_a(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){ // there is a maximum number according to IEEE 754 standards
      exp(0) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(0) := io.in_a(bw-2, mantissa)
    }
    when(io.in_b(bw-2, mantissa) > BigInt(2).pow(exponent).U - 2.U){
      exp(1) := BigInt(2).pow(exponent).U - 2.U
    }.otherwise{
      exp(1) := io.in_b(bw-2, mantissa)
    }

    //fractional part of ieee number
    val frac = Wire(Vec(2, UInt(mantissa.W)))
    frac(0) := io.in_a(mantissa-1,0)
    frac(1) := io.in_b(mantissa-1,0)

    // 1.0 + fractional part
    val whole_frac = Wire(Vec(2, UInt((mantissa+1).W)))
    whole_frac(0) := 1.U ## frac(0)
    whole_frac(1) := 1.U ## frac(1)


    val out_s = RegInit(0.U(1.W)) // sign of the larger input
    val out_frac = RegInit(0.U(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp = RegInit(0.U(exponent.W)) // exponent of larger inpui
    val sub_exp = RegInit(0.U(exponent.W)) // temporarily holds the result of exp(0) - exp(1) (difference in exponents)

    // subtracts the exponent of second input from the first input
    val subber = Module(new full_subber(exponent))
    subber.io.in_a := exp(0)
    subber.io.in_b := exp(1)
    subber.io.in_c := 0.U

    // in case the exponent difference is negative, take the twos complement of subtraction result
    val exp_diff_c = RegInit(0.U(1.W)) // 1st clock cycle
    exp_diff_c := subber.io.out_c
    val complement = Module(new twoscomplement(exponent))
    when(subber.io.out_c === 1.U){
      complement.io.in := subber.io.out_s
      sub_exp := complement.io.out
    }.otherwise{
      complement.io.in := 0.U
      sub_exp := subber.io.out_s
    }

    // add the fractional/mantissa parts of the ieee numbers together
    // these instantiations of twoscomplement are when there are negative number inputs

    // before we add the mantissa parts together, we need to align the exponents by shifting by the exponent difference
    val shifter = Module(new shifter(mantissa + 1))
    val temp_wf = RegInit(VecInit.fill(2)(0.U((mantissa+1).W)))
    temp_wf := whole_frac
    // if the exponent difference resulted in a borrow, then the second input has a larger exponent than the first
    val temp_sign = RegInit(VecInit.fill(2)(0.U(1.W))) // part of first cycle
    temp_sign := sign
    val temp_exp = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    temp_exp := exp
    val temp_frac = RegInit(VecInit.fill(2)(0.U(mantissa.W)))
    temp_frac := frac

    val inps = RegInit(VecInit.fill(2)(0.U(bw.W)))
    inps(0) := io.in_a
    inps(1) := io.in_b

    // end of 1 cc
    val out_s2 = RegInit(0.U(1.W)) // sign of the larger input
    val out_frac2 = RegInit(0.U(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp2 = RegInit(0.U(exponent.W)) // exponent of larger inpui
    val sub_exp2 = RegInit(0.U(exponent.W))
    sub_exp2 := sub_exp
    val adder = Module(new full_adder(mantissa+1))
    adder.io.in_c := 0.U
    val complementN_0 = Module(new twoscomplement(mantissa + 1))
    val complementN_1 = Module(new twoscomplement(mantissa + 1))
    when(exp_diff_c === 1.U){
      out_exp2 := temp_exp(1) // reference exponent // second clockcycle
      out_s2 := temp_sign(1) // reference sign
      out_frac2 := temp_frac(1) // reference frac
      // part of the same cycle
      shifter.io.in_a := temp_wf(0) // shift the smaller exponent input to the right for aligning
      shifter.io.in_b := sub_exp
      shifter.io.in_c := 1.U
      complementN_0.io.in := shifter.io.out_s
      complementN_1.io.in := temp_wf(1)
      // if first input is negative, take twos complement
      when(temp_sign(0) === 1.U && temp_sign(1) === 0.U){
        adder.io.in_a := complementN_0.io.out
        adder.io.in_b := temp_wf(1)
      }.elsewhen(temp_sign(1) === 1.U && temp_sign(0) === 0.U){
        adder.io.in_a := shifter.io.out_s
        adder.io.in_b := complementN_1.io.out
      }.otherwise{
        adder.io.in_a := shifter.io.out_s // now we can add the two aligned mantissa/fractional parts
        adder.io.in_b := temp_wf(1)
      }
    }.otherwise { // otherwise the first input has a larger exponent or the same as the second input
      out_exp2 := temp_exp(0) // reference exp
      out_s2 := temp_sign(0) // reference sign
      out_frac2 := temp_frac(0) // reference frac
      // part of the same cycle
      shifter.io.in_a := temp_wf(1) // shift the smaller exponent input to the right for aligning
      shifter.io.in_b := sub_exp
      shifter.io.in_c := 1.U
      complementN_0.io.in := temp_wf(0)
      complementN_1.io.in := shifter.io.out_s
      when(temp_sign(0) === 1.U && temp_sign(1) === 0.U){
        adder.io.in_a := complementN_0.io.out
        adder.io.in_b := shifter.io.out_s
      }.elsewhen(temp_sign(1) === 1.U && temp_sign(0) === 0.U){
        adder.io.in_a := temp_wf(0)
        adder.io.in_b := complementN_1.io.out
      }.otherwise{
        adder.io.in_a := temp_wf(0) // now we can add the two aligned mantissa/fractional parts
        adder.io.in_b := shifter.io.out_s
      }
    }
    val inps2 = RegInit(VecInit.fill(2)(0.U(bw.W)))
    inps2 := inps


    val temp_wf2 = RegInit(VecInit.fill(2)(0.U((mantissa+1).W)))
    temp_wf2 := temp_wf
    val temp_sign2 = RegInit(VecInit.fill(2)(0.U(1.W)))
    temp_sign2 := temp_sign
    val temp_exp2 = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    temp_exp2 := temp_exp
    val temp_frac2 = RegInit(VecInit.fill(2)(0.U(mantissa.W)))
    temp_frac2 := temp_frac

    val adder_frac_results = RegInit(0.U((mantissa + 1).W))
    adder_frac_results := adder.io.out_s
    val adder_frac_results_c = RegInit(0.U(1.W))
    adder_frac_results_c := adder.io.out_c
    // end of 2 clock cycle

    //start of 3 clock cycle
    val new_s = RegInit(0.U(1.W)) // will hold the final sign result
    val new_out_frac = RegInit(0.U(mantissa.W)) // will hold the final mantissa result
    val new_out_exp = RegInit(0.U(exponent.W)) // will hold the final exponent result
    new_s := (~adder_frac_results_c & temp_sign2(0)) | (temp_sign2(0) & temp_sign2(1)) | (~adder_frac_results_c & temp_sign2(1)) // this binary equation gives the new sign of the sum
    new_out_frac := 0.U // just temporarily setting to 0
    new_out_exp := 0.U

    val out_s3 = RegInit(0.U(1.W)) // sign of the larger input
    val out_frac3 = RegInit(0.U(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp3 = RegInit(0.U(exponent.W)) // exponent of larger inpui
    val sub_exp3 = RegInit(0.U(exponent.W))
    out_s3 := out_s2
    out_frac3 := out_frac2
    out_exp3 := out_exp2
    sub_exp3 := sub_exp2

    val temp_wf3 = RegInit(VecInit.fill(2)(0.U((mantissa+1).W)))
    temp_wf3 := temp_wf2
    val temp_sign3 = RegInit(VecInit.fill(2)(0.U(1.W)))
    temp_sign3 := temp_sign2
    val temp_exp3 = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    temp_exp3 := temp_exp2
    val temp_frac3 = RegInit(VecInit.fill(2)(0.U(mantissa.W)))
    temp_frac3 := temp_frac2

    val adder_frac_results2 = RegInit(0.U((mantissa + 1).W))
    adder_frac_results2 := adder_frac_results
    val adder_frac_results_c2 = RegInit(0.U(1.W))
    adder_frac_results_c2 := adder_frac_results_c

    val inps3 = RegInit(VecInit.fill(2)(0.U(bw.W)))
    inps3 := inps2
    // end of 3 clock cycle

    // start of 4 clock cycle
    val adder_result = RegInit(0.U((mantissa+1).W))
    val adder_result_c = RegInit(0.U(1.W))
    adder_result_c := adder_frac_results_c2
    val complementN_2 = Module(new twoscomplement(mantissa + 1))

    when(new_s === 1.U && temp_sign3(0) =/= temp_sign3(1)){ // if the new sign of the sum is negative, then take the twos complement of the mantissa sum
      complementN_2.io.in := adder_frac_results2
      adder_result := complementN_2.io.out
    }.otherwise{
      complementN_2.io.in := 0.U
      adder_result := adder_frac_results2
    }

    val out_s4 = RegInit(0.U(1.W)) // sign of the larger input
    val out_frac4 = RegInit(0.U(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp4 = RegInit(0.U(exponent.W)) // exponent of larger inpui
    val sub_exp4 = RegInit(0.U(exponent.W))
    out_s4 := out_s3
    out_frac4 := out_frac3
    out_exp4 := out_exp3
    sub_exp4 := sub_exp3

    val temp_wf4 = RegInit(VecInit.fill(2)(0.U((mantissa+1).W)))
    temp_wf4 := temp_wf3
    val temp_sign4 = RegInit(VecInit.fill(2)(0.U(1.W)))
    temp_sign4 := temp_sign3
    val temp_exp4 = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    temp_exp4 := temp_exp3
    val temp_frac4 = RegInit(VecInit.fill(2)(0.U(mantissa.W)))
    temp_frac4 := temp_frac3

    val adder_frac_results3 = RegInit(0.U((mantissa + 1).W))
    adder_frac_results3 := adder_frac_results2
    val adder_frac_results_c3 = RegInit(0.U(1.W))
    adder_frac_results_c3 := adder_frac_results_c2

    val new_s2 = RegInit(0.U(1.W)) // will hold the final sign result
    val new_out_frac2 = RegInit(0.U(mantissa.W)) // will hold the final mantissa result
    val new_out_exp2 = RegInit(0.U(exponent.W)) // will hold the final exponent result
    new_s2 := new_s
    new_out_frac2 := new_out_frac
    new_out_exp2 := new_out_exp

    val inps4 = RegInit(VecInit.fill(2)(0.U(bw.W)))
    inps4 := inps3
    // end of 4 clock cycle

    // start clock cycle 5
    val D = RegInit(0.U(1.W))  // will indicate in which direction the mantissa sum will have to be shifted to be correct. (D = 0 indicates current exponent needs to be increased, D= 1 indicates that the current exponent needs to be decreased)
    val E = RegInit(0.U(1.W))  // will indicate if there is no need for adjusting the mantissa sum and we can leave it as it is.

    // equation for describing the conditions in which the mantissa sum will need to be shifted
    D := (~adder_frac_results_c3) | (temp_sign4(0) ^ temp_sign4(1))

    // equation for the conditions in which the manstissa sum does not need to be shifted. This has higher priority than D
    E := (~adder_frac_results_c3 & ~adder_frac_results3(mantissa)) | (~adder_frac_results_c3 & ~(temp_sign4(0) ^ temp_sign4(1))) | (adder_frac_results_c3 & adder_frac_results3(mantissa) & (temp_sign4(0) ^ temp_sign4(1)))

    val adder_result2 = RegInit(0.U((mantissa+1).W))
    val adder_result_c2 = RegInit(0.U(1.W))
    adder_result2 := adder_result
    adder_result_c2 := adder_result_c

    val out_s5 = RegInit(0.U(1.W)) // sign of the larger input
    val out_frac5 = RegInit(0.U(mantissa.W)) // mantissa/fractional part of larger input
    val out_exp5 = RegInit(0.U(exponent.W)) // exponent of larger inpui
    val sub_exp5 = RegInit(0.U(exponent.W))
    out_s5 := out_s4
    out_frac5 := out_frac4
    out_exp5 := out_exp4
    sub_exp5 := sub_exp4

    val temp_wf5 = RegInit(VecInit.fill(2)(0.U((mantissa+1).W)))
    temp_wf5 := temp_wf4
    val temp_sign5 = RegInit(VecInit.fill(2)(0.U(1.W)))
    temp_sign5 := temp_sign4
    val temp_exp5 = RegInit(VecInit.fill(2)(0.U(exponent.W)))
    temp_exp5 := temp_exp4
    val temp_frac5 = RegInit(VecInit.fill(2)(0.U(mantissa.W)))
    temp_frac5 := temp_frac4

    val adder_frac_results4 = RegInit(0.U((mantissa + 1).W))
    adder_frac_results4 := adder_frac_results3
    val adder_frac_results_c4 = RegInit(0.U(1.W))
    adder_frac_results_c4 := adder_frac_results_c3

    val new_s3 = RegInit(0.U(1.W)) // will hold the final sign result
    val new_out_frac3 = RegInit(0.U(mantissa.W)) // will hold the final mantissa result
    val new_out_exp3 = RegInit(0.U(exponent.W)) // will hold the final exponent result
    new_s3 := new_s2
    new_out_frac3 := new_out_frac2
    new_out_exp3 := new_out_exp2

    val inps5 = RegInit(VecInit.fill(2)(0.U(bw.W)))
    inps5 := inps4
    // end of cycle 5

    // this twoscomplement is here to take the two complement of the mantissa sum in case the new sign of the sum is negative

    // 6 clock cycle
    // module finds the most significant 1 in the mantissa sum. This is used when E = 0, and D = 1, indicating a left shift
    val leadingOneFinder = Module(new leadingOneDetector(mantissa + 1))
    leadingOneFinder.io.in := adder_result2
    val subber2 = Module(new full_subber(exponent))
    subber2.io.in_a := out_exp5
    subber2.io.in_b := ((mantissa + 1).U - leadingOneFinder.io.out)
    subber2.io.in_c := 0.U

    val new_s4 = RegInit(0.U(1.W)) // will hold the final sign result
    val new_out_frac4 = RegInit(0.U(mantissa.W)) // will hold the final mantissa result
    val new_out_exp4 = RegInit(0.U(exponent.W))

    when(inps5(0)(bw-2,0) === 0.U && inps5(1)(bw-2, 0) === 0.U){
      new_s4 := 0.U
      new_out_exp4 := 0.U
      new_out_frac4 := 0.U
    }.elsewhen( sub_exp5 >= mantissa.U){// if the difference between the exponents is too large, larger than mantissa size.
      new_s4 := out_s5
      new_out_frac4 := out_frac5
      new_out_exp4 := out_exp5
    }.elsewhen(E === 1.U){ // if the exponent should stay the same size as the largest exponent
      new_s4 := new_s3
      new_out_exp4 := out_exp5
      new_out_frac4 := adder_result2(mantissa-1,0)
    }.elsewhen(D === 0.U){ // if exponent needs to be increased by 1
      new_s4 := new_s3
      when(out_exp5 === BigInt(2).pow(exponent).U - 2.U){
        new_out_exp4 := BigInt(2).pow(exponent).U - 2.U
        new_out_frac4 := BigInt(2).pow(mantissa).U - 1.U
      }.otherwise{
        new_out_exp4 := out_exp5 + 1.U
        new_out_frac4 := adder_result2(mantissa,1)
      }
    }.elsewhen(D === 1.U){ // if exponent needs to be decreased by 1 or more
      new_s4 := new_s3
      when(leadingOneFinder.io.out === 1.U && adder_result2 === 0.U && ((1.U === (temp_sign5(0) ^ temp_sign5(1)) && inps5(0)(bw-2, 0)===inps5(1)(bw-2,0)))){
        new_out_exp4 := 0.U
      }.otherwise{
        when(subber2.io.out_c === 1.U){
          new_out_exp4 := 1.U(exponent.W)
          new_out_frac4 := BigInt(2).pow(mantissa-1).U(mantissa.W)
        }.otherwise {
          new_out_exp4 := subber2.io.out_s
          new_out_frac4 := adder_result2(mantissa - 1, 0) << ((mantissa + 1).U - leadingOneFinder.io.out)
        }
      }
    }
    // 7 clock cycle
    val reg_out_s = RegInit(0.U(bw.W))
    //val reg_out_s = Reg(UInt(bw.W))
    reg_out_s := new_s4 ## new_out_exp4 ## new_out_frac4
    // combine all of the final results
    io.out_s := reg_out_s
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
}
