package es.rromero.kata2;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import org.junit.Test;


public class RomanNumeralsTest {

	@Test
	public void testToRomanNumberLowerThan5() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("",rn.toRomanNumerals(0));
		assertEquals("I",rn.toRomanNumerals(1));
		assertEquals("II",rn.toRomanNumerals(2));
		assertEquals("III",rn.toRomanNumerals(3));
		assertEquals("IV",rn.toRomanNumerals(4));
	}
	
	@Test
	public void testToRomanNumber1989() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("MCMLXXXIX",rn.toRomanNumerals(1989));
	}
	
	@Test
	public void testToRomanNumber2008() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("MMVIII",rn.toRomanNumerals(2008));
	}
	
	@Test
	public void testToRomanNumber545() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("DXLV",rn.toRomanNumerals(545));
	}
	
	@Test
	public void testToRomanNumber1999() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("MCMXCIX",rn.toRomanNumerals(1999));
	}
	
	@Test
	public void testToRomanNumberMaxSupported() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals("MMMCMXCIX",rn.toRomanNumerals(3999));
		try {
			rn.toRomanNumerals(4000);
			fail("It should have raised an exception");
		} catch (IndexOutOfBoundsException e) {
			assertNotNull(e);
		}
	}
	
	@Test
	public void testFromRomanNumber0() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals(0, rn.fromRomanNumerals(""));
	}
	
	@Test
	public void testFromRomanNumberLowerThan5() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals(1,rn.fromRomanNumerals("I"));
		assertEquals(2,rn.fromRomanNumerals("II"));
		assertEquals(3,rn.fromRomanNumerals("III"));
		assertEquals(4,rn.fromRomanNumerals("IV"));
	}
	
	@Test
	public void testFromRomanNumber1999() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals(1999, rn.fromRomanNumerals("MCMXCIX"));
	}
	
	@Test
	public void testFromRomanNumber545() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals(545, rn.fromRomanNumerals("DXLV"));
	}
	
	@Test
	public void testFromRomanNumber2008() {
		RomanNumerals rn = new RomanNumerals();
		assertEquals(2008, rn.fromRomanNumerals("MMVIII"));
	}

}
