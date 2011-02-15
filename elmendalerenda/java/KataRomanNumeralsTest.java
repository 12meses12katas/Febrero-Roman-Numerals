package elmenda;

import junit.framework.Assert;

import org.junit.Test;

public class KataRomanNumeralsTest {

	
	@Test
	public void zeroShouldReturnEmptyResult() {
	
		assertRomanNumber("", 0);
		
	}
	
	@Test
	public void simpleNumberShouldReturnOneLetterResult() {
		
		assertRomanNumber("I", 1);

		assertRomanNumber("V", 5);

		assertRomanNumber("X", 10);
		
		assertRomanNumber("L", 50);
		
		assertRomanNumber("C", 100);
		
		assertRomanNumber("D", 500);

		assertRomanNumber("M", 1000);

	}
	
	@Test
	public void fourShouldReturnOneAndFive() {
		
		assertRomanNumber("IV", 4);
		
	}
	
	@Test
	public void sixShouldReturnFiveAndOne() {
		
		assertRomanNumber("VI", 6);
		
	}
	
	@Test
	public void nineShouldReturnOneAndTen() {
		
		assertRomanNumber("IX", 9);
		
	}
	
	@Test
	public void tenToNineTy() {
		
		assertRomanNumber("XI", 11);
		assertRomanNumber("XII", 12);
		assertRomanNumber("XIII", 13);
		assertRomanNumber("XIV", 14);
		assertRomanNumber("XV", 15);
		assertRomanNumber("XVI", 16);
		assertRomanNumber("XVII", 17);
		assertRomanNumber("XVIII", 18);
		assertRomanNumber("XIX", 19);
		assertRomanNumber("XX", 20);	
		assertRomanNumber("XXXIX", 39);
		assertRomanNumber("XLV", 45);
		assertRomanNumber("LIV", 54);
		assertRomanNumber("LXXI", 71);
		assertRomanNumber("LXXXVIII", 88);
	}
	
	@Test
	public void nineties() {
		
		assertRomanNumber("XC", 90);
		assertRomanNumber("XCIX", 99);
	}
	
	
	@Test
	public void hundreds() {
		
		assertRomanNumber("CI", 101);
		assertRomanNumber("CX", 110);
		assertRomanNumber("CXXIII", 123);
		assertRomanNumber("CXXXIV", 134);
		assertRomanNumber("CXLV", 145);
		assertRomanNumber("CLVI", 156);
		assertRomanNumber("CLXVII", 167);
		assertRomanNumber("CLXXVIII", 178);
		assertRomanNumber("CCCLV", 355);
		assertRomanNumber("CDII", 402);
		assertRomanNumber("DVI", 506);
		assertRomanNumber("DCCCXCIX", 899);
	}
	
	@Test
	public void nineHundred() {

		assertRomanNumber("CM", 900);
		assertRomanNumber("CMXCIX", 999);
	}

	@Test
	public void thousands() {

		assertRomanNumber("MCDXLIV", 1444);
		assertRomanNumber("MCMXC", 1990);
		assertRomanNumber("MCMXCIX", 1999);
		
	}
	
	
	private void assertRomanNumber(String romanNumber, int normalNumber) {
		
		Assert.assertEquals("roman number for:" + normalNumber, romanNumber, RomanNumerals.convert(normalNumber));
	}
	
}
