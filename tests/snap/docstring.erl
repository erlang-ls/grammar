-module(docstring).
-moduledoc """
Triple quoted strings examples
""".

-export([f1/0, f2/0, f3/0, f4/0, f5/0,
         g1/0, g2/0, g3/0, g4/0, g5/0]).

%% -doc attributes without parentheses

-doc """
     Docstring examples
     """.
f1() ->
    """
  Line "1"
  Line "2"
  """ = "Line \"1\"
Line \"2\"",
    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    """
      First line starting with two spaces
    Not escaped: "\t \r \xFF" and """

    """ = "  First line starting with two spaces
Not escaped: \"\\t \\r \\xFF\" and \"\"\"
",
    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    """""
""""
previous line is not a closing delimiter because opening-closing delimiter have five double quote characters
""""" = "\"\"\"\"",
    X = lists:seq(1,3), % just to check is syntax highlight is still ok

    ok.

-doc ~s"""""
      Hello\n
      """"".
f2() -> ok.

-doc "Hello\n".
f3() -> ok.

-doc ~s"Hello\n".
f4() -> ok.

-doc <<"Hello\n"/utf8>>.
f5() -> ok.

%% -doc attributes with parentheses

-doc("""
     Hello\n
     """).
g1() -> ok.

-doc(~B"""""
      Hello\n
      """"").
g2() -> ok.

-doc("Hello\n").
g3() -> ok.

-doc(~B"Hello\n").
g4() -> ok.

-doc(<<"Hello\n"/utf8>>).
g5() -> ok.

-define(THIS_IS_THE_END, "end"). % just to check is syntax highlight is still ok
