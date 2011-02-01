package kata

object Roman {
  val TO_DEC = Map(
    ("M", 1000),
    ("CM", 900),
    ("D", 500),
    ("CD", 400),
    ("C", 100),
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
    def to_roman(x:Int, candidates:List[Int]):String = {
      candidates match {
        case Nil => ""
        case divisor :: tl if (x / divisor > 0) =>
          (Roman.FROM_DEC(divisor) * (x/divisor)) + to_roman( x % divisor, candidates)
        case _ :: tl => to_roman(x, tl)
      }
    }
    to_roman(delegate, Roman.DIVISOR_CANDIDATES)
  }
}

class RomanStringExtensions(delegate : String) {

  def from_roman:Int = {
    val result:Tuple2[Int,Int] = delegate.foldLeft( (0, 0) ) {
      (accumulator, roman) => {
        val current = Roman.TO_DEC(roman.toString)
        val previous = accumulator._2
        if(previous < current)
          (accumulator._1 + current - 2*previous, current)
        else
          (accumulator._1 + current, current)
      }
    }
    result._1
  }
}

object RomanImplicits {
  implicit def integerRomanExtensions(i:Int) = new RomanIntExtensions(i)
  implicit def stringRomanExtensions(s:String) = new RomanStringExtensions(s)
}