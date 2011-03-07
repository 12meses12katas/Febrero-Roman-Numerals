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

    def getNumeralNumber(self, number):
        if (number in self.rosettaStone):
            return self.rosettaStone[number]
        elif number > 1000:
            return 'M'+self.getNumeralNumber(number-1000)
        elif number > 500:
            return 'D'+self.getNumeralNumber(number-500)
        elif number > 100:
            return 'C'+self.getNumeralNumber(number-100)
        elif number > 50:
            return 'L'+self.getNumeralNumber(number-50)
        elif number > 10:
            return 'X'*(number/10)+self.getNumeralNumber(number%10)
        elif number > 5:
            return 'V'+'I'*(number-5)
        else:
            return 'I'*number
