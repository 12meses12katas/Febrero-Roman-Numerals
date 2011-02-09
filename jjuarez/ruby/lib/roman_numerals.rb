module RomanNumerals
  
  MAX = 3000
  VALID_CHARS = [ 'I', 'V', 'X', 'L', 'C', 'D', 'M' ]
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
end


class Fixnum
  
  def to_roman
    
    fail( "Ivalid number" ) unless( self > 0 && self <= RomanNumbers::MAX )  

    value       = self
    roman_value = ""
    
    thousans    =  value    / 1000
    value       -= thousans * 1000  
    roman_value << RomanNumerals::I2R[thousans * 1000]
         
    hundreds    =  value    / 100
    value       -= hundreds * 100
    roman_value << RomanNumerals::I2R[hundreds * 100]
    
    tens        =  value / 10
    value       -= tens  * 10
    roman_value << RomanNumerals::I2R[tens  * 10]
    roman_value << RomanNumerals::I2R[value % 10]
  end
end


class String
  
  def to_arabic
    
    fail( "String is empty" ) if empty?
    
    chars.each { |char| fail( "String is not a roman number" ) unless RomanNumerals::VALID_CHARS.include?( char.upcase ) }
    
    fail( "Not implemented... yet" )
  end
end