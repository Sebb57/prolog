:- use_module(library(clpfd)).

make_num_matrix(N, Rows) :-
    length(Rows, N),
    maplist(same_length_(N), Rows).

same_length_(N, Row) :-
    length(Row, N).

sudoku(Rows) :-
    length(Rows, N),
    make_num_matrix(N, Rows),
    append(Rows, Vars),
    Vars ins 1..N,    

    maplist(all_distinct, Rows),
    transpose(Rows, Cols),
    maplist(all_distinct, Cols),

    labeling([], Vars),

    maplist(printRow, Rows).


printRow([]) :-
    nl.
printRow([H|T]) :-
    write('|'),
    write(H),
    printRow(T).
