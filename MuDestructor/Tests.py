'''
Created on 01/03/2011

@author: Fergus
'''

import unittest
from Numerals import Numerals

class Tests(unittest.TestCase):
    
    def setUp(self):
        self.numerals = Numerals()
        
    def testGlobal(self):
        self.dobleConversion("I",1)
        self.dobleConversion("II", 2)
        self.dobleConversion("III",3)   
        self.dobleConversion("IV",4)
        self.dobleConversion("V",5)
        self.dobleConversion("VI",6)
        self.dobleConversion("VII",7)
        self.dobleConversion("VIII",8)
        self.dobleConversion("IX",9)
        self.dobleConversion("X",10)
        self.dobleConversion("XI",11)
        self.dobleConversion("XII",12)
        self.dobleConversion("XV",15)
        self.dobleConversion("XX",20)
        self.dobleConversion("XXX",30)
        self.dobleConversion("XXXIX",39)
        self.dobleConversion("XL",40)
        self.dobleConversion("XLI",41)
        self.dobleConversion("XLV",45)
        self.dobleConversion("L",50)
        self.dobleConversion("LX",60)
        self.dobleConversion("LXX",70)
        self.dobleConversion("LXXX",80)
        self.dobleConversion("XC",90)
        self.dobleConversion("LXIX",69)
        self.dobleConversion("XCIX",99)
        self.dobleConversion("CDL",450)
        self.dobleConversion("DCLXVI",666)
        self.dobleConversion("CMXCIX",999)
        self.dobleConversion("MCDXLIV",1444)
        self.dobleConversion("MCM",1900)
        self.dobleConversion("MMVIII",2008)
        self.dobleConversion("MMIX",2009)
        self.dobleConversion("MMXI",2011)
        self.dobleConversion("MMXII",2012)
        self.dobleConversion("MMXIII",2013)
        self.dobleConversion("MMXIV",2014)
        self.dobleConversion("MMXV",2015)
        self.dobleConversion("MMXVI",2016)
        
    def dobleConversion(self, romano, numero):
        mensaje = "Error al pasar " + str(romano) + " a " + str(numero) + "; resultado = " + str(self.numerals.romanoANumero(romano))
        self.assertEquals(self.numerals.romanoANumero(romano),numero,mensaje)
        mensaje =  "Error al pasar " + str(numero) + " a " + str(romano) + "; resultado = " + str(self.numerals.numeroARomano(numero))
        self.assertEquals(self.numerals.numeroARomano(numero),romano,mensaje)
        
if __name__ == "__main__":
    unittest.main()