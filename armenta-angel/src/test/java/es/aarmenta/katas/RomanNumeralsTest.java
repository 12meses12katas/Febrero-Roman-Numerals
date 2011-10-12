package es.aarmenta.katas;

import static org.junit.Assert.*;

import org.junit.Test;

public class RomanNumeralsTest {

	RomanNumerals romNum = new RomanNumerals();
	
	@Test
	public void testTotal() {
		for (int i = 1; i <= 3000; i++) {
			
			String roman = romNum.encode(i);
			
			assertEquals(i, romNum.decode(roman));
			assertEquals(roman, romNum.encode(i));
			
		}
	}

}
