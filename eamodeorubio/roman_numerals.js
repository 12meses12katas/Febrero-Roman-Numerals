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
	
	this.toString=function() {
		if(value==0)
			return '';
		for(var i=(romanNumeralsCount-1);i>=0;i-=2) {
			var romanNumeral=romanNumeralsByValue[i];
			var arabicNumeral=romanNumeralsByValue[i-1];
			if(value>=arabicNumeral)
				return romanNumeral+new RomanNumber(value-arabicNumeral).toString();
			if (i >= 3) {
				var substractiveRomanNumeral=romanNumeralsByValue[i-2];
				var substractiveArabicNumeral=romanNumeralsByValue[i-3];
				var valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
				if(valueOfSubstractRule<=substractiveArabicNumeral) {
					substractiveRomanNumeral=romanNumeralsByValue[i-4];
					substractiveArabicNumeral=romanNumeralsByValue[i-5];
					valueOfSubstractRule=arabicNumeral-substractiveArabicNumeral;
				}
				if(value>=valueOfSubstractRule)
					return substractiveRomanNumeral+romanNumeral+new RomanNumber(value-valueOfSubstractRule).toString();
			}
		}
	};
};
