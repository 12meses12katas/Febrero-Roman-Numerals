using System;

namespace RomanNumerals
{
    public static class RomanNumerals
    {

        public const int MinValue = 1;
        public const int MaxValue = 3000;

        public static string Arabic2Roman(int a)
        {

            if (a < MinValue || a > MaxValue)
                throw new ArgumentOutOfRangeException("Argument must be between 1 and 3000");

            string[] romans = { "I", "V", "X", "L", "C", "D", "M" };
            string result = "";
            int index = 0;
            
            while (a > 0)
            {
                int oneDigit = a % 10;

                switch (oneDigit)
                {
                    case 1:
                        result = romans[index] + result;
                        break;

                    case 2:
                        result = romans[index] + romans[index] + result;
                        break;

                    case 3:
                        result = romans[index] + romans[index] + romans[index] + result;
                        break;

                    case 4:
                        result = romans[index] + romans[index + 1] + result;
                        break;

                    case 5:
                        result = romans[index + 1] + result;
                        break;

                    case 6:
                        result = romans[index + 1] + romans[index] + result;
                        break;

                    case 7:
                        result = romans[index + 1] + romans[index] + romans[index] + result;
                        break;

                    case 8:
                        result = romans[index + 1] + romans[index] + romans[index] + romans[index] + result;
                        break;

                    case 9:
                        result = romans[index] + romans[index + 2] + result;
                        break;

                }
                index += 2;
                a /= 10;
            }

            return result;
        }
    }
}
