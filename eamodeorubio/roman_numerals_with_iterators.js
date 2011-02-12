var FancyRomanNumber=(function(originalRomanNumeral2ArabicConversions) {
	var romanNumeral2ArabicConversions=[];
	var arabicNumbersByRomanNumeral={};
	var romanNumeralDetector=[];
	
	var giveRoman2ArabicConversionForSubstractRuleOf = function(roman2Arabic, i){
		if(roman2Arabic.arabic<=1)
			return;
		var substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 1];
		if (roman2Arabic.arabic <= (2 * substractiveRoman2Arabic.arabic)) 
			substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 2];
		var roman2ArabicConversion={
			'arabic': (roman2Arabic.arabic - substractiveRoman2Arabic.arabic),
			'roman': (substractiveRoman2Arabic.roman + roman2Arabic.roman)
		};
		romanNumeral2ArabicConversions.push(roman2ArabicConversion);
		arabicNumbersByRomanNumeral[roman2ArabicConversion.roman]=roman2ArabicConversion.arabic;
		romanNumeralDetector.push(roman2ArabicConversion.roman);
	};
	
	originalRomanNumeral2ArabicConversions.forEach(function(roman2ArabicConversion, i){
		romanNumeral2ArabicConversions.push(roman2ArabicConversion);
		arabicNumbersByRomanNumeral[roman2ArabicConversion.roman] = roman2ArabicConversion.arabic;
		romanNumeralDetector.push(roman2ArabicConversion.roman);
		giveRoman2ArabicConversionForSubstractRuleOf(roman2ArabicConversion, i);
	});
	
	romanNumeralDetector=new RegExp(romanNumeralDetector.join('|'),"gi");
	
	return function(value){
		var romanResult, arabicResult;
		
		this.toString = function() {
			if (typeof(romanResult) != 'string') {
				var rest = value;
				romanResult=romanNumeral2ArabicConversions.reduce(function(acumulated, roman2Arabic) {
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
	{'arabic':500, 'roman':'D'},
	{'arabic':100, 'roman':'C'},
	{'arabic':50, 'roman':'L'},
	{'arabic':10, 'roman':'X'},
	{'arabic':5, 'roman':'V'},
	{'arabic':1, 'roman':'I'}
]);
