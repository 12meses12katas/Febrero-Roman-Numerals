-module(romans).
-export([arabic_to_roman/1, roman_to_arabic/1]).
-include_lib("eunit/include/eunit.hrl").

-define(Romans, [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"}, {50, "L"},
                 {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}]).

arabic_to_roman(0) -> "";
arabic_to_roman(Arabic) ->
  [{A, R}|_] = lists:filter(fun({A, _}) -> A =< Arabic end, ?Romans),
  string:concat(R, arabic_to_roman(Arabic - A)).

roman_to_arabic("") -> 0;
roman_to_arabic(Roman) ->
  [{A, R}|_] = lists:filter(fun({_, R}) -> ends_with(Roman, R) end, lists:reverse(?Romans)),
  A + roman_to_arabic(without_tail(Roman, R)).
  
ends_with(String, Tail) ->
  case re:run(String, string:concat(Tail, "$")) of
    {match, _} -> true;
    nomatch -> false
  end.

without_tail(String, Tail) -> re:replace(String, string:concat(Tail, "$"), "", [{return, list}]).
  
-define(TestCases, [{1, "I"}, {2, "II"}, {3, "III"}, {4, "IV"}, {5, "V"}, {6, "VI"}, {7, "VII"}, {8, "VIII"},
                    {9, "IX"}, {10, "X"}, {11, "XI"}, {12, "XII"}, {13, "XIII"}, {14, "XIV"}, {15, "XV"},
                    {16, "XVI"}, {17, "XVII"}, {18, "XVIII"}, {19, "XIX"}, {20, "XX"}, {21, "XXI"},
                    {39, "XXXIX"}, {40, "XL"}, {41, "XLI"}, {49, "XLIX"}, {50, "L"}, {51, "LI"}, {89, "LXXXIX"},
                    {90, "XC"}, {100, "C"}, {400, "CD"}, {500, "D"}, {900, "CM"}, {1000, "M"}, {1492, "MCDXCII"},
                    {1980, "MCMLXXX"}, {2011, "MMXI"}].
                    
arabic_to_roman_test_() ->
  lists:map(fun({A, R}) -> ?_assert(arabic_to_roman(A) =:= R) end, ?TestCases).
roman_to_arabic_test_() ->
  lists:map(fun({A, R}) -> ?_assert(roman_to_arabic(R) =:= A) end, ?TestCases).