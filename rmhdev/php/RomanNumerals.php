<?php

/**
 * Katayuno 2011-feb-26: Roman Numerals
 *
 * Kata trying to resolve the Roman Numerals problem using TDD.
 * It's been my first attempt on TDD, so most of the code is
 * from "programania"
 *
 * LICENSE: MIT license
 *
 * @category   Katayuno
 * @author     Rober Martín "rmhdev"
 * @author     Luis Artola "programania"
 * @license    MIT License
 * @version    0.1
 * @link       http://github.com/12meses12katas/Febrero-Roman-Numerals
 */

class RomanNumerals {

    static $equivalences = array(
        'M'     => 1000,
        'CM'    => 900,
        'D'     => 500,
        'CD'    => 400,
        'C'     => 100,
        'XC'    => 90,
        'L'     => 50,
        'LX'    => 40,
        'X'     => 10,
        'IX'    => 9,
        'V'     => 5,
        'IV'    => 4,
        'I'     => 1,
    );

    function arabicToRoman($arabic)
    {
        if ($arabic > 3000) return '';
        $roman = '';
        while ($arabic > 0) {
            list ($symbol, $value) = $this->getSymbolAndValue($arabic);
            $roman  .= $symbol;
            $arabic -= $value;
        }

        return $roman;
    }

    protected function getSymbolAndValue($value)
    {
        foreach (self::$equivalences as $roman => $arabic) {
            if ($value >= $arabic) {
                return array($roman, $arabic);
            }
        }
    }

    function romanToArabic($roman)
    {
        $arabic = 0;
        while (strlen($roman) > 0) {
            $current = $this->getCurrent($roman);
            $roman = substr($roman, strlen($current));
            $arabic = $arabic + self::$equivalences[$current];
        }

        return $arabic;
    }

    protected function getCurrent($roman)
    {
        $currentOne = substr($roman, 0, 1);
        $currentTwo = substr($roman, 0, 2);
        return (isset(self::$equivalences[$currentTwo])) ? $currentTwo : $currentOne;
    }

}
?>