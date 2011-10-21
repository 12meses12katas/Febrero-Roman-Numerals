assert = require("assert");

Number.prototype.toRoman = (function () {
  var nmap = {
    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1
  };

  var toRomanR = function toRomanR(num) {
    for (var a in nmap) {
      if (nmap[a] <= num) {
        return a + toRomanR(num - nmap[a]);
      }
    }
    return '';
  }

  return function toRoman() {
    return toRomanR(this);
  };
}());

String.prototype.toArabic = (function () {
  var nmap = {
    M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1
  };

  var toArabicR = function toArabicR(str) {
    for (var a in nmap){
      if (str.substr(0, a.length) === a) {
        return nmap[a] + toArabicR(str.slice(a.length));
      }
    }
    return 0;
  }

  return function toArabic() {
    return toArabicR(this);
  };
}());


assert.equal(Number(0).toRoman(),"");
assert.equal(Number(1).toRoman(),"I");
assert.equal(Number(20).toRoman(),"XX");
assert.equal(Number(34).toRoman(),"XXXIV");
assert.equal(Number(99).toRoman(),"XCIX");
assert.equal(Number(999).toRoman(),"CMXCIX");
assert.equal(Number(2000).toRoman(),"MM");
assert.equal(Number(2999).toRoman(),"MMCMXCIX");
assert.equal(Number(12000).toRoman(),"MMMMMMMMMMMM");

assert.equal("".toArabic(),0);
assert.equal("I".toArabic(),1);
assert.equal("XX".toArabic(),20);
assert.equal("XXXIV".toArabic(),34);
assert.equal("XCIX".toArabic(),99);
assert.equal("CMXCIX".toArabic(),999);
assert.equal("MM".toArabic(),2000);
assert.equal("MMCMXCIX".toArabic(),2999);
assert.equal("MMMMMMMMMMMM".toArabic(),12000);
