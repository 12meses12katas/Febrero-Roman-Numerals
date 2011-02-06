var RomanNumber=function(value) {
	var originalRomanNumeral2ArabicConversions=[
		{'arabic':1, 'roman':'I'},
		{'arabic':5, 'roman':'V'},
		{'arabic':10, 'roman':'X'},
		{'arabic':50, 'roman':'L'},
		{'arabic':100, 'roman':'C'},
		{'arabic':500, 'roman':'D'},
		{'arabic':1000, 'roman':'M'}
	];
	var romanNumeral2ArabicConversions=[];
	
	var giveRomanNumeralAndArabicConversionForSubstractRuleOf=function(i) {
		if(i<1)
			return;
		var roman2Arabic=originalRomanNumeral2ArabicConversions[i];
		var substractiveRoman2Arabic=originalRomanNumeral2ArabicConversions[i-1];
		if(roman2Arabic.arabic<=(2*substractiveRoman2Arabic.arabic))
			substractiveRoman2Arabic=originalRomanNumeral2ArabicConversions[i-2];
		romanNumeral2ArabicConversions.unshift({
			'arabic':(roman2Arabic.arabic-substractiveRoman2Arabic.arabic),
			'roman':(substractiveRoman2Arabic.roman+roman2Arabic.roman)
		});
	};
	
	for (var i = (originalRomanNumeral2ArabicConversions.length - 1); i >= 0; i--) {
		romanNumeral2ArabicConversions.unshift(originalRomanNumeral2ArabicConversions[i]);
		giveRomanNumeralAndArabicConversionForSubstractRuleOf(i);
	}
	
	var romanNumeralsCount=romanNumeral2ArabicConversions.length;
	
	this.toString=function() {
		if(value==0)
			return '';
		for(var i=(romanNumeralsCount-1);i>=0;i--) {
			var roman2Arabic=romanNumeral2ArabicConversions[i];
			if(value>=roman2Arabic.arabic)
					return roman2Arabic.roman+new RomanNumber(value-roman2Arabic.arabic).toString();
		}
	};
};
