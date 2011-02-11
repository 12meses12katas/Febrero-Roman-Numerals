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
