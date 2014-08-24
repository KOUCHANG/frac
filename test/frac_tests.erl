%% coding: latin-1
-module(frac_tests).

-include_lib("eunit/include/eunit.hrl").

from_integer_test_() ->
    [
     {"単純な分数の生成", ?_assertEqual({fraction, 3, 2}, frac:from_integer(3, 2))},
     {"分子が負の整数", ?_assertEqual({fraction, -4, 5}, frac:from_integer(-4, 5))},
     {"分母が負の整数", ?_assertEqual({fraction, 6, -7}, frac:from_integer(6, -7))},
     {"分母/分子が負の整数", ?_assertEqual({fraction, -8, -7}, frac:from_integer(-8, -7))},
     {"約分, 符号の調整がされない", ?_assertEqual({fraction, 3, -6}, frac:from_integer(3, -6))},
     {"分母に0を指定したらbadargが返る", ?_assertError(badarg, frac:from_integer(1, 0))}
    ].

reduce_test_() ->
    [
     {"単純な約分", ?_assertEqual(frac:from_integer(4, 5), frac:reduce(frac:from_integer(12, 15)))},
     {"分子が負の整数", ?_assertEqual(frac:from_integer(-3, 4), frac:reduce(frac:from_integer(-6, 8)))},
     {"分母が負の整数", ?_assertEqual(frac:from_integer(7, -5), frac:reduce(frac:from_integer(14, -10)))}
    ].
