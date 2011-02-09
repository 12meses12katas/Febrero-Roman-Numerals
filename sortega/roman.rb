class Roman

  def Roman.to_roman(number)
    raise ArgumentError.new("Unable to represent " + number.to_s + 
                            " in roman numerals") unless number > 0

    roman_digits = [
      ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
      ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XL'],
      ['', 'C', 'CC', 'CCC', 'CM', 'M', 'MC', 'MCC', 'MCCC', 'CM'],
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
end
