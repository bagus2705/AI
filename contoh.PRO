% Start Rules (Knowledge Base)
/* Knowledge Base */
os(ios):-
    fear_technology(yes),
    daddy_rich(yes).
os(chrome):-
    fear_technology(yes),
    daddy_rich(no).
os(windows):-
    fear_technology(no),
    care_privacy(no).
os(ubuntu):-
    fear_technology(no),
    care_privacy(yes),
    have_life(yes).
os(kali):-
    fear_technology(no),
    care_privacy(yes),
    have_life(no).
 
% End Rules (Knowledge Base)
 
% Start User Interface
/* Asking the user */
fear_technology(X):- 
    menuask(fear_technology, X, [yes, no]).
daddy_rich(X):- 
    menuask(daddy_rich, X, [yes, no]).
care_privacy(X):- 
    menuask(care_privacy, X, [yes, no]).
have_life(X):- 
    menuask(have_life, X, [yes, no]).
 
/* Menus for user & Remembering the answer*/
menuask(A, V, _):-
    known(yes, A, V), % succeed if true
    !. % stop looking
menuask(A,V,_):-
    alreadyasked(yes, A), !, fail.
menuask(A, V, MenuList) :-
    write('Do you '), write(A), write('?'), nl,
    write(MenuList), nl,
    read(X),
    check_val(X, A, V, MenuList),
    asserta( known(yes, A, X) ),
    asserta( alreadyasked(yes, A) ),
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
top_goal(X) :- os(X). 
 
solve :-
    abolish(known, 3),
    abolish(alreadyasked, 2),
    top_goal(X),
    write('The answer is '), write(X), nl.
solve :-
    write('No answer found.'), nl. 
 
/* Command loop */
go :-  
    greeting,
    repeat,
    write('> '),
    read(X),
    do(X),
    X == quit.
 
greeting :-
    write('This is the Clasification a Plant Prolog Exsys.'), nl,
    write('Enter start or quit at the prompt.'), nl.
 
/* Running Program */
do(start) :-
    solve,
    !. 
 
/* Quit Program */
do(quit).
do(X) :-
    write(X),
    write('is not a legal command.'), nl,
    fail. 
% End Simple Shell
 
/* handle undefined procedure */
:- unknown(trace, fail).
