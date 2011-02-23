module RomanCalculator (fromNumberToRoman, fromRomanToNumber) where

value_of_I = 1
value_of_IV = 4
value_of_V = 5
value_of_IX = 9
value_of_X = 10
value_of_XL = 40
value_of_L = 50
value_of_XC = 90
value_of_C = 100
value_of_CD = 400
value_of_D = 500
value_of_CM = 900
value_of_M = 1000

fromNumberToRoman :: Int -> String
fromNumberToRoman number
	| number <= 0 = ""
	| number < value_of_IV = "I" ++ fromNumberToRoman(number-value_of_I)
	| number == value_of_IV = "IV"
	| number < value_of_IX = "V" ++ fromNumberToRoman(number-value_of_V)
	| number == value_of_IX = "IX"
	| number < value_of_XL = "X" ++ fromNumberToRoman(number-value_of_X)
	| number < value_of_L = "XL" ++ fromNumberToRoman(number-value_of_XL)
	| number < value_of_XC = "L" ++ fromNumberToRoman(number-value_of_L)
	| number < value_of_C = "XC" ++ fromNumberToRoman(number-value_of_XC)
	| number < value_of_CD = "C" ++ fromNumberToRoman(number-value_of_C)
	| number < value_of_D = "CD" ++ fromNumberToRoman(number-value_of_CD)
	| number < value_of_CM = "D" ++ fromNumberToRoman(number-value_of_D)
	| number < value_of_M = "CM" ++ fromNumberToRoman(number-value_of_CM)
	| otherwise = "M" ++ fromNumberToRoman(number-value_of_M)

fromRomanToNumber :: String -> Int
fromRomanToNumber roman 
	| roman == [] = 0
	| roman == "IV" = value_of_IV
	| roman == "IX" = value_of_IX
	| take 2 roman == "XL" = value_of_XL + fromRomanToNumber (drop 2 roman)
	| take 2 roman == "XC" = value_of_XC + fromRomanToNumber (drop 2 roman)
	| take 2 roman == "CD" = value_of_CD + fromRomanToNumber (drop 2 roman)
	| take 2 roman == "CM" = value_of_CM + fromRomanToNumber (drop 2 roman)
	| head roman == 'M' = value_of_M + fromRomanToNumber (tail roman)
	| head roman == 'D' = value_of_D + fromRomanToNumber (tail roman)
	| head roman == 'C' = value_of_C + fromRomanToNumber (tail roman)
	| head roman == 'L' = value_of_L + fromRomanToNumber (tail roman)
	| head roman == 'X' = value_of_X + fromRomanToNumber (tail roman)
	| head roman == 'V' = value_of_V + fromRomanToNumber (tail roman)
	| head roman == 'I' = value_of_I + fromRomanToNumber (tail roman)

fromRomanToNumber otherwise = 0

