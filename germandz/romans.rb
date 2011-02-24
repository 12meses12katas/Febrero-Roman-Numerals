class RomanNumbers
  I = "I"
end

class Fixnum
  def to_roman
    roman = ""
    self.times do
      roman << RomanNumbers::I
    end
    roman
  end
end