module RomanCalculator_Test where

import RomanCalculator( fromNumberToRoman )
import Test.HUnit

testConversionOf1 = TestCase $ assertEqual 
  "Should get I from number 1" "I" ( fromNumberToRoman 1)

testConversionOf2 = TestCase $ assertEqual 
  "Should get II from number 2" "II" ( fromNumberToRoman 2)

testConversionOf3 = TestCase $ assertEqual 
  "Should get III from number 3" "III" ( fromNumberToRoman 3)

testConversionOf4 = TestCase $ assertEqual 
  "Should get IV from number 4" "IV" ( fromNumberToRoman 4)

testConversionOf5 = TestCase $ assertEqual 
  "Should get V from number 5" "V" ( fromNumberToRoman 5)

testConversionOf7 = TestCase $ assertEqual 
  "Should get VII from number 7" "VII" ( fromNumberToRoman 7)

testConversionOf9 = TestCase $ assertEqual 
  "Should get IX from number 7" "IX" ( fromNumberToRoman 9)

testConversionOf12 = TestCase $ assertEqual 
  "Should get XII from number 12" "XII" ( fromNumberToRoman 12)

testConversionOf14 = TestCase $ assertEqual 
  "Should get XIV from number 14" "XIV" ( fromNumberToRoman 14)

main = runTestTT $ TestList [testConversionOf1, testConversionOf2, testConversionOf3, testConversionOf4, testConversionOf5,
							 testConversionOf7, testConversionOf9, testConversionOf12, testConversionOf14]
