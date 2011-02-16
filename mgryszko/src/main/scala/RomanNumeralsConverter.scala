class RomanNumeralsConverter {
  private val romanSymbolsForEachDecimalPos = List("I", "V", "X", "L", "C", "D", "M", "", "").sliding(3, 2).toList

  def toRoman(decimal: Int): String = {
    val decimalSymbols = toDecimalSymbols(decimal)
    val decimalWithRomanSymbols = decimalSymbols.reverse.zip(romanSymbolsForEachDecimalPos)

    val initialRoman = ""
    decimalWithRomanSymbols.foldRight(initialRoman) { case ((decimalSymbol, romanSymbols), roman) => {
      roman + decimalToRomanSymbol(decimalSymbol, romanSymbols)
    } }
  }

  private def toDecimalSymbols(n: Int) = {
    def string2Int(s: String) = s.toInt
    val emptySymbols = List[Int]()
    n.toString().foldRight(emptySymbols)((c, symbols) => string2Int(c.toString) :: symbols)
  }

  private def decimalToRomanSymbol(decimal: Int, romanSymbols: List[String]) = {
    val (lowerSymbol, halfSymbol, upperSymbol) = (romanSymbols(0), romanSymbols(1), romanSymbols(2))

    decimal match {
      case d if (d <= 3) => lowerSymbol * d
      case 4 => lowerSymbol + halfSymbol
      case 5 => halfSymbol
      case d if (d >= 6 && d <= 8) => halfSymbol + lowerSymbol * (d - 5)
      case 9 => lowerSymbol + upperSymbol
      case _ => ""
    }
  }
}