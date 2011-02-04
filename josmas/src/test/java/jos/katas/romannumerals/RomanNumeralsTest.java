package com.jos.katas.romannumerals;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import com.jos.katas.romannumerals.RomanNumerals;


public class RomanNumeralsTest {

	@Before
	public void setUp() throws Exception {
	}
	
	@Test
	public void testRomanNumerals(){
		RomanNumerals rn = new RomanNumerals();
		
		assertEquals("I", rn.convert(1));
		assertEquals("II", rn.convert(2));
		assertEquals("III", rn.convert(3));
		assertEquals("IV", rn.convert(4));
		assertEquals("V", rn.convert(5));
		assertEquals("VI", rn.convert(6));
		assertEquals("VII", rn.convert(7));
		assertEquals("VIII", rn.convert(8));
		assertEquals("IX", rn.convert(9));
//		assertEquals("X", rn.convert(10));
	}
	
	//Have to test for Zero and probably send an illegal argument exception.

}
