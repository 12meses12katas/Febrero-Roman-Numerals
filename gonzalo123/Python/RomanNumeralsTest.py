import unittest
import RomanNumerals

class RomanNumeralsTest (unittest.TestCase):
    def setUp(self):
        self.rn = RomanNumerals.RomanNumerals()
        
    def _test_simple(self):
        self.assertEquals("I", self.rn.num2Romans(1))
        self.assertEquals(1, self.rn.roman2Nums(""))

        self.assertEquals("V", self.rn.num2Romans(5))
        self.assertEquals5(5, self.rn.roman2Nums("V"))
        
        self.assertEquals("X", self.rn.num2Romans(10))
        self.assertEquals(10, self.rn.roman2Nums(""))

    def test_complex(self):
        self.assertEquals("VII", self.rn.num2Romans(7))
        self.assertEquals(7, self.rn.roman2Nums("VII"))

        self.assertEquals("XIV", self.rn.num2Romans(14))
        self.assertEquals(14, self.rn.roman2Nums("XIV"))

        self.assertEquals("XXIII", self.rn.num2Romans(23))
        self.assertEquals(23, self.rn.roman2Nums("XXIII"))

        self.assertEquals("CXLV", self.rn.num2Romans(145))
        self.assertEquals(145, self.rn.roman2Nums("CXLV"))

        self.assertEquals("MCMLXXV", self.rn.num2Romans(1975))
        self.assertEquals(1975, self.rn.roman2Nums("MCMLXXV"))

        self.assertEquals("XLII", self.rn.num2Romans(42))
        self.assertEquals(42, self.rn.roman2Nums("XLII"))

    def test_kata(self):
        self.assertEquals("MCMXCIX", self.rn.num2Romans(1999))
        self.assertEquals(1999, self.rn.roman2Nums("MCMXCIX"))


if __name__ == '__main__':
    unittest.main()
