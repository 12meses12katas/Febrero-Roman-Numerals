import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test 


class NumeralToRomanTest {
    
    RomanNumerals conversor;
    
    @Before
    public void setUp() throws Exception {
        conversor = new RomanNumerals()
    }
    
    @After
    public void tearDown() throws Exception {
    }
    
    @Test
    public void test1(){
        assertEquals("I", conversor.toRoman(1))
    }
    
    @Test
    public void test2(){
        assertEquals("II", conversor.toRoman(2))
    }
    
    @Test
    public void test3(){
        assertEquals("III", conversor.toRoman(3))
    }
    
    @Test
    public void test4(){
        assertEquals("IV", conversor.toRoman(4))
    }
    
    @Test
    public void test5(){
        assertEquals("V", conversor.toRoman(5))
    }
    
    @Test
    public void test6(){
        assertEquals("VI", conversor.toRoman(6))
    }
    
    @Test
    public void test8(){
        assertEquals("VIII", conversor.toRoman(8))
    }
    
    @Test
    public void test9(){
        assertEquals("IX", conversor.toRoman(9))
    }
    
    @Test
    public void test10(){
        assertEquals("X", conversor.toRoman(10))
    }
    
    @Test
    public void test14(){
        assertEquals("XIV", conversor.toRoman(14))
    }
    
    @Test
    public void test15(){
        assertEquals("XV", conversor.toRoman(15))
    }
    
    @Test
    public void test19(){
        assertEquals("XIX", conversor.toRoman(19))
    }
    
    @Test
    public void test24(){
        assertEquals("XXIV", conversor.toRoman(24))
    }
    
    @Test
    public void test29(){
        assertEquals("XXIX", conversor.toRoman(29))
    }
    
    @Test
    public void test30(){
        assertEquals("XXX", conversor.toRoman(30))
    }
    
    @Test
    public void test49(){
        assertEquals("XLIX", conversor.toRoman(49))
    }
    
    @Test
    public void test50(){
        assertEquals("L", conversor.toRoman(50))
    }
    
    @Test
    public void test89(){
        assertEquals("LXXXIX", conversor.toRoman(89))
    }
    
    @Test
    public void test90(){
        assertEquals("XC", conversor.toRoman(90))
    }
    
    @Test
    public void test99(){
        assertEquals("XCIX", conversor.toRoman(99))
    }
    
    @Test
    public void test399(){
        assertEquals("CCCXCIX", conversor.toRoman(399))
    }
    
    @Test
    public void test1999(){
        assertEquals("MCMXCIX", conversor.toRoman(1999))
    }
}
