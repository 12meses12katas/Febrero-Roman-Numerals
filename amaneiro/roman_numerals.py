#!/usr/bin/python

class RomanNumeralsParser:

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
            return self.rosettaStone[number]
