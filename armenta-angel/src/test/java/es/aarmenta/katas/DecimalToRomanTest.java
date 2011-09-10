package es.aarmenta.katas;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class DecimalToRomanTest {
	
	// -------------------------------------------------------- Metodos publicos
	
	@Test
	public void testBasico() {
		assertEquals("I", DecimalToRoman.toRoman(1));
		assertEquals("V", DecimalToRoman.toRoman(5));
		assertEquals("X", DecimalToRoman.toRoman(10));
		assertEquals("L", DecimalToRoman.toRoman(50));
		assertEquals("C", DecimalToRoman.toRoman(100));
		assertEquals("D", DecimalToRoman.toRoman(500));
		assertEquals("M", DecimalToRoman.toRoman(1000));
	}

	@Test
	public void testCombinacionesBasicas() {
		assertEquals("II", DecimalToRoman.toRoman(2));
		assertEquals("VI", DecimalToRoman.toRoman(6));
		assertEquals("XIII", DecimalToRoman.toRoman(13));
		assertEquals("LV", DecimalToRoman.toRoman(55));
		assertEquals("CLXII", DecimalToRoman.toRoman(162));
		assertEquals("DXIII", DecimalToRoman.toRoman(513));
		assertEquals("MCLII", DecimalToRoman.toRoman(1152));
		assertEquals("MDLI", DecimalToRoman.toRoman(1551));
	}
	
	@Test
	public void testNumerosDosCaracteres() {
		assertEquals("IV", DecimalToRoman.toRoman(4));
		assertEquals("IX", DecimalToRoman.toRoman(9));
		assertEquals("XL", DecimalToRoman.toRoman(40));
		assertEquals("XC", DecimalToRoman.toRoman(90));
		assertEquals("CD", DecimalToRoman.toRoman(400));
		assertEquals("CM", DecimalToRoman.toRoman(900));
	}
}
