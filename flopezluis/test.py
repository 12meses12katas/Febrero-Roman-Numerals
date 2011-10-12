import random
import unittest
from roman import Roman
class TestRomans(unittest.TestCase):

    def test_roman(self):
        self.assertEqual(Roman.I, 1)
        self.assertEqual(Roman.III, 3)
        self.assertEqual(Roman.IV, 4)
        self.assertEqual(Roman.V, 5)
        self.assertEqual(Roman.VI, 6)
        self.assertEqual(Roman.IX, 9)
        self.assertEqual(Roman.XXIV, 24)
        self.assertEqual(Roman.XXXI, 31)
        self.assertEqual(Roman.CCCLXIX, 369)
        self.assertEqual(Roman.CD, 400)
        self.assertEqual(Roman.CDXLVIII, 448)


        self.assertEqual(Roman.to_roman(1), 'I')
        self.assertEqual(Roman.to_roman(3), 'III')
        self.assertEqual(Roman.to_roman(4) , 'IV')
        self.assertEqual(Roman.to_roman(5), 'V')
        self.assertEqual(Roman.to_roman(6), 'VI')
        self.assertEqual(Roman.to_roman(9), 'IX')
        self.assertEqual(Roman.to_roman(24), 'XXIV')
        self.assertEqual(Roman.to_roman(31), 'XXXI')
        self.assertEqual(Roman.to_roman(90), 'XC')
        self.assertEqual(Roman.to_roman(369), 'CCCLXIX')
        self.assertEqual(Roman.to_roman(400), 'CD')
        self.assertEqual(Roman.to_roman(448), 'CDXLVIII')


if __name__ == '__main__':
    unittest.main()
        
