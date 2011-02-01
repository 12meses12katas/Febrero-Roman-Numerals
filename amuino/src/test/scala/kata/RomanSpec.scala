package kata

import org.specs.runner.JUnitSuiteRunner
import org.specs.util.DataTables
import org.junit.runner.RunWith
import org.specs._
import org.specs.runner.{ ConsoleRunner, JUnit4 }
import kata.RomanImplicits._

@RunWith(classOf[JUnitSuiteRunner])
class RomanSpecTest extends JUnit4(RomanSpec)

object RomanSpec extends Specification with DataTables {
  "A positive int" should {
    "calculate romans" in {
      "decimal" | "roman" |>
      1         ! "I"     |
      2         ! "II"    |
      3         ! "III"   |
      4         ! "IV"    |
      5         ! "V"     |
      1978      ! "MCMLXXVIII" | {
        (decimal, roman) => decimal.to_roman must_== roman
      }
    }
  }

  "A roman number string" should {
    "calculate integers" in {
       "decimal" | "roman" |>
      1         ! "I"     |
      2         ! "II"    |
      3         ! "III"   |
      4         ! "IV"    |
      5         ! "V"     |
      1978      ! "MCMLXXVIII" | {
        (decimal, roman) => roman.from_roman must_== decimal
      }
    }
  }

}