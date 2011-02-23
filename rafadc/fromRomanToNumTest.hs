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

testConversionOfX = TestCase $ assertEqual 
  "Should get 10 from roman X" 10 ( fromRomanToNumber "X")

testConversionOfXVI = TestCase $ assertEqual 
  "Should get 16 from roman XVI" 16 ( fromRomanToNumber "XVI")

testsForX = TestList [testConversionOfX, testConversionOfXVI]

testConversionOfXL = TestCase $ assertEqual 
  "Should get 40 from roman XL" 40 ( fromRomanToNumber "XL")

testConversionOfXLII = TestCase $ assertEqual 
  "Should get 42 from roman XLII" 42 ( fromRomanToNumber "XLII")

testsForXL = TestList [testConversionOfXL, testConversionOfXLII]

testConversionOfLVI = TestCase $ assertEqual 
  "Should get 56 from roman LVI" 56 ( fromRomanToNumber "LVI")

testConversionOfXCII = TestCase $ assertEqual 
  "Should get 92 from roman XCII" 92 ( fromRomanToNumber "XCII")

testConversionOfCLII = TestCase $ assertEqual 
  "Should get 152 from roman CLII" 152 ( fromRomanToNumber "CLII")

testConversionOfCDIX = TestCase $ assertEqual 
  "Should get 409 from roman CDIX" 409 ( fromRomanToNumber "CDIX")

main = runTestTT $ TestList [testsForI, testConversionOfIV, testsForV, testConversionOfIX, testsForX,
							 testsForXL, testConversionOfLVI, testConversionOfXCII, testConversionOfCLII,
							 testConversionOfCDIX]