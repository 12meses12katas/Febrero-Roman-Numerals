

class RomanNumerals {
    private Map<String, Integer> ROMAN_TO_NUMERAL_MAP = ["I":1, "V":5, "X":10, "L":50, "C":100, "D":500, "M":1000]
    private Map<Integer, String> NUMERAL_TO_ROMAN_MAP = [1:"I", 5:"V", 10:"X", 50:"L", 100:"C", 500:"D", 1000:"M"]
    
    int toNumeral(String roman){
        int sum = 0
        roman.eachWithIndex { romanDigit, idx ->
            int intValue = ROMAN_TO_NUMERAL_MAP.getAt(romanDigit)
            int nextValue = getNextIntValue(roman, idx)
            if(nextValue > intValue){
                intValue *= -1
            }
            sum += intValue
        }
        
        return sum
    }
    
    private getNextIntValue(String roman, int idx){
        if(idx + 1 < roman.count){
            String romanDigit = roman.getAt (idx + 1)
            return ROMAN_TO_NUMERAL_MAP.getAt(romanDigit)
        }
        return Integer.MIN_VALUE
    }
    
    String toRoman(int numeral){
        String result = ""
        def numbers = decompose(numeral)
        numbers.each { number ->
            result += NUMERAL_TO_ROMAN_MAP[number]
        } 
        return result
    }
    
    private List decompose(int numeral){
        def numList = []
        
        def values = NUMERAL_TO_ROMAN_MAP.collect { it.key }
        
        while(numeral > 0){
            int n = values.size() - 1
            int greater = values[n]
            int substracter = getSubstracter(greater)
            int smaller = greater - substracter
            
            if(numeral >= greater){
                numList << greater
                numeral -= greater
            }else if(numeral >= smaller){
                numList << substracter << greater
                numeral -= smaller
            } else {
                values.remove(n)
            }
        }
        
        numList
    }
    
    private int getSubstracter(int greater){
        if(greater > 100) return 100
        if(greater > 10) return 10
        if(greater > 1) return 1
        return 0
    }
}
