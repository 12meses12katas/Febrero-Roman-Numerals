#!/usr/bin/python

import unittest
from roman_numerals import NumericToRomanParser

class NumericToRomanParserTestCase(unittest.TestCase):

    def setUp(self):
        self.parser = NumericToRomanParser()

    def testMainSymbols(self):
        self.assertEqual(self.parser.getRomanNumber(1), 'I')
        self.assertEqual(self.parser.getRomanNumber(5), 'V')
        self.assertEqual(self.parser.getRomanNumber(10), 'X')
        self.assertEqual(self.parser.getRomanNumber(50), 'L')
        self.assertEqual(self.parser.getRomanNumber(100), 'C')
        self.assertEqual(self.parser.getRomanNumber(500), 'D')
        self.assertEqual(self.parser.getRomanNumber(1000), 'M')

    def testNumbersLowerThanFive(self):
        self.assertEqual(self.parser.getRomanNumber(2), 'II')
        self.assertEqual(self.parser.getRomanNumber(3), 'III')
        self.assertEqual(self.parser.getRomanNumber(4), 'IIII')

    def testNumbersBetweenFiveAndTen(self):
        self.assertEqual(self.parser.getRomanNumber(6), 'VI')
        self.assertEqual(self.parser.getRomanNumber(7), 'VII')
        self.assertEqual(self.parser.getRomanNumber(8), 'VIII')
        self.assertEqual(self.parser.getRomanNumber(9), 'VIIII')

    def testNumbersBetweenXAndL(self):
        self.assertEqual(self.parser.getRomanNumber(11), 'XI')
        self.assertEqual(self.parser.getRomanNumber(15), 'XV')
        self.assertEqual(self.parser.getRomanNumber(23), 'XXIII')
        self.assertEqual(self.parser.getRomanNumber(29), 'XXVIIII')

    def testMeaningOfLife(self):
        self.assertEqual(self.parser.getRomanNumber(42), 'XXXXII')

    def testNumbersBetweenLAndC(self):
        self.assertEqual(self.parser.getRomanNumber(51), 'LI')
        self.assertEqual(self.parser.getRomanNumber(99), 'LXXXXVIIII')

    def testNumbersBetweenCAndD(self):
        self.assertEqual(self.parser.getRomanNumber(105), 'CV')
        self.assertEqual(self.parser.getRomanNumber(205), 'CCV')
        self.assertEqual(self.parser.getRomanNumber(399), 'CCCLXXXXVIIII')

    def testNumbersBetweenDAndM(self):
        self.assertEqual(self.parser.getRomanNumber(501), 'DI')

    def testNumbersBetweenMAndMMM(self):
        self.assertEqual(self.parser.getRomanNumber(1999), 'MDCCCCLXXXXVIIII')
        self.assertEqual(self.parser.getRomanNumber(2956), 'MMDCCCCLVI')

if __name__ == '__main__':
    unittest.main()
