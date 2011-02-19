module RomanNumerals
  MAPPINGS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }
end

class String
  def to_arabic
    RomanNumerals::MAPPINGS.each do |roman, arabic|
      current = self
      return arabic + current.to_arabic if current.slice!(/^#{roman}/)  
    end
    0
  end
end

class Fixnum
  def to_roman
    RomanNumerals::MAPPINGS.each do |roman, arabic|
      return "#{roman}#{(self - arabic).to_roman}" if self >= arabic
    end
    nil
  end
end

describe "Roman Numerals" do
  TRANSFORMATIONS = { 1 => "I",  2 => "II", 3 => "III", 4 => "IV", 5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII",
                      9 => "IX", 10 => "X", 11 => "XI", 12 => "XII", 13 => "XIII", 14 => "XIV", 19 => "XIX", 
                      39 => "XXXIX", 40 => "XL", 49 => "XLIX", 50 => "L", 89 => "LXXXIX", 90 => "XC", 99 => "XCIX",
                      100 => "C", 399 => "CCCXCIX", 400 => "CD", 500 => "D", 899 => "DCCCXCIX", 900 => "CM", 
                      999 => "CMXCIX", 1000 => "M", 1999 => "MCMXCIX" }
  
  describe "Arabics to Romans" do
    TRANSFORMATIONS.each do |arabic, roman|
      it "returns #{roman} given #{arabic}" do
        arabic.to_roman.should == roman
      end
    end
  end

  describe "Romans to Arabics" do
    TRANSFORMATIONS.each do |arabic, roman|
      it "returns #{arabic} given #{roman}" do
        roman.to_arabic.should == arabic
      end
    end
  end
end
