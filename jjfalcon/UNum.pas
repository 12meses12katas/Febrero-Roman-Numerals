unit UNum;

interface

uses
  windows;


function toRoman(n: integer): string;
function toDec(r: string): integer;

implementation

function toDec(r: string): integer;
begin
  Result := 1;
end;

function toRoman(n: integer): string;
begin
  if      (n >= 1000) then result := 'M'  + toRoman(n-1000)
  else if (n >= 900)  then result := 'CM' + toRoman(n-900)
  else if (n >= 500)  then result := 'D'  + toRoman(n-500)
  else if (n >= 400)  then result := 'CD' + toRoman(n-400)
  else if (n >= 100)  then result := 'C'  + toRoman(n-100)
  else if (n >= 90)   then result := 'XC' + toRoman(n-90)
  else if (n >= 50)   then result := 'L'  + toRoman(n-50)
  else if (n >= 40)   then result := 'XL' + toRoman(n-40)
  else if (n >= 10)   then result := 'X'  + toRoman(n-10)
  else if (n >= 9)    then result := 'IX' + toRoman(n-9)
  else if (n >= 5)    then result := 'V'  + toRoman(n-5)
  else if (n >= 4)    then result := 'IV' + toRoman(n-4)
  else if (n >= 1)    then result := 'I'  + toRoman(n-1)
  else Result := '';
end;

end.
