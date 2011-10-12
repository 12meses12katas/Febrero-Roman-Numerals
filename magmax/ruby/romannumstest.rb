#!/usr/bin/ruby
# -*- coding:utf-8; tab-width:4; mode:ruby -*-

require_relative './romannums.rb'

describe Fixnum, "#roman" do

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
    40 => 'XL',
    46 => 'XLVI',
    50 => 'L',
    90 => 'XC',
    100 => 'C',
    400 => 'CD',
    500 => 'D',
     900 => 'CM',
    1000 => 'M',
    1998 => 'MCMXCVIII',
  }

  it "returns the roman number for each number" do
    numbers.each do |arab,roman|
      arab.to_roman().should == roman
    end
  end
end



describe String, "#roman" do
  numbers = {
    'I' => 1,
    'II' => 2,
    'III' => 3,
    'IV' => 4,
    'V' => 5,
    'VI' => 6,
    'VIII' => 8,
    'IX' => 9,
    'X' => 10,
    'XI' => 11,
    'XIV' => 14,
    'XX' => 20,
    'XLI' => 41,
    'LVIII' => 58,
    'XCIII' => 93,
    'CLXXIV' => 174,
    'CDIV' => 404,
    'DCCCLXXXVIII' => 888,
    'CMIX'=> 909,
    'MCI ' => 1101,
    'MCMXCVIII' => 1998,
  }

  it "returns the arabian number for one" do
    numbers.each do |roman,arab|
      roman.from_roman.should == arab
    end
  end


end
