require 'rspec'

ROMANS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

class Fixnum

  def to_roman
    return nil unless self > 0 && self < 4000
    remaining_number = self
    ROMANS.inject ("") do | roman_str, current_number |
        times,remaining_number = remaining_number.divmod current_number[1]
        roman_str + current_number[0].to_s * times
    end
  end

end

class String

  def from_roman
    remaining_arabic_str = self.clone
    roman_candidate = 0
    ROMANS.each do | roman, arabic |
      while (remaining_arabic_str.sub!(/^#{roman}/,'') != nil)
        roman_candidate += arabic
      end
    end
    self == roman_candidate.to_roman ? roman_candidate : nil
  end

end



TRANSFORMATIONS = {
  I: 1, II: 2, III: 3, IV: 4, V: 5, VI: 6, VII: 7, VIII: 8, IX: 9, X: 10, XI: 11, XII: 12, XIV: 14, XV: 15,
  XIX: 19, XXXIX: 39, XL: 40, XLI: 41, L: 50, LXXXIX: 89, XC: 90, XCIX: 99, C: 100, CCCXCIX: 399, CD: 400,
  D: 500, DCCCXCIX: 899, CM: 900, M: 1000, MMXI: 2011, MMMCMXCIX: 3999
}

describe "From arabic to roman numerals. " do

  TRANSFORMATIONS.each do |roman, arabic|
    it("transforms #{arabic} to #{roman}") do
      arabic.to_roman.should == roman.to_s
    end
  end

  [ -10, 0, 4000, 4100 ].each do | bad_arabic |
    it("#{bad_arabic} can not be transformed to roman numeral") do
      bad_arabic.to_roman.should == nil
    end
  end
end

describe "From roman to arabic numerals. " do

  TRANSFORMATIONS.each do |roman, arabic|
    it("transforms #{roman} to #{arabic}") do
      roman.to_s.from_roman.should == arabic
    end
  end

  [ "IIII", "VIV", "", "IA", "HOLA", "i", "v"  ].each do | bad_roman |
    it("#{bad_roman} is not a valid roman numeral") do
      bad_roman.from_roman.should == nil
    end
  end
  
end

