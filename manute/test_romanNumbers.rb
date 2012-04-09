require 'test/unit'
require File.join(File.dirname(__FILE__), 'romanNumbers') 

class TestRomanNumbers < Test::Unit::TestCase

	def test_no_word_to_roman_zero
		assert_equal('' , RomanNumbers.to_roman(0) )
	end
	def test_cero_from_empty_roman
		assert_equal( 0 , RomanNumbers.from_roman('') )
	end

	def test_simple_to_roman
		assert_equal('I' , RomanNumbers.to_roman(1) )
		assert_equal('D' , RomanNumbers.to_roman(500))
		assert_equal('M' , RomanNumbers.to_roman(1000))
	end
	def test_simple_from_roman
		assert_equal(1 , RomanNumbers.from_roman('I') )
		assert_equal(500, RomanNumbers.from_roman('D') )
		assert_equal(1000, RomanNumbers.from_roman('M') )
	end
	
	def test_mix_to_roman
		assert_equal('CL' , RomanNumbers.to_roman(150) )
		assert_equal('MM', RomanNumbers.to_roman(2000) )
		assert_equal('MMCL', RomanNumbers.to_roman(2150) )
		assert_equal('MCMXCIX', RomanNumbers.to_roman(1999) )
	end
	def test_mix_from_roman
		assert_equal(150 , RomanNumbers.from_roman('CL') )
		assert_equal(2000, RomanNumbers.from_roman('MM') )
		assert_equal(2150, RomanNumbers.from_roman('MMCL') )
		assert_equal(1999, RomanNumbers.from_roman('MCMXCIX') )
	end
	
end