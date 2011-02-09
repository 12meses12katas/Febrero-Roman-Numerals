$:.unshift File.join( File.dirname( __FILE__ ), %w[.. .. lib] )


require 'test/unit'
require 'roman_numerals'


class TC_RomanNumerals < Test::Unit::TestCase
 
  def test_fixnum_to_roman
  
    (1..RomanNumerals::MAX).each { |a| assert_equal( a, a.to_roman.to_arabic ) }      
    
    assert_raise( RomanNumerals::RomanNumberError ) { (RomanNumerals::MAX+1).to_roman}  
    assert_raise( RomanNumerals::RomanNumberError ) { 0.to_roman }  
  end

  def test_aceptance_fixnum_to_roman

    assert_equal( 1999.to_roman, "MCMXCIX" )
  end
  
  def test_string_to_arabic
    
    romans = []
    
    (1..RomanNumerals::MAX).each { |n| romans << n.to_roman }
    romans.each { |r| assert_equal( r, r.to_arabic.to_roman ) }    
        
    assert_raise( RomanNumerals::RomanNumberError ) { "".to_arabic}  
    assert_raise( RomanNumerals::RomanNumberError ) { "MMcMXCVIII".to_arabic }  
  end

  def test_aceptance_string_to_arabic
    
    assert_equal( "MCMXCIX".to_arabic, 1999 )
  end
end