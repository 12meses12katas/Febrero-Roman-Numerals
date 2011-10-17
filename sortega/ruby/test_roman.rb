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

  def test_to_i
    assert_equal(0, Roman.to_i(''))
    assert_equal(1, Roman.to_i('I'))
    assert_equal(3, Roman.to_i('III'))
    assert_equal(10, Roman.to_i('X'))
    assert_equal(510, Roman.to_i('DX'))
  end

  def test_roundtrip
    for i in 1..3000
      assert_equal(i, Roman.to_i(Roman.to_roman(i)))
    end
  end
end
