:- [world_definition].
:- [actions].
:- [planner].

run_scenario(1, Plan) :-
    initial_state(InitialState),
    goal_state(GoalState),
    plan(InitialState, GoalState, Plan).

display_plan([]).
display_plan([Action|Rest]) :-
    write('Move: '), write(Action), nl,
    display_plan(Rest).

% Exemplo de uso:
% ?- run_scenario(1, Plan), display_plan(Plan).