#!/usr/bin/ruby
# -*- coding:utf-8; tab-width:4; mode:ruby -*-


class Fixnum
  def to_roman()
    @conversions = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9  => 'IX',
      5  => 'V',
      4  => 'IV',
      1  => 'I'
    }
    return to_roman_priv(self)
  end

  private
  def to_roman_priv (n)
    @conversions.each do |num, roman|
      return roman+to_roman_priv(n-num) if n >= num
    end
    return ''
  end
end

class String
  def from_roman()
    conversions = {
      'M' => 1000,
      'CM' => 900,
      'D' => 500,
      'CD' => 400,
      'C' => 100,
      'XC' => 90,
      'L' => 50,
      'XL' => 40,
      'X' => 10,
      'IX' => 9,
      'V' => 5,
      'IV' => 4,
      'I' => 1,
    }
    conversions.each do |roman,arab|
      return arab + self[(roman.length)..-1].from_roman if self.start_with? roman
    end
    0
  end
end
