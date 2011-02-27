
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
		assertEquals("I", romanNumeral.dig2roman(1));
		assertEquals("V", romanNumeral.dig2roman(5));
		assertEquals("X", romanNumeral.dig2roman(10));
		assertEquals("L", romanNumeral.dig2roman(50));
		assertEquals("C", romanNumeral.dig2roman(100));
		assertEquals("D", romanNumeral.dig2roman(500));
		assertEquals("M", romanNumeral.dig2roman(1000));
		
	}
	
	@Test
	public void testRepetitionConversions(){
		assertEquals("II", romanNumeral.dig2roman(2));
		assertEquals("III", romanNumeral.dig2roman(3));
	}

}
