-module(format_control_sequences).

-export([f/0]).

f() ->
    io:format("[~f]~n", [3.14]),
    io:format("[~9f]~n", [3.14]),
    io:format("[~-9f]~n", [3.14]),
    io:format("[~*f]~n", [9, 3.14]),
    io:format("[~.f]~n", [3.14]),
    io:format("[~.3f]~n", [3.14]),
    io:format("[~.*f]~n", [3, 3.14]),
    io:format("[~9.f]~n", [3.14]),
    io:format("[~*.f]~n", [9, 3.14]),
    io:format("[~9.3f]~n", [3.14]),
    io:format("[~9.*f]~n", [3, 3.14]),
    io:format("[~*.3f]~n", [9, 3.14]),
    io:format("[~*.*f]~n", [9, 3, 3.14]),
    io:format("[~..0f]~n", [3.14]),
    io:format("[~.3.0f]~n", [3.14]),
    io:format("[~9..0f]~n", [3.14]),
    io:format("[~9.3.0f]~n", [3.14]),
    io:format("[~9.3.0f]~n", [3.14]),
    io:format("[~9.3.*f]~n", [$*, 3.14]),
    io:format("[~kp]~n", [#{z => "apple", a => [199 | "banana"]}]),
    io:format("[~Kp]~n", [reversed, #{z => "apple", a => [199 | "banana"]}]),
    io:format("[~Klp]~n", [reversed, #{z => "apple", a => [199 | "banana"]}]),
    io:format("[~lp]~n", [[199 | "banana"]]),
    io:format("[~-70.3._ts]~n", ["banana"]),

    io:fread("~d"),
    io:fread("~td"),
    io:fread("~10d"),
    io:fread("~10td"),
    io:fread("~*10d"),
    io:fread("~*10td"),
    ok.
