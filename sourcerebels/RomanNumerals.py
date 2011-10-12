import re

class RomanNumerals():

    def __init__(self):

        self.replacements = [ ("1000", "M" ), 
                              ("900" , "CM"),
                              ("500" , "D" ),
                              ("400" , "CD"),
                              ("100" , "C" ),
                              ("90"  , "XC"),
                              ("50"  , "L" ),
                              ("40"  , "XL"),
                              ("10"  , "X" ),
                              ("9"   , "IX"),
                              ("5"   , "V" ), 
                              ("4"   , "IV") ]

    def fixSymbols(self, roman):
        
        for howManyItoReplace, replacement in self.replacements:
            patternToReplace = "I{%s}" % howManyItoReplace
            roman = re.sub(patternToReplace, replacement, roman) 

        return roman

    def toRoman(self, number):

        roman = ""

        for unit in range(0, number):
            roman = roman + "I"

        return self.fixSymbols(roman)
