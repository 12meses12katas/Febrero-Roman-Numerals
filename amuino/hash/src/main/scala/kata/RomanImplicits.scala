package kata

object Roman {
  val TO_DEC = Map(
    ("M", 1000),
    ("CM", 900),
    ("D", 500),
    ("CD", 400),
    ("C", 100),
    ("XC", 90),
    ("L", 50),
    ("XL", 40),
    ("X", 10),
    ("IX", 9),
    ("V", 5),
    ("IV", 4),
    ("I", 1)
  )
  val FROM_DEC = TO_DEC.map { _.swap }
  val DIVISOR_CANDIDATES = TO_DEC.values.toList.sorted.reverse
}
class RomanIntExtensions(delegate : Int) {

  def to_roman = {
    val roman_and_remaining = Roman.DIVISOR_CANDIDATES.foldLeft(("", delegate)) {
      (accumulator_and_remaining, candidate) => {
        val (accumulator, remaining) = accumulator_and_remaining
        if (remaining / candidate > 0) {
          val (quotient, module) = ( remaining / candidate, remaining % candidate)
          (accumulator + Roman.FROM_DEC(candidate) * quotient, module)
        } else
          (accumulator, remaining)
      }
    }
    roman_and_remaining._1
  }
}

class RomanStringExtensions(delegate : String) {

  def from_roman:Int = {
    val result:Tuple2[Int,Int] = delegate.reverse.foldLeft((0, 0)) {
      (accumulator_and_previous, roman) => {
        val (accumulator, previous) = accumulator_and_previous
        val current = Roman.TO_DEC(roman.toString)
        if(current < previous)
          (accumulator - current, current)
        else
          (accumulator + current, current)
      }
    }
    result._1
  }
}

object RomanImplicits {
  implicit def integerRomanExtensions(i:Int) = new RomanIntExtensions(i)
  implicit def stringRomanExtensions(s:String) = new RomanStringExtensions(s)
}