% Planejador principal
plan(State, Goals, []) :-
    satisfied(State, Goals).
plan(State, Goals, Plan) :-
    append(PrePlan, [Action], Plan),
    select(State, Goals, Goal),
    achieves(Action, Goal),
    can(Action, Preconditions),
    preserves(Action, Goals),
    regress(Goals, Action, RegressedGoals),
    plan(State, RegressedGoals, PrePlan).

% Funções auxiliares
satisfied(_, []).
satisfied(State, [Goal|Goals]) :-
    holds(Goal, State),
    satisfied(State, Goals).

holds(clear(X), State) :- member(clear(X), State).
holds(on(X, Y), State) :- member(on(X, Y), State).
holds(size(X, S), _) :- size(X, S).
holds(different(X, Y), _) :- X \== Y.

select(State, Goals, Goal) :-
    member(Goal, Goals),
    \+ holds(Goal, State).

achieves(Action, Goal) :-
    adds(Action, AddList),
    member(Goal, AddList).

preserves(Action, Goals) :-
    deletes(Action, DeleteList),
    \+ (member(Goal, DeleteList), member(Goal, Goals)).

regress(Goals, Action, RegressedGoals) :-
    adds(Action, AddList),
    delete_all(Goals, AddList, RestGoals),
    can(Action, Preconditions),
    append(Preconditions, RestGoals, RegressedGoals).

delete_all([], _, []).
delete_all([X|Tail], L2, Result) :-
    member(X, L2), !,
    delete_all(Tail, L2, Result).
delete_all([X|Tail], L2, [X|Result]) :-
    delete_all(Tail, L2, Result).