var RomanNumber=function(value) {
	var romanNumeralsByValue={
		1:'I',
		5:'V',
		10:'X',
		50:'L',
		100:'C',
		500:'D',
		1000:'M'
	};
	
	this.toString=function() {
		var r=romanNumeralsByValue[value];
		if(r)
			return r;
		return 'I'+new RomanNumber(value-1).toString();
	};
};
