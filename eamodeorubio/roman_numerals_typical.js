var TypicalRomanNumber=(function(roman2ArabicConversionTable) {
	var arabicNumbersByRomanNumeral={};
	var romanNumeralDetector=[];
	
	roman2ArabicConversionTable.forEach(function(roman2Arabic) {
		arabicNumbersByRomanNumeral[roman2Arabic.roman]=roman2Arabic.arabic;
		romanNumeralDetector.push(roman2Arabic.roman);
	});
	
	romanNumeralDetector=new RegExp(romanNumeralDetector.join('|'), "gi");
	
	return function(value){
		var romanResult, arabicResult;
		
		this.toString = function() {
			if (typeof(romanResult) != 'string') {
				var rest = value;
				romanResult=roman2ArabicConversionTable.reduce(function(acumulated, roman2Arabic) {
					while (rest >= roman2Arabic.arabic) {
						rest -= roman2Arabic.arabic;
						acumulated += roman2Arabic.roman;
					}
					return acumulated;
				},'');
			}
			return romanResult;
		};
		
		this.toNumber = function() {
			if (typeof(arabicResult) != 'number') {
				arabicResult=value.match(romanNumeralDetector).reduce(function(acumulated, roman) {
					return acumulated+arabicNumbersByRomanNumeral[roman];
				},0);
			}
			return arabicResult;
		};
	};
})([
	{'arabic':1000, 'roman':'M'},
	{'arabic':900, 'roman':'CM'},
	{'arabic':500, 'roman':'D'},
	{'arabic':400, 'roman':'CD'},
	{'arabic':100, 'roman':'C'},
	{'arabic':90, 'roman':'XC'},
	{'arabic':50, 'roman':'L'},
	{'arabic':40, 'roman':'XL'},
	{'arabic':10, 'roman':'X'},
	{'arabic':9, 'roman':'IX'},
	{'arabic':5, 'roman':'V'},
	{'arabic':4, 'roman':'IV'},
	{'arabic':1, 'roman':'I'}
]);
