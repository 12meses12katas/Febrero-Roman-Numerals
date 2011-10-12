#!/usr/bin/python

import unittest
from roman_numerals import RomanToNumericParser

class RomanToNumericParserTestCase(unittest.TestCase):

    def setUp(self):
        self.parser = RomanToNumericParser()

    def testInputIsLowerCase(self):
        self.assertEqual(self.parser.getNumericNumber('i'),1)
        self.assertEqual(self.parser.getNumericNumber('xxxxii'), 42)

    def textInputIsMixCase(self):
        self.assertEqual(self.parser.getNumericNumber('MDcCCcLXxxXViIII'),1999)

    def testMainSymbols(self):
        self.assertEqual(self.parser.getNumericNumber('I'), 1)
        self.assertEqual(self.parser.getNumericNumber('V'), 5)
        self.assertEqual(self.parser.getNumericNumber('X'), 10)
        self.assertEqual(self.parser.getNumericNumber('L'), 50)
        self.assertEqual(self.parser.getNumericNumber('C'), 100)
        self.assertEqual(self.parser.getNumericNumber('D'), 500)
        self.assertEqual(self.parser.getNumericNumber('M'), 1000)

    def testNumbersLowerThanFive(self):
        self.assertEqual(self.parser.getNumericNumber('II'), 2)
        self.assertEqual(self.parser.getNumericNumber('III'), 3)
        self.assertEqual(self.parser.getNumericNumber('IIII'), 4)

    def testNumbersBetweenFiveAndTen(self):
        self.assertEqual(self.parser.getNumericNumber('VI'), 6)
        self.assertEqual(self.parser.getNumericNumber('VII'), 7)
        self.assertEqual(self.parser.getNumericNumber('VIII'), 8)
        self.assertEqual(self.parser.getNumericNumber('VIIII'), 9)

    def testNumbersBetweenXAndL(self):
        self.assertEqual(self.parser.getNumericNumber('XI'), 11)
        self.assertEqual(self.parser.getNumericNumber('XV'), 15)
        self.assertEqual(self.parser.getNumericNumber('XXIII'), 23)
        self.assertEqual(self.parser.getNumericNumber('XXVIIII'), 29)

    def testMeaningOfLife(self):
        self.assertEqual(self.parser.getNumericNumber('XXXXII'), 42)

    def testNumbersBetweenLAndC(self):
        self.assertEqual(self.parser.getNumericNumber('LI'), 51)
        self.assertEqual(self.parser.getNumericNumber('LXXXXVIIII'), 99)

    def testNumbersBetweenCAndD(self):
        self.assertEqual(self.parser.getNumericNumber('CV'), 105)
        self.assertEqual(self.parser.getNumericNumber('CCV'), 205)
        self.assertEqual(self.parser.getNumericNumber('CCCLXXXXVIIII'), 399)

    def testNumbersBetweenDAndM(self):
        self.assertEqual(self.parser.getNumericNumber('DI'), 501)

    def testNumbersBetweenMAndMMM(self):
        self.assertEqual(self.parser.getNumericNumber('MDCCCCLXXXXVIIII'), 1999)
        self.assertEqual(self.parser.getNumericNumber('MMDCCCCLVI'), 2956)

if __name__ == '__main__':
    unittest.main()
