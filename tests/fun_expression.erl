% SYNTAX TEST "source.erlang" "fun expressions"
-module(fun_expression).

%% Zero arity fun as a *type* stays a function type (erlang-ls/grammar#15).
-type zero_arity_fun() :: fun().
%                         ^^^ source.erlang meta.directive.erlang entity.name.function.erlang

%% vscode_erlang#317: zero arity fun *expression* is a keyword, not a type.
a() -> fun () -> 123 end.
%      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
%                    ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

b() -> fun() -> ok end.
%      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
%                  ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

%% vscode_erlang#316: named fun on one line.
c() -> fun NextIndex () -> NextIndex() end.
%      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
%          ^^^^^^^^^ source.erlang meta.function.erlang meta.expression.fun.erlang entity.name.function.erlang
%                                      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

%% Named fun with the name on its own clause lines.
d() ->
    fun
%   ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
        Loop(0) -> done;
%       ^^^^ source.erlang meta.function.erlang meta.expression.fun.erlang entity.name.function.erlang
        Loop(N) -> Loop(N - 1)
%       ^^^^ source.erlang meta.function.erlang meta.expression.fun.erlang entity.name.function.erlang
%                  ^^^^ source.erlang meta.function.erlang meta.expression.fun.erlang meta.function-call.erlang variable.other.erlang
    end.
%   ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

%% vscode_erlang#316 guard: the rest of the file keeps its highlighting.
-spec tail_guard(integer()) -> integer().
%^^^^ source.erlang meta.directive.erlang keyword.control.directive.erlang
%     ^^^^^^^^^^ source.erlang meta.directive.erlang meta.function-call.erlang entity.name.function.erlang
tail_guard(X) -> X.
%<---------- source.erlang meta.function.erlang entity.name.function.definition.erlang

%% Implicit fun with the arity on a later line stops at the `/`, it does not
%% wait for an `end` that never comes.
e() ->
    fun tail_guard
%   ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
        /1.
%       ^ source.erlang meta.function.erlang meta.expression.fun.erlang punctuation.separator.function-arity.erlang
%        ^ source.erlang meta.function.erlang constant.numeric.integer.decimal.erlang

f() -> ok.
%<- source.erlang meta.function.erlang entity.name.function.definition.erlang

%% The function type rule only applies where types are written, so these zero
%% arity fun expressions stay expressions.
g() -> fun() when true -> ok end.
%      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
%                            ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

h() -> fun ((X)) -> X end.
%      ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.fun.erlang
%                     ^^^ source.erlang meta.function.erlang meta.expression.fun.erlang keyword.control.end.erlang

-define(ANONYMOUS, fun() -> ok end).
%                  ^^^ source.erlang meta.directive.define.erlang meta.expression.fun.erlang keyword.control.fun.erlang

%% Fun types keep their type scope wherever a type can be written.
-type nested_fun() :: [fun(() -> ok)].
%                      ^^^ source.erlang meta.directive.erlang meta.type.erlang meta.structure.list.erlang entity.name.function.erlang

-record(r, {f :: fun()}).
%                ^^^ source.erlang meta.directive.record.erlang meta.structure.record.erlang meta.type.erlang entity.name.function.erlang

-callback cb() -> fun((a) -> b).
%                 ^^^ source.erlang meta.directive.erlang meta.type.erlang entity.name.function.erlang
