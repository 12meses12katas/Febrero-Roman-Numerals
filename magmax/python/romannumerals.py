#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

class ArabianToRoman:

    def translate(self, roman):
        result = ""

        if roman >=10:
            roman -= 10
            result += "X"

        if roman == 9:
            roman -= 9
            result += "IX"

        if roman >= 5:
            roman -= 5
            result += "V"

        if roman == 4:
            roman -= 4
            result += "IV"

        result += "I"*roman

        return result
