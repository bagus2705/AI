% Start Rules (Knowledge Base)
/* Knowledge Base */
penyakit(maag):-
sakit_perut(yes),
mual(yes),
muntah(yes).
penyakit(polip_lambung):-
sakit_perut(no),
kram(no),
nyeri(yes).
penyakit(masuk_angin):-
sakit_perut(no),
kram(yes),
kurang_nafsu_makan(no).
penyakit(sehat):-
sakit_perut(no),
kram(no),
nyeri(no).
penyakit(tukak_lambung):-
sakit_perut(no),
kram(yes),
kurang_nafsu_makan(yes).
penyakit(gerd):-
sakit_perut(yes),
mual(yes),
muntah(no).
penyakit(asam_lambung):-
sakit_perut(yes),
mual(no),
kurang_nafsu_makan(yes).
penyakit(sembelit):-
sakit_perut(yes),
mual(no),
kurang_nafsu_makan(no).
% End Rules (Knowledge Base)
 
% Start User Interface
/* Asking the user */
diagnosa(X):- 
    menuask(diagnosa, X, [yes, no]).
sakit_perut(X):- 
    menuask(sakit_perut, X, [yes, no]).
kram(X):- 
    menuask(kram, X, [yes, no]).
mual(X):- 
    menuask(mual, X, [yes, no]).
muntah(X):- 
    menuask(muntah, X, [yes, no]).
kurang_nafsu_makan(X):- 
    menuask(kurang_nafsu_makan, X, [yes, no]).
nyeri(X):- 
    menuask(nyeri, X, [yes, no]).
 
/* Menus for user & Remembering the answer*/
menuask(A, V, _):-
    known(yes, A, V), % succeed if true
    !. % stop looking
menuask(A,V,_):-
    alreadyasked(yes, A), !, fail.
menuask(A, V, MenuList) :-
    write('Apakah Kamu mengalami'),write(' '),write(A), write('?'), nl,
    write(MenuList), nl,
    read(X),
    check_val(X, A, V, MenuList),
    asserta(known(yes, A, X) ),
    asserta(alreadyasked(yes, A) ),
    X == V. 
 
/* Check input */
check_val(X, _A, _V, MenuList) :-
    member(X, MenuList),
    !.
check_val(X, A, V, MenuList) :-
    write(X), write(' is not a legal value, try again.'), nl,
    menuask(A, V, MenuList). 
 
/* Member rules */
member(X,[X|_]).
member(X,[_|T]):-member(X,T).
% End User Interface
 
% Start Simple Shell
/* Simple shell */
top_goal(X) :- penyakit(X). 
 
solve :-
    abolish(known,3),
    abolish(alreadyasked,2),
    top_goal(X),
    write('Penyakit kamu adalah'),write(' '),write(X), nl.
solve :-
    write('Penyakit kamu tidak ada di data '), nl. 
 
/* Command loop */
mulai :-  
    salam,
    repeat,
    write('> '),
    read(X),
    do(X),
    X == quit.
 
salam :-
    write('Diagnosa penyakit lambung'), nl,
    write('Ketik start or quit '), nl.
 
/* Running Program */
do(start) :-
    solve,
    !. 
 
/* Quit Program */
do(quit).
do(X) :-
    write(X),
    write('input kamu tidak sesuai.'), nl,
    fail. 
% End Simple Shell
 
/* handle undefined procedure */
:- unknown(trace, fail).
