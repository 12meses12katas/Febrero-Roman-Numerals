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
  "Converting to roman from integer" should {
    "a positive number should succeed" in {
      "decimal" | "roman" |>
      1         ! "I"     |
      2         ! "II"    |
      3         ! "III"   |
      4         ! "IV"    |
      5         ! "V"     |
      1978      ! "MCMLXXVIII" |
      1999      ! "MCMXCIX" |
 	  3999      ! "MMMCMXCIX" | {
        (decimal, roman) => decimal.to_roman must_== roman
      }
    }
	"a negative number should fail" in {
		(-1).to_roman must(throwA[NumberFormatException])
	}
	"zero should fail" in {
		0.to_roman must(throwA[NumberFormatException])
	}
	"4000 should fail" in {
		4000.to_roman must(throwA[NumberFormatException])
	}

  }

  "Converting from arabic to roman" should {
    "succeed with valid romans" in {
       "decimal" | "roman" |>
      1         ! "I"     |
      2         ! "II"    |
      3         ! "III"   |
      4         ! "IV"    |
      5         ! "V"     |
      1978      ! "MCMLXXVIII" |
      1999      ! "MCMXCIX" |
 	  3999      ! "MMMCMXCIX" | {
        (decimal, roman) => roman.from_roman must_== decimal
      }
    }
	"fail with invalid romans" in {
		Array("IIII", "VIV", "IM").forall { 
			roman => roman.from_roman aka roman must(throwA[NumberFormatException])
		}
	}
	"fail with non-roman digits" in {
		Array("HOLA", "ix", "XXMALO").forall { 
			roman => roman.from_roman aka roman must(throwA[NumberFormatException])
		}
	}
	"fail with empty string" in {
		"".from_roman aka "empty string" must(throwA[NumberFormatException])
	}
  }

}