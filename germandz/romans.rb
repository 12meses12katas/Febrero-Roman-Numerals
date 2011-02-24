class RomanNumbers
  I = "I"
end

class Fixnum
  def to_roman
    return RomanNumbers::I if self==1
    RomanNumbers::I + RomanNumbers::I
  end
end