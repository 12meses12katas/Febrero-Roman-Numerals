var RomanNumber=function(value) {
	var romanNumeralsByValue=[
		0, '',
		1, 'I',
		5, 'V',
		10, 'X',
		50, 'L',
		100, 'C',
		500, 'D',
		1000, 'M'
	];
	var romanNumeralsCount=romanNumeralsByValue.length;
	
	value=Math.abs(value);
	this.toString=function() {
		for(var i=(romanNumeralsCount-1);i>=0;i-=2) {
			var romanNumeral=romanNumeralsByValue[i];
			var arabicNumeral=romanNumeralsByValue[i-1];
			if(value==arabicNumeral)
				return romanNumeral;
				
			var immediatelyLowerRomanNumeral=romanNumeralsByValue[i-2];
			var immediatelyLowerArabicNumeral=romanNumeralsByValue[i-3];
			var minimumIncrement=romanNumeralsByValue[i-5];
			
			if(Math.abs(value-arabicNumeral)<Math.abs(value-immediatelyLowerArabicNumeral-minimumIncrement))
				return new RomanNumber(value-arabicNumeral).toString()+romanNumeral;
			if(value>immediatelyLowerArabicNumeral)
				return immediatelyLowerRomanNumeral+new RomanNumber(value-immediatelyLowerArabicNumeral).toString();
		}
	};
};
