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

if __name__ == '__main__':
    unittest.main()
