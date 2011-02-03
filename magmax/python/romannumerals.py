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
        return self._EQUIVALENCES[pos]

    def __multiple_at (self, pos):
        if pos+2 >= len(self._EQUIVALENCES):
            return 100000, ''
        ms = self._EQUIVALENCES[pos]
        ls = None
        if pos % 2:
            ls = self._EQUIVALENCES[pos+2]
        else:
            ls = self._EQUIVALENCES[pos+1]
        return ms[0]-ls[0], ls[1]+ms[1]
