:- use_module(library(clpfd)).

assign_vals(Row) :-
    Row ins 1..4.

sudoku(Rows) :-
    Rows = [[A1,A2,A3,A4],
            [B1,B2,B3,B4],
            [C1,C2,C3,C4],
            [D1,D2,D3,D4]],
    
    maplist(assign_vals, Rows),

    maplist(all_distinct, Rows),

    all_distinct([A1,B1,C1,D1]),
    all_distinct([A2,B2,C2,D2]),
    all_distinct([A3,B3,C3,D3]),
    all_distinct([A4,B4,C4,D4]),

    append(Rows, Vars),
    labeling([], Vars),

    maplist(printRow, Rows).


printRow([]) :-
    nl.
printRow([H|T]) :-
    write('|'),
    write(H),
    printRow(T).
