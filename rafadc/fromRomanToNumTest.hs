module FromRomanToNum_Test where

import RomanCalculator( fromRomanToNumber )
import Test.HUnit

testConversionOfI = TestCase $ assertEqual 
  "Should get 1 from roman I" 1 ( fromRomanToNumber "I")


main = runTestTT $ TestList [testConversionOfI]