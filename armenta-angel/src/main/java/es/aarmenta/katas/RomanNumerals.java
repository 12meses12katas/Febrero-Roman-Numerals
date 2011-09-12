package es.aarmenta.katas;

public class RomanNumerals {

	// -------------------------------------------------------------- Constantes
	
	public static final String ROMAN_1 = "I";
	public static final String ROMAN_5 = "V";
	public static final String ROMAN_10 = "X";
	public static final String ROMAN_50 = "L";
	public static final String ROMAN_100 = "C";
	public static final String ROMAN_500 = "D";
	public static final String ROMAN_1000 = "M";
	
	public static final String ROMAN_4 = "IV";
	public static final String ROMAN_9 = "IX";
	public static final String ROMAN_40 = "XL";
	public static final String ROMAN_90 = "XC";
	public static final String ROMAN_400 = "CD";
	public static final String ROMAN_900 = "CM";
	
	// -------------------------------------------------------- Metodos publicos
	
	public int decode(String romanNumber) {
		return RomanToDecimal.toDecimal(romanNumber);
	}
	
	public String encode(int decimalNumber) {
		return DecimalToRoman.toRoman(decimalNumber);
	}
}
