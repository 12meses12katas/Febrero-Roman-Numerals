import unittest
from RomanNumerals import RomanNumerals

class RomanNumeralsTest(unittest.TestCase):

    def setUp(self):
        self.converter = RomanNumerals()

    def toRoman(self, number):
        return self.converter.toRoman(number)

    def testSomeReplacements(self):
        self.assertEquals("V", self.toRoman(5))
        self.assertEquals("X", self.toRoman(10))
        self.assertEquals("L", self.toRoman(50))
        self.assertEquals("C", self.toRoman(100))
        self.assertEquals("D", self.toRoman(500))
        self.assertEquals("M", self.toRoman(1000))

    def testFrom1To4(self):
        self.assertEquals("I", self.toRoman(1))
        self.assertEquals("II", self.toRoman(2))
        self.assertEquals("III", self.toRoman(3))
        self.assertEquals("IV", self.toRoman(4))

    def testFrom6To8(self):
        self.assertEquals("VI", self.toRoman(6))
        self.assertEquals("VII", self.toRoman(7))
        self.assertEquals("VIII", self.toRoman(8))

    def testSomeNumbersBetween10And50(self):
        self.assertEquals("XI", self.toRoman(11))
        self.assertEquals("XXIII", self.toRoman(23))
        self.assertEquals("XXXIV", self.toRoman(34))
        self.assertEquals("XL", self.toRoman(40))

    def testSomeNumbersBetween10And50(self):
        self.assertEquals("LIII", self.toRoman(53))
        self.assertEquals("LIX", self.toRoman(59))
        self.assertEquals("LX", self.toRoman(60))
        self.assertEquals("LXIX", self.toRoman(69))
        self.assertEquals("LXX", self.toRoman(70))
        self.assertEquals("LXXIX", self.toRoman(79))

    def testSomeBigRomanNumbers(self):
        self.assertEquals("CDXCIX", self.toRoman(499))
        self.assertEquals("CMXCIX", self.toRoman(999))
        self.assertEquals("MDCCXLIII", self.toRoman(1743))
        self.assertEquals("MMCMXCIX", self.toRoman(2999))

if __name__ == "__main__":
    unittest.main()
