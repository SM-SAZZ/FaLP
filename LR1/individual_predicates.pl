%Задание 1
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(miloslav).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(bogdana).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(miloslav, lubomila).
parent(miloslav, boguslav).
parent(miloslav, veslava).
parent(miloslav, duhovlad).

parent(bogdana, lubomila).
parent(bogdana, boguslav).
parent(bogdana, veslava).
parent(bogdana, duhovlad).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men :- man(X), write(X), nl, fail. %men - вывод всех мужчин
women :- woman(X), write(X), nl, fail. %women - вывод всех женщин
children(X) :- parent(X, Y), write(Y), nl, fail. %children(+X) - вывод всех детей X
mother(X, Y) :- parent(X, Y), woman(X). %mother(?X, +Y) - +X проверка является ли X матерью Y; -X вывод матери Y
mother(X) :- mother(Y, X), write(Y). %mother(+X) - вывод матери X
brother(X, Y) :- parent(Z, X), parent(Z, Y), man(Z), man(X). %brother(?X, +Y) - +X проверка является ли X братом Y; -X вывод брата Y
brothers(X) :- brother(Y, X), not(Y==X), write(Y), nl, fail. %brothers(+X) - вывод всех братьев X

b_s(X, Y) :- parent(Z, X), parent(Z, Y), man(Z), not(X==Y). %b_s(+X, ?Y) - +Y проверка являются ли X и Y братьями, или сестрами, или братом и сестрой; -Y вывод брата/сестры X
b_s(X) :- b_s(X, Y), not(X==Y), write(Y), nl, fail. %b_s(+X) - вывод всех братьев и сестёр X

%Задание 2
daughter(X, Y) :- parent(Y, X), woman(X). %daughter(?X, +Y) - +X проверка является ли X дочерью Y; -X вывод дочери Y
daughter(X) :- daughter(Y, X), write(Y), nl, fail. %daughter(+X) - вывод дочерей X
husband(X, Y) :- parent(X, Z), parent(Y, Z), man(X). %husband(?X, +Y) - +X проверка является ли X мужем Y; -X вывод мужа Y
husband(X) :- husband(Y, X), man(Y), not(X==Y), write(Y). %husband(+X) - вывод мужа X

%Задание 3
%grand_ma(?X, +Y) - +X проверка является ли X бабушкой Y; -X вывод бабушки Y
grand_ma(X, Y) :- woman(X), parent(X, Z), parent(Z, Y).
%grand_ma(X, Y) :- mother(X, Z), parent(Z, Y).

grand_mas(X) :- grand_ma(Y, X), write(Y), nl, fail. %grand_mas(+X) - вывод всех бабушек X

%grand_ma_and_da(?X, +Y) - +X проверка является ли X и Y бабушкой и внучкой или внучкой и бабушкой; -X вывод бабушки Y, если Y женщина
grand_ma_and_da(X, Y) :- woman(X), woman(Y), (parent(X, Z), parent(Z, Y); parent(Y, Z), parent(Z, X)).
% grand_ma_and_da(X, Y) :- mother(X, Z), daughter(Y, Z); mother(Y, Z), daughter(X, Z).

%aunt(?X, +Y) - +X проверка является ли X тётей Y; -X вывод тёти Y
aunt(X, Y) :- woman(X), not(parent(X, Y)), parent(Z, V), parent(V, Y), (parent(Z, X); parent(Z, W), parent(W, C), parent(X,C)).
% aunt(X, Y) :- woman(X), not(parent(X, Y)), parent(Z, Y), (b_s(Z, X); b_s(Z, V), husband(V, X)).

aunts(X) :- aunt(Y, X), woman(Y), write(Y), nl, fail. %aunts(+X) - вывод всех тётей X

