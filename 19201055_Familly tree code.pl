male(ayeb).
male(kazi).
male(motalab).
male(shuvo).
male(shuvo).
male(akbar).
male(azgar).
male(indro).
male(yusuf).
male(alamin).
male(rabbi).
male(sumon).
male(munna).
male(rakib).
male(anik).
male(nazrul).
male(ayon).
male(joy).
male(rajib).
male(pranto).
male(peyas).
male(suman).
male(showan).
male(juwel).
male(hassan).
male(bosir).
male(maruf).

female(mukta).
female(fatema).
female(sayoni).
female(rokeya).
female(firoza).
female(shihada).
female(rahima).
female(nodi).
female(bithi).
female(kobita).
female(priya).
female(mala).
female(dighi).
female(khodaja).
female(sumi).
female(popy).
female(hasi).
female(kaniz).
female(aysha).
female(mousumi).


father(ayeb,kazi).
father(ayeb,juwel).

father(juwel,rakib).
father(juwel,hassan).
father(rakib,anik).
father(anik,nazrul).
father(anik,rajib).
father(nazrul,ayon).
father(ayon,joy).
father(rajib,pranto).
father(pranto,peyas).
father(hassan,suman).
father(suman,showan).
father(kazi,motalab).
father(kazi,indro).
father(indro,shuvo).
father(motalab,akbar).
father(motalab,azgar).
father(motalab,khodaja).
father(akbar,alamin).
father(akbar,rabbi).
father(azgar,sumon).
father(azgar,sumi).
father(yusuf,popy).
father(yusuf,munna).
father(hassan,bosir).
father(bosir,maruf).
father(bosir,mousumi).



mother(khodaja,popy).
mother(sayoni,shuvo).
mother(mukta,kazi).
mother(fatema,motalab).
mother(rokeya,akbar).
mother(rokeya,azgar).
mother(rokeya,khodaja).
mother(firoza,alamin).
mother(firoza,rabbi).
mother(shihada,sumon).
mother(kaniz,rakib).
mother(kaniz,hassan).
mother(rahima,anik).
mother(nodi,nazrul).
mother(nodi,rajib).
mother(bithi,ayon).
mother(kobita,joy).
mother(priya,pranto).
mother(mala,peyas).
mother(hasi,suman).
mother(dighi,showan).
mother(shihada,sumi).
mother(khodaja,munna).
mother(aysha,maruf).
mother(aysha,mousumi).



/*rules*/

parent(X,Y):-
     mother(X,Y);
     father(X,Y).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

sibling(Y,X):-
    parent(Z,X),
    parent(Z,Y),
    X\=Y.

grandparent(X,Y):-
     parent(Z,Y),
     parent(X,Z).


greatgrandparent(X,Y):-
    parent(X,P),
    parent(P,Z),
    parent(Z,Y).

greatgreatgrandparent(X,Y):-
     parent(A,Y),
     parent(B,A),
     parent(C,B),
     parent(X,C).

firstcousin(X,Y):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).
firstcousin(Y,X):-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

secondcousin(X,Y):-
    greatgrandparent(Z,X),
    greatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.
	
thirdcousin(X,Y):-
    greatgreatgrandparent(Z,X),
    greatgreatgrandparent(Z,Y),
    \+firstcousin(X,Y),
    \+secondcousin(X,Y),
    \+sibling(X,Y),
    X\=Y.

firstcousin_onceremoved(X,Y):-
    parent(Z,Y),
    firstcousin(X,Z).
firstcousin_onceremoved(X,Y):-
    parent(Z,X),
    firstcousin(Z,Y).

firstcousin_twiceremoved(X,Y):-
    firstcousin(X,Z),
    grandparent(Z,Y).
firstcousin_twiceremoved(X,Y):-
    firstcousin(Z,Y),
    grandparent(Z,X).

secondcousin_onceremoved(X,Y):-
     parent(Z,Y),
     secondcousin(X,Z).
secondcousin_onceremoved(X,Y):-
     parent(Z,X),
     secondcousin(Z,Y).

secondcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     secondcousin(X,Z).
secondcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     secondcousin(Z,Y).

thirdcousin_onceremoved(X,Y):-
     parent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_onceremoved(X,Y):-
     parent(Z,X),
     thirdcousin(Z,Y).

thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,Y),
     thirdcousin(X,Z).
thirdcousin_twiceremoved(X,Y):-
     grandparent(Z,X),
     thirdcousin(Z,Y).

