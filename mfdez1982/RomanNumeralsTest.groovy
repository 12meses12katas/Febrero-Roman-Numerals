import groovy.util.GroovyTestCase

class RomanNumeralsTest extends GroovyTestCase
{
	def testCases = [
			 'I': 1, 
			'II': 2,
		   'III': 3,
		    'IV': 4,
			 'V': 5,
			'VI': 6,
		  'VIII': 8,
			'IX': 9,
			 'X': 10,
		  'XIII': 13,
		   'XIV': 14,
		   'XIX': 19,
		 'XXXIV': 34,
			'XL': 40,
		   'XLV': 45,
		  'XCIV': 94,
	   'CXXVIII': 128,
		 'CDXCI': 491,
	   'DLXXXIV': 584,
	   'MCMXCIX': 1999
	   ]
	
	
	void test()
	{
		for(entry in testCases)
			assertEquals entry.value , new RomanNumerals(roman:entry.key).eval()		
	}
}