#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

class ArabianToRoman:
    __NUMBERS = {
        1:"I",
        4:"IV",
        5:"V",
        9:"IX",
        10:"X",
        }

    def translate(self, roman):
        result = ""

        pos = 0

        values = [x for x in reversed(sorted(self.__NUMBERS.keys() ))]
        print values

        while roman > 0:
            while roman >= values[pos]:
                roman -= values[pos]
                result += self.__NUMBERS[values[pos]]
            pos += 1
            if pos == len(values):
                pos = 0

        return result
