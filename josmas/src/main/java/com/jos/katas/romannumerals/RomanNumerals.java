package com.jos.katas.romannumerals;

public class RomanNumerals {

	public String convert(int intInput) {
		
		StringBuilder resultInRoman = new StringBuilder();
		if ( intInput < 4){
				resultInRoman.append(countILetters(intInput));
		} else if (intInput < 9){
			int palos = intInput - 3;
			if (palos == 1)
				resultInRoman.append("IV");
			else {
				resultInRoman.append("V");
				resultInRoman.append(countILetters(palos-2));
			}
		} else if (intInput < 49){
				if (intInput == 9){
					resultInRoman.append("IX");
				}
				else {
					// Handle bigger than 10 here!
				}
		}
		return resultInRoman.toString();
	}

	private StringBuilder countILetters(int iLetters) {
		StringBuilder resultILetters = new StringBuilder();
		for (int i = iLetters; i > 0; i--)
			resultILetters.append("I");
		
		return resultILetters;
	}

}
