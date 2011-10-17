package romans;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import java.util.Arrays;
import java.util.Collection;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.core.IsEqual.equalTo;

@RunWith(Parameterized.class)
public class RomanNumeralsTest {

    private String roman;
    private int decimal;

    @Parameterized.Parameters
    public static Collection<Object[]> cases() {
        return Arrays.asList(new Object[][] {
                { "I", 1 },
                { "II", 2 },
                { "III", 3 },
                { "IV", 4},
                { "V", 5},
                { "VI", 6},
                { "VII", 7},
                { "VIII", 8},
                { "IX", 9},
                { "X", 10},
                { "XIV", 14},
                { "CCXXXIV", 234},
                { "MCMXCVI", 1996},
                { "MMM", 3000},
        });
    }

    public RomanNumeralsTest(String roman, int decimal) {
        this.roman = roman;
        this.decimal = decimal;
    }

    @Test
    public void toRomanConversion() {
       assertThat("translation of " + decimal,
               RomanNumerals.toRoman(decimal), equalTo(roman));
    }

    @Test
    public void toDecimalConversion() {
       assertThat("translation of " +  roman,
               RomanNumerals.toDecimal(roman), equalTo(decimal));
    }
}
