% SYNTAX TEST "source.erlang" "A basic test"
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.erlang comment.line.percentage.erlang
-module(basic).
%<- source.erlang meta.directive.module.erlang punctuation.section.directive.begin.erlang
%^^^^^^ source.erlang meta.directive.module.erlang keyword.control.directive.module.erlang
%      ^ source.erlang meta.directive.module.erlang punctuation.definition.parameters.begin.erlang
%       ^^^^^ source.erlang meta.directive.module.erlang entity.name.type.class.module.definition.erlang
%            ^ source.erlang meta.directive.module.erlang punctuation.definition.parameters.end.erlang
%             ^ source.erlang meta.directive.module.erlang punctuation.section.directive.end.erlang
-export([test/0]).
%<- source.erlang meta.directive.export.erlang punctuation.section.directive.begin.erlang
%^^^^^^ source.erlang meta.directive.export.erlang keyword.control.directive.export.erlang
%      ^ source.erlang meta.directive.export.erlang punctuation.definition.parameters.begin.erlang
%       ^ source.erlang meta.directive.export.erlang meta.structure.list.function.erlang punctuation.definition.list.begin.erlang
%        ^^^^ source.erlang meta.directive.export.erlang meta.structure.list.function.erlang entity.name.function.erlang
%            ^ source.erlang meta.directive.export.erlang meta.structure.list.function.erlang punctuation.separator.function-arity.erlang
%             ^ source.erlang meta.directive.export.erlang meta.structure.list.function.erlang constant.numeric.integer.decimal.erlang
%              ^ source.erlang meta.directive.export.erlang meta.structure.list.function.erlang punctuation.definition.list.end.erlang
%               ^ source.erlang meta.directive.export.erlang punctuation.definition.parameters.end.erlang
%                ^ source.erlang meta.directive.export.erlang punctuation.section.directive.end.erlang

test() -> ok.
%<---- source.erlang meta.function.erlang entity.name.function.definition.erlang
%   ^ source.erlang meta.function.erlang meta.expression.parenthesized punctuation.section.expression.begin.erlang
%    ^ source.erlang meta.function.erlang meta.expression.parenthesized punctuation.section.expression.end.erlang
%     ^ source.erlang meta.function.erlang
%      ^ source.erlang meta.function.erlang keyword.operator.symbolic.erlang
%       ^ source.erlang meta.function.erlang keyword.operator.symbolic.erlang
%        ^ source.erlang meta.function.erlang
%         ^^ source.erlang meta.function.erlang constant.other.symbol.unquoted.erlang
%           ^ source.erlang meta.function.erlang punctuation.terminator.function.erlang