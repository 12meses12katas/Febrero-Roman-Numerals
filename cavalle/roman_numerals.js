var vows = require("vows"),
    assert = require("assert");

const ROMAN_MAPPINGS = { M:1000, CM:900, D:500, CD:400, C:100, XC:90, L:50, XL:40, X:10, IX:9, V:5, IV:4, I:1 }

Number.prototype.toRoman = function() {
  var str = "", 
      num = this.valueOf();
  
  for (var roman in ROMAN_MAPPINGS) {
    var arabic = ROMAN_MAPPINGS[roman];
    while (num >= arabic) {
      str += roman;
      num -= arabic;
    }
  }

  return str;
}

String.prototype.toArabic = function() {
  var num = 0,
      str = this.valueOf();

  for (var roman in ROMAN_MAPPINGS) {
    var arabic = ROMAN_MAPPINGS[roman];
    while (str.substr(0, roman.length) == roman) {
      num += arabic;
      str = str.substr(roman.length);
    }
  }

  return num;
}

vows.describe("Roman numerals").addBatch({
  "Number.toRoman": {
    "transforms 1 to I": function() { assert.equal(Number(1).toRoman(), "I"); },
    "transforms 2 to II": function() { assert.equal(Number(2).toRoman(), "II"); },
    "transforms 3 to III": function() { assert.equal(Number(3).toRoman(), "III"); },
    "transforms 4 to IV": function() { assert.equal(Number(4).toRoman(), "IV"); },
    "transforms 5 to V": function() { assert.equal(Number(5).toRoman(), "V"); },
    "transforms 6 to VI": function() { assert.equal(Number(6).toRoman(), "VI"); },
    "transforms 7 to VII": function() { assert.equal(Number(7).toRoman(), "VII"); },
    "transforms 8 to VIII": function() { assert.equal(Number(8).toRoman(), "VIII"); },
    "transforms 9 to IX": function() { assert.equal(Number(9).toRoman(), "IX"); },
    "transforms 10 to X": function() { assert.equal(Number(10).toRoman(), "X"); },
    "transforms 11 to XI": function() { assert.equal(Number(11).toRoman(), "XI"); },
    "transforms 39 to XXXIX": function() { assert.equal(Number(39).toRoman(), "XXXIX"); },
    "transforms 49 to XLIX": function() { assert.equal(Number(49).toRoman(), "XLIX"); },
    "transforms 89 to LXXXIX": function() { assert.equal(Number(89).toRoman(), "LXXXIX"); },
    "transforms 399 to CCCXCIX": function() { assert.equal(Number(399).toRoman(), "CCCXCIX"); },
    "transforms 499 to CDXCIX": function() { assert.equal(Number(499).toRoman(), "CDXCIX"); },
    "transforms 899 to DCCCXCIX": function() { assert.equal(Number(899).toRoman(), "DCCCXCIX"); },
    "transforms 999 to CMXCIX": function() { assert.equal(Number(999).toRoman(), "CMXCIX"); },
    "transforms 1999 to MCMXCIX": function() { assert.equal(Number(1999).toRoman(), "MCMXCIX"); }
  },
  "String.toArabic": {
    "transforms I to 1": function() { assert.equal(String("I").toArabic(), 1) },
    "transforms II to 2": function() { assert.equal(String("II").toArabic(), 2) },
    "transforms III to 3": function() { assert.equal(String("III").toArabic(), 3) },
    "transforms MCMXCIX to 1999": function() { assert.equal(String("MCMXCIX").toArabic(), 1999) },
  }
}).run();
