module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number
	| number == 0 = ""
	| number <= 3 = "I" ++ fromNumberToRoman(number-1)
	| number == 4 = "IV"
	| number < 9 = "V" ++ fromNumberToRoman(number-5)
	| number == 9 = "IX"
	| number < 39 = "X" ++ fromNumberToRoman(number-10)
	| number < 49 = "XL" ++ fromNumberToRoman(number-40)
	| number >= 50 = "L" ++ fromNumberToRoman(number-50)
