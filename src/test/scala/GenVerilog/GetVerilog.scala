package GenVerilog
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import chiseltest.WriteVcdAnnotation
import chiseltest.VerilatorBackendAnnotation
import chisel3.stage.ChiselGeneratorAnnotation
import circt.stage.{ChiselStage, FirtoolOption}
import FP_Modules.FloatingPointDesigns._
import Binary_Modules.BinaryDesigns._

object GetVerilog {

  class BasicTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "DUT"
    it should "do something" in {
      // simple test to see output of multiplier module
      // since vcd is enabled, look for a test_run_dir directory to be created, it will have vcd files when run
//      test(new FP_mult_3ccs(32)).withAnnotations(Seq(VerilatorBackendAnnotation,WriteVcdAnnotation)) {c=>
      test(new FP_mult_3ccs(32)).withAnnotations(Seq(WriteVcdAnnotation)) {c=>
        c.io.in_en.poke(true.B)
        c.io.in_valid.poke(true.B)
        c.io.in_a.poke(convert_string_to_IEEE_754("8.555",32).U)
        c.io.in_b.poke(convert_string_to_IEEE_754("0.258",32).U)
        var ccs = 0
        for(i <- 0 until 30){
          ccs += 1
          c.clock.step(1)
          println(s"clock cycle: ${ccs}")
          println(s"out valid: ${c.io.out_valid.peek().litValue}")
          println(s"out result: ${convert_IEEE754_to_Decimal(c.io.out_s.peek().litValue, 32)}")
          println()
        }
      }
    }
  }
  def main(args:Array[String]): Unit = {
    // execute test
    val t = new BasicTest
    t.execute()

    // Basic way to generate verilog
    (new ChiselStage).execute(
      Array("--target", "systemverilog"),
      Seq(ChiselGeneratorAnnotation(() => new FP_mult_3ccs(32))
        ,
        FirtoolOption("--disable-all-randomization"),
        FirtoolOption("-strip-debug-info")
      ),
    )

  }
}
