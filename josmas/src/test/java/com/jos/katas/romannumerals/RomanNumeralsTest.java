package com.jos.katas.romannumerals;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.jos.katas.romannumerals.RomanNumerals;


public class RomanNumeralsTest {
	RomanNumerals rn = new RomanNumerals();

	@Before
	public void setUp() throws Exception {
		rn = new RomanNumerals();
	}
	
	@Test
	public void shouldNotAcceptOutOfRangeNumbers(){
		try{
			rn.convert(0);
			fail("Exception expected, argument out of range");
		}
		catch (IllegalArgumentException iae) {
			//ignore
		}
		try{
			rn.convert(3000);
			fail("Exception expected, argument out of range");
		}
		catch (IllegalArgumentException iae) {
			//ignore
		}
	}
	
	@Test
	public void itShouldReturnTheRomanNumeral(){
		assertEquals("I", rn.convert(1));
		assertEquals("II", rn.convert(2));
		assertEquals("III", rn.convert(3));
		assertEquals("IV", rn.convert(4));
		assertEquals("V", rn.convert(5));
		assertEquals("VI", rn.convert(6));
		assertEquals("VII", rn.convert(7));
		assertEquals("VIII", rn.convert(8));
		assertEquals("IX", rn.convert(9));
		assertEquals("X", rn.convert(10));
		assertEquals("XIV", rn.convert(14));
		assertEquals("XIX", rn.convert(19));
		assertEquals("XX", rn.convert(20));
		assertEquals("XXXIII", rn.convert(33));
		assertEquals("XXXIV", rn.convert(34));
		assertEquals("XXXIX", rn.convert(39));
		assertEquals("XLIX", rn.convert(49));
		assertEquals("L", rn.convert(50));
		assertEquals("LXXXIX", rn.convert(89));
		assertEquals("XCIX", rn.convert(99));
		assertEquals("CXLIX", rn.convert(149));
		assertEquals("CCCXLIX", rn.convert(349));
		assertEquals("CDLVI", rn.convert(456));
		assertEquals("D", rn.convert(500));
		assertEquals("DCIV", rn.convert(604));		
		assertEquals("DCCCXLIX", rn.convert(849));
		assertEquals("CMIV", rn.convert(904));
		assertEquals("MVII", rn.convert(1007));
		assertEquals("MMDCCCVI", rn.convert(2806));
		assertEquals("MMCMXCIX", rn.convert(2999));
	}
	
	@Test
	public void shouldNotAcceptOutOfRangeRomanNumerals(){
		//TODO compare upper limmit for MMM
		try{
			rn.convert("");
			fail("Exception expected, argument out of range");
		}
		catch (IllegalArgumentException iae) {
			//ignore
		}
	}
	
	@Test
	public void itShouldReturnTheArabicNumber(){
		assertEquals(1, rn.convert("I"));
		assertEquals(2, rn.convert("II"));
		assertEquals(4, rn.convert("IV"));
		assertEquals(5, rn.convert("V"));
		assertEquals(6, rn.convert("VI"));
		assertEquals(7, rn.convert("VII"));
		assertEquals(8, rn.convert("VIII"));
		assertEquals(9, rn.convert("IX"));
		assertEquals(10, rn.convert("X"));
		assertEquals(14, rn.convert("XIV"));
		assertEquals(19, rn.convert("XIX"));
		assertEquals(20, rn.convert("XX"));
		assertEquals(33, rn.convert("XXXIII"));
		assertEquals(34, rn.convert("XXXIV"));
		assertEquals(39, rn.convert("XXXIX"));
		assertEquals(49, rn.convert("XLIX"));
		assertEquals(50, rn.convert("L"));
		assertEquals(89, rn.convert("LXXXIX"));
		assertEquals(99, rn.convert("XCIX"));
		assertEquals(149, rn.convert("CXLIX"));
		assertEquals(349, rn.convert("CCCXLIX"));
		assertEquals(456, rn.convert("CDLVI"));
		assertEquals(500, rn.convert("D"));
		assertEquals(604, rn.convert("DCIV"));		
		assertEquals(849, rn.convert("DCCCXLIX"));
		assertEquals(904, rn.convert("CMIV"));
		assertEquals(1007, rn.convert("MVII"));
		assertEquals(2806, rn.convert("MMDCCCVI"));
		assertEquals(2999, rn.convert("MMCMXCIX"));
	}
}
