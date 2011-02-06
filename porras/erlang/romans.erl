-module(romans).
-export([arabic_to_roman/1]).
-include_lib("eunit/include/eunit.hrl").

-define(Romans, [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
                 {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"},
                 {5, "V"}, {4, "IV"}, {1, "I"}]).

arabic_to_roman(0) -> "";
arabic_to_roman(Arabic) ->
  [{A, R}|_] = lists:filter(fun({A, _}) -> A =< Arabic end, ?Romans),
  string:concat(R, arabic_to_roman(Arabic - A)).

romans_test_() ->
  [ ?_assert(arabic_to_roman(1) =:= "I"),
    ?_assert(arabic_to_roman(2) =:= "II"),
    ?_assert(arabic_to_roman(3) =:= "III"),
    ?_assert(arabic_to_roman(4) =:= "IV"),
    ?_assert(arabic_to_roman(5) =:= "V"),
    ?_assert(arabic_to_roman(6) =:= "VI"),
    ?_assert(arabic_to_roman(7) =:= "VII"),
    ?_assert(arabic_to_roman(8) =:= "VIII"),
    ?_assert(arabic_to_roman(9) =:= "IX"),
    ?_assert(arabic_to_roman(10) =:= "X"),
    ?_assert(arabic_to_roman(11) =:= "XI"),
    ?_assert(arabic_to_roman(12) =:= "XII"),
    ?_assert(arabic_to_roman(13) =:= "XIII"),
    ?_assert(arabic_to_roman(14) =:= "XIV"),
    ?_assert(arabic_to_roman(15) =:= "XV"),
    ?_assert(arabic_to_roman(16) =:= "XVI"),
    ?_assert(arabic_to_roman(17) =:= "XVII"),
    ?_assert(arabic_to_roman(18) =:= "XVIII"),
    ?_assert(arabic_to_roman(19) =:= "XIX"),
    ?_assert(arabic_to_roman(20) =:= "XX"),
    ?_assert(arabic_to_roman(21) =:= "XXI"),
    ?_assert(arabic_to_roman(39) =:= "XXXIX"),
    ?_assert(arabic_to_roman(40) =:= "XL"),
    ?_assert(arabic_to_roman(41) =:= "XLI"),
    ?_assert(arabic_to_roman(49) =:= "XLIX"),
    ?_assert(arabic_to_roman(50) =:= "L"),
    ?_assert(arabic_to_roman(51) =:= "LI"),
    ?_assert(arabic_to_roman(89) =:= "LXXXIX"), 
    ?_assert(arabic_to_roman(90) =:= "XC"),
    ?_assert(arabic_to_roman(100) =:= "C"),
    ?_assert(arabic_to_roman(400) =:= "CD"),
    ?_assert(arabic_to_roman(500) =:= "D"),
    ?_assert(arabic_to_roman(900) =:= "CM"),
    ?_assert(arabic_to_roman(1000) =:= "M"),
    ?_assert(arabic_to_roman(1492) =:= "MCDXCII"),
    ?_assert(arabic_to_roman(1980) =:= "MCMLXXX"),
    ?_assert(arabic_to_roman(2011) =:= "MMXI")
  ].
  