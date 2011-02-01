#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

class ArabianToRoman:

    def __init__(self):
        self.arabian = 0
        self.translated = ""

    def translate(self, arabian):
        self.arabian = arabian
        self.translated = ""

        self.__apply (10, "X")
        self.__apply (9, "IX")
        self.__apply (5, "V")
        self.__apply (4, "IV")
        self.__apply (1, "I")

        return self.translated

    def __apply (self, arabian, roman):
        while self.arabian >= arabian:
            self.arabian -= arabian
            self.translated += roman
