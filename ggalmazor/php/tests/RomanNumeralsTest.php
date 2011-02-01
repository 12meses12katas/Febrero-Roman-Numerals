<?php

require_once '../RomanNumerals.php';

class RomanNumeralsTest extends PHPUnit_Framework_TestCase {

  protected $rn;

  public function setUp() {
    $this->rn = new RomanNumerals();
  }

  public function getToRomanTestCases() {
    return array(
        '1 should return I' => array(1, "I"),
        '2 should return II' => array(2, "II"),
        '3 should return III' => array(3, "III"),
        '4 should return IV' => array(4, "IV"),
        '5 should return V' => array(5, "V"),
        '9 should return IX' => array(9, "IX"),
        '13 should return XIII' => array(13, "XIII"),
        // Fastforward TDD
        '40 should return XL' => array(40, "XL"),
        '60 should return LX' => array(60, "LX"),
        '90 should return XC' => array(90, "XC"),
        '110 should return CX' => array(110, "CX"),
        '400 should return CD' => array(400, "CD"),
        '600 should return DC' => array(600, "DC"),
        '900 should return CM' => array(900, "CM"),
        '1100 should return MC' => array(1100, "MC"),
        // Acceptance test
        '1999 should return MCMXCIX' => array(1999, "MCMXCIX")
    );
  }
  
  public function getToIntegerTestCases() {
    return array(
        'I should return 1' => array("I", 1),
        'II should return 2' => array("II", 2),
        'III should return 3' => array("III", 3),
        'V should return 5' => array("V", 5),
        'IV should return 4' => array("IV", 4),
        'IX should return 9' => array("IX", 9),
        // Acceptance test
        'MCMXCIX should return 1999' => array("MCMXCIX", 1999)
    );
  }

  /**
   * @dataProvider getToRomanTestCases
   */
  public function testIntegerToRomanConversion($number, $expected) {
    $this->assertEquals($expected, $this->rn->integerToRoman($number));
  }
  
  public function testWontConvertIntegersBiggerThan3000() {
    $this->setExpectedException("Exception");
    $this->rn->integerToRoman(3500);
  }
 
  /**
   * @dataProvider getToIntegerTestCases
   */
  public function testRomanToIntegerConversion($number, $expected) {
    $this->assertEquals($expected, $this->rn->romanToInteger($number));
  }
  
  public function testWontConvertRomansBiggerThanMMM() {
    $this->setExpectedException("Exception");
    $this->rn->romanToInteger("MMMI");
  }
  
}