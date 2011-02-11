unit UNum_Test;

interface

Uses
  sysutils,
  TestFramework, TestExtensions, GUITesting;

type

  TNum_Test = class(TGUITestCase)
  private
  protected
  public
  published
    procedure Test_Roman;
    procedure Test_Decimal;
  end;


implementation

uses
  uNum;

type
  TData = record
    roman: string;
    num: integer;
  end;

const
  TestData : array [1..3] of TData = (
                                       (roman: 'I'  ; num: 1),
                                       (roman: 'II' ; num: 2),
                                       (roman: 'III'; num: 3)
                                       );

procedure TNum_Test.Test_Decimal;
begin
  CheckEquals(1, toDec('I'));
end;

procedure TNum_Test.Test_Roman;
begin
  CheckEquals('I',       toRoman(1));
  CheckEquals('II',      toRoman(2));
  CheckEquals('III',     toRoman(3));
  CheckEquals('IV',      toRoman(4));
  CheckEquals('V',       toRoman(5));
  CheckEquals('VI',      toRoman(6));
  CheckEquals('VII',     toRoman(7));
  CheckEquals('VIII',    toRoman(8));
  CheckEquals('IX',      toRoman(9));
  CheckEquals('X',       toRoman(10));
  CheckEquals('XI',      toRoman(11));
  CheckEquals('XII',     toRoman(12));
  CheckEquals('XIII',    toRoman(13));
  CheckEquals('XIV',     toRoman(14));
  CheckEquals('XV',      toRoman(15));
  CheckEquals('XVII',    toRoman(17));
  CheckEquals('XIX',     toRoman(19));
  CheckEquals('XX',      toRoman(20));
  CheckEquals('XXI',     toRoman(21));
  CheckEquals('XXXVI',   toRoman(36));
  CheckEquals('XLI',     toRoman(41));
  CheckEquals('XLVI',    toRoman(46));
  CheckEquals('XLIX',    toRoman(49));
  CheckEquals('L',       toRoman(50));
  CheckEquals('LII',     toRoman(52));
  CheckEquals('LIX',     toRoman(59));
  CheckEquals('LX',      toRoman(60));
  CheckEquals('XCIX',    toRoman(99));
  CheckEquals('C',       toRoman(100));
  CheckEquals('D',       toRoman(500));
  CheckEquals('M',       toRoman(1000));
  CheckEquals('MCMXCIX', toRoman(1999));
  CheckEquals('MMDCCLI', toRoman(2751));
  CheckEquals('MMM',     toRoman(3000));
end;

initialization
  TestFramework.RegisterTest('', TNum_Test.Suite);
end.
