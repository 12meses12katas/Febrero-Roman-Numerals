import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;


class RomanToNumeralsTest {
    
    RomanNumerals conversor
    
    @Before
    public void setUp() throws Exception {
        conversor = new RomanNumerals()
    }
    
    @Test
    public void test1() {
        assertEquals(1, conversor.toNumeral("I"))
    }
    
    @Test
    public void test2() {
        assertEquals(2, conversor.toNumeral("II"))
    }
    
    @Test
    public void test3() {
        assertEquals(3, conversor.toNumeral("III"))
    }
    
    @Test
    public void test4() {
        assertEquals(4, conversor.toNumeral("IV"))
    }
    
    @Test
    public void test5() {
        assertEquals(5, conversor.toNumeral("V"))
    }
    
    @Test
    public void test6() {
        assertEquals(6, conversor.toNumeral("VI"))
    }
    
    @Test
    public void test7() {
        assertEquals(7, conversor.toNumeral("VII"))
    }
    
    @Test
    public void test8() {
        assertEquals(8, conversor.toNumeral("VIII"))
    }
    
    @Test
    public void test9() {
        assertEquals(9, conversor.toNumeral("IX"))
    }
    
    @Test
    public void test10() {
        assertEquals(10, conversor.toNumeral("X"))
    }
    
    @Test
    public void test14() {
        assertEquals(14, conversor.toNumeral("XIV"))
    }
    
    @Test
    public void test15() {
        assertEquals(15, conversor.toNumeral("XV"))
    }
    
    @Test
    public void test18() {
        assertEquals(18, conversor.toNumeral("XVIII"))
    }
    
    @Test
    public void test19() {
        assertEquals(19, conversor.toNumeral("XIX"))
    }
    
    @Test
    public void test24() {
        assertEquals(24, conversor.toNumeral("XXIV"))
    }
    
    @Test
    public void test29() {
        assertEquals(29, conversor.toNumeral("XXIX"))
    }
    
    @Test
    public void test40() {
        assertEquals(40, conversor.toNumeral("XL"))
    }
    
    @Test
    public void test49() {
        assertEquals(49, conversor.toNumeral("XLIX"))
    }
    
    @Test
    public void test50() {
        assertEquals(50, conversor.toNumeral("L"))
    }
    
    @Test
    public void test89() {
        assertEquals(89, conversor.toNumeral("LXXXIX"))
    }
    
    @Test
    public void test90() {
        assertEquals(90, conversor.toNumeral("XC"))
    }
    
    @Test
    public void test99() {
        assertEquals(99, conversor.toNumeral("IC"))
    }
    
    @Test
    public void test100() {
        assertEquals(100, conversor.toNumeral("C"))
    }
    
    @Test
    public void test190() {
        assertEquals(190, conversor.toNumeral("CXC"))
    }
    
    @Test
    public void test400() {
        assertEquals(400, conversor.toNumeral("CD"))
    }
    
    @Test
    public void test500() {
        assertEquals(500, conversor.toNumeral("D"))
    }
    
    @Test
    public void test1000() {
        assertEquals(1000, conversor.toNumeral("M"))
    }
    
    @Test
    public void test1980() {
        assertEquals(1980, conversor.toNumeral("MCMLXXX"))
    }
    
    @Test
    public void test1999() {
        assertEquals(1999, conversor.toNumeral("MCMXCIX"))
    }
    
    @Test
    public void test2011() {
        assertEquals(2011, conversor.toNumeral("MMXI"))
    }
}
