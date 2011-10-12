class RomanNumbers
  def self.symbols exponent
   {
     0 => ["I", "V", "X"],
     1 => ["X", "L", "C"],
     2 => ["C", "D", "M"],
     3 => ["M",  "",  ""]
   }[exponent]
  end
end

class Fixnum
  
  def to_roman
    roman = ""
    number = self
    [3,2,1,0].each do |exponent|
        digit, number = number.divmod(10**exponent)
        roman << digit_to_roman(digit, RomanNumbers::symbols(exponent))
    end
    roman
  end
  
  def digit_to_roman digit, symbols
    unit_symbol, medium_symbol, next_unit_symbol = symbols
    roman = ""
    roman << units(unit_symbol, digit)
    roman << medium_symbol if digit > 3 && digit < 9
    roman << units(unit_symbol, digit-5)
    roman << next_unit_symbol if digit == 9
    roman
  end
  
  def units symbol, half
    return "" if half < 1 || half > 4
    q,r = half.divmod 4
    symbol * (q+r)
  end
end