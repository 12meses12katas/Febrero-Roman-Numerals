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

    /**
     * Convert an arabic number to roman.
     *
     * @param int $arabic
     * @return string
     */
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

    /**
     * @param int $value
     * @return array
     */
    protected function getSymbolAndValue($value)
    {
        foreach (self::$equivalences as $roman => $arabic) {
            if ($value >= $arabic) {
                return array($roman, $arabic);
            }
        }
    }

    /**
     * Convert a roman number to arabic.
     *
     * @param string $roman
     * @return int
     */
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

    /**
     *
     * @param string $roman
     * @return int
     */
    protected function getCurrent($roman)
    {
        $currentOne = substr($roman, 0, 1);
        $currentTwo = substr($roman, 0, 2);
        return (isset(self::$equivalences[$currentTwo])) ? $currentTwo : $currentOne;
    }

    /**
     * Recursive solution for arabicToRoman
     *
     * @param string $arabic
     * @return int
     */
    function arabicToRomanRecursive($arabic)
    {
        if ($arabic > 3000) return '';
        if ($arabic <= 0)   return '';

        list ($symbol, $value) = $this->getSymbolAndValue($arabic);

        return $symbol . $this->arabicToRomanRecursive($arabic - $value);
    }

    /**
     * Recursive solution for romanToArabic
     *
     * @param int $roman
     * @return string
     */
    function romanToArabicRecursive($roman)
    {
        if (!$roman) return 0;

        $current    = $this->getCurrent($roman);
        $roman      = substr($roman, strlen($current));

        return self::$equivalences[$current] + $this->romanToArabicRecursive($roman);
    }
}
?>