require "rspec"

class String 
	
  ROMAN_ARABIC_TRANSLATION = [["M", 1000],
                              ["CM",900],
                              ["D", 500],
                              ["CD",400],
                              ["C", 100],
                              ["XC",90],
                              ["L", 50],
                              ["XL",40],
                              ["X", 10],
                              ["IX",9],
                              ["V", 5],
                              ["IV",4],
                              ["I", 1]]

  def to_arabic
    roman_number_to_convert = self
    ROMAN_ARABIC_TRANSLATION.each do |roman,arabic| 
      if roman_number_to_convert.start_with? roman 
        return arabic if roman == roman_number_to_convert
        return arabic + roman_number_without_the_first(roman).to_arabic
      end			
    end	
  end 
  
  def roman_number_without_the_first(roman)
    self[roman.size,self.size-1]
  end

end


describe "roman to arabic number converter" do
  
  it "transform one roman character to arabic" do
    "I".to_arabic.should == 1
    "V".to_arabic.should == 5
    "X".to_arabic.should == 10
    "L".to_arabic.should == 50
    "C".to_arabic.should == 100
    "D".to_arabic.should == 500
    "M".to_arabic.should == 1000
  end

  it "transform special cases with two roman characters, where the first is substracting the second, to arabic" do
    "IV".to_arabic.should == 4
    "IX".to_arabic.should == 9
    "XL".to_arabic.should == 40
    "XC".to_arabic.should == 90
    "CD".to_arabic.should == 400
    "CM".to_arabic.should == 900
  end
	
  it "transform two and three equal roman characters to arabic" do
    "II".to_arabic.should == 2
    "III".to_arabic.should == 3
  end

  it "transform complex roman numbers to arabic" do
    "XIV".to_arabic.should == 14
    "XLIX".to_arabic.should == 49
    "MCMXCIX".to_arabic.should == 1999
  end

end