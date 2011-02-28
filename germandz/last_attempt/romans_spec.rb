require "./romans.rb"

describe "romans" do
    
  it "should be I when number is 1" do
    1.to_roman.should == "I"
  end
  
  it "should be II when number is 2" do
    2.to_roman.should == "II"
  end
  
  it "should be III when number is 3" do
    3.to_roman.should == "III"
  end
  
  it "should be IV when number is 4" do
    4.to_roman.should == "IV"
  end
  
  it "should be V when number is 5" do
    5.to_roman.should == "V"
  end
  
  it "should be VI when number is 6" do
    6.to_roman.should == "VI"
  end

  it "should be VII when number is 7" do
    7.to_roman.should == "VII"
  end
  
  it "should be VIII when number is 8" do
    8.to_roman.should == "VIII"
  end
  
  it "should be IX when number is 9" do
    9.to_roman.should == "IX"
  end
  
  it "should be X when number is 10" do
    10.to_roman.should == "X"
  end

  it "should be XI when number is 11" do
    11.to_roman.should == "XI"
  end
 
  it "should be XV when number is 15" do
    15.to_roman.should == "XV"
  end  

  it "should be XXV when number is 25" do
    25.to_roman.should == "XXV"
  end

  it "should be XXVIII when number is 28" do
    28.to_roman.should == "XXVIII"
  end

  it "should be XIX when number is 19" do
    19.to_roman.should == "XIX"
  end
  
  it "should be XXIX when number is 29" do
    29.to_roman.should == "XXIX"
  end

  it "should be LXIX when number is 69" do
    69.to_roman.should == "LXIX"
  end  

  it "should be LXXVI when number is 76" do
    76.to_roman.should == "LXXVI"
  end

  it "should be XC when number is 90" do
    90.to_roman.should == "XC"
  end  
  
  it "should be MCMXCIX when number is 1999" do
    1999.to_roman.should == "MCMXCIX"
  end
  
  it "should be MMMDCCCLXXXVIII when number is 3888" do
    3888.to_roman.should == "MMMDCCCLXXXVIII"
  end  
  
  it "should be MMMCMXCIX when number is 3999" do
    3999.to_roman.should == "MMMCMXCIX"
  end
  
end