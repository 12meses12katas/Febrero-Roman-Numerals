
class Fixnum
  ROMAN_ONES = ["I", "X", "C", "M"]
  ROMAN_FIVES = ["V", "L", "D", ""]
  
  def to_roman
    nil if self < 1 || self >= 3000
    current = self
    [3,2,1,0].inject("") do |result, power|
      div, mod = current.divmod(10**power)
      current = mod
      result + digit_to_roman(div, power)
    end
  end
  
  def digit_to_roman(digit, scale) 
    five_or_more, less_than_five = digit.divmod(5)
    case less_than_five
      when 4 then ROMAN_ONES[scale] + (five_or_more == 1 ? ROMAN_ONES[scale+1] : ROMAN_FIVES[scale])
      else ROMAN_FIVES[scale]*five_or_more + ROMAN_ONES[scale]*less_than_five
    end
  end
end