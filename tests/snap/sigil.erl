-module(sigil).

-export([f/0, g/0]).

-doc """
     Sigil examples
     """.
-spec f() -> ok.
f() ->
     ~(monkey ~2..0b\n),
    ~b(monkey ~2..0b\n),
    ~B(monkey ~2..0b\n), % verbatim
    ~s(monkey ~2..0b\n),
    ~S(monkey ~2..0b\n), % verbatim

     ~{monkey ~2..0b\n},
    ~b{monkey ~2..0b\n},
    ~B{monkey ~2..0b\n}, % verbatim
    ~s{monkey ~2..0b\n},
    ~S{monkey ~2..0b\n}, % verbatim

     ~[monkey ~2..0b\n],
    ~b[monkey ~2..0b\n],
    ~B[monkey ~2..0b\n], % verbatim
    ~s[monkey ~2..0b\n],
    ~S[monkey ~2..0b\n], % verbatim

     ~<monkey ~2..0b\n>,
    ~b<monkey ~2..0b\n>,
    ~B<monkey ~2..0b\n>, % verbatim
    ~s<monkey ~2..0b\n>,
    ~S<monkey ~2..0b\n>, % verbatim

     ~/monkey ~2..0b\n/,
    ~b/monkey ~2..0b\n/,
    ~B/monkey ~2..0b\n/, % verbatim
    ~s/monkey ~2..0b\n/,
    ~S/monkey ~2..0b\n/, % verbatim

     ~|monkey ~2..0b\n|,
    ~b|monkey ~2..0b\n|,
    ~B|monkey ~2..0b\n|, % verbatim
    ~s|monkey ~2..0b\n|,
    ~S|monkey ~2..0b\n|, % verbatim

     ~'monkey ~2..0b\n',
    ~b'monkey ~2..0b\n',
    ~B'monkey ~2..0b\n', % verbatim
    ~s'monkey ~2..0b\n',
    ~S'monkey ~2..0b\n', % verbatim

      "monkey ~2..0b\n", % '' == '~s'

     ~"monkey ~2..0b\n", % '~' == '~b'
    ~b"monkey ~2..0b\n",
    ~B"monkey ~2..0b\n", % verbatim
    ~s"monkey ~2..0b\n",
    ~S"monkey ~2..0b\n", % verbatim

     ~`monkey ~2..0b\n`,
    ~b`monkey ~2..0b\n`,
    ~B`monkey ~2..0b\n`, % verbatim
    ~s`monkey ~2..0b\n`,
    ~S`monkey ~2..0b\n`, % verbatim

     ~#monkey ~2..0b\n#,
    ~b#monkey ~2..0b\n#,
    ~B#monkey ~2..0b\n#, % verbatim
    ~s#monkey ~2..0b\n#,
    ~S#monkey ~2..0b\n#, % verbatim

    _X = lists:seq(1,3), % just to check is syntax highlight is still ok
    ok.

-spec g() -> ok. % just to check is syntax highlight is still ok
g() ->
    %% verbatim ('' == '~S' for triple-quoted strings)
    """
    monkey ~2..0b\n
    business
    """,

    %% verbatim ('~' == '~B' for triple-quoted strings)
    ~"""
    monkey ~2..0b\n
    business
    """,

    ~b""""
    monkey ~2..0b\n
    """
    business
    """",

    ~B"""""
    monkey ~2..0b\n
    """
    business
    """"",

    ~s""""""
    monkey ~2..0b\n
    """
    business
    """""",

    ~S"""""""
    monkey ~2..0b\n
    """
    business
    """"""",

    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    <<"\"\\µA\""/utf8>> = <<$",$\\,194,181,$A,$">> =
        ~b"""
          "\\µA"
          """ = ~b'"\\µA"' =
        ~B"""
          "\µA"
          """ = ~B<"\µA"> =
        ~"""
          "\µA"
          """ = ~"\"\\µA\"" = ~/"\\µA"/,
    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    [$",$\\,$µ,$A,$"] =
        ~s"""
          "\\µA"
          """ = ~s"\"\\µA\"" = ~s["\\µA"] =
        ~S"""
          "\µA"
          """ = ~S("\µA") =
        """
        "\µA"
        """ = "\"\\µA\"",
    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    ok.

-define(THIS_IS_THE_END, "end").
