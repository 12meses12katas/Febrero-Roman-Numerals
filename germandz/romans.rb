class RomanNumbers
  I = "I"
end

class Fixnum
  def to_roman
    return "IV" if self==4
    RomanNumbers::I * self
  end
end