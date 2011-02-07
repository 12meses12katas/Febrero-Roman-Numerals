var RomanNumber=(function(originalRomanNumeral2ArabicConversions) {
	var originalRoman2ArabicConversionsCount=originalRomanNumeral2ArabicConversions.length;
	
	var romanNumeral2ArabicConversions=[];
	
	var giveRoman2ArabicConversionForSubstractRuleOf = function(i){
		if (i == (originalRoman2ArabicConversionsCount-1)) 
			return;
		var roman2Arabic = originalRomanNumeral2ArabicConversions[i];
		var substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 1];
		if (roman2Arabic.arabic <= (2 * substractiveRoman2Arabic.arabic)) 
			substractiveRoman2Arabic = originalRomanNumeral2ArabicConversions[i + 2];
		romanNumeral2ArabicConversions.push({
			'arabic': (roman2Arabic.arabic - substractiveRoman2Arabic.arabic),
			'roman': (substractiveRoman2Arabic.roman + roman2Arabic.roman)
		});
	};
	
	for (var i = 0; i < originalRoman2ArabicConversionsCount; i++) {
		romanNumeral2ArabicConversions.push(originalRomanNumeral2ArabicConversions[i]);
		giveRoman2ArabicConversionForSubstractRuleOf(i);
	}
	
	var roman2ArabicConversionsCount=romanNumeral2ArabicConversions.length;
	
	return function(value){
		this.toString = function() {
			if (value == 0) 
				return '';
			for (var i = 0; i < roman2ArabicConversionsCount; i++) {
				var roman2Arabic = romanNumeral2ArabicConversions[i];
				if (value >= roman2Arabic.arabic) 
					return roman2Arabic.roman + new RomanNumber(value - roman2Arabic.arabic).toString();
			}
		};
		
		this.toNumber = function() {
			if(value.length==0)
				return 0;
			var roman2Arabic;
			for (var i = 0; !roman2Arabic && i < roman2ArabicConversionsCount; i++) {
				var currentRoman2Arabic = romanNumeral2ArabicConversions[i];
				if(value.indexOf(currentRoman2Arabic.roman)==0)
					roman2Arabic=currentRoman2Arabic;
			}
			return roman2Arabic.arabic + new RomanNumber(value.substr(roman2Arabic.roman.length)).toNumber();
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
