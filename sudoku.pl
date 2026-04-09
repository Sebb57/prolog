:- use_module(library(clpfd)).

sudoku(A1, A2, A3, A4, B1, B2, B3, B4, C1, C2, C3, C4, D1, D2, D3, D4) :-
    Vars = [A1,A2,A3,A4,
            B1,B2,B3,B4,
            C1,C2,C3,C4,
            D1,D2,D3,D4],

    Vars ins 1..4,

    all_distinct([A1,A2,A3,A4]),
    all_distinct([B1,B2,B3,B4]),
    all_distinct([C1,C2,C3,C4]),
    all_distinct([D1,D2,D3,D4]),
    all_distinct([A1,B1,C1,D1]),
    all_distinct([A2,B2,C2,D2]),
    all_distinct([A3,B3,C3,D3]),
    all_distinct([A4,B4,C4,D4]),
    all_distinct([A1,A2,B1,B2]),
    all_distinct([A3,A4,B3,B4]),
    all_distinct([C1,C2,D1,D2]),
    all_distinct([C3,C4,D3,D4]),

    labeling([], Vars),

    printRow([A1, A2, A3, A4]),
    printRow([B1, B2, B3, B4]),
    printRow([C1, C2, C3, C4]),
    printRow([D1, D2, D3, D4]).

printRow([]) :-
    nl.
printRow([H|T]) :-
    write('|'),
    write(H),
    printRow(T).
