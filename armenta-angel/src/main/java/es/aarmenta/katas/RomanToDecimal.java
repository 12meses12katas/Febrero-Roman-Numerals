package es.aarmenta.katas;

public class RomanToDecimal {

	// -------------------------------------------------------- Metodos publicos
	
	public static int toDecimal(String numero) {
		int resultado = 0;
		String sumando;
		int indice = 0;
		int longNum = 0;

		while (indice < numero.length()) {
			if (indice < numero.length() - 1
					&& esNumeroCompuesto(numero.substring(indice, indice + 2))) {
				longNum = 2;
			} else {
				longNum = 1;
			}
			sumando = numero.substring(indice, indice + longNum);
			resultado += devuelveValorDecimal(sumando);
			indice += longNum;
		}

		return resultado;
	}

	// -------------------------------------------------------- Metodos privados
	
	private static int devuelveValorDecimal(String str) {

		int resultado = 0;

		if (str.equals(RomanNumerals.ROMAN_1)) {
			resultado = 1;
		} else if (str.equals(RomanNumerals.ROMAN_4)) {
			resultado = 4;
		} else if (str.equals(RomanNumerals.ROMAN_5)) {
			resultado = 5;
		} else if (str.equals(RomanNumerals.ROMAN_9)) {
			resultado = 9;
		} else if (str.equals(RomanNumerals.ROMAN_10)) {
			resultado = 10;
		} else if (str.equals(RomanNumerals.ROMAN_40)) {
			resultado = 40;
		} else if (str.equals(RomanNumerals.ROMAN_50)) {
			resultado = 50;
		} else if (str.equals(RomanNumerals.ROMAN_90)) {
			resultado = 90;
		} else if (str.equals(RomanNumerals.ROMAN_100)) {
			resultado = 100;
		} else if (str.equals(RomanNumerals.ROMAN_400)) {
			resultado = 400;
		} else if (str.equals(RomanNumerals.ROMAN_500)) {
			resultado = 500;
		} else if (str.equals(RomanNumerals.ROMAN_900)) {
			resultado = 900;
		} else if (str.equals(RomanNumerals.ROMAN_1000)) {
			resultado = 1000;
		}

		return resultado;
	}

	private static boolean esNumeroCompuesto(String str) {
		boolean resultado = false;

		if (str.equals(RomanNumerals.ROMAN_4)) {
			resultado = true;
		} else if (str.equals(RomanNumerals.ROMAN_9)) {
			resultado = true;
		} else if (str.equals(RomanNumerals.ROMAN_40)) {
			resultado = true;
		} else if (str.equals(RomanNumerals.ROMAN_90)) {
			resultado = true;
		} else if (str.equals(RomanNumerals.ROMAN_400)) {
			resultado = true;
		} else if (str.equals(RomanNumerals.ROMAN_900)) {
			resultado = true;
		}

		return resultado;
	}

	
}
