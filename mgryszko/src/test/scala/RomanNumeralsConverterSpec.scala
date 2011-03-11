import org.specs._
import org.specs.util.DataTables

class RomanNumeralsConverterSpec extends SpecificationWithJUnit with DataTables {
  "roman numerals converter" should {
    val converter = new RomanNumeralsConverter

    "convert decimal to roman" in {
      "decimalNum" | "romanNum" |>
      1    ! "I" |
      3    ! "III" |
      4    ! "IV" |
      5    ! "V" |
      6    ! "VI" |
      8    ! "VIII" |
      9    ! "IX" |
      10   ! "X" |
      11   ! "XI" |
      30   ! "XXX" |
      33   ! "XXXIII" |
      40   ! "XL" |
      44   ! "XLIV" |
      50   ! "L" |
      55   ! "LV" |
      60   ! "LX" |
      66   ! "LXVI" |
      80   ! "LXXX" |
      88   ! "LXXXVIII" |
      90   ! "XC" |
      99   ! "XCIX" |
      100  ! "C" |
      300  ! "CCC" |
      400  ! "CD" |
      500  ! "D" |
      600  ! "DC" |
      800  ! "DCCC" |
      900  ! "CM" |
      999  ! "CMXCIX" |
      1000 ! "M" |
      1498 ! "MCDXCVIII" |
      3000 ! "MMM" | { (decimal: Int, roman: String) =>

        converter.toRoman(decimal) must_== roman
      }
    }
  }
}