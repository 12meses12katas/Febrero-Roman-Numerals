#!/usr/bin/env python
# encoding: utf-8

import unittest

from romannumerals import ArabicToRoman, RomanToArabic


NUMBERS = {
            0 : '',
            1 : 'I',
            2 : "II",
            3 : "III",
            4 : "IV",
            5 : 'V',
            6 : "VI",
            7 : "VII",
            8 : "VIII",
            9 : "IX",
            10 : 'X',
            11 : "XI",
            14 : "XIV",
            15 : "XV",
            19 : "XIX",
            20 : "XX",
            40 : "XL",
            41 : "XLI",
            50 : 'L',
            87 : "LXXXVII",
            94 : "XCIV",
            119 : "CXIX",
            499 : "CDXCIX",
            572 : "DLXXII",
            1444 : "MCDXLIV",
            1998 : "MCMXCVIII",
            2751 : "MMDCCLI",
            3000 : "MMM",
           }

class  ArabicToRomanTests(unittest.TestCase):
    def setUp(self):
        self.sut = ArabicToRoman()
        
    def test_to_roman(self):
        for arabic in NUMBERS:
            self.assertEqual(NUMBERS[arabic], self.sut.to_roman(arabic))

class  RomanToArabicTests(unittest.TestCase):
    def setUp(self):
        self.sut = RomanToArabic()
        
    def test_to_arabic(self):
        for arabic in NUMBERS:
            self.assertEqual(arabic, self.sut.to_arabic(NUMBERS[arabic]))
    
if __name__ == '__main__':
    unittest.main()