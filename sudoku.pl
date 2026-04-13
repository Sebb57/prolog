:- use_module(library(clpfd)).

check_grid(N) :-
    between(1, inf, N),
    S is floor(sqrt(N)),
    N is S * S.

make_num_matrix(N, Rows) :-
    length(Rows, N),
    maplist(same_length_(N), Rows).

same_length_(N, Row) :-
    length(Row, N).

sudoku(Rows) :-
    length(Rows, N),
    check_grid(N),
    make_num_matrix(N, Rows),
    append(Rows, Vars),
    Vars ins 1..N,    

    maplist(all_distinct, Rows),
    transpose(Rows, Cols),
    maplist(all_distinct, Cols),
    B is floor(sqrt(N)),
    squares(B, Rows),

    labeling([], Vars),

    maplist(printRow, Rows).

squares(_, []).
squares(B, Rows) :-
    take(B, Rows, Group, RestRows),
    square_groups(B, Group),
    squares(B, RestRows).

square_groups(_, Rows) :-
    maplist(=([]), Rows).
square_groups(B, Rows) :-
    maplist(take(B), Rows, Prefixes, RestRows),
    append(Prefixes, Square),
    all_distinct(Square),
    square_groups(B, RestRows).

take(N, List, Front, Back) :-
    length(Front, N),
    append(Front, Back, List).

printRow([]) :-
    nl.
printRow([H|T]) :-
    write('|'),
    write(H),
    printRow(T).
