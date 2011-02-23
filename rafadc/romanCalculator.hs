module RomanCalculator (fromNumberToRoman, fromRomanToNumber) where

fromNumberToRoman :: Int -> String
fromNumberToRoman number
	| number == 0 = ""
	| number <= 3 = "I" ++ fromNumberToRoman(number-1)
	| number == 4 = "IV"
	| number < 9 = "V" ++ fromNumberToRoman(number-5)
	| number == 9 = "IX"
	| number < 40 = "X" ++ fromNumberToRoman(number-10)
	| number < 50 = "XL" ++ fromNumberToRoman(number-40)
	| number < 90 = "L" ++ fromNumberToRoman(number-50)
	| number < 100 = "XC" ++ fromNumberToRoman(number-90)
	| number < 400 = "C" ++ fromNumberToRoman(number-100)
	| number < 500 = "CD" ++ fromNumberToRoman(number-400)
	| number < 1000 = "D" ++ fromNumberToRoman(number-500)
	| otherwise = "M" ++ fromNumberToRoman(number-1000)

fromRomanToNumber :: String -> Int
fromRomanToNumber roman 
	| roman == [] = 0
	| roman == "IV" = 4
	| roman == "IX" = 9
	| roman == "X" = 10
	| head roman == 'V' = 5 + fromRomanToNumber (tail roman)
	| head roman == 'I' = 1 + fromRomanToNumber (tail roman)

fromRomanToNumber otherwise = 0

