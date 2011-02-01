#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

class ArabianToRoman:

    def __init__(self):
        self.arabian = 0
        self.translated = ""

    def translate(self, arabian):
        self.arabian = arabian
        self.translated = ""

        self.__apply_all ()


        return self.translated

    def __apply_all (self):
        equivalences = [
            (10, 'X'),
            (9, 'IX'),
            (5, 'V'),
            (4, 'IV'),
            (1, 'I')
            ]

        for k, v in equivalences:
            self.__apply (k, v)

    def __apply (self, arabian, roman):
        while self.arabian >= arabian:
            self.arabian -= arabian
            self.translated += roman
