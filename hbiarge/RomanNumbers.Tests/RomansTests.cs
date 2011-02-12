using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace RomanNumbers.Tests
{
    [TestClass]
    public class RomansTests
    {
        [TestMethod]
        [ExpectedException(typeof(ArgumentOutOfRangeException))]
        public void Numero_mayor_rango_soportado_produce_excepcion()
        {
            Assert.AreEqual("", 3000.ToRoman());
        }

        [TestMethod]
        public void Numero_menor_igual_0_devuelve_cadena_vacia()
        {
            Assert.AreEqual("", 0.ToRoman());
        }

        [TestMethod]
        public void Miles_To_Roman()
        {
            Assert.AreEqual("MM", 2000.ToRoman());
            Assert.AreEqual("M", 1000.ToRoman());
        }

        [TestMethod]
        public void Cientos_To_Roman()
        {
            Assert.AreEqual("MC", 1100.ToRoman());
            Assert.AreEqual("MCC", 1200.ToRoman());
            Assert.AreEqual("MCCC", 1300.ToRoman());
            Assert.AreEqual("MCD", 1400.ToRoman());
            Assert.AreEqual("MD", 1500.ToRoman());
            Assert.AreEqual("MDC", 1600.ToRoman());
            Assert.AreEqual("MDCC", 1700.ToRoman());
            Assert.AreEqual("MDCCC", 1800.ToRoman());
            Assert.AreEqual("MCM", 1900.ToRoman());
        }

        [TestMethod]
        public void Decenas_To_Roman()
        {
            Assert.AreEqual("MCX", 1110.ToRoman());
            Assert.AreEqual("MCXX", 1120.ToRoman());
            Assert.AreEqual("MCXXX", 1130.ToRoman());
            Assert.AreEqual("MCXL", 1140.ToRoman());
            Assert.AreEqual("MCL", 1150.ToRoman());
            Assert.AreEqual("MCLX", 1160.ToRoman());
            Assert.AreEqual("MCLXX", 1170.ToRoman());
            Assert.AreEqual("MCLXXX", 1180.ToRoman());
            Assert.AreEqual("MCXC", 1190.ToRoman());
        }

        [TestMethod]
        public void Unidades_To_Roman()
        {
            Assert.AreEqual("MCXI", 1111.ToRoman());
            Assert.AreEqual("MCXII", 1112.ToRoman());
            Assert.AreEqual("MCXIII", 1113.ToRoman());
            Assert.AreEqual("MCXIV", 1114.ToRoman());
            Assert.AreEqual("MCXV", 1115.ToRoman());
            Assert.AreEqual("MCXVI", 1116.ToRoman());
            Assert.AreEqual("MCXVII", 1117.ToRoman());
            Assert.AreEqual("MCXVIII", 1118.ToRoman());
            Assert.AreEqual("MCXIX", 1119.ToRoman());
        }

        [TestMethod]
        public void Acceptance_Test()
        {
            Assert.AreEqual("IX", 9.ToRoman());
            Assert.AreEqual("XCIX", 99.ToRoman());
            Assert.AreEqual("CMXCIX", 999.ToRoman());
            Assert.AreEqual("MCMXCIX", 1999.ToRoman());
        }
    }

    public static class RomanExtensions
    {
        private static readonly char[] RomanLetters = { 'I', 'V', 'X', 'L', 'C', 'D', 'M' };
        private const int IndexFiveUnits = 1;
        private const int IndexTenUnits = 2;


        public static string ToRoman(this int number)
        {
            if (number <= 0)
            {
                return string.Empty;
            }

            if (number > 2999)
            {
                throw new ArgumentOutOfRangeException("Only numbers between 1 and 2.999");
            }

            string milesRoman = string.Empty;
            string cientosRoman = string.Empty;
            string decenasRoman = string.Empty;
            string unidadesRoman = string.Empty;

            int miles = number / 1000;

            if (miles > 0)
            {
                milesRoman = GetMiles(miles);
            }

            int cientos = (number % 1000) / 100;

            if (cientos > 0)
            {
                cientosRoman = GetRomanString(cientos, 4);
            }

            int decenas = (number % 100) / 10;

            if (decenas > 0)
            {
                decenasRoman = GetRomanString(decenas, 2);
            }

            int unidades = number % 10;

            if (unidades > 0)
            {
                unidadesRoman = GetRomanString(unidades, 0);
            }

            return ComposeRoman(milesRoman, cientosRoman, decenasRoman, unidadesRoman);
        }

        private static string GetMiles(int miles)
        {
            return new string(RomanLetters[6], miles);
        }

        private static string GetRomanString(int number, int romanLettersIndexOneUnit)
        {
            if (number < 4)
            {
                return new string(RomanLetters[romanLettersIndexOneUnit], number);
            }

            if (number == 4)
            {
                return new string(new char[]
                    {
                        RomanLetters[romanLettersIndexOneUnit],
                        RomanLetters[romanLettersIndexOneUnit + IndexFiveUnits]
                    });
            }

            if (number < 9)
            {
                return string.Concat(
                    RomanLetters[romanLettersIndexOneUnit + IndexFiveUnits],
                    new string(RomanLetters[romanLettersIndexOneUnit], number - 5));
            }

            if (number == 9)
            {
                return new string(new char[]
                    {
                        RomanLetters[romanLettersIndexOneUnit],
                        RomanLetters[romanLettersIndexOneUnit + IndexTenUnits]
                    });
            }

            return string.Empty;
        }

        private static string ComposeRoman(string miles, string cientos, string decenas, string unidades)
        {
            return string.Concat(miles, cientos, decenas, unidades);
        }
    }
}
