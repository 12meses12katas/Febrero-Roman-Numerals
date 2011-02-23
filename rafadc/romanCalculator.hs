module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number 
	| number <= 3 = take number (repeat 'I')
	| number == 4 = "IV"
	| otherwise = "V"