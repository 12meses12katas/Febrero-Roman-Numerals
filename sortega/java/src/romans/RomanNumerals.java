package romans;

public class RomanNumerals {
    public static class ConversionException extends RuntimeException {
        public ConversionException(int number) {
            super("No roman numeral representation for " + number);
        }
        public ConversionException(String message) {
            super(message);
        }
    }

    public static String toRoman(int number) {
        if (number < 1 || number > 3000)
        throw new ConversionException(number);

        String roman = "";
        for(int digitNumber = 0; number > 0; number /= 10, digitNumber++) {
            int digit = number % 10;
            roman = romanDigits[digitNumber][digit] + roman;
        }
        return roman;
    }

    private static String[][] romanDigits = new String[][] {
        {"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"},
        {"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"},
        {"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"},
        {"", "M", "MM", "MMM"}
    };

    public static int toDecimal(String roman) {
        String untranslated = roman.toUpperCase();
        int decimal = 0;

        for (int power = romanDigits.length - 1; power >=0; power--) {
            String[] digits = romanDigits[power];
            for (int value = digits.length - 1; value > 0; value--) {
                if (untranslated.startsWith(digits[value])) {
                    decimal += value * tenToThe(power);
                    untranslated = untranslated.substring(digits[value].length());
                    break;
                }
            }
        }

        if (decimal == 0 || !untranslated.isEmpty())
            throw new ConversionException("Not a valid roman numeral");
        return decimal;
    }

    private static int tenToThe(int power) {
        int result = 1;
        for (int i=0; i<power; i++)
            result *= 10;
        return result;
    }

}
