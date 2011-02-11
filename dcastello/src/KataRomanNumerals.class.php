<?php

/**
 * Description of KataRomanNumerals
 *
 * @author david
 */
class KataRomanNumerals
{

  private $romanNumerals = array();
  const UP_LIMIT = 3000;
  const DOWN_LIMIT = 1;

  public function __construct()
  {
    $romanNumerals = array(
        1 => 'I', 4 => 'IV', 5 => 'V', 9 => 'IX',
        10 => 'X', 40 => 'XL', 50 => 'L', 90 => 'XC',
        100 => 'C', 400 => 'CD', 500 => 'D', 900 => 'CM',
        1000 => 'M'
    );

    $this->setRomanNumerals($romanNumerals);
  }

  public function setRomanNumerals($romanNumerals)
  {
    $this->romanNumerals = $romanNumerals;
    krsort($this->romanNumerals);
  }

  public function getRomanNumerals()
  {
    return $this->romanNumerals;
  }

  public function isValidIntegerNumber($numberNoRoman)
  {
    if ($numberNoRoman >= self::DOWN_LIMIT && $numberNoRoman <= self::UP_LIMIT)
    {
      return true;
    }
    throw new Exception("Please, enter a number between 1 and 3000");
    
  }

  public function integerToRoman($integerToConvert)
  {
    $romanNumberToReturn = "";
    foreach ($this->getRomanNumerals() as $integer => $romanNumeral) {
      while ($integerToConvert >= $integer) {
        $integerToConvert -= $integer;
        $romanNumberToReturn .= $romanNumeral;
      }

      if ($integerToConvert == 0) {
        break;
      }

    }

    return $romanNumberToReturn;
  }
  
}

?>
