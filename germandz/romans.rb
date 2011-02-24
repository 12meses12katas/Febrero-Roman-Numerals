class RomanNumbers
  I = "I"
  V = "V"
end

class Fixnum
  def to_roman
    roman = ""
    q,r = self.divmod 4
    roman << RomanNumbers::I * (q-r).abs
    roman << RomanNumbers::V if q>0
    roman
  end
end