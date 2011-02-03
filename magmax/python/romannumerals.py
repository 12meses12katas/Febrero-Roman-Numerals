#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

class ArabianToRoman:
    _EQUIVALENCES = [
        (1000, 'M'),
        (500, 'D'),
        (100, 'C'),
        (50, 'L'),
        (10, 'X'),
        (5, 'V'),
        (1, 'I')
        ]

    _EQUIVALENCES_MULTI = [
        (900, 'CM'),
        (400, 'CD'),
        (90, 'XC'),
        (40, 'XL'),
        (9, 'IX'),
        (4, 'IV'),
        ]

    def __init__(self):
        self.arabian = 0
        self.translated = ""

    def translate(self, arabian):
        self.arabian = arabian
        self.translated = ""

        self.__apply_all ()

        return self.translated

    def __apply_all (self):
        pos = 0
        last_value = 0
        while self.arabian > 0:
            if last_value == self.arabian:
                pos += 1
            last_value = self.arabian
            self.__apply (*self._EQUIVALENCES[pos])
            self.__apply_multiletter (pos)

    def __apply (self, arabian, roman):
        while self.arabian >= arabian:
            self.__add_value ( arabian, roman)

    def __apply_multiletter (self, pos):
        if pos >= len (self._EQUIVALENCES_MULTI):
            return
        arabian, roman = self._EQUIVALENCES_MULTI[pos]
        if self.arabian >= arabian:
            self.__add_value ( arabian, roman)

    def __add_value ( self, arabian, roman ):
        self.arabian -= arabian
        self.translated += roman
