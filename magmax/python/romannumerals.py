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

    _INFINITE = (3000, '')

    def __init__(self):
        self.arabian = 0
        self.translated = ""

    def translate(self, arabian):
        self.arabian = arabian
        self.translated = ""

        self.__apply_all ()

        return self.translated

    def __apply_all (self):
        for pos in xrange(len(self._EQUIVALENCES)):
            last_value = self.arabian
            self.__apply_singleletter (pos)
            self.__apply_multiletter (pos)

    def __apply_singleletter (self, pos):
        arabian, roman = self.__single_at(pos)
        while self.arabian >= arabian:
            self.__add_value ( arabian, roman)

    def __apply_multiletter (self, pos):
        arabian, roman = self.__multiple_at(pos)
        if self.arabian >= arabian:
            self.__add_value ( arabian, roman)

    def __add_value ( self, arabian, roman ):
        self.arabian -= arabian
        self.translated += roman

    def __single_at (self, pos):
        if pos >= len (self._EQUIVALENCES):
            return self._INFINITE
        return self._EQUIVALENCES[pos]

    def __multiple_at (self, pos):
        ms = self.__single_at(pos)
        ls = self.__single_at(pos + 2 - (pos%2))
        return abs(ms[0]-ls[0]), ls[1]+ms[1]
