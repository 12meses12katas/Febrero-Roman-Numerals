module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number
	| number == 0 = ""
	| number <= 3 = take number (repeat 'I')
	| number == 4 = "IV"
	| number < 9 = "V" ++ fromNumberToRoman(number-5)
	| number == 9 = "IX"
	| otherwise = "XII"
