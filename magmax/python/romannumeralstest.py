#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

import unittest

from romannumerals import ArabianToRoman

class ArabianToRomanTest (unittest.TestCase):

    NUMBERS = {1:"I",
               2:"II",
               3:"III",
               4:"IV",
               }

    def setUp (self):
        self.sut = ArabianToRoman()

    def test_translate (self):
        for key in self.NUMBERS:
            self.assertEqual(self.NUMBERS[key], self.sut.translate(key))

if __name__ == '__main__':
    unittest.main()
