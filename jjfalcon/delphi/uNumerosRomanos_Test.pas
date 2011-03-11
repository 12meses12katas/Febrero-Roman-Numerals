unit uNumerosRomanos_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting;

type

  Test_RomanToArabic = class(TGUITestCase)
  private
  protected
  public
  published
    procedure CasosCorrectos;
    procedure CasosIncorrectos;
  end;

  Test_ArabicToRoman = class(TGUITestCase)
  private
  protected
  public
  published
    procedure CasosCorrectos;
    procedure CasosIncorrectos;
  end;

implementation

uses
  uNumerosRomanos;

const
  INCORRECTO = -1;
  INDEFINIDO = '';

procedure Test_ArabicToRoman.CasosIncorrectos;
begin
  CheckEquals(INDEFINIDO, ArabicToRoman(4000));
  CheckEquals(INDEFINIDO, ArabicToRoman(0));
  CheckEquals(INDEFINIDO, ArabicToRoman(-2));
end;

procedure Test_ArabicToRoman.CasosCorrectos;
begin
  CheckEquals('I',        ArabicToRoman(1));
  CheckEquals('II',       ArabicToRoman(2));
  CheckEquals('III',      ArabicToRoman(3));
  CheckEquals('IV',       ArabicToRoman(4));
  CheckEquals('V',        ArabicToRoman(5));
  CheckEquals('VI',       ArabicToRoman(6));
  CheckEquals('VII',      ArabicToRoman(7));
  CheckEquals('VIII',     ArabicToRoman(8));
  CheckEquals('IX',       ArabicToRoman(9));
  CheckEquals('X',        ArabicToRoman(10));
  CheckEquals('XI',       ArabicToRoman(11));
  CheckEquals('XII',      ArabicToRoman(12));
  CheckEquals('XIII',     ArabicToRoman(13));
  CheckEquals('XIV',      ArabicToRoman(14));
  CheckEquals('XV',       ArabicToRoman(15));
  CheckEquals('XVII',     ArabicToRoman(17));
  CheckEquals('XIX',      ArabicToRoman(19));
  CheckEquals('XX',       ArabicToRoman(20));
  CheckEquals('XXI',      ArabicToRoman(21));
  CheckEquals('XXXVI',    ArabicToRoman(36));
  CheckEquals('XLI',      ArabicToRoman(41));
  CheckEquals('XLVI',     ArabicToRoman(46));
  CheckEquals('XLIX',     ArabicToRoman(49));
  CheckEquals('L',        ArabicToRoman(50));
  CheckEquals('LII',      ArabicToRoman(52));
  CheckEquals('LIX',      ArabicToRoman(59));
  CheckEquals('LX',       ArabicToRoman(60));
  CheckEquals('XCIX',     ArabicToRoman(99));
  CheckEquals('C',        ArabicToRoman(100));
  CheckEquals('D',        ArabicToRoman(500));
  CheckEquals('M',        ArabicToRoman(1000));
  CheckEquals('MCMXCIX',  ArabicToRoman(1999));
  CheckEquals('MMDCCLI',  ArabicToRoman(2751));
  CheckEquals('MMM',      ArabicToRoman(3000));
  CheckEquals('MMMCMXCIX',ArabicToRoman(3999));
end;

procedure Test_RomanToArabic.CasosCorrectos;
begin
  CheckEquals(   1, RomanToArabic('I'));
  CheckEquals(   2, RomanToArabic('II'));
  CheckEquals(   3, RomanToArabic('III'));
  CheckEquals(   4,  RomanToArabic('IV'));
  CheckEquals(   5, RomanToArabic('V'));
  CheckEquals(   9,  RomanToArabic('IX'));
  CheckEquals(  10, RomanToArabic('X'));
  CheckEquals(  20, RomanToArabic('XX'));
  CheckEquals(  30, RomanToArabic('XXX'));
  CheckEquals(  40, RomanToArabic('XL'));
  CheckEquals(  50, RomanToArabic('L'));
  CheckEquals( 100, RomanToArabic('C'));
  CheckEquals( 200, RomanToArabic('CC'));
  CheckEquals( 300, RomanToArabic('CCC'));
  CheckEquals( 400, RomanToArabic('CD'));
  CheckEquals( 500, RomanToArabic('D'));
  CheckEquals(1000, RomanToArabic('M'));
  CheckEquals(2000, RomanToArabic('MM'));
  CheckEquals(3000, RomanToArabic('MMM'));
end;

procedure Test_RomanToArabic.CasosIncorrectos;
begin
  CheckEquals(INCORRECTO, RomanToArabic('i'));
  CheckEquals(INCORRECTO, RomanToArabic('A'));
  CheckEquals(INCORRECTO, RomanToArabic('S'));

  CheckEquals(INCORRECTO, RomanToArabic('IVI'));
  CheckEquals(INCORRECTO, RomanToArabic('VIV'));
  CheckEquals(INCORRECTO, RomanToArabic('LXL'));
  CheckEquals(INCORRECTO, RomanToArabic('DXD'));

  CheckEquals(INCORRECTO, RomanToArabic('IIII'));
  CheckEquals(INCORRECTO, RomanToArabic('XXXX'));
  CheckEquals(INCORRECTO, RomanToArabic('CCCC'));
  CheckEquals(INCORRECTO, RomanToArabic('MMMM'));

  CheckEquals(INCORRECTO, RomanToArabic('VV'));
  CheckEquals(INCORRECTO, RomanToArabic('LL'));
  CheckEquals(INCORRECTO, RomanToArabic('DD'));

  CheckEquals(INCORRECTO, RomanToArabic('IL'));
  CheckEquals(INCORRECTO, RomanToArabic('IC'));
  CheckEquals(INCORRECTO, RomanToArabic('IM'));

  CheckEquals(INCORRECTO, RomanToArabic('IIV'));
  CheckEquals(INCORRECTO, RomanToArabic('VX'));
end;

initialization
  TestFramework.RegisterTest('', Test_RomanToArabic.Suite);
  TestFramework.RegisterTest('', Test_ArabicToRoman.Suite);
end.
