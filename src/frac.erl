-module(frac).

-export([
         from_integer/2
        ]).

-export_type([
              fraction/0
             ]).

-record(fraction,
        {
         numerator   :: integer(),
         denominator :: integer()
        }).
-type fraction() :: #fraction{}.

%% @doc 整数で分子, 分母を指定して分数を作る.
-spec from_integer(Numerator::integer(), Denominator::integer()) -> fraction().
from_integer(Num, Denom) ->
    #fraction{numerator = Num, denominator = Denom}.
