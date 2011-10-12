<?php

require_once 'PHPUnit/Framework.php';

require_once './roman.php';

class RomanTest extends PHPUnit_Framework_TestCase {

  private $sut;

  public function setUp() {
    $this->sut = new Roman;
  }

  private function check ($roman, $arabian) {
    $this->assertEquals($roman, $this->sut->romanOf($arabian));
  }

  public function test_creation () {
    $this->assertTrue($this->sut instanceof Roman);
  }

  public function test_one () {
    $this->check('I', 1);
  }

  public function test_two () {
    $this->check('II', 2);
  }

  public function test_three () {
    $this->check('III', 3);
  }

  public function test_four () {
    $this->check('IV', 4);
  }

  public function test_five() {
    $this->check('V', 5);
  }

  public function test_six () {
    $this->check('VI', 6);
  }

  public function test_seven() {
    $this->check('VII', 7);
  }

  public function test_nine() {
    $this->check('IX', 9);
  }

  public function test_ten(){
    $this->check('X', 10);
  }

  public function test_eleven() {
    $this->check('XI', 11);
  }

  public function test_nineteen() {
    $this->check('XIX', 19);
  }

  public function test_forty() {
    $this->check('XL', 40);
  }

  public function test_fifty_five(){
    $this->check('LV', 55);
  }

  public function test_eighty_eight() {
    $this->check('LXXXVIII', 88);
  }

  public function test_ninety_two(){
    $this->check('XCII', 92);
  }

  public function test_one_hundred_and_twenty_nine() {
    $this->check('CXXIX', 129);
  }

  public function test_four_hundred_and_eighty(){
    $this->check('CDLXXX', 480);
  }

  public function test_eight_hundred() {
    $this->check('DCCC', 800);
  }

  public function test_nine_hundred_and_forty_six(){
    $this->check('CMXLVI', 946);
  }

  public function test_a_thousand_and_twenty_one(){
    $this->check('MXXI', 1021);
  }

  public function test_aceptation () {
    $this->check('MCMXCVIII', 1998);
  }
}

?>
