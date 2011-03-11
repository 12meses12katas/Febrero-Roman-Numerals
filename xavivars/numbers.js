////////////////////////////////////////////////////////////
// Number library
//
// Author-email: xavi.ivars@gmail.com
//
// License: GPL, see http://www.gnu.org/licenses/gpl.html
////////////////////////////////////////////////////////////

/**
 * Numbers - A number converter library
 * @package Numbers
 * @author Xavier Ivars i Ribes
 * @email xavi.ivars@gmail.com
 */


if(typeof Numbers == 'undefined') {

	Numbers = function () {

	function toRoman(num) {
		var lookup = {M:1000,CM:900,D:500,CD:400,C:100,XC:90,L:50,XL:40,X:10,IX:9,V:5,IV:4,I:1},
		roman = '', i;

		for ( i in lookup ) {
			while ( num >= lookup[i] ) {
				 roman += i;
				 num -= lookup[i];
			}
		}

		return roman;
	}

	function toArabic(nm) {
		var roman = nm.toUpperCase().split(''),
		lookup = {I:1,V:5,X:10,L:50,C:100,D:500,M:1000},
		num = 0, val = 0;
	
		while (roman.length) {
			val = lookup[roman.shift()];
			num += val * (val < lookup[roman[0]] ? -1:1);
		}
		return num;
	}
	
	function convert(nm) {
		a = parseInt(nm);
		if(isNaN(a)) {
			var	str = nm.toUpperCase(),
			validator = /^M*(?:D?C{0,3}|C[MD])(?:L?X{0,3}|X[CL])(?:V?I{0,3}|I[XV])$/;

			if(str && validator.test(str))
				return toArabic(str);
			else
				return false;
		} else {
			return toRoman(nm);
		}
	}

	function test(arabic,roman) {
		return toArabic(roman)==arabic && toRoman(arabic)==roman;
	}

	return {
		toArabic : toArabic,
		toRoman: toRoman,
		convert: convert,
		test: test
	}

	}();
}
