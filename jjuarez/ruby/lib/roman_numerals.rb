module RomanNumerals
  
  class RomanNumberError < StandardError
  end
  
  MAX = 3000
  I2R = {
       0=>'',
       1=>'I',
       2=>'II',
       3=>'III',
       4=>'IV',
       5=>'V',
       6=>'VI',
       7=>'VII',
       8=>'VIII',
       9=>'IX',
      10=>'X',
      20=>'XX',
      30=>'XXX',
      40=>'XL',
      50=>'L',
      60=>'LX',
      70=>'LXX',
      80=>'LXXX',
      90=>'XC',
     100=>'C',
     200=>'CC',
     300=>'CCC',
     400=>'CD',
     500=>'D',
     600=>'DC',
     700=>'DCC',
     800=>'DCCC',
     900=>'CM',
    1000=>'M',
    2000=>'MM',
    3000=>'MMM'
  }

  R2I={
    'M'=>1000,
    'D'=>500,
    'C'=>100,
    'L'=>50,
    'X'=>10,
    'V'=>5,
    'I'=>1
  }
end


class Fixnum
  
  def to_roman
    
    raise RomanNumerals::RomanNumberError.new( 'Ivalid number' ) unless( self > 0 && self <= RomanNumerals::MAX )  

    value       = self
    roman_value = ""
    
    [1000, 100, 10].each do |divisor|
    
      y     = value/divisor
      r     = y * divisor
      value -= r
      roman_value << RomanNumerals::I2R[r]
    end

    roman_value << RomanNumerals::I2R[value % 10]
  end
end


class String
  
  def to_arabic
    
    raise RomanNumerals::RomanNumberError.new( 'String is empty' ) if empty?

    previous_value = 1001
    final_value    = 0
    
    chars.each do |character|

      raise RomanNumerals::RomanNumberError.new( 'This string is not a roman number' ) unless RomanNumerals::R2I.keys.include?( character )

      current_value = RomanNumerals::R2I[character]
      final_value   += (previous_value < current_value) ? (current_value - previous_value*2) : current_value
      
      previous_value = current_value
    end
    
    final_value
  end
end