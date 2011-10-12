package org.kata;

import java.util.Map;
import java.util.TreeMap;

public class Arabic {

	private int numero;
	private Map<Integer, String> symbols = new TreeMap<Integer, String>();
	
	public Arabic() {
		numero = 0;
		symbols.put(1, "I");
		symbols.put(5, "V");
		symbols.put(10, "X");
		symbols.put(50, "L");
		symbols.put(100, "C");
		symbols.put(1000, "M");
	}
	
	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String toRoman() {
		int unidad = 1;
		String result = "";
		char[] digits = String.valueOf(numero).toCharArray();
		for (int i = digits.length - 1; i >= 0; i--) {
			result = getRomanUnidad(Integer.parseInt(String.valueOf(digits[i])), unidad) + result;
			unidad *= 10;
		}
		return result;
	}
	
	private String getRomanUnidad(int digito, int grupoDecimal) {
		String result = "";
		if (digito == 0)
			return result;
		else if (digito * grupoDecimal + 1 * grupoDecimal < 5 * grupoDecimal) {
			for (int i = 1; i <= digito; i++) result += symbols.get(grupoDecimal);
			return result;
		}
		else if (digito * grupoDecimal + 1 * grupoDecimal == 5 * grupoDecimal)
			return symbols.get(grupoDecimal) + symbols.get(5 * grupoDecimal);
		else if (digito * grupoDecimal + 1 * grupoDecimal == 10 * grupoDecimal)
			return symbols.get(grupoDecimal) + symbols.get(10 * grupoDecimal);
		else {
			result = symbols.get(5 * grupoDecimal);
			for (int i = 1; i <= digito - 5; i++) result += symbols.get(grupoDecimal);
			return result;
		}
	}
}
