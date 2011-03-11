<?php

class RomanNumerals {

  protected $additiveNumerals = array(
      1 => "I",
      5 => "V",
      10 => "X",
      50 => "L",
      100 => "C",
      500 => "D",
      1000 => "M"
  );
  protected $substractiveNumerals = array(
      4 => "IV",
      9 => "IX",
      40 => "XL",
      90 => "XC",
      400 => "CD",
      900 => "CM"
  );

  public function integerToRoman($number) {
    $this->validateIntegerInput($number);
    $romanNumber = "";
    $numerals = $this->getNumerals();
    foreach ($numerals as $intValue => $numeral) {
      while ($number >= $intValue) {
        $romanNumber .= $numeral;
        $number -= $intValue;
      }
    }
    return $romanNumber;
  }

  public function romanToInteger($number) {
    $this->validateRomanInput($number);
    $integerNumber = 0;
    $integerNumber += $this->processAdditiveNumerals($number);
    $integerNumber -= $this->processSubstractiveNumerals($number);
    return $integerNumber;
  }

  protected function getNumerals() {
    $numerals = $this->additiveNumerals + $this->substractiveNumerals;
    return $this->orderByDescendingNumerals($numerals);
  }

  protected function orderByDescendingNumerals($numerals) {
    krsort($numerals);
    return $numerals;
  }

  protected function validateIntegerInput($number) {
    if ($number > 3000) {
      throw new Exception("Won't convert integers bigger than 3000");
    }
  }

  protected function validateRomanInput($number) {
    if (strpos($number, "MMM") !== false && strlen($number) > 3) {
      throw new Exception("Won't convert integers bigger than MMM");
    }
  }

  protected function processSubstractiveNumerals($number) {
    $substraction = 0;
    foreach ($this->substractiveNumerals as $numeral) {
      if (strpos($number, $numeral) !== false) {
        $substraction += 2 * array_search($numeral[0], $this->additiveNumerals);
      }
    }
    return $substraction;
  }

  protected function processAdditiveNumerals($number) {
    $sum = 0;
    for ($i = 0, $max = strlen($number); $i < $max; $i++) {
      $sum += array_search($number[$i], $this->additiveNumerals);
    }
    return $sum;
  }

}
