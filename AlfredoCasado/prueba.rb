require "rspec"

describe "roman to arabic number converter" do
  
  it "transform arabic numbers to simple roman numbers" do
    "I".to_arabic.should == "I"
  end
end