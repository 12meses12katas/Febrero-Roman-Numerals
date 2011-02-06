var RomanNumber=function(value) {
	var romanNumeralsByValue=[
		1, 'I',
		5, 'V',
		10, 'X',
		50, 'L',
		100, 'C',
		500, 'D',
		1000, 'M'
	];
	var romanNumeralsCount=romanNumeralsByValue.length;
	var giveRomanNumeralAndArabicConversionForSubstractRuleOf=function(i) {
		var romanNumeral=romanNumeralsByValue[i];
		var arabicNumeral=romanNumeralsByValue[i-1];
		var substractiveRomanNumeral=romanNumeralsByValue[i-2];
		var substractiveArabicNumeral=romanNumeralsByValue[i-3];
		var valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
		if(valueOfSubstractRule<=substractiveArabicNumeral) {
			substractiveRomanNumeral=romanNumeralsByValue[i-4];
			substractiveArabicNumeral=romanNumeralsByValue[i-5];
			valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
		}
		return [substractiveRomanNumeral+romanNumeral, valueOfSubstractRule];
	};
	
	this.toString=function() {
		if(value==0)
			return '';
		for(var i=(romanNumeralsCount-1);i>=0;i-=2) {
			var romanNumeral=romanNumeralsByValue[i];
			var arabicNumeral=romanNumeralsByValue[i-1];
			var restOfTheValue=value-arabicNumeral;
			if (restOfTheValue<0 && i >= 3) {
				var virtualRomanNumeralAndArabicConversion=giveRomanNumeralAndArabicConversionForSubstractRuleOf(i);
				romanNumeral=virtualRomanNumeralAndArabicConversion[0];
				restOfTheValue=value-virtualRomanNumeralAndArabicConversion[1];
			}
			if(restOfTheValue>=0)
					return romanNumeral+new RomanNumber(restOfTheValue).toString();
		}
	};
};
