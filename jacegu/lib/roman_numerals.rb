class Fixnum
  def to_roman
    roman = ''
    equivalence = RomanEquivalence.closestTo(self)
    roman << equivalence.roman
    remaining = self - equivalence.arabic
    roman << remaining.to_roman if remaining > 0
    roman
  end
end

class RomanEquivalence
  attr_reader :arabic, :roman
  
  KNOWN_ROMANS = 1..3999
  KNOWN_EQUIVALENCES = {   1 =>  'I',
                           4 => 'IV', 
                           5 =>  'V',
                           9 => 'IX',
                          10 =>  'X',
                          40 => 'XL',
                          50 =>  'L', 
                          90 => 'XC',
                         100 =>  'C', 
                         400 => 'CD',
                         500 =>  'D', 
                         900 => 'CM', 
                        1000 =>  'M' }

  def self.closestTo(number)
    raise 'This number has no roman representation' unless KNOWN_ROMANS.include?(number)
    arabic_value = KNOWN_EQUIVALENCES.keys.select{ |arabic| number >= arabic}.max
    roman_value = KNOWN_EQUIVALENCES[arabic_value]
    RomanEquivalence.new(arabic_value, roman_value)
  end

  def initialize(arabic, roman)
    @arabic = arabic
    @roman = roman
  end
end
