module RomanNumerals
  MAP = { M:1000, CM:900, D:500, CD:400, C:100, XC:90, L:50, XL:40, X:10, IX:9, V:5, IV:4, I:1 }
end

class String
  def to_arabic
    RomanNumerals::MAP.detect do |roman, arabic|
      if self =~ /^#{roman}(.*)/
        result = arabic + $1.to_arabic.to_i
        return result unless result.to_roman != self
      end
    end
  end
end

class Fixnum
  def to_roman
    return if self >= 4000
    RomanNumerals::MAP.detect do |roman, arabic|
      return "#{roman}#{(self - arabic).to_roman}" if self >= arabic
    end
  end
end

describe "Roman numerals" do
  context "to_roman" do
    example { 1.to_roman.should == "I" }
    example { 2.to_roman.should == "II" }
    example { 3.to_roman.should == "III" }
    example { 4.to_roman.should == "IV" }
    example { 5.to_roman.should == "V" }
    example { 6.to_roman.should == "VI" }
    example { 7.to_roman.should == "VII" }
    example { 8.to_roman.should == "VIII" }
    example { 9.to_roman.should == "IX" }
    example { 10.to_roman.should == "X" }
    example { 11.to_roman.should == "XI" }
    example { 39.to_roman.should == "XXXIX" }
    example { 49.to_roman.should == "XLIX" }
    example { 89.to_roman.should == "LXXXIX" }
    example { 99.to_roman.should == "XCIX" }
    example { 399.to_roman.should == "CCCXCIX" }
    example { 499.to_roman.should == "CDXCIX" }
    example { 899.to_roman.should == "DCCCXCIX" }
    example { 999.to_roman.should == "CMXCIX" }
    example { 3999.to_roman.should == "MMMCMXCIX" }
    example { -10.to_roman.should == nil }
    example { 4000.to_roman.should == nil }
  end

  context "to_arabic" do
    example { "I".to_arabic.should == 1 }
    example { "II".to_arabic.should == 2 }
    example { "III".to_arabic.should == 3 }
    example { "IV".to_arabic.should == 4 }
    example { "V".to_arabic.should == 5 }
    example { "VI".to_arabic.should == 6 }
    example { "VII".to_arabic.should == 7 }
    example { "VIII".to_arabic.should == 8 }
    example { "IX".to_arabic.should == 9 }
    example { "X".to_arabic.should == 10 }
    example { "XI".to_arabic.should == 11 }
    example { "MMMCMXCIX".to_arabic.should == 3999 }
    example { "WADUS".to_arabic.should == nil }
    example { "MMMM".to_arabic.should == nil }
    example { "LD".to_arabic.should == nil }
    example { "XCXC".to_arabic.should == nil }
  end
end
