#!/usr/bin/python

class NumericToRomanParser:

    def __init__(self):
        self.rosettaStone = {
            1:'I',
            5:'V',
            10:'X',
            50:'L',
            100:'C',
            500:'D',
            1000:'M'
            }

    def getRomanNumber(self, number):
        if (number in self.rosettaStone):
            return self.rosettaStone[number]
        elif number > 1000:
            return 'M'+self.getRomanNumber(number-1000)
        elif number > 500:
            return 'D'+self.getRomanNumber(number-500)
        elif number > 100:
            return 'C'+self.getRomanNumber(number-100)
        elif number > 50:
            return 'L'+self.getRomanNumber(number-50)
        elif number > 10:
            return 'X'*(number/10)+self.getRomanNumber(number%10)
        elif number > 5:
            return 'V'+'I'*(number-5)
        else:
            return 'I'*number

class RomanToNumericParser:

    def __init__(self):
        self.rosettaStone = {
            'I':1,
            'V':5,
            'X':10,
            'L':50,
            'C':100,
            'D':500,
            'M':1000
            }

    def getNumericNumber(self, roman):
        roman = roman.upper()
        if roman in self.rosettaStone.keys():
            return self.rosettaStone[roman]
        elif 'M' in roman:
            return 1000*roman.count('M') + \
                self.getNumericNumber(roman.split('M')[-1])
        elif 'D' in roman:
            return 500 + \
                self.getNumericNumber(roman.split('D')[-1])
        elif 'C' in roman:
            return 100*roman.count('C') + \
                self.getNumericNumber(roman.split('C')[-1])
        elif 'L' in roman:
            return 50+self.getNumericNumber(roman.split('L')[-1])
        elif 'X' in roman:
            return 10*roman.count('X') + \
                self.getNumericNumber(roman.split('X')[-1])
        elif 'V' in roman:
            return 5 + \
                self.rosettaStone['I']*(len(roman)-1)
        else:
            return self.rosettaStone['I']*len(roman)
