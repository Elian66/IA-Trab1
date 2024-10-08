% Definição dos blocos e lugares
block(a). block(b). block(c). block(d).
place(1). place(2). place(3). place(4). place(5). place(6).

% Definição dos tamanhos
size(a, 1). size(b, 2). size(c, 3). size(d, 4).
size(p([X,Y]), Size) :- 
    size(X, SizeX), size(Y, SizeY), Size is SizeX + SizeY.

% Estados inicial e final
initial_state([clear(3), on(c,p([1,2])), on(b,6), on(a,4), on(d,p([a,b]))]).
goal_state([clear(1), clear(2), clear(3), on(d,p([4,6])), on(c,p([d,d])), on(a,c), on(b,c)]).

object(X) :- block(X); place(X).