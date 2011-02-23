module FromRomanToNum_Test where

import RomanCalculator( fromRomanToNumber )
import Test.HUnit

testConversionOfI = TestCase $ assertEqual 
  "Should get 1 from roman I" 1 ( fromRomanToNumber "I")

testConversionOfII = TestCase $ assertEqual 
  "Should get 2 from roman II" 2 ( fromRomanToNumber "II")

testConversionOfIII = TestCase $ assertEqual 
  "Should get 3 from roman III" 3 ( fromRomanToNumber "III")

testsForI = TestList [testConversionOfI, testConversionOfII, testConversionOfIII]

testConversionOfIV = TestCase $ assertEqual 
  "Should get 4 from roman IV" 4 ( fromRomanToNumber "IV")

testConversionOfV = TestCase $ assertEqual 
  "Should get 5 from roman V" 5 ( fromRomanToNumber "V")

testConversionOfVIII = TestCase $ assertEqual 
  "Should get 8 from roman VIII" 8 ( fromRomanToNumber "VIII")

testsForV = TestList [testConversionOfV, testConversionOfVIII]

testConversionOfIX = TestCase $ assertEqual 
  "Should get 9 from roman IX" 9 ( fromRomanToNumber "IX")

main = runTestTT $ TestList [testsForI, testConversionOfIV, testsForV, testConversionOfIX]