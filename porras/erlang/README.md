# Erlang implementation of February http://www.12meses12katas.com/

Only the first part is done (arabic to roman). It's my first non-completely-trivial Erlang code so it's far from perfect and actually not very readable. Al least it's short ;)

Tested with Erlang/OTP R13B04

To run the tests:

    $ erlc romans.erl && erl romans -noshell -s romans test -s init stop
    
To play with the methods:

    $ erl
    Erlang R13B04 (erts-5.7.5) [source] [64-bit] [smp:2:2] [rq:2] [async-threads:0] [hipe] [kernel-poll:false]

    Eshell V5.7.5  (abort with ^G)
    1> c(romans).
    {ok,romans}
    2> romans:arabic_to_roman(1127).
    "MCXXVII"

Exit the shell with ^G and then q