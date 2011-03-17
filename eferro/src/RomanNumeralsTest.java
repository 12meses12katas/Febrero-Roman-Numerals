
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

/**
 * 
 */

/**
 * @author eferro
 *
 */
public class RomanNumeralsTest {

	RomanNumeral romanNumeral = null;
	
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		romanNumeral = new RomanNumeral();
	}
	
	@Test
	public void testBasicConversions() {
		assertEquals("I", romanNumeral.number2roman(1));
		assertEquals("V", romanNumeral.number2roman(5));
		assertEquals("X", romanNumeral.number2roman(10));
		assertEquals("L", romanNumeral.number2roman(50));
		assertEquals("C", romanNumeral.number2roman(100));
		assertEquals("D", romanNumeral.number2roman(500));
		
		assertEquals("M", romanNumeral.number2roman(1000));
	}
	
	@Test
	public void testRepetitionConversions(){
		
		assertEquals("II", romanNumeral.number2roman(2));
		assertEquals("III", romanNumeral.number2roman(3));
		
		assertEquals("XX", romanNumeral.number2roman(20));
		assertEquals("XXX", romanNumeral.number2roman(30));
		
	}
	
	@Test
	public void testSubstractions(){
		assertEquals("IV", romanNumeral.number2roman(4));
		assertEquals("XL", romanNumeral.number2roman(40));
	}

	@Test
	public void testNotExactsSubstractions(){
		assertEquals("XLV", romanNumeral.number2roman(45));
	}
	
	@Test
	public void testComplexCases(){
		assertEquals("VII", romanNumeral.number2roman(7));
		
		assertEquals("XC", romanNumeral.number2roman(90));
		assertEquals("XCIX", romanNumeral.number2roman(99));
		assertEquals("MMIII", romanNumeral.number2roman(2003));
		
		assertEquals("XIV", romanNumeral.number2roman(14));
		assertEquals("MCMXCIX", romanNumeral.number2roman(1999));
		assertEquals("MMXI", romanNumeral.number2roman(2011));
		assertEquals("CDLXVII", romanNumeral.number2roman(467));
		
	}
}
