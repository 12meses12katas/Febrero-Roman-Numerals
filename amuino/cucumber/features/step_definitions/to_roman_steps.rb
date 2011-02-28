# encoding: utf-8
require './converter.rb'

Dado /^que el número decimal es (\d+)$/ do |arg1|
  @decimal = arg1.to_i
end

Dado /^que (-?\d+) es un numero no convertible a romano$/ do |arg1|
  @decimal = arg1.to_i
end

Cuando /^convierto a romano$/ do
  @roman = @decimal.to_roman
end

Entonces /^el resultado romano es ([IVXLCDM]+)$/ do |arg1|
  @roman.should == arg1
end

Entonces /^el resultado romano es nil$/ do
  @roman.should == nil
end
