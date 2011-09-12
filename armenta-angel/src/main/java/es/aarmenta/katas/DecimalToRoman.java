package es.aarmenta.katas;

public class DecimalToRoman {

	// -------------------------------------------------------------- Constantes
	
	private final static String ZERO_STR = "0";
	
	// -------------------------------------------------------- Metodos publicos
	
	public static String toRoman(int numero) {
		String resultado = "";
		String strNumero = String.valueOf(numero);
		String digito;
		int posicion;
		int potenciaDecimal;

		for (int i = 0; i < strNumero.length(); i++) {
			digito = strNumero.substring(i, i + 1);
			if (!digito.equals(ZERO_STR)) {
				posicion = strNumero.length() - i;
				potenciaDecimal = calculaPotenciaDecimal(
						Integer.valueOf(digito), posicion);
				resultado += devuelveDigitoRomano(potenciaDecimal);
			}

		}

		return resultado;
	}

	// -------------------------------------------------------- Metodos privados
	
	private static int calculaPotenciaDecimal(int digito, int posicion) {
		int resultado;
		int multiplicador = 1;

		if (posicion == 1) {
			multiplicador = 1;
		} else {
			multiplicador = (int) Math.pow(10, posicion - 1);
		}

		resultado = digito * multiplicador;

		return resultado;
	}

	private static String devuelveDigitoRomano(int valor) {
		switch (valor) {
		case 1:
		case 4:
		case 5:
		case 9:
		case 10:
		case 40:
		case 50:
		case 90:
		case 100:
		case 400:
		case 500:
		case 900:
		case 1000:
			return devuelveDigitoRomanoDirecto(valor);
		default:
			return devuelveDigitoRomanoCalculado(valor);
		}
	}

	private static String devuelveDigitoRomanoDirecto(int valor) {
		String resultado = "";

		if (valor == 1) {
			resultado = RomanNumerals.ROMAN_1;
		} else if (valor == 4) {
			resultado = RomanNumerals.ROMAN_4;
		} else if (valor == 5) {
			resultado = RomanNumerals.ROMAN_5;
		} else if (valor == 9) {
			resultado = RomanNumerals.ROMAN_9;
		} else if (valor == 10) {
			resultado = RomanNumerals.ROMAN_10;
		} else if (valor == 40) {
			resultado = RomanNumerals.ROMAN_40;
		} else if (valor == 50) {
			resultado = RomanNumerals.ROMAN_50;
		} else if (valor == 90) {
			resultado = RomanNumerals.ROMAN_90;
		} else if (valor == 100) {
			resultado = RomanNumerals.ROMAN_100;
		} else if (valor == 400) {
			resultado = RomanNumerals.ROMAN_400;
		} else if (valor == 500) {
			resultado = RomanNumerals.ROMAN_500;
		} else if (valor == 900) {
			resultado = RomanNumerals.ROMAN_900;
		} else if (valor == 1000) {
			resultado = RomanNumerals.ROMAN_1000;
		}

		return resultado;
	}

	private static String devuelveDigitoRomanoCalculado(int valor) {

		String resultado = "";
		String digitoRomano = "";
		int divisor = 1;
		int iterador;

		if (valor > 1 && valor < 10) {
			digitoRomano = RomanNumerals.ROMAN_1;
			divisor = 1;
			if (valor > 5) {
				resultado = RomanNumerals.ROMAN_5;
			}
		}
		if (valor > 10 && valor < 100) {
			digitoRomano = RomanNumerals.ROMAN_10;
			divisor = 10;
			if (valor > 50) {
				resultado = RomanNumerals.ROMAN_50;
			}
		}
		if (valor > 100 && valor < 1000) {
			digitoRomano = RomanNumerals.ROMAN_100;
			divisor = 100;
			if (valor > 500) {
				resultado = RomanNumerals.ROMAN_500;
			}
		}
		if (valor > 1000) {
			digitoRomano = RomanNumerals.ROMAN_1000;
			divisor = 1000;
		}

		iterador = valor / divisor;
		if (iterador > 5) {
			iterador -= 5;
		}
		while (iterador > 0) {
			resultado += digitoRomano;
			iterador--;
		}

		return resultado;
	}
}
