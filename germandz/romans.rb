class RomanNumbers
  I = "I"
  V = "V"
  X = "X"
  L = "L"
  C = "C"
  D = "D"
  M = "M"
  
  def self.get_symbols pivot
    symbols_by_pivot = {   5 => [RomanNumbers::I, RomanNumbers::V, RomanNumbers::X],
                          50 => [RomanNumbers::X, RomanNumbers::L, RomanNumbers::C],
                         500 => [RomanNumbers::C, RomanNumbers::D, RomanNumbers::M],
                        5000 => [RomanNumbers::M, "", ""]}  
    symbols_by_pivot[pivot]
  end
end

class Fixnum
  def to_roman
    roman = ""
    arabic = self
    exponents = [3,2,1,0]
    exponents.each do |exponent| 
        multiplier = 10 ** exponent
        pivot = 5 * multiplier
        digit = arabic.div multiplier
        arabic -= digit * multiplier
        if (digit > 0)
          roman << (up_to_pivot digit, pivot) if digit <= 5
          roman << (above_pivot digit, pivot) if digit > 5
        end
    end
    roman
  end
  
  def up_to_pivot arabic, pivot
    unit_symbol, pivot_symbol, next_unit_symbol = RomanNumbers::get_symbols pivot
    return unit_symbol + pivot_symbol if arabic==4
    roman = ""
    roman << unit_symbol * arabic if arabic<5
    roman << pivot_symbol if arabic>4
    roman    
  end
  
  def above_pivot arabic, pivot
    unit_symbol, pivot_symbol, next_unit_symbol = RomanNumbers::get_symbols pivot
    return unit_symbol + next_unit_symbol if arabic==9
    roman = ""
    roman << pivot_symbol
    roman << unit_symbol * (arabic-5)
    roman
  end
end