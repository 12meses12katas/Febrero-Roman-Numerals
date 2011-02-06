var RomanNumber=function(value) {
	var originalRomanNumerals=[
		1, 'I',
		5, 'V',
		10, 'X',
		50, 'L',
		100, 'C',
		500, 'D',
		1000, 'M'
	];
	var romanNumeralsByValue=[];
	
	var giveRomanNumeralAndArabicConversionForSubstractRuleOf=function(i) {
		var romanNumeral=originalRomanNumerals[i];
		var arabicNumeral=originalRomanNumerals[i-1];
		var substractiveRomanNumeral=originalRomanNumerals[i-2];
		var substractiveArabicNumeral=originalRomanNumerals[i-3];
		var valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
		if(valueOfSubstractRule<=substractiveArabicNumeral) {
			substractiveRomanNumeral=originalRomanNumerals[i-4];
			substractiveArabicNumeral=originalRomanNumerals[i-5];
			valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
		}
		return [substractiveRomanNumeral+romanNumeral, valueOfSubstractRule];
	};
	
	for (var i = (originalRomanNumerals.length - 1); i >= 0; i -= 2) {
		romanNumeralsByValue.unshift(originalRomanNumerals[i]);
		romanNumeralsByValue.unshift(originalRomanNumerals[i-1]);
		if(i>=3) {
			var virtualRomanNumeralAndArabicConversion=giveRomanNumeralAndArabicConversionForSubstractRuleOf(i);
			romanNumeralsByValue.unshift(virtualRomanNumeralAndArabicConversion[0]);
			romanNumeralsByValue.unshift(virtualRomanNumeralAndArabicConversion[1]);
			
		}
	}
	
	var romanNumeralsCount=romanNumeralsByValue.length;
	
	this.toString=function() {
		if(value==0)
			return '';
		for(var i=(romanNumeralsCount-1);i>=0;i-=2) {
			var romanNumeral=romanNumeralsByValue[i];
			var arabicNumeral=romanNumeralsByValue[i-1];
			if(value>=arabicNumeral)
					return romanNumeral+new RomanNumber(value-arabicNumeral).toString();
		}
	};
};
