module RomanCalculator_Test where

import RomanCalculator( fromNumberToRoman )
import Test.HUnit

testConversionOf1 = TestCase $ assertEqual 
  "Should get I from number 1" "I" ( fromNumberToRoman 1)

testConversionOf2 = TestCase $ assertEqual 
  "Should get II from number 2" "II" ( fromNumberToRoman 2)

testConversionOf3 = TestCase $ assertEqual 
  "Should get III from number 3" "III" ( fromNumberToRoman 3)

main = runTestTT $ TestList [testConversionOf1, testConversionOf2, testConversionOf3]
