class Roman

  def Roman.to_roman(number)
    raise ArgumentError.new("Unable to represent " + number.to_s + 
                            " in roman numerals") unless number > 0

    roman_digits = [
      ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
      ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XL'],
      ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
      ['', 'M', 'MM', 'MMM'],
    ]

    roman = ''
    digit_index = 0
    while number > 0
      digit = number % 10
      roman = roman_digits[digit_index][digit] + roman
      number /= 10
      digit_index+= 1
    end

    return roman
  end

  def Roman.to_i(roman)
    numerals = {
      'I' => 1,   'V' => 5,
      'X' => 10,  'L' => 50,
      'C' => 100, 'D' => 500,
      'M' => 1000
    }

    values = []
    roman.each_char { |ch| values.push numerals[ch] }

    return aggregate(values)
  end
  
  private

  def Roman.aggregate(values)
    return 0 if values.empty?
    return values[0] if values.length == 1

    first  = values.shift
    second = values.first
    if first < second
      values.drop(1)
      return second - first + aggregate(values)
    else
      return first + aggregate(values)
    end
  end
end
