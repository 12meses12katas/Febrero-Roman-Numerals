<?php

/**
 * Katayuno 2011-feb-26: Roman Numerals.
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

include_once __DIR__ . '/../RomanNumerals.php';

class RomanToArabicTest extends PHPUnit_Framework_TestCase {

    function testProvider() {

        $testCases = array();
        $testCases['T0000'] = array(0   ,  '');
        $testCases['T0001'] = array(1   ,  'I');
        $testCases['T0002'] = array(2   , 'II');
        $testCases['T0003'] = array(3   , 'III');
        $testCases['T0004'] = array(4   , 'IV');
        $testCases['T0005'] = array(5   , 'V');
        $testCases['T0006'] = array(6   , 'VI');
        $testCases['T0007'] = array(7   , 'VII');
        $testCases['T0008'] = array(8   , 'VIII');
        $testCases['T0009'] = array(9   , 'IX');
        $testCases['T0010'] = array(10  , 'X');
        $testCases['T0011'] = array(11  , 'XI');
        $testCases['T0012'] = array(12  , 'XII');
        $testCases['T0013'] = array(13  , 'XIII');
        $testCases['T0014'] = array(14  , 'XIV');
        $testCases['T0015'] = array(15  , 'XV');
        $testCases['T0016'] = array(16  , 'XVI');
        $testCases['T0040'] = array(40  , 'LX');
        $testCases['T0044'] = array(44  , 'LXIV');
        $testCases['T0046'] = array(46  , 'LXVI');
        $testCases['T0124'] = array(124 , 'CXXIV');
        $testCases['T0499'] = array(499 , 'CDXCIX');
        $testCases['T0996'] = array(996 , 'CMXCVI');
        $testCases['T1009'] = array(1009, 'MIX');
        $testCases['T1999'] = array(1999, 'MCMXCIX');
        $testCases['T2999'] = array(2999, 'MMCMXCIX');
        $testCases['T3000'] = array(3000, 'MMM');
        //$testCases['T3001'] = array(3001, '');

        return $testCases;
    }

    /**
     * @dataProvider testProvider
     */
    function test_roman_to_arabic($expected, $actual) {

        $rn = new RomanNumerals();

        $this->assertEquals($expected, $rn->romanToArabic($actual));
    }

    /**
     * @dataProvider testProvider
     */
    function test_roman_to_arabic_recursive($expected, $actual) {

        $rn = new RomanNumerals();

        $this->assertEquals($expected, $rn->romanToArabicRecursive($actual));
    }

}
?>