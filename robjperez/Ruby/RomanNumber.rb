
class RomanNumber
	def initilialize
	end
	
	def toRoman (number)	
		raise 'Number Too big' if number > 3000
				
		romanThousands = ['', 'M', 'MM', 'MMM']
		romanHundreds = ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM']
		romanTens = ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC']
		romanUnits = ['', 'I', 'II', 'III', 'IV', 'V', 'VI','VII', 'VIII', 'IX']
		
		romanThousands[number/1000] + romanHundreds[(number % 1000) /100] + 
			romanTens[(number % 100) / 10] + romanUnits[(number % 10)]			
	end
	
	def toNumber (romanString)
		prevchar = ''
		value = 0
		romanString.chars do |c| 
			if isGreater(c, prevchar) then
				value -= getValue(prevchar)
				value += getValue(c) - getValue(prevchar)
			else
				value += getValue(c)
			end	
			prevchar = c
		end
		return value
	end	
	
	def getValue(char)	
		return 1000 if char == 'M'
		return 500 if char == 'D'
		return 100 if char == 'C'
		return 50 if char == 'L'
		return 10 if char == 'X'
		return 5 if char == 'V'
		return 1 if char == 'I'
		return 0
	end
	
	def isGreater (a, b)
		return true if a == 'M' and b != 'M'
		return true if a == 'D' and ( b == 'C' or b == 'L' or b == 'X' or b == 'V' or b == 'I')
		return true if a == 'C' and ( b == 'L' or b == 'X' or b == 'V' or b == 'I')
		return true if a == 'L' and ( b == 'X' or b == 'V' or b == 'I')
		return true if a == 'X' and ( b == 'V' or b == 'I' )
		return true if a == 'V' and b == 'I'
		return false
	end
end