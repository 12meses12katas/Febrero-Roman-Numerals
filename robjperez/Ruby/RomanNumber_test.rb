require './RomanNumber.rb'
require 'test/unit'

class RomanNumberTest < Test::Unit::TestCase
	def test_toRoman
		assert_equal('DCL', RomanNumber.new().toRoman(650))
		assert_equal('MCMLXXXI', RomanNumber.new().toRoman(1981))
		assert_equal('MM', RomanNumber.new().toRoman(2000))
		assert_equal('MCMLXXXIV', RomanNumber.new().toRoman(1984))
		assert_equal('X', RomanNumber.new().toRoman(10))
		assert_equal('LX', RomanNumber.new().toRoman(60))
		assert_equal('MMVII', RomanNumber.new().toRoman(2007))
		assert_equal('I', RomanNumber.new().toRoman(1))
		assert_equal('MI', RomanNumber.new().toRoman(1001))
		assert_equal('MMCMXCIX', RomanNumber.new().toRoman(2999))
		assert_equal('MCMXCIX', RomanNumber.new().toRoman(1999))
	end
	
	def test_isGreater
		assert_equal(true, RomanNumber.new().isGreater('C', 'X'))
		assert_equal(true, RomanNumber.new().isGreater('C', 'V'))
		assert_equal(true, RomanNumber.new().isGreater('M', 'D'))
		assert_equal(true, RomanNumber.new().isGreater('D', 'I'))
		assert_equal(false, RomanNumber.new().isGreater('M', 'M'))
		assert_equal(false, RomanNumber.new().isGreater('D', 'M'))
		assert_equal(false, RomanNumber.new().isGreater('C', 'M'))
		assert_equal(false, RomanNumber.new().isGreater('V', 'L'))
		assert_equal(false, RomanNumber.new().isGreater('X', 'D'))
		assert_equal(false, RomanNumber.new().isGreater('', 'D'))
		assert_equal(false, RomanNumber.new().isGreater('', ''))
		assert_equal(false, RomanNumber.new().isGreater('C', ''))
	end
	
	def test_getValue	
		assert_equal(1000, RomanNumber.new().getValue('M'))
		assert_equal(500, RomanNumber.new().getValue('D'))
		assert_equal(100, RomanNumber.new().getValue('C'))
		assert_equal(50, RomanNumber.new().getValue('L'))
		assert_equal(10, RomanNumber.new().getValue('X'))
		assert_equal(5, RomanNumber.new().getValue('V'))
		assert_equal(1, RomanNumber.new().getValue('I'))		
	end
	
	def test_toNumber
		assert_equal(650, RomanNumber.new().toNumber('DCL'))
		assert_equal(1981, RomanNumber.new().toNumber('MCMLXXXI'))
		assert_equal(2000, RomanNumber.new().toNumber('MM'))
		assert_equal(1984, RomanNumber.new().toNumber('MCMLXXXIV'))
		assert_equal(10, RomanNumber.new().toNumber('X'))
		assert_equal(60, RomanNumber.new().toNumber('LX'))
		assert_equal(2007, RomanNumber.new().toNumber('MMVII'))
		assert_equal(1, RomanNumber.new().toNumber('I'))
		assert_equal(1001, RomanNumber.new().toNumber('MI'))
		assert_equal(2999, RomanNumber.new().toNumber('MMCMXCIX'))
		assert_equal(1999, RomanNumber.new().toNumber('MCMXCIX'))
	end
	
	def test_big_number
		assert_raise RuntimeError do
			RomanNumber.new().toRoman(3001)
		end
	end
end
