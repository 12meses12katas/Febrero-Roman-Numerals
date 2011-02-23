module RomanCalculator (fromNumberToRoman) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number 
	| number <= 3 = take number (repeat 'I')
	| otherwise = "IV"