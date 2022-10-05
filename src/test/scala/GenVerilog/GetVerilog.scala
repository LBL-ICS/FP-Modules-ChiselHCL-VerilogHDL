package GenVerilog
import chisel3.tester.RawTester.test
import chisel3._
import chisel3.tester._
import java.io.PrintWriter
import FP_Modules.FloatingPointDesigns._

object GetVerilog {
  def main(args:Array[String]): Unit = {
    val pw = new PrintWriter("FP_adder.v")
    pw.println(getVerilogString(new FP_adder(32)))
    pw.close()
    val pw2 = new PrintWriter("FP_subber.v")
    pw2.println(getVerilogString(new FP_subber(32)))
    pw2.close()
    val pw3 = new PrintWriter("FP_multiplier.v")
    pw3.println(getVerilogString(new FP_multiplier(32)))
    pw3.close()
    val pw4 = new PrintWriter("FP_divider.v")
    pw4.println(getVerilogString(new FP_divider(32)))
    pw4.close()
    val pw5 = new PrintWriter("FP_reciprocal.v")
    pw5.println(getVerilogString(new FP_reciprocal(32)))
    pw5.close()
    val pw6 = new PrintWriter("FP_square_root.v")
    pw6.println(getVerilogString(new FP_square_root(32)))
    pw6.close()
    val pw7 = new PrintWriter("FP_exponential.v")
    pw7.println(getVerilogString(new FP_exponential(32)))
    pw7.close()
  }
}
