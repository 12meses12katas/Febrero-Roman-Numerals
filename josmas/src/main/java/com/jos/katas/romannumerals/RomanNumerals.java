package com.jos.katas.romannumerals;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class RomanNumerals {
	
	private static final HashMap<Integer, String> conversion = new LinkedHashMap<Integer, String>();
	static {
		conversion.put(1000, "M");
		conversion.put(900, "CM");
		conversion.put(500, "D");
		conversion.put(400, "CD");
		conversion.put(100, "C");
		conversion.put(90, "XC");
		conversion.put(50, "L");
		conversion.put(40, "XL");
		conversion.put(10, "X");
		conversion.put(9, "IX");
		conversion.put(5, "V");
		conversion.put(4, "IV");
		conversion.put(1, "I");
	}
	
	public String convert(int intInput) {
		if (intInput == 0 || intInput > 2999)
			throw new IllegalArgumentException("Only numbers allowed are 1 to 3000");
		
		return convertToRoman(intInput).toString();
	}
	
	public int convert(String textInput) {
		//TODO compare upper limits for MMM
		if (textInput.isEmpty() )
			throw new IllegalArgumentException("Only Roman numerals allowed are I to MMCDCXIX");
		
		return convertToArabic(textInput);
	}
	
	private StringBuilder convertToRoman(int intInput) {
		StringBuilder result = new StringBuilder();
		Iterator<Entry<Integer, String>> it = conversion.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<Integer, String> pair = it.next();
			while (intInput >= pair.getKey()){
				result.append(pair.getValue());
				intInput -= pair.getKey();
			}
		}
		return result;
	}
	
	private int convertToArabic(String textInput) {
		int result =0;
		Iterator<Entry<Integer, String>> it = conversion.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<Integer, String> pair = it.next();
			while (textInput.startsWith(pair.getValue())){
				result = result + pair.getKey();
				textInput = textInput.substring(pair.getValue().length(), textInput.length());
			}
		}
		return result;
	}
	
}
