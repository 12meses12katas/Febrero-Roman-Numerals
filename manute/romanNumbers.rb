
class RomanNumbers

 @@romanlist = [["M", 1000],
                ["CM", 900],
                ["D",  500],
                ["CD", 400],
                ["C",  100],
                ["XC",  90],
                ["L",   50],
                ["XL",  40],
                ["X",   10],
                ["IX",   9],
                ["V",    5],
                ["IV",   4],
                ["I",    1]]

		   
  
   def self.to_roman(number)
        roman = ""
        for sym, num in @@romanlist
            while number >= num
                number -= num
                roman << sym
            end
        end
        roman
    end
    
    def self.from_roman(roman)
        ustr = roman.upcase
        sum = 0
        for entry in @@romanlist
            sym, num = entry[0], entry[1]
            while sym == ustr[0, sym.length]
                sum += num
                ustr.slice!(0, sym.length)
            end
        end
        sum
    end

end