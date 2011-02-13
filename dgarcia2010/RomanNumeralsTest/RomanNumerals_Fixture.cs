using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using NUnit.Framework;

namespace RomanNumerals.Test
{
    [TestFixture]
    public class RomanNumerals_Fixture
    {
        [Test]
        public void A2R_OnlyOnleDigit()
        {
            string[] romans = { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX" };

            for (int i = 0; i < 9; i++ )
                Assert.AreEqual(romans[i], RomanNumerals.Arabic2Roman(i + 1));
        }

        [Test]
        public void A2R_TwoDigits()
        {
            int[] arabs = { 10, 11, 39, 56, 78, 98 };
            string[] romans = { "X", "XI", "XXXIX", "LVI", "LXXVIII", "XCVIII" };

            for (int i = 0; i < arabs.Length; i++)
                Assert.AreEqual(romans[i], RomanNumerals.Arabic2Roman(arabs[i]));

        }

        [Test]
        public void A2R_ThreeDigits()
        {
            int[] arabs = { 324, 678, 936, 198, 340, 100, 999, 777, 213 };
            string[] romans = { "CCCXXIV", 
                                  "DCLXXVIII", 
                                  "CMXXXVI",
                                  "CXCVIII",
                                  "CCCXL",
                                    "C",
                                    "CMXCIX",
                                    "DCCLXXVII",
                                    "CCXIII"};

            for (int i = 0; i < arabs.Length; i++)
                Assert.AreEqual(romans[i], RomanNumerals.Arabic2Roman(arabs[i]));
        }

        [Test]
        public void A2R_FourDigits()
        {
            int[] arabs = { 1000, 1999, 3000, 2546, 2989, 1642 };
            string[] romans = { "M", 
                                  "MCMXCIX",
                                  "MMM",
                                  "MMDXLVI",
                                  "MMCMLXXXIX",
                                  "MDCXLII" };

            for (int i = 0; i < arabs.Length; i++)
                Assert.AreEqual(romans[i], RomanNumerals.Arabic2Roman(arabs[i]));

        }

        [Test]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void A2R_OutOfRange()
        {    
            RomanNumerals.Arabic2Roman(5000);
        }

    }
}
