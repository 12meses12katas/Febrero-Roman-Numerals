#!/usr/bin/python
# -*- coding:utf-8; tab-width:4; mode:python -*-

import unittest

from romannumerals import ArabianToRoman

class ArabianToRomanTest (unittest.TestCase):
    def test_translate_1 (self):
        sut = ArabianToRoman()
        self.assertEqual("I", sut.translate(1))

    def test_translate_2 (self):
        sut = ArabianToRoman()
        self.assertEqual("II", sut.translate(2))

if __name__ == '__main__':
    unittest.main()
