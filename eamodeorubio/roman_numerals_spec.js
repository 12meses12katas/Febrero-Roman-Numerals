describe("RomanNumber", function(){
	describe("can convert from arabic to roman", function(){
		var appendArabicToRomanConversionSpec = function(arabicNumber, expectedRomanNumber){
			it(arabicNumber + " is converted to " + expectedRomanNumber, function(){
				expect(new RomanNumber(arabicNumber).toString()).toEqual(expectedRomanNumber);
			});
		};
		
		var sampleArabicToRomanEquivalences = [
			1,		'I',
			5,		'V',
			10,		'X'
		];
		for (var i = 0; i < sampleArabicToRomanEquivalences.length; i += 2) 
			appendArabicToRomanConversionSpec(sampleArabicToRomanEquivalences[i]
																			, sampleArabicToRomanEquivalences[i + 1]);
	});
});
