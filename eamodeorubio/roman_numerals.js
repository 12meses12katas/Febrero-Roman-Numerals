var RomanNumber=function(value) {
	var romanNumeralsByValue={
		1:'I',
		5:'V',
		10:'X'
	};
	
	this.toString=function() {
		return romanNumeralsByValue[value];
	};
};
