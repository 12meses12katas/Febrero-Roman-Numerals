import unittest
from RomanNumerals import RomanNumerals

class Test(unittest.TestCase):

    def setUp(self):
        self.roman = RomanNumerals()
        
    def testSimple(self):
        self.checkConversion(1,"I")
        self.checkConversion(4,"IV")
        self.checkConversion(5,"V")
        self.checkConversion(9,"IX")
        self.checkConversion(10,"X")
        self.checkConversion(40,"XL")
        self.checkConversion(50,"L")
        self.checkConversion(90,"XC")
        self.checkConversion(100,"C")
        self.checkConversion(400,"CD")
        self.checkConversion(500,"D")
        self.checkConversion(900,"CM")
        self.checkConversion(1000,"M")
        
    def testTens(self):
        self.checkConversion(11,"XI")
        self.checkConversion(12,"XII")
        self.checkConversion(13,"XIII")
        self.checkConversion(14,"XIV")
        self.checkConversion(19,"XIX")
        self.checkConversion(20,"XX")
        self.checkConversion(24,"XXIV")
        self.checkConversion(31,"XXXI")
        self.checkConversion(38,"XXXVIII")
        self.checkConversion(45,"XLV")
        self.checkConversion(71,"LXXI")
        self.checkConversion(87,"LXXXVII")
        self.checkConversion(99,"XCIX")
        
    def testHundreds(self):
        self.checkConversion(109,"CIX")
        self.checkConversion(203,"CCIII")
        self.checkConversion(303,"CCCIII")
        self.checkConversion(304,"CCCIV")
        self.checkConversion(450,"CDL")
        self.checkConversion(546,"DXLVI")
        self.checkConversion(671,"DCLXXI")
        self.checkConversion(788,"DCCLXXXVIII")
        self.checkConversion(888,"DCCCLXXXVIII")
        self.checkConversion(999,"CMXCIX")
        
    def testThousands(self):
        self.checkConversion(1010,"MX")
        self.checkConversion(1111,"MCXI")
        self.checkConversion(1234,"MCCXXXIV")
        self.checkConversion(2342,"MMCCCXLII")
        self.checkConversion(2999,"MMCMXCIX")
        
    def checkConversion(self,numeral, roman):
        self.assertEquals(roman, self.roman.intToRoman(numeral))
        self.assertEquals(numeral, self.roman.romanToInt(roman))
    
if __name__ == "__main__":
    unittest.main()