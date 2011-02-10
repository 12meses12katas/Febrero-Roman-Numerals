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

if __name__ == '__main__':
    unittest.main()
        
