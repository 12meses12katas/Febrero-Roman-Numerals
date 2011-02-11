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
