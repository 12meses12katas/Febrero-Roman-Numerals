#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

import unittest

from romannumerals import ArabianToRoman

class ArabianToRomanTest (unittest.TestCase):
    def setUp (self):
        self.sut = ArabianToRoman()

    def test_translate_1 (self):
        self.assertEqual("I", self.sut.translate(1))

    def test_translate_2 (self):
        self.assertEqual("II", self.sut.translate(2))

    def test_translate_3 (self):
        self.assertEqual("III", self.sut.translate(3))

if __name__ == '__main__':
    unittest.main()
