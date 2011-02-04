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
		
		// 50 / 10 / 5
		if(Math.abs(value-50)<(Math.abs(value-10-5)))
			return new RomanNumber(value-50).toString()+'L';
		if(value>10)
			return 'X'+new RomanNumber(value-10).toString();
		
		// 10 / 5 / 1
		if(Math.abs(value-10)<(Math.abs(value-5-1)))
			return new RomanNumber(value-10).toString()+'X';
		if(value>5)
			return 'V'+new RomanNumber(value-5).toString();
		
		// 5 / 1 / 0
		if(Math.abs(value-5)<Math.abs(value-1-0))
			return new RomanNumber(value-5).toString()+'V';
		if(value>1)
			return 'I'+new RomanNumber(value-1).toString();
	};
};
