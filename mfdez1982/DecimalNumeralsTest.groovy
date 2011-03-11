import groovy.util.GroovyTestCase

class DecimalNumeralsTest extends GroovyTestCase
{
    void test1()
    {
        assertEquals 'I', new DecimalNumerals(decimal:1).eval()        
    }
    
    void test2()
    {
        assertEquals 'II', new DecimalNumerals(decimal:2).eval()        
    }

    void test3()
    {
        assertEquals 'III', new DecimalNumerals(decimal:3).eval()        
    }

    void test4()
    {
        assertEquals 'IV', new DecimalNumerals(decimal:4).eval()        
    }
      
    void test5()
    {
        assertEquals 'V', new DecimalNumerals(decimal:5).eval()        
    }
       
    void test6()
    {
        assertEquals 'VI', new DecimalNumerals(decimal:6).eval()        
    }

    void test8()
    {
        assertEquals 'VIII', new DecimalNumerals(decimal:8).eval()        
    }
             
    void test9()
    {
        assertEquals 'IX', new DecimalNumerals(decimal:9).eval()        
    }
            
    void test10()
    {
        assertEquals 'X', new DecimalNumerals(decimal:10).eval()        
    }

    void test13()
    {
        assertEquals 'XIII', new DecimalNumerals(decimal:13).eval()        
    }
   
    void test14()
    {
        assertEquals 'XIV', new DecimalNumerals(decimal:14).eval()        
    }

    void test19()
    {
        assertEquals 'XIX', new DecimalNumerals(decimal:19).eval()        
    }
        
    void test34()
    {
        assertEquals 'XXXIV', new DecimalNumerals(decimal:34).eval()        
    }
    
    void test40()
    {
        assertEquals 'XL', new DecimalNumerals(decimal:40).eval()        
    }

    void test45()
    {
        assertEquals 'XLV', new DecimalNumerals(decimal:45).eval()        
    }
    
    void test50()
    {
        assertEquals 'L', new DecimalNumerals(decimal:50).eval()        
    }
    
    void test67()
    {
        assertEquals 'LXVII', new DecimalNumerals(decimal:67).eval()        
    }

    void test90()
    {
        assertEquals 'XC', new DecimalNumerals(decimal:90).eval()        
    }

    void test94()
    {
        assertEquals 'XCIV', new DecimalNumerals(decimal:94).eval()        
    }
    
    void test100()
    {
        assertEquals 'C', new DecimalNumerals(decimal:100).eval()        
    }

    void test128()
    {
        assertEquals 'CXXVIII', new DecimalNumerals(decimal:128).eval()        
    }

    void test491()
    {
        assertEquals 'CDXCI', new DecimalNumerals(decimal:491).eval()        
    }

    void test500()
    {
        assertEquals 'D', new DecimalNumerals(decimal:500).eval()        
    }

    void test584()
    {
        assertEquals 'DLXXXIV', new DecimalNumerals(decimal:584).eval()        
    }

    void test1000()
    {
        assertEquals 'M', new DecimalNumerals(decimal:1000).eval()        
    }

    void test1999()
    {
        assertEquals 'MCMXCIX', new DecimalNumerals(decimal:1999).eval()        
    }
}