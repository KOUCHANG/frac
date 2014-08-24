%% @doc 分数を扱うモジュール.
%%
%% 分母の値が変わるときにのみ約分を行う.
%% 符号も調整しない.
-module(frac).

-export([
         from_integer/2,
         reduce/1
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

-type non_zero_integer() :: pos_integer() | neg_integer(). % 0以外の整数

%% @doc 整数で分子, 分母を指定して分数を作る.
-spec from_integer(Numerator::integer(), Denominator::non_zero_integer()) -> fraction().
from_integer(_, 0) ->
    error(badarg);
from_integer(Num, Denom) ->
    #fraction{numerator = Num, denominator = Denom}.

%% @doc 約分.
-spec reduce(fraction()) -> fraction().
reduce(#fraction{numerator = Num, denominator = Denom}) ->
    R = meth:gcd(Num, Denom),
    #fraction{numerator = Num div R, denominator = Denom div R}.
