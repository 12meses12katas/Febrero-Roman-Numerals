class Fixnum
  def toRoman num = self
    @@nmap.each do |k, v|
      return k.to_s + toRoman(num - v) if (num >= v)
    end
    ''
  end

  private
    @@nmap = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }
end

class String
  def toArabic str = self
    @@nmap.each do |k, v|
      pat = %r{^#{k}}
      return v + toArabic(str.gsub(pat,'')) if str =~ pat
    end
    0
  end

  private
    @@nmap = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }
end

require 'minitest/spec'
require 'minitest/autorun'

describe Fixnum do
  it "should convert arabics to romans" do
      2.toRoman.must_equal 'II'
      2000.toRoman.must_equal 'MM'
      36.toRoman.must_equal 'XXXVI'
      99.toRoman.must_equal 'XCIX'
      0.toRoman.must_equal ''
      12000.toRoman.must_equal 'M' * 12
  end
end

describe String do
  it "should convert romans to arabics" do
    'II'.toArabic.must_equal 2
    'MM'.toArabic.must_equal 2000
    'XXXVI'.toArabic.must_equal 36
    ''.toArabic.must_equal 0
    'LDLD'.toArabic.must_equal nil
    ('M' * 12 + 'IV').toArabic.must_equal 12004
  end
end
