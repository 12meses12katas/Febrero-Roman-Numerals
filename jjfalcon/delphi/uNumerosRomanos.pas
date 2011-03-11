unit uNumerosRomanos;

interface

function ArabicToRoman(n: integer): string;
function RomanToArabic(const romanNumber : string): integer;

implementation

function RomanToArabic(const romanNumber : string): integer;
const
  INCORRECTO = -1;
  romanChars = 'IVXLCDMvxlcdm?!#' ;
  decades : array [0..8] of integer = (0, 1, 10, 100, 1000, 10000, 100000, 1000000, 10000000) ;
  OneFive : array [boolean] of byte = (1, 5) ;
var
  newValue, oldValue : integer ;
  cIdx, P : byte ;
begin
  result := 0;
  oldValue := 0 ;
  for cIdx := Length(romanNumber) downto 1 do
  begin
    P := Succ(Pos(romanNumber[cIdx], romanChars)) ;
    newValue := OneFive[Odd(P)] * decades[P div 2] ;
    if newValue = 0 then
    begin
      result := INCORRECTO;
      Exit;
    end ;
    if newValue < oldValue then newValue := - newValue ;
    Inc(result, newValue) ;
    oldValue := newValue
  end ;

  if ArabicToRoman(Result) <> romanNumber then Result := INCORRECTO;
end;

function _ArabicToRoman(n: integer): string;
begin
  if      (n >  3999) then result := ''
  else if (n >= 1000) then result := 'M'  + ArabicToRoman(n-1000)
  else if (n >= 900)  then result := 'CM' + ArabicToRoman(n-900)
  else if (n >= 500)  then result := 'D'  + ArabicToRoman(n-500)
  else if (n >= 400)  then result := 'CD' + ArabicToRoman(n-400)
  else if (n >= 100)  then result := 'C'  + ArabicToRoman(n-100)
  else if (n >= 90)   then result := 'XC' + ArabicToRoman(n-90)
  else if (n >= 50)   then result := 'L'  + ArabicToRoman(n-50)
  else if (n >= 40)   then result := 'XL' + ArabicToRoman(n-40)
  else if (n >= 10)   then result := 'X'  + ArabicToRoman(n-10)
  else if (n >= 9)    then result := 'IX' + ArabicToRoman(n-9)
  else if (n >= 5)    then result := 'V'  + ArabicToRoman(n-5)
  else if (n >= 4)    then result := 'IV' + ArabicToRoman(n-4)
  else if (n >= 1)    then result := 'I'  + ArabicToRoman(n-1)
  else Result := '';
end;

function ArabicToRoman(n: integer): String;
const
  Arabics: Array[1..13] of Integer = (1,4,5,9,10,40,50,90,100,400,500,900,1000) ;
  Romans: Array[1..13] of String = ('I','IV','V','IX','X','XL','L','XC','C','CD','D','CM','M') ;
var
   j: Integer;
begin
  Result := '';
  if (n>3999) or (n<1) then exit;

  for j := 13 downto 1 do
  while (n >= Arabics[j]) do begin
   n := n - Arabics[j];
   Result := Result + Romans[j];
  end;
end;

end.
