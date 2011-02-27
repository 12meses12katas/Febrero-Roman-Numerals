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

include_once __DIR__.'/../RomanNumerals.php';

class ArabicToRoman extends PHPUnit_Framework_TestCase{

    function testProvider(){

        $testCases = array();
        $testCases['T0000'] = array(''          , 0);
        $testCases['T0001'] = array('I'         , 1);
        $testCases['T0002'] = array('II'        , 2);
        $testCases['T0003'] = array('III'       , 3);
        $testCases['T0004'] = array('IV'        , 4);
        $testCases['T0005'] = array('V'         , 5);
        $testCases['T0006'] = array('VI'        , 6);
        $testCases['T0007'] = array('VII'       , 7);
        $testCases['T0008'] = array('VIII'      , 8);
        $testCases['T0009'] = array('IX'        , 9);
        $testCases['T0010'] = array('X'         , 10);
        $testCases['T0011'] = array('XI'        , 11);
        $testCases['T0012'] = array('XII'       , 12);
        $testCases['T0013'] = array('XIII'      , 13);
        $testCases['T0014'] = array('XIV'       , 14);
        $testCases['T0015'] = array('XV'        , 15);
        $testCases['T0016'] = array('XVI'       , 16);
        $testCases['T0040'] = array('LX'        , 40);
        $testCases['T0044'] = array('LXIV'      , 44);
        $testCases['T0046'] = array('LXVI'      , 46);
        $testCases['T0124'] = array('CXXIV'     , 124);
        $testCases['T0499'] = array('CDXCIX'    , 499);
        $testCases['T0996'] = array('CMXCVI'    , 996);
        $testCases['T1009'] = array('MIX'       , 1009);
        $testCases['T1999'] = array('MCMXCIX'   , 1999);
        $testCases['T2999'] = array('MMCMXCIX'  , 2999);
        $testCases['T3000'] = array('MMM'       , 3000);
        $testCases['T3001'] = array(''          , 3001);

        return $testCases;
    }

    /**
     * @dataProvider testProvider
     */
    function test_arabic_to_roman($expected, $actual){

        $rn = new RomanNumerals();

        $this->assertEquals( $expected, $rn->arabicToRoman($actual) );
    }
}

?>