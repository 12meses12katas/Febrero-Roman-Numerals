package org.kata;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.kata.Arabic;


public class ArabicTest {

	private Arabic arabic;
	private String[] spected = {
			"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", 
			"XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX", 
			"XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",  
			"XXXI", "XXXII", "XXXIII", "XXXIV", "XXXV", "XXXVI", "XXXVII", "XXXVIII", "XXXIX", "XL", 
			"XLI", "XLII", "XLIII", "XLIV", "XLV", "XLVI", "XLVII", "XLVIII", "XLIX", "L", 
			"LI", "LII", "LIII", "LIV", "LV", "LVI", "LVII", "LVIII", "LIX", "LX", 
			"LXI", "LXII", "LXIII", "LXIV", "LXV", "LXVI", "LXVII", "LXVIII", "LXIX", "LXX", 
			"LXXI", "LXXII", "LXXIII", "LXXIV", "LXXV", "LXXVI", "LXXVII", "LXXVIII", "LXXIX", "LXXX",  
			"LXXXI", "LXXXII", "LXXXIII", "LXXXIV", "LXXXV", "LXXXVI", "LXXXVII", "LXXXVIII", "LXXXIX", "XC", 
			"XCI", "XCII", "XCIII", "XCIV", "XCV", "XCVI", "XCVII", "XCVIII", "XCIX", "C", 
			"CI", "CII", "CIII", "CIV", "CV", "CVI", "CVII", "CVIII", "CIX", "CX", 
			"CXI", "CXII", "CXIII", "CXIV", "CXV", "CXVI", "CXVII", "CXVIII", "CXIX", "CXX", 
			"CXXI", "CXXII", "CXXIII", "CXXIV", "CXXV", "CXXVI", "CXXVII", "CXXVIII", "CXXIX", "CXXX",  
			"CXXXI", "CXXXII", "CXXXIII", "CXXXIV", "CXXXV", "CXXXVI", "CXXXVII", "CXXXVIII", "CXXXIX", "CXL", 
			"CXLI", "CXLII", "CXLIII", "CXLIV", "CXLV", "CXLVI", "CXLVII", "CXLVIII", "CXLIX", "CL", 
			"CLI", "CLII", "CLIII", "CLIV", "CLV", "CLVI", "CLVII", "CLVIII", "CLIX", "CLX", 
			"CLXI", "CLXII", "CLXIII", "CLXIV", "CLXV", "CLXVI", "CLXVII", "CLXVIII", "CLXIX", "CLXX", 
			"CLXXI", "CLXXII", "CLXXIII", "CLXXIV", "CLXXV", "CLXXVI", "CLXXVII", "CLXXVIII", "CLXXIX", "CLXXX",  
	};
	
	@Before
	public void setUp() {
		arabic =  new Arabic();
	}

	@Test
	public void showRoman() {
		int num = 40;
		arabic.setNumero(num);
		assertEquals(spected[num - 1], arabic.toRoman()); 
	}

	@Test
	public void showRomanRange() {
		for (int i = 1; i < 180; i++) {
			arabic.setNumero(i);
			assertEquals(spected[i - 1], arabic.toRoman()); 
		}
	}
	
	@Test
	public void show1990() {
		arabic.setNumero(1990);
		assertEquals("MCMXC", arabic.toRoman()); 
	}
	
	@Test
	public void show999() {
		arabic.setNumero(999);
		assertEquals("CMXCIX", arabic.toRoman()); 
	}
	
	@Test
	public void show1999() {
		arabic.setNumero(1999);
		assertEquals("MCMXCIX", arabic.toRoman()); 
	}
	
	@Test
	public void show2008() {
		arabic.setNumero(2008);
		assertEquals("MMVIII", arabic.toRoman()); 
	}
	
}
