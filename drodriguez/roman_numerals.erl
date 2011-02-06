-module(roman_numerals).
-export([from_integer/1, to_integer/1]).

-compile([debug_info]).



from_integer(Integer) ->
  from_integer(lists:reverse(split_in_digits(Integer)), 1).

from_integer([Digit], Unit) ->
  to_roman_char(Digit, roman_chars(Unit));
from_integer([Digit | Digits], Unit) ->
  from_integer(Digits, Unit * 10) ++ from_integer([Digit], Unit).



to_integer(Roman) ->
  to_integer(Roman, 1000, 0).

to_integer([], _Unit, Acc) ->
  Acc;
to_integer(Roman, Unit, Acc) ->
  RomanChars = roman_chars(Unit),
  Digit = find(fun(Digit) ->
                 lists:prefix(to_roman_char(Digit, RomanChars), Roman)
               end,
               [8, 7, 3, 9, 4, 6, 2, 5, 1]), % sorted by longest prefix length
  case is_integer(Digit) of
    true ->
      {_, Rest} = lists:split(length(to_roman_char(Digit, RomanChars)), Roman),
      to_integer(Rest, Unit div 10, Acc + Digit * Unit);
    false ->
      to_integer(Roman, Unit div 10, Acc)
  end.



%%% Private fuctions
to_roman_char(Digit, [UnitChar, FiveChar, NextUnitChar]) ->
  case Digit of
    0 -> "";
    1 -> [UnitChar];
    2 -> [UnitChar, UnitChar | []];
    3 -> [UnitChar, UnitChar, UnitChar | []];
    4 -> [UnitChar, FiveChar | []];
    5 -> [FiveChar | []];
    6 -> [FiveChar, UnitChar | []];
    7 -> [FiveChar, UnitChar, UnitChar | []];
    8 -> [FiveChar, UnitChar, UnitChar, UnitChar | []];
    9 -> [UnitChar, NextUnitChar | []]
  end.

roman_chars(1) ->
  [$I, $V, $X];
roman_chars(10) ->
  [$X, $L, $C];
roman_chars(100) ->
  [$C, $D, $M];
roman_chars(1000) ->
  [$M, undefined, undefined].


split_in_digits(Integer) ->
  split_in_digits(Integer, []).
split_in_digits(0, Acc) ->
  Acc;
split_in_digits(Integer, Acc) ->
  split_in_digits(Integer div 10, [Integer rem 10 | Acc]).

find(_Fun, []) ->
  undefined;
find(Fun, [X | Xs]) ->
  case Fun(X) of
    true -> X;
    false -> find(Fun, Xs)
  end.
