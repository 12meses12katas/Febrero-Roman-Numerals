#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

import unittest

from romannumerals import ArabianToRoman, RomanToArabian


NUMBERS = {1:"I",
           2:"II",
           3:"III",
           4:"IV",
           5:"V",
           6:"VI",
           7:"VII",
           8:"VIII",
           9:"IX",
           10:"X",
           11:"XI",
           14:"XIV",
           15:"XV",
           19:"XIX",
           20:"XX",
           40:"XL",
           41:"XLI",
           50:"L",
           87:"LXXXVII",
           94:"XCIV",
           119:"CXIX",
           499:"CDXCIX",
           572:"DLXXII",
           1998:"MCMXCVIII",
           2751:"MMDCCLI",
           }

class ArabianToRomanTest (unittest.TestCase):
    def setUp (self):
        self.sut = ArabianToRoman()

    def test_translate (self):
        for key in NUMBERS:
            self.assertEqual(NUMBERS[key], self.sut.translate(key))

class RomanToArabianTest (unittest.TestCase):
    def setUp (self):
        self.sut = RomanToArabian()

    def test_translate (self):
        for key in NUMBERS:
            self.assertEqual(key, self.sut.translate(NUMBERS[key]))

if __name__ == '__main__':
    unittest.main()
