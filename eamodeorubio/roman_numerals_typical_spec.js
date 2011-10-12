describe("TypicalRomanNumber", function(){
	describe("can convert from arabic to roman", function(){
		var appendArabicToRomanConversionSpec = function(arabicNumber, expectedRomanNumber){
			it(arabicNumber + " is converted to " + expectedRomanNumber, function(){
				expect(new TypicalRomanNumber(arabicNumber).toString()).toEqual(expectedRomanNumber);
			});
		};
		
		var appendRomanToArabicConversionSpec = function(romanNumber, expectedArabicNumber){
			it(romanNumber + " is converted to " + expectedArabicNumber, function(){
				expect(new TypicalRomanNumber(romanNumber).toNumber()).toEqual(expectedArabicNumber);
			});
		};
		
		var sampleArabicToRomanEquivalences = [
			1,		'I',
			2,		'II',
			3,		'III',
			4,		'IV',
			5,		'V',
			6,		'VI',
			7,		'VII',
			8,		'VIII',
			9,		'IX',
			10,		'X',
			11,		'XI',
			12,		'XII',
			13,		'XIII',
			14,		'XIV',
			15,		'XV',
			19,		'XIX',
			20,		'XX',
			40,		'XL',
			49,		'XLIX',
			50,		'L',
			99,		'XCIX',
			100,	'C',
			500,	'D',
			999,	'CMXCIX',
			1000,	'M',
			1999, 'MCMXCIX',
			2000, 'MM',
			2999, 'MMCMXCIX',
			3000, 'MMM'
		];
		for (var i = 0; i < sampleArabicToRomanEquivalences.length; i += 2) {
			var romanNumber=sampleArabicToRomanEquivalences[i + 1];
			var arabicNumber=sampleArabicToRomanEquivalences[i];
			appendArabicToRomanConversionSpec(arabicNumber, romanNumber);
			appendRomanToArabicConversionSpec(romanNumber, arabicNumber);
		}
	});
});
