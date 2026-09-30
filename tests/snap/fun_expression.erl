-module(fun_expression).

-type zero_arity_fun() :: fun().
-type unary_fun() :: fun((term()) -> ok).
-type nested_fun() :: [fun(() -> ok)] | {fun(), integer()}.

-record(r, {f = fun() -> ok end :: fun(), g :: fun((a) -> b)}).

-callback cb() -> fun((a) -> b).

-define(ANONYMOUS, fun() -> ok end).

-spec a() -> fun(() -> integer()).
a() -> fun () -> 123 end.

b() -> fun() -> ok end.

c(AllGens) ->
    GetNextIndex = fun NextIndex () ->
        case get(k) of
            undefined -> NextIndex();
            N -> N
        end
    end,
    D = fun Loop(0) -> done; Loop(N) -> Loop(N - 1) end,
    {GetNextIndex, D, lists:nth(1, AllGens)}.

e() ->
    fun
        Loop(0) -> done;
        Loop(N) -> Loop(N - 1)
    end.

%% Zero arity fun expressions the "function type" rule used to swallow.
g() -> fun() when true -> ok end.

h() -> fun() % comment
    -> ok end.

i() -> fun ((X)) -> X end.

%% Implicit fun with the arity on a later line.
j() ->
    fun plus_one
        /1.

f(L) ->
    lists:map(fun plus_one/1, L),
    lists:map(fun ?MODULE:plus_one/1, L),
    lists:map(fun erlang:abs/1, L).

-spec d(integer()) -> integer().
d(X) -> X.
