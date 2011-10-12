assert = require "assert"
vows   = require "vows"

String.ROMAN_MAPPINGS = { M: 1000, CM: 900, D: 500, CD: 400, C:100, XC:90, L:50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }  

String.prototype.toArabic = -> 
  return 0 if this.length == 0
  for roman, arabic of String.ROMAN_MAPPINGS
    return arabic + this.substr(roman.length).toArabic() if this.substr(0,roman.length) == roman

vows.describe("Roman Numerals").addBatch(
  'Transforms 1 to I': -> assert.equal "I".toArabic(), 1
  'Transforms 2 to II': -> assert.equal "II".toArabic(), 2
  'Transforms 3 to III': -> assert.equal "III".toArabic(), 3
  'Transfroms 4 to IV': -> assert.equal "IV".toArabic(), 4
  'Transforms 5 to V': -> assert.equal "V".toArabic(), 5
  'Transforms 6 to VI': -> assert.equal "VI".toArabic(), 6
  'Transforms 7 to VII': -> assert.equal "VII".toArabic(), 7
  'Transforms 8 to VIII': -> assert.equal "VIII".toArabic(), 8
  'Transforms 9 to IX': -> assert.equal "IX".toArabic(), 9
  'Transforms 10 to X': -> assert.equal "X".toArabic(), 10
  'Transforms 11 to XI': -> assert.equal "XI".toArabic(), 11
  'Transforms 14 to XIV': -> assert.equal "XIV".toArabic(), 14
  'Transforms 39 to XXXIX': -> assert.equal "XXXIX".toArabic(), 39
  'Transforms 49 to XLIX': -> assert.equal "XLIX".toArabic(), 49
  'Transforms 89 to LXXXIX': -> assert.equal "LXXXIX".toArabic(), 89
  'Transforms 99 to XCIX': -> assert.equal "XCIX".toArabic(), 99
  'Transforms 499 to CDXCIX': -> assert.equal "CDXCIX".toArabic(), 499
  'Transforms 899 to DCCCXCIX': -> assert.equal "DCCCXCIX".toArabic(), 899
  'Transforms 999 to CMXCIX': -> assert.equal "CMXCIX".toArabic(), 999
  'Transforms 1999 to MCMXCIX': -> assert.equal "MCMXCIX".toArabic(), 1999
).run()
