require 'rspec'

module RomanNumerals
	ROMANS = {
		M:1000, CM:900, D:500, CD:400, C:100, XC:90, L:50, XL:40, X:10, IX:9, V:5, IV:4, I:1
	}
end

class Fixnum
	def to_roman
		return nil if self >= 4000
		RomanNumerals::ROMANS.detect do |roman, arabic|
			return "#{roman}#{(self - arabic).to_roman}" if self >= arabic
		end		
	end
end

class String
	def to_arabic
		return 0 if empty?
		roman = RomanNumerals::ROMANS.keys.reverse.detect {|s| self =~ /#{s}$/}
		RomanNumerals::ROMANS[roman.to_sym] + sub(/#{roman}$/, '').to_arabic
	end
end

TESTCASES = {
	IX:9,
	VII:7,
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

describe 'Fixnum to_roman' do
	TESTCASES.each do |roman, arabic|
	  it "should return #{roman} for #{arabic}" do
	    arabic.to_roman.should == roman.to_s
	  end
	end

	it "should return nil for negative fixnum" do
		-10.to_roman.should == nil
	end

	it "should return nil for > 4000" do
		4000.to_roman.should == nil
	end
end

describe 'String to_arabic' do
	TESTCASES.each do |roman, arabic|
	  it "should return #{arabic} for #{roman}" do
	    roman.to_s.to_arabic.should == arabic
	  end
	end
end