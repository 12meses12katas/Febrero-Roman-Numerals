-module(roman_numerals_SUITE).
-include_lib("common_test/include/ct.hrl").

%% Test server callbacks
-export([suite/0, all/0,
         init_per_suite/1, end_per_suite/1,
         init_per_testcase/2, end_per_testcase/2]).

%% Export all test cases
-compile([debug_info, export_all]).

suite() ->
  [{timetrap, {minutes, 1}}].

init_per_suite(Config) ->
  Config.

end_per_suite(_Config) ->
  ok.

init_per_testcase(_Case, Config) ->
  Config.

end_per_testcase(_Case, _Config) ->
  ok.

all() ->
  [test_from_integer, test_to_integer].

test_cases() ->
  [{"I", 1},
   {"II", 2},
   {"III", 3},
   {"IV", 4},
   {"V", 5},
   {"VI", 6},
   {"VII", 7},
   {"VIII", 8},
   {"IX", 9},
   {"X", 10},
   {"XX", 20},
   {"XL", 40},
   {"L", 50},
   {"LX", 60},
   {"XC", 90},
   {"XCIX", 99},
   {"C", 100},
   {"CI", 101},
   {"CX", 110},
   {"CXI", 111},
   {"CC", 200},
   {"CD", 400},
   {"D", 500},
   {"CM", 900},
   {"CMXCIX", 999},
   {"M", 1000},
   {"MCXI", 1111},
   {"MCMXC", 1990},
   {"MCMXCIX", 1999},
   {"MMVIII", 2008},
   {"MMM", 3000},
   {"MMMCMXCIX", 3999}].

%% this should be one test each, but I don't want to type all the names
test_from_integer(_Config) ->
  true = lists:all(
    fun({Roman, Arabic}) -> Roman =:= roman_numerals:from_integer(Arabic) end,
    test_cases()),
  ok.

test_to_integer(_Config) ->
  true = lists:all(
    fun({Roman, Arabic}) -> Arabic =:= roman_numerals:to_integer(Roman) end,
    test_cases()),
  ok.
