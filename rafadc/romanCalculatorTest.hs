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
  "Should get IX from number 9" "IX" ( fromNumberToRoman 9)

testConversionOf12 = TestCase $ assertEqual 
  "Should get XII from number 12" "XII" ( fromNumberToRoman 12)

testConversionOf14 = TestCase $ assertEqual 
  "Should get XIV from number 14" "XIV" ( fromNumberToRoman 14)

testConversionOf41 = TestCase $ assertEqual 
  "Should get XLI from number 41" "XLI" ( fromNumberToRoman 41)

testConversionOf53= TestCase $ assertEqual 
  "Should get LIII from number 53" "LIII" ( fromNumberToRoman 53)

testConversionOf95= TestCase $ assertEqual 
  "Should get XCV from number 95" "XCV" ( fromNumberToRoman 95)

testConversionOf39= TestCase $ assertEqual 
  "Should get XXXIX from number 39" "XXXIX" ( fromNumberToRoman 39)

testConversionOf49= TestCase $ assertEqual 
  "Should get ILIX from number 49" "ILIX" ( fromNumberToRoman 49)

testConversionOf89= TestCase $ assertEqual 
  "Should get LXXXIX from number 89" "LXXXIX" ( fromNumberToRoman 89)

main = runTestTT $ TestList [testConversionOf1, testConversionOf2, testConversionOf3, testConversionOf4, testConversionOf5,
							 testConversionOf7, testConversionOf9, testConversionOf12, testConversionOf14, testConversionOf39,
							 testConversionOf41, testConversionOf53, testConversionOf95]
