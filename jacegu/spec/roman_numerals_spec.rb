require 'spec_helper'

RSpec::Matchers.define :be_roman_numeral do |expected|
  match do |arabic|
    @result = arabic.to_roman
    @result == expected
  end

  failure_message_for_should do |arabic|
    "#{arabic} should be roman numeral #{expected} but was #{@result}"
  end
end

describe 'Arabic to roman' do
  context 'with numbers from 1 to 3' do
    it 'transforms 1 to I' do
      1.should be_roman_numeral 'I'
    end

    it 'transforms 2 to II' do
      2.should be_roman_numeral 'II'
    end

    it 'transforms 3 to III' do
      3.should be_roman_numeral 'III'
    end
  end

  context 'with 4 and 5' do
    it 'transforms 4 to IV' do
      4.should be_roman_numeral 'IV'
    end

    it 'transforms 5 to V' do
      5.should be_roman_numeral 'V'
    end
  end

  context 'with numbers from 6 to 9' do
    it 'transforms 6 to VI' do
      6.should be_roman_numeral 'VI'
    end
    
   it 'transforms 8 to VIII' do
      8.should be_roman_numeral 'VIII'
    end

   it 'transforms 9 to IX' do
      9.should be_roman_numeral 'IX'
    end
  end

  context 'wxith numbers from 10 to 39' do
   it 'transforms 10 to X' do
      10.should be_roman_numeral 'X'
    end

   it 'transforms 39 to XXXIX' do
      39.should be_roman_numeral 'XXXIX'
    end
  end

  context 'wxith numbers from 40 to 89' do
   it 'transforms 40 to XL' do
      40.should be_roman_numeral 'XL'
    end

   it 'transforms 50 to L' do
      50.should be_roman_numeral 'L'
    end

   it 'transforms 89 to LXXXIX' do
      89.should be_roman_numeral 'LXXXIX'
    end
  end

  context 'wxith numbers from 90 to 399' do
   it 'transforms 90 to XC' do
      90.should be_roman_numeral 'XC'
    end

   it 'transforms 100 to C' do
      100.should be_roman_numeral 'C'
    end

   it 'transforms 399 to CCCXCIX' do
      399.should be_roman_numeral 'CCCXCIX'
    end
  end

  context 'wxith numbers from 400 to 899' do
   it 'transforms 400 to CD' do
      400.should be_roman_numeral 'CD'
    end

   it 'transforms 500 to D' do
      500.should be_roman_numeral 'D'
    end

   it 'transforms 899 to DCCCXCIX' do
      899.should be_roman_numeral 'DCCCXCIX'
    end
  end

  context 'with numbers from 900 to 3999' do
   it 'transforms 900 to CM' do
      900.should be_roman_numeral 'CM'
    end

   it 'transforms 1000 to M' do
      1000.should be_roman_numeral 'M'
    end

    it 'transforms 1978 to MCMLXXVIII' do
      1978.should be_roman_numeral 'MCMLXXVIII' 
    end
    
    it 'transforms 1999 to MCMXCIX' do
      1999.should be_roman_numeral 'MCMXCIX' 
    end

   it 'transforms 3999 to MMMCMXCIX' do
      3999.should be_roman_numeral 'MMMCMXCIX' 
    end
  end

  context "with numbers that don't have roman representation" do
   it 'raises error when transforming 0 to roman' do
      expect{ 0.to_roman }.to raise_error 'This number has no roman representation'
    end

   it 'raises error when transforming -1 to roman' do
      expect{ -1.to_roman }.to raise_error 'This number has no roman representation'
    end

   it 'raises error when transforming 4000 to roman' do
      expect{ 4000.to_roman}.to raise_error 'This number has no roman representation'
    end
  end

end
