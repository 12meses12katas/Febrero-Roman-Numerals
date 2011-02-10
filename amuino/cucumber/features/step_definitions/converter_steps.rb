# encoding: utf-8
require './converter.rb'

Dado /^que el número decimal es (\d+)$/ do |arg1|
  @decimal = arg1.to_i
end

Cuando /^convierto a romano$/ do
  @roman = @decimal.to_roman
end

Entonces /^el resultado es (.+)$/ do |arg1|
  @roman.should == arg1
end
