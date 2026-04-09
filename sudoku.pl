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
    transpose(Rows, Cols),
    maplist(all_distinct, Cols),

    append(Rows, Vars),
    labeling([], Vars),

    maplist(printRow, Rows).


printRow([]) :-
    nl.
printRow([H|T]) :-
    write('|'),
    write(H),
    printRow(T).
