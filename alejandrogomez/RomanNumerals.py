#!/usr/bin/env python
# encoding: utf-8

"""
RomanNumerals.py

@author Alejandro Gómez <alejandroogomez@gmail.com>
"""

EQUIVALENCES =  {   
                1:'I',
                4:"IV",
                5:'V',
                9:"IX",
                10:'X',
                40:"XL",
                50:'L',
                90:"XC",
                100:'C',
                400:"CD",
                500:'D', 
                900:"CM",
                1000:'M'
                }

def arabic_to_roman(value):
    """Converts an arabic value to a roman number."""
    roman = ""
    if value:
        arabics = __split_arabic(value)
        for arabic in arabics:
            roman += __convert_to_roman(arabic)
    return roman

def __split_arabic(arabic_):
    """
    Splits an arabic to simpler arabics.
    
    e.g. __split_arabic(1444) will return [1000, 400, 40, 4]
    """
    arabic = str(arabic_)
    arabic_lenght = len(arabic)
    splitted_arabic = []
    for digit in arabic:
        if arabic_lenght > 0:
            arabic_lenght -= 1
        simpler_arabic = int(digit) * 10 ** arabic_lenght
        splitted_arabic.append(simpler_arabic)
    return splitted_arabic

def __convert_to_roman(number):
    """Converts `number` arabic number to a roman number."""
    roman = ''
    if EQUIVALENCES.has_key(number):
        roman = EQUIVALENCES[number]
    elif number > 0:
        arabics = EQUIVALENCES.keys()
        arabics.sort()
        nums = filter(lambda x: x < number, arabics)
        greatest = nums[-1]
        roman += EQUIVALENCES[greatest]
        rest = number - greatest
        roman += __convert_to_roman(rest)
    return roman       
        
def roman_to_arabic(value):
    """Converts a roman number `value` to arabic."""
    arabic_value = 0
    if value:
        romans = __split_roman(value)
        for roman in romans:
            arabic_value += __convert_to_arabic(roman)
    return arabic_value

def __split_roman(roman):
    """
    Splits a roman number to simple romans.
    
    e.g. __split_roman("MCDXLIV") will return ["M", "CD", "XL", "IV"]
    """
    roman_splitted = []
    simple_roman = roman[0]
    roman = roman[1:]
    for letter in roman:
        if __greater_or_equal_roman(letter, simple_roman[-1]):
            simple_roman += letter
        else:
            roman_splitted.append(simple_roman)
            simple_roman = letter
    roman_splitted.append(simple_roman)
    return roman_splitted

def __convert_to_arabic(number):
    """
    Converts `number` roman number to arabic.
    
    This function takes romans letters or simple compositions
    like "MC", "XIII" or "XC" and converts it into arabic.
    """
    arabic = 0
    if number:
        first = number[0]
        last = number[-1]
        if __greater_or_equal_roman(first, last):
            for num in number:
                arabic += __arabic(num)
        else:
            arabic = __arabic(last)
            substract = number[:-1]
            for num in substract:
                arabic -= __arabic(num)
    return arabic

def __greater_or_equal_roman(gr_or_eq, low):
    """Returns True if `gr_or_eq` is a greather or equal roman than low."""
    arabics = EQUIVALENCES.keys()
    arabics.sort()
    romans_sorted = []
    for arabic in arabics:
        romans_sorted.append(EQUIVALENCES[arabic])
    return romans_sorted.index(gr_or_eq) >= romans_sorted.index(low)        
            
def __lower_roman(lower, greater):
    """Returns True if `lower` is a lower roman number than `greater`."""
    return not __greater_or_equal_roman(lower, greater)
 
def __arabic(roman):
    """Returns arabic value of `roman` roman number."""
    arabic = 0
    if roman in EQUIVALENCES.values():
        for arabic in EQUIVALENCES:
            if EQUIVALENCES[arabic] is roman:
                return arabic
    return arabic  


if __name__ == "__main__":
    for arabic in range(4000):
        roman = arabic_to_roman(arabic)
        if roman_to_arabic(roman) != arabic:
            print "value %d has FAILED" % arabic
            print roman