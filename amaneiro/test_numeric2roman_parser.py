#!/usr/bin/python

import unittest
from roman_numerals import NumericToRomanParser

class NumericToRomanParserTestCase(unittest.TestCase):

    def setUp(self):
        self.parser = NumericToRomanParser()

    def testMainSymbols(self):
        self.assertEqual(self.parser.getNumeralNumber(1), 'I')
        self.assertEqual(self.parser.getNumeralNumber(5), 'V')
        self.assertEqual(self.parser.getNumeralNumber(10), 'X')
        self.assertEqual(self.parser.getNumeralNumber(50), 'L')
        self.assertEqual(self.parser.getNumeralNumber(100), 'C')
        self.assertEqual(self.parser.getNumeralNumber(500), 'D')
        self.assertEqual(self.parser.getNumeralNumber(1000), 'M')

    def testNumbersLowerThanFive(self):
        self.assertEqual(self.parser.getNumeralNumber(2), 'II')
        self.assertEqual(self.parser.getNumeralNumber(3), 'III')
        self.assertEqual(self.parser.getNumeralNumber(4), 'IIII')

    def testNumbersBetweenFiveAndTen(self):
        self.assertEqual(self.parser.getNumeralNumber(6), 'VI')
        self.assertEqual(self.parser.getNumeralNumber(7), 'VII')
        self.assertEqual(self.parser.getNumeralNumber(8), 'VIII')
        self.assertEqual(self.parser.getNumeralNumber(9), 'VIIII')

    def testNumbersBetweenXAndL(self):
        self.assertEqual(self.parser.getNumeralNumber(11), 'XI')
        self.assertEqual(self.parser.getNumeralNumber(15), 'XV')
        self.assertEqual(self.parser.getNumeralNumber(23), 'XXIII')
        self.assertEqual(self.parser.getNumeralNumber(29), 'XXVIIII')

    def testMeaningOfLife(self):
        self.assertEqual(self.parser.getNumeralNumber(42), 'XXXXII')

    def testNumbersBetweenLAndC(self):
        self.assertEqual(self.parser.getNumeralNumber(51), 'LI')
        self.assertEqual(self.parser.getNumeralNumber(99), 'LXXXXVIIII')

    def testNumbersBetweenCAndD(self):
        self.assertEqual(self.parser.getNumeralNumber(105), 'CV')
        self.assertEqual(self.parser.getNumeralNumber(205), 'CCV')
        self.assertEqual(self.parser.getNumeralNumber(399), 'CCCLXXXXVIIII')

    def testNumbersBetweenDAndM(self):
        self.assertEqual(self.parser.getNumeralNumber(501), 'DI')

    def testNumbersBetweenMAndMMM(self):
        self.assertEqual(self.parser.getNumeralNumber(1999), 'MDCCCCLXXXXVIIII')
        self.assertEqual(self.parser.getNumeralNumber(2956), 'MMDCCCCLVI')

if __name__ == '__main__':
    unittest.main()
