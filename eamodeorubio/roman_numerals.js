var RomanNumber=(function(originalRomanNumeral2ArabicConversions) {
	var originalRoman2ArabicConversionsCount=originalRomanNumeral2ArabicConversions.length;
	
	var romanNumeral2ArabicConversions=[];
	var arabicNumbersByRomanNumeral={};
	
	var giveRoman2ArabicConversionForSubstractRuleOf = function(i){
		if (i == (originalRoman2ArabicConversionsCount-1)) 
			return;
		var roman2Arabic = originalRomanNumeral2ArabicConversions[i];
		var substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 1];
		if (roman2Arabic.arabic <= (2 * substractiveRoman2Arabic.arabic)) 
			substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 2];
		var roman2ArabicConversion={
			'arabic': (roman2Arabic.arabic - substractiveRoman2Arabic.arabic),
			'roman': (substractiveRoman2Arabic.roman + roman2Arabic.roman)
		};
		romanNumeral2ArabicConversions.push(roman2ArabicConversion);
		arabicNumbersByRomanNumeral[roman2ArabicConversion.roman]=roman2ArabicConversion.arabic;
	};
	
	for (var i = 0; i < originalRoman2ArabicConversionsCount; i++) {
		var roman2ArabicConversion=originalRomanNumeral2ArabicConversions[i];
		romanNumeral2ArabicConversions.push(roman2ArabicConversion);
		arabicNumbersByRomanNumeral[roman2ArabicConversion.roman]=roman2ArabicConversion.arabic;
		giveRoman2ArabicConversionForSubstractRuleOf(i);
	}
	
	var roman2ArabicConversionsCount=romanNumeral2ArabicConversions.length;
	
	return function(value){
		var romanResult, arabicResult;
		
		this.toString = function() {
			if (typeof(romanResult) != 'string') {
				var rest = value;
				romanResult = '';
				for (var i = 0; rest > 0 && i < roman2ArabicConversionsCount; i++) {
					var roman2Arabic = romanNumeral2ArabicConversions[i];
					while (rest >= roman2Arabic.arabic) {
						rest -= roman2Arabic.arabic;
						romanResult += roman2Arabic.roman;
					}
				}
			}
			return romanResult;
		};
		
		this.toNumber = function() {
			if (typeof(arabicResult) != 'number') {
				var rest = value;
				arabicResult = 0;
				while (rest.length > 0) {
					var roman = rest.substr(0, 2);
					var arabic = arabicNumbersByRomanNumeral[roman];
					if (typeof(arabic) != 'number') {
						roman = rest[0];
						arabic = arabicNumbersByRomanNumeral[roman];
					}
					rest = rest.substr(roman.length);
					arabicResult += arabic;
				}
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
