% SYNTAX TEST "source.erlang" "doc attributes with malformed Markdown"
-module(doc_markdown).

%% An unclosed code fence in a doc attribute must not leak past the closing
%% triple quotes and turn the rest of the module into Markdown.
-doc """
Unclosed code fence:
```erlang
%<--- source.erlang meta.directive.doc.erlang meta.embedded.block.markdown markup.fenced_code.block.markdown
foo() -> ok.
""".
%<--- source.erlang meta.directive.doc.erlang comment.block.documentation.erlang punctuation.definition.string.end.erlang
f() -> ok.
%<- source.erlang meta.function.erlang entity.name.function.definition.erlang

-moduledoc """
~~~
""".
%<--- source.erlang meta.directive.doc.erlang comment.block.documentation.erlang punctuation.definition.string.end.erlang
g() -> ok.
%<- source.erlang meta.function.erlang entity.name.function.definition.erlang
