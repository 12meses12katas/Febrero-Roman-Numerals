require "./romans.rb"

RSpec::Matchers.define :be_roman_numeral do |expected|
  match do |arabic|
    @result = arabic.to_roman
    @result == expected
  end

  failure_message_for_should do |arabic|
    "#{arabic} should be roman numeral #{expected} but was #{@result}"
  end
end


def test_numbers_if_any(range)
  numbers = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X',
    11 => 'XI',
    14 => 'XIV',
    15 => 'XV',
    16 => 'XVI',
    19 => 'XIX',
    38 => 'XXXVIII',
    40 => 'XL',
    46 => 'XLVI',
    50 => 'L',
    90 => 'XC',
    100 => 'C',
    400 => 'CD',
    499 => 'CDXCIX',
    500 => 'D',
    899 => 'DCCCXCIX',
    900 => 'CM',
    999 => 'CMXCVIII',
    999 => 'CMXCIX',
    1000 => 'M',
    1998 => 'MCMXCVIII',
  }
  range.each do |arabic|
    it "transforms #{arabic} to #{numbers[arabic]}" do
      arabic.should be_roman_numeral numbers[arabic]
    end if numbers[arabic]
  end
end

describe "The transformation from arabic to roman number" do

  context "with numbers from 1 to 3" do
    test_numbers_if_any (1..3)
  end

  context "with numbers 4 and 5" do
    test_numbers_if_any (4..5)
  end

  context "with numbers from 6 to 9" do
    test_numbers_if_any (6..9)
  end

  context "with numbers from 10 to 39" do
    test_numbers_if_any (10..39)
  end

  context "with numbers from 40 to 89" do 
    test_numbers_if_any (40..89)
  end

  context "with numbers from 90 to 399" do
    test_numbers_if_any (90..399)
  end

  context "with numbers from 400 to 899" do
    test_numbers_if_any (400..899)
  end

  context "with numbers from 900 to 3999" do
    test_numbers_if_any (900..3999)
  end

end