module FromRomanToNum_Test where

import RomanCalculator( fromRomanToNumber )
import Test.HUnit

testConversionOfI = TestCase $ assertEqual 
  "Should get 1 from roman I" 1 ( fromRomanToNumber "I")

testConversionOfII = TestCase $ assertEqual 
  "Should get 2 from roman II" 2 ( fromRomanToNumber "II")

testsForI = TestList [testConversionOfI, testConversionOfII]

main = runTestTT $ TestList [testsForI]