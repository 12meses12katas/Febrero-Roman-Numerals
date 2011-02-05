require 'rspec'

ROMANS = {M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1}

class Fixnum
  def to_roman
    ROMANS.detect do |roman, arabic|
      return "#{roman}#{(self - arabic).to_roman}" if self >= arabic
    end
  end
end

class String
  def to_arabic
    return 0 if empty?
    tail = ROMANS.keys.reverse.detect { |roman| self =~ /#{roman}$/ }
    ROMANS[tail.to_sym] + sub(/#{tail}$/, '').to_arabic
  end
end

TESTCASES = {
  I: 1,
  II: 2,
  III: 3,
  IV: 4,
  V: 5,
  VI: 6,
  VII: 7,
  VIII: 8,
  IX: 9,
  X: 10,
  XI: 11,
  XII: 12,
  XIII: 13,
  XIV: 14,
  XV: 15,
  XVI: 16,
  XIX: 19,
  XX: 20,
  XXI: 21,
  XXIV: 24,
  XXXIX: 39,
  XL: 40,
  XLI: 41,
  XLIX: 49,
  L: 50,
  LI: 51,
  XC: 90,
  C: 100,
  CD: 400,
  D: 500,
  CM: 900,
  M: 1000,
  MCDXCII: 1492,
  MCMLXXX: 1980,
  MMXI: 2011
}

describe "to_roman" do
  TESTCASES.each do |roman, arabic|
    it "should turn #{arabic} into #{roman}" do
      arabic.to_roman.should == roman.to_s
    end
  end
end

describe "to_arabic" do
  TESTCASES.each do |roman, arabic|
    it "should turn #{roman} into #{arabic}" do
      roman.to_s.to_arabic.should == arabic
    end
  end
end