% Start Rules (Knowledge Base)
/* Knowledge Base */
penyakit(maag_kronis):-
perut(yes),
makan(yes),
muntah(yes),
mual(yes),
kram(yes),
nyeri(yes),
panas(yes),
telan(yes).
penyakit(maag_akut):-
perut(yes),
makan(yes),
muntah(yes),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(yes).
penyakit(maag_ringan):-
perut(yes),
makan(yes),
muntah(no),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(no).
penyakit(maag_sedang):-
perut(yes),
makan(yes),
muntah(yes),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(no).
penyakit(gastritis):-
perut(no),
makan(yes),
muntah(yes),
mual(yes),
kram(no),
nyeri(yes),
panas(yes),
telan(no).
penyakit(tukak_lambung):-
perut(no),
makan(yes),
muntah(yes),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(no).
penyakit(polip_lambung):-
perut(no),
makan(no),
muntah(no),
mual(yes),
kram(no),
nyeri(yes),
panas(no),
telan(no).
penyakit(gerd):-
perut(yes),
makan(yes),
muntah(no),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(yes).
penyakit(infek_lambung):-
perut(yes),
makan(yes),
muntah(no),
mual(yes),
kram(no),
nyeri(no),
panas(no),
telan(no).
penyakit(asam_lambung):-
perut(yes),
makan(yes),
muntah(no),
mual(no),
kram(no),
nyeri(no),
panas(no),
telan(no).
penyakit(usus_buntu):-
perut(yes),
makan(no),
muntah(yes),
mual(yes),
kram(no),
nyeri(no),
panas(no),
telan(no).
penyakit(sembelit):-
perut(yes),
makan(no),
muntah(no),
mual(no),
kram(no),
nyeri(no),
panas(no),
telan(no).
penyakit(disentri):-
perut(no),
makan(no),
muntah(no),
mual(no),
kram(yes),
nyeri(no),
panas(no),
telan(no).
penyakit(masuk_angin):-
perut(no),
makan(no),
muntah(no),
mual(yes),
kram(yes),
nyeri(no),
panas(no),
telan(no).
penyakit(sehat):-
perut(no),
makan(no),
muntah(no),
mual(no),
kram(no),
nyeri(no),
panas(no),
telan(no).
% End Rules (Knowledge Base)
 
% Start User Interface
/* Asking the user */
diagnosa(X):- 
    menuask(diagnosa, X, [yes, no]).
perut(X):- 
    menuask(perut, X, [yes, no]).
makan(X):- 
    menuask(makan, X, [yes, no]).
muntah(X):- 
    menuask(muntah, X, [yes, no]).
mual(X):- 
    menuask(mual, X, [yes, no]).
kram(X):- 
    menuask(kram, X, [yes, no]).
nyeri(X):- 
    menuask(nyeri, X, [yes, no]).
panas(X):- 
    menuask(panas, X, [yes, no]).
telan(X):- 
    menuask(telan, X, [yes, no]).    
 
/* Menus for user & Remembering the answer*/
menuask(A, V, _):-
    known(yes, A, V), % succeed if true
    !. % stop looking
menuask(A,V,_):-
    alreadyasked(yes, A), !, fail.
menuask(A, V, MenuList) :-
    write('Apakah Kamu'),write(' '),write(A), write('?'), nl,
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
    abolish(known,8),
    abolish(alreadyasked,7),
    top_goal(X),
    write('Penyakit kamu adalah'), write(X), nl.
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
