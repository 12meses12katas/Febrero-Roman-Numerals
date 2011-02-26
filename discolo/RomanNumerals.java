package es.rromero.kata2;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * Max number supported 3999.
 * 
 * @author rromero
 * 
 */
public class RomanNumerals {

	private static final char[] UNITS_ROMAN = { 'I', 'X', 'C', 'M' };
	private static final char[] FIVE_STH_ROMAN = { 'V', 'L', 'D' };

	private static final int[] DECIMALS = { 1, 5, 10, 50, 100, 500, 1000 };
	private static final char[] ROMANS = { 'I', 'V', 'X', 'L', 'C', 'D', 'M' };

	public String toRomanNumerals(int number) {
		if (number <= 0)
			return "";

		List<Integer> digits = new ArrayList<Integer>();
		// Tokenize numbers
		int tnumber = number;
		while (tnumber != 0) {
			digits.add(tnumber % 10);
			tnumber /= 10;
		}

		StringBuilder result = new StringBuilder();
		for (int i = digits.size() - 1; i >= 0; i--) {
			int num = digits.get(i);
			switch (num) {
			case 3:
				result.append(UNITS_ROMAN[i]);
			case 2:
				result.append(UNITS_ROMAN[i]);
			case 1:
				result.append(UNITS_ROMAN[i]);
				break;
			case 4:
				result.append(UNITS_ROMAN[i]);
			case 5:
				result.append(FIVE_STH_ROMAN[i]);
				break;
			case 8:
				result.append(FIVE_STH_ROMAN[i]).append(UNITS_ROMAN[i]);
			case 7:
				result.append(UNITS_ROMAN[i]);
			case 6:
				result.append(UNITS_ROMAN[i]);
				break;
			case 9:
				result.append(UNITS_ROMAN[i]).append(UNITS_ROMAN[i + 1]);
			}
		}
		return result.toString();
	}

	private int searchPos(char c) {
		for (int i = 0; i < ROMANS.length; i++) {
			if (c == ROMANS[i])
				return i;
		}
		return -1;
	}

	public int fromRomanNumerals(String rnumber) {
		int result = 0;
		if (rnumber == null || rnumber.isEmpty()) {
			return result;
		}
		for (int i = rnumber.length() - 1; i >= 0; i--) {
			int pos = searchPos(rnumber.charAt(i));
			result += DECIMALS[pos];
			if (i > 0 && pos > 0) {
				char nextSymbol = rnumber.charAt(i - 1);
				if (nextSymbol == ROMANS[pos - 1]) {
					result -= DECIMALS[pos - 1];
					i--;
				} else if (pos > 1 && nextSymbol == ROMANS[pos - 2]) {
					result -= DECIMALS[pos - 2];
					i--;
				}
			}

		}

		return result;
	}

}
