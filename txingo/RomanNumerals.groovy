
class RomanNumerals {
    
    /* de numeros romanos a enteros */
    int toNumeral(String roman){
        int sum = 0
        roman.eachWithIndex { digit, idx ->
            def digitValue = getDigitAt(roman, idx)
            def nextDigitValue = getDigitAt(roman, idx + 1)
            def sign = (digitValue < nextDigitValue) ? -1 : +1
            sum += (sign * digitValue)
        }
        
        sum
    }
    
    private getDigitAt(def roman, def idx){
        def ROMAN_TO_NUMERAL_MAP = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
        (idx < roman.count) ? ROMAN_TO_NUMERAL_MAP[roman[idx]] : Integer.MIN_VALUE
    }
    
    /* de enteros a numeros romanos */
    String toRoman(int numeral){
        def NUMERAL_TO_ROMAN_MAP = [1000:"M", 900:"CM", 500:"D", 400:"CD", 100:"C", 90:"XC", 50:"L", 40:"XL", 10:"X", 9:"IX", 5:"V", 4:"IV", 1:"I"]
        String roman = ""
        
        while(numeral > 0){
            def descendantSortedKeys = NUMERAL_TO_ROMAN_MAP.keySet().sort().reverse()
            def greaterDigit = descendantSortedKeys.find { it <= numeral }
            numeral -= greaterDigit
            roman += NUMERAL_TO_ROMAN_MAP[greaterDigit]
        }
        
        roman
    }
}
