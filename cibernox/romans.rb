class RomanNumber
  @syms = { 
    :ones       => { :unit => 'I', :pivot => 'V', :last => 'X' },
    :tens       => { :unit => 'X', :pivot => 'L', :last => 'C' },
    :hundreds   => { :unit => 'C', :pivot => 'D', :last => 'M' },
    :thousands  => { :unit => 'M', :pivot => '',  :last => ''  }
  }

  def self.chain_chars(num_in_string, position)
    return '' unless num_in_string
    num = num_in_string.to_i
    family = [:ones, :tens, :hundreds, :thousands][position]
    case num
      when 0..3 then @syms[family][:unit] * num
      when 4..5 then @syms[family][:unit] * (num - 5).abs + @syms[family][:pivot]
      when 6..8 then @syms[family][:pivot] + @syms[family][:unit] * (num - 5)
      when 9..10  then @syms[family][:unit] * (num - 10).abs + @syms[family][:last]
      else " Error "
    end
  end
end

class Fixnum
  def to_roman
    ary = (1..4).each_with_index.map{ |n, i| [to_s[-1 * n], i]}
    ary.reverse.map{ |num_and_index| RomanNumber.chain_chars(num_and_index[0], num_and_index[1]) }.join
  end
end

class String
  def to_arabic
    thousands = match(/(^M+)/)[0] rescue ''
    hundreds = gsub(/^#{thousands}/, '').match(/((C|D)[^X|^L]+)|^C|^D/)[0] rescue ''
    tens = gsub(/^#{thousands+hundreds}/, '').match(/((X|L)[^I|^V]+)|^X|^L/)[0] rescue ''
    ones = gsub(/^#{thousands+hundreds+tens}/, '') 
    res = thousands.length * 1000
    res += hundreds=='CD' ? 400 : hundreds=='CM' ? 900 : hundreds.count('C')*100 + hundreds.count('D')*500
    res += tens=='XL' ? 40 : tens=='XC' ? 90 : tens.count('X')*10 + tens.count('L')*50
    res += ones=='IV' ? 4 : ones=='IX' ? 9 : ones.count('I') + ones.count('V')*5
  end
end