
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class RomanNumeralsTest {
	
	private RomanNumeralsConverter converter;
	
	@Before
	public void setUp(){
		converter = new RomanNumeralsConverter();
	}
	
	
	@Test
	public void test1() {
		
		String result = converter.normalToRoman(1);
		
		Assert.assertEquals("I", result);
	}
	
	@Test
	public void test4() {
		
		String result = converter.normalToRoman(4);
		
		Assert.assertEquals("IV", result);
	}
	
	@Test
	public void test5() {
		
		String result = converter.normalToRoman(5);
		
		Assert.assertEquals("V", result);
	}
	
	@Test
	public void test9() {
		
		String result = converter.normalToRoman(9);
		
		Assert.assertEquals("IX", result);
	}
	
	@Test
	public void test10() {
		
		String result = converter.normalToRoman(10);
		
		Assert.assertEquals("X", result);
	}
	
	@Test
	public void test40() {
		
		String result = converter.normalToRoman(40);
		
		Assert.assertEquals("XL", result);
	}
	
	@Test
	public void test50() {
		
		String result = converter.normalToRoman(50);
		
		Assert.assertEquals("L", result);
	}
	
	@Test
	public void test90() {
		
		String result = converter.normalToRoman(90);
		
		Assert.assertEquals("XC", result);
	}
	
	@Test
	public void test100() {
		
		String result = converter.normalToRoman(100);
		
		Assert.assertEquals("C", result);
	}
	
	@Test
	public void test400() {
		
		String result = converter.normalToRoman(400);
		
		Assert.assertEquals("CD", result);
	}
	
	@Test
	public void test500() {
		
		String result = converter.normalToRoman(500);
		
		Assert.assertEquals("D", result);
	}
	
	@Test
	public void test900() {
		
		String result = converter.normalToRoman(900);
		
		Assert.assertEquals("CM", result);
	}
	
	@Test
	public void test1000() {
		
		String result = converter.normalToRoman(1000);
		
		Assert.assertEquals("M", result);
	}
	
	@Test
	public void test986() {
		
		String result = converter.normalToRoman(986);
		
		Assert.assertEquals("CMLXXXVI", result);
	}
	
	@Test
	public void test3999() {
		
		String result = converter.normalToRoman(3999);
		
		Assert.assertEquals("MMMCMXCIX", result);
	}
	
	@Test
	public void test10000() {
		
		String result = converter.normalToRoman(10000);
		
		Assert.assertEquals("MMMMMMMMMM", result);
	}
	
	@Test
	public void testI() {
		
		int result = converter.romanToNormal("I");
		
		Assert.assertEquals(1, result);
	}
	
	@Test
	public void testIV() {
		
		int result = converter.romanToNormal("IV");
		
		Assert.assertEquals(4, result);
	}
	
	@Test
	public void testCMLXXXVI() {
		
		int result = converter.romanToNormal("CMLXXXVI");
		
		Assert.assertEquals(986, result);
	}
	
	@Test
	public void testMMMCMXCIX() {
		
		int result = converter.romanToNormal("MMMCMXCIX");
		
		Assert.assertEquals(3999, result);
	}
	
	@Test
	public void testMMMMMMMMMM() {
		
		int result = converter.romanToNormal("MMMMMMMMMM");
		
		Assert.assertEquals(10000, result);
	}
}
