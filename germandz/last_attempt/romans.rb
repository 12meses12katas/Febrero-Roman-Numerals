class RomanNumber
  def self.symbols exponent
    ["I", "V", "X", "L", "C", "D", "M", "", ""].slice exponent*2, 3
  end
end

class Fixnum
  def to_roman
    arabic = self
    [3,2,1,0].inject("") do |roman, exponent|
        digit, arabic = arabic.divmod 10**exponent
        roman << digit_to_roman(digit, exponent)
    end
  end
  
  def digit_to_roman digit, exponent
    return "" if digit == 0
    unit, quinc, dec = RomanNumber::symbols exponent
    roman = unit * digit
    roman = roman.sub unit*5, quinc
    roman = roman.sub unit*4, unit+quinc
    roman = roman.sub quinc+unit+quinc, unit+dec
  end
end