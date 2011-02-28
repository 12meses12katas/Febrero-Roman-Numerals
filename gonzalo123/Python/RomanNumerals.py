class RomanNumerals:
    _numerals = {
            1 : "I",
            4 : "IV",  # substract
            5 : "V",
            9: "IX", # substract
            10 : "X",
            40 : "XL", # substract
            50 : "L",
            90 : "XC", # substract
            100 : "C",
            400 : "CD", # substract
            500 : "D",
            900 : "CM", # substract
            1000 : "M"
            }

    def _getKeys(self):
        keys = self._numerals.keys() 
        keys.sort() 
        keys.reverse()

        return keys

    def num2Romans(self, number):
        out = ""
        for i in self._getKeys():
            count = number / i
            out = "%s%s" % (out, self._numerals[i] * count)
            number -= i * count
        return out

    def roman2Nums(self, roman):
        romanValues = ('M', 'D', 'C', 'L', 'X', 'V', 'I')
        romanKeys = (1000, 500, 100, 50, 10, 5, 1)
        out = 0

        for i in range(len(roman)):
            c = roman[i]
            value = romanKeys[romanValues.index(c)]
            if len(roman) > i+1:
                nextvalue = romanKeys[romanValues.index(roman[i+1])]
                if nextvalue > value:
                    value *= -1
            out += value
        return out
