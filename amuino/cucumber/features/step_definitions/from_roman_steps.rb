# encoding: utf-8
require './converter.rb'

Dado /^que el número romano es (.+)$/ do |arg1|
  @roman = arg1
end

Cuando /^convierto a entero$/ do
  @decimal = @roman.from_roman
end

Entonces /el resultado entero es (.+)$/ do |arg1| 
  @decimal.should == arg1.to_i
end