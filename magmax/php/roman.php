<?php

class Pair {
  public $roman;
  public $arabian;

  function __construct($roman, $arabian) {
    $this->roman = $roman;
    $this->arabian = $arabian;
  }
}

class Roman {

  private $CONVERSION;

  function __construct () {
    $this->CONVERSION = array ();
    $this->CONVERSION[] = new Pair ('M', 1000);
    $this->CONVERSION[] = new Pair ('CM', 900);
    $this->CONVERSION[] = new Pair ('D', 500);
    $this->CONVERSION[] = new Pair ('CD', 400);
    $this->CONVERSION[] = new Pair ('C', 100);
    $this->CONVERSION[] = new Pair ('XC', 90);
    $this->CONVERSION[] = new Pair ('L', 50);
    $this->CONVERSION[] = new Pair ('XL', 40);
    $this->CONVERSION[] = new Pair ('X', 10);
    $this->CONVERSION[] = new Pair ('IX', 9);
    $this->CONVERSION[] = new Pair ('V',  5);
    $this->CONVERSION[] = new Pair ('IV', 4);
    $this->CONVERSION[] = new Pair ('I',  1);
  }

  public function romanOf ($n) {

    foreach ($this->CONVERSION as $pair)
      {
	if ($n >= $pair->arabian)
	  return $pair->roman . $this->romanOf($n - $pair->arabian);
      }
    return '';
  }
}

?>
