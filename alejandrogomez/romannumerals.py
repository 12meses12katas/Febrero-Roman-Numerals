#!/usr/bin/env python
# encoding: utf-8

_ROSETTA_STONE = {
                    0 : '',
                    1 : 'I',
                    4 : "IV",
                    5 : 'V',
                    9 : "IX",
                    10 : 'X',
                    40 : "XL",
                    50 : 'L',
                    90 : "XC",
                    100 : 'C',
                    500 : 'D',
                    400 : "CD",
                    900 : "CM",
                    1000 : 'M',
                 }

class ArabicToRoman:
    """Class that performs a conversion from arabic to roman numbers."""
                    
    def __init__(self):
        self.arabic = 0
        self.roman = ''
        
    def to_roman(self, arabic):
        """Convert the given arabic to roman."""
        self.arabic = arabic
        fractions = self._split_arabic(self.arabic)
        self.roman = ''.join(map(self._roman, fractions))
        return self.roman
        
    def _split_arabic(self, arabic):
        """
        Splits the given arabic number into easily convertible values.
        
        e.g. 1990 is rendered: [1000, 900, 90]
        """
        arabic = str(arabic)
        splitted_arabic = []
        i = len(arabic) - 1
        for digit in arabic:
            n = 10 ** i
            splitted_arabic.append(int(digit) * n)
            i -= 1
        return splitted_arabic
        
    def _roman(self, arabic):
        """Converts arabic to its roman representation."""
        if arabic not in _ROSETTA_STONE.keys():
            return self._composed_roman(arabic)
        return _ROSETTA_STONE[arabic]
        
    def _composed_roman(self, arabic):
        """
        Takes the closest arabic with roman representation, converts
        it to a roman numeral and concatenates it with the conversion
        of the rest of the number.
        """
        arabics = filter(lambda x: x < arabic, _ROSETTA_STONE.keys())
        arabics.sort()
        closest = arabics.pop()
        return _ROSETTA_STONE[closest] + self._roman(arabic - closest)
        
class RomanToArabic:
    """Class that performs a conversion from roman to arabic numbers."""
    
    
    def __init__(self):
        self.roman = ''
        self.arabic = 0
        
    def to_arabic(self, roman):
        """Convert the given roman to arabic."""
        self.roman = roman
        fractions = self._split_roman(roman)
        self.arabic = sum(map(self._arabic, fractions))
        return self.arabic
        
    def _split_roman(self, roman):
        """
        Splits the given roman number into easily convertible values.
        
        e.g. "MCMXC" is rendered: ["M", "CM", "XC"]
        """
        splitted_roman = []
        while roman:
            first = roman[0]
            roman = roman[1:]
            split_index = self._next_smaller_index(first, roman)
            splitted_roman.append(first + roman[:split_index])
            roman = roman[split_index:]
        return splitted_roman
        
    def _next_smaller_index(self, number, romans):
        """
        Returns the index of the first roman number in `romans`
        smaller than `number`.
        """
        arabics = _ROSETTA_STONE.keys()
        arabics.sort()
        sorted_romans = [_ROSETTA_STONE[arabic] for arabic in arabics]
        i = 0
        for roman in romans:
            if sorted_romans.index(roman) < sorted_romans.index(number):
                return i
            i += 1
        return i
        
    def _next_greater_index(self, number, romans):
        """
        Returns the index of the first roman number in `romans`
        greater than `number`.
        
        If there is no greater roman number returns -1.
        """
        arabics = _ROSETTA_STONE.keys()
        arabics.sort()
        sorted_romans = [_ROSETTA_STONE[arabic] for arabic in arabics]
        i = 0
        for roman in romans:
            if sorted_romans.index(roman) > sorted_romans.index(number):
                return i
            i += 1
        return -1
        
                
    def _arabic(self, roman):
        """Converts roman to its arabic representation."""
        for arabic in _ROSETTA_STONE.keys():
            if _ROSETTA_STONE[arabic] == roman:
                return arabic
        return self._composed_arabic(roman)
        
    def _composed_arabic(self, roman):
        """
        Calculates the value of roman numerals where operations such
        a substraction has to be performed.
        
        e.g. "MMM" returns 3000
        """
        arabic = 0
        first = roman[0]
        roman = roman[1:]
        split_index = self._next_greater_index(first, roman)
        if split_index > 0:
            substract = first + roman[:split_index]
            greatest = roman[split_index:]
            arabic = sum(map(self._arabic, greatest)) - sum(map(self._arabic, substract))
        else:
            arabic =  self._arabic(first) + sum(map(self._arabic, roman))
        return arabic