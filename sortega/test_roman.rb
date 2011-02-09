require "roman"
require "test/unit"

class TestRoman < Test::Unit::TestCase

  def test_to_roman
    assert_raises(ArgumentError) { Roman.to_roman(0) }
    assert_equal('I', Roman.to_roman(1))
    assert_equal('MCMXL', Roman.to_roman(1990))
    assert_equal('MMVIII', Roman.to_roman(2008))
    assert_equal('MMM', Roman.to_roman(3000))
  end
end
