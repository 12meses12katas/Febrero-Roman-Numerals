package romans;

import org.junit.Test;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.fail;

public class RomanNumeralsEdgeCasesTest {

    @Test
    public void exceptionForZero() {
        try {
            RomanNumerals.toRoman(0);
            fail("Expected exception");
        } catch(RomanNumerals.ConversionException ex) {
            assertThat(ex.getMessage(), equalTo("No roman numeral representation for 0"));
        }
    }

    @Test(expected = RomanNumerals.ConversionException.class)
    public void exceptionBelowZero() {
        RomanNumerals.toRoman(-3);
    }

    @Test(expected = RomanNumerals.ConversionException.class)
    public void exceptionAbove3000() {
        RomanNumerals.toRoman(3001);
    }

    @Test
    public void exceptionForEmptyString() {
        try {
            RomanNumerals.toDecimal("");
            fail("Expected exception");
        } catch(RomanNumerals.ConversionException ex) {
            assertThat(ex.getMessage(), equalTo("Not a valid roman numeral"));
        }
    }

    @Test(expected = RomanNumerals.ConversionException.class)
    public void invalidRomanIIII() {
        RomanNumerals.toDecimal("IIII");
    }

    @Test(expected = RomanNumerals.ConversionException.class)
    public void exceptionOnWrong1999() {
        RomanNumerals.toDecimal("IM");
    }
}
