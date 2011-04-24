/**
 *   kata:    Roman Numerals http://codingdojo.org/cgi-bin/wiki.pl?KataRomanNumerals
 *   Author:  Arturo Herrero
 *   Web:     http://arturoherrero.com/
 *   Twitter: @ArturoHerrero
 */

import groovy.util.GroovyTestCase

class RomanNumeralsTest extends GroovyTestCase {

    RomanNumerals number = new RomanNumerals()
    
    void testOne() {
        assert "I" == number.toRoman(1)
    }
    
    void testTwo() {
        assert "II" == number.toRoman(2)
    }
    
    void testThree() {
        assert "III" == number.toRoman(3)
    }
    
}

class RomanNumerals {

    def toRoman(number) {
        if (number == 1)
            "I"
        else if (number == 2)
            "II"
        else
            "III"
    }
    
}

