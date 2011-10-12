package es.aarmenta.katas;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class RomanToDecimalTest {
	
	// -------------------------------------------------------- Metodos publicos
	
	@Test
	public void testBasico() {
		assertEquals(1, RomanToDecimal.toDecimal("I"));
		assertEquals(5, RomanToDecimal.toDecimal("V"));
		assertEquals(10, RomanToDecimal.toDecimal("X"));
		assertEquals(50, RomanToDecimal.toDecimal("L"));
		assertEquals(100, RomanToDecimal.toDecimal("C"));
		assertEquals(500, RomanToDecimal.toDecimal("D"));
		assertEquals(1000, RomanToDecimal.toDecimal("M"));
	}
	
	@Test
	public void testCombinacionesBasicas() {
		assertEquals(2, RomanToDecimal.toDecimal("II"));
		assertEquals(6, RomanToDecimal.toDecimal("VI"));
		assertEquals(13, RomanToDecimal.toDecimal("XIII"));
		assertEquals(55, RomanToDecimal.toDecimal("LV"));
		assertEquals(162, RomanToDecimal.toDecimal("CLXII"));
		assertEquals(513, RomanToDecimal.toDecimal("DXIII"));
		assertEquals(1152, RomanToDecimal.toDecimal("MCLII"));
		assertEquals(1551, RomanToDecimal.toDecimal("MDLI"));
	}
	
	@Test
	public void testNumerosDosCaracteres() {
		assertEquals(4, RomanToDecimal.toDecimal("IV"));
		assertEquals(9, RomanToDecimal.toDecimal("IX"));
		assertEquals(40, RomanToDecimal.toDecimal("XL"));
		assertEquals(90, RomanToDecimal.toDecimal("XC"));
		assertEquals(400, RomanToDecimal.toDecimal("CD"));
		assertEquals(900, RomanToDecimal.toDecimal("CM"));
	}
	
	@Test
	public void testCompleto() {
		assertEquals(2, RomanToDecimal.toDecimal("II"));
		assertEquals(6, RomanToDecimal.toDecimal("VI"));
		assertEquals(13, RomanToDecimal.toDecimal("XIII"));
		assertEquals(55, RomanToDecimal.toDecimal("LV"));
		assertEquals(162, RomanToDecimal.toDecimal("CLXII"));
		assertEquals(513, RomanToDecimal.toDecimal("DXIII"));
		assertEquals(1152, RomanToDecimal.toDecimal("MCLII"));
		assertEquals(1551, RomanToDecimal.toDecimal("MDLI"));
	}

}
