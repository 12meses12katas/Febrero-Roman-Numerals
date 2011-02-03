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
            self.__apply_singleletter (pos)
            self.__apply_multiletter (pos)

    def __apply_singleletter (self, pos):
        self.__add_value (*self.__single_at(pos))

    def __apply_multiletter (self, pos):
        self.__add_value (*self.__multiple_at(pos))

    def __add_value ( self, arabian, roman ):
        while self.arabian >= arabian:
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


class RomanToArabian:
    _EQUIVALENCES = [
        ('L',50),
        ('X',10),
        ('V',5),
        ('I',1),
        ('', 0),
        ]
    def __init__(self):
        self.roman = ''
        self.arabian = 0
        self.prev = ''
        self.current = None

    def translate(self, roman):
        self.arabian = 0
        self.roman = roman
        self.prev = ''
        self.current = None

        self.__translate()

        return self.arabian

    def __translate(self):
        for each in self.roman:
            self.current = each
            self.__apply_char ()
            self.prev = each

    def __apply_char (self):
        self.arabian +=  self.__value_of(self.current)
        if self.__must_substract():
            self.arabian -= 2*self.__value_of(self.prev)

    def __must_substract (self):
        return self.__value_of(self.prev) < self.__value_of(self.current)

    def __value_of (self, roman):
        for k,v in self._EQUIVALENCES:
            if k == roman:
                return v
        raise ValueError("invalid number: " + roman)
