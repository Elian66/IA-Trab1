% Definição da ação move
can(move(Block, From, To), [clear(Block), clear(To), on(Block, From), size(Block, SizeB), size(To, SizeT), SizeB =< SizeT + 1]) :-
    block(Block), object(To), object(From),
    Block \== To, From \== To, Block \== From.

adds(move(Block, From, To), [on(Block, To), clear(From)]).
deletes(move(Block, From, To), [on(Block, From), clear(To)]).

% Definição de situações impossíveis
impossible(on(X, X), _).
impossible(on(X, Y), Goals) :-
    member(clear(Y), Goals);
    (member(on(X, Y1), Goals), Y1 \== Y);
    (member(on(X1, Y), Goals), X1 \== X).
impossible(clear(X), Goals) :-
    member(on(_, X), Goals).