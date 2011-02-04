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
	value=Math.abs(value);
	this.toString=function() {
		var r=romanNumeralsByValue[value];
		if(r)
			return r;
		if(Math.abs(value-5)<Math.abs(value-1))
			return new RomanNumber(value-5).toString()+'V';
		else
			return 'I'+new RomanNumber(value-1).toString();
	};
};
