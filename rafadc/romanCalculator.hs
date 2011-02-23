module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number
	| number == 0 = ""
	| number <= 3 = take number (repeat 'I')
	| number == 4 = "IV"
	| number >= 5 = "V" ++ fromNumberToRoman(number-5)
