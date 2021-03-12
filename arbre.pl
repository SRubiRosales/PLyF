%Árbol genealógico de mi familia
%Hechos
%Mujeres
femme(guadalupe).%Predicado: Guadalupe es mujer
femme(martha).
femme(beatriz).
femme(laura).
femme(maria).
femme(sharon).
femme(paulina).
femme(kristell).
femme(jazmin).
%Hombres
homme(jesus).%Predicado: Jesús es hombre
homme(pablo).
homme(antonio).
homme(eliseo).
homme(david).
homme(victor).
homme(ivan).
homme(rafael).
homme(sergio).
homme(eduardo).
homme(armando).
%Relaciones de parentesco
%Progenie
parent(jesus,martha).%Predicado: Jesús es padre de Martha
parent(jesus,pablo).
parent(jesus,laura).
parent(guadalupe,martha).
parent(guadalupe,pablo).
parent(guadalupe,laura).
parent(antonio,maria).
parent(antonio,david).
parent(martha,maria).
parent(martha,david).
parent(pablo,sharon).
parent(pablo,victor).
parent(beatriz,sharon).
parent(beatriz,victor).
parent(eliseo,paulina).
parent(eliseo,ivan).
parent(laura,paulina).
parent(laura,ivan).
parent(rafael,sergio).
parent(rafael,jazmin).
parent(rafael,eduardo).
parent(maria,sergio).
parent(maria,jazmin).
parent(maria,eduardo).
parent(david,armando).
parent(kristell,armando).
%Cónyuge
mariage(jesus,guadalupe).%Predicado: Jesús se casó con Guadalupe
mariage(guadalupe,jesus).
mariage(antonio,martha).
mariage(martha,antonio).
mariage(pablo,beatriz).
mariage(beatriz,pablo).
mariage(eliseo,laura).
mariage(laura,eliseo).
mariage(rafael,maria).
mariage(maria,rafael).
mariage(david,kristell).
mariage(kristell,david).

%Reglas
%X es papá de Y si X es "parent" de Y y si X es "homme"
pere(X,Y):- parent(X,Y), homme(X).
%X es papá de Y si X es "parent" de Y y si X es "femme"
mere(X,Y):- parent(X,Y), femme(X).
%X es abuela de Y si Z es "parent" de Y y si X es "meré" de Z
grandMere(X,Y):- parent(Z,Y), mere(X,Z).
%X es abuelo de Y si Z es "parent" de Y y si X es "peré" de Z
grandPere(X,Y):- parent(Z,Y), pere(X,Z).
% X es bisabuelo de Y si X es "pere" de Z y
%Z es "grandPere" o "grandMere" de Y
arriereGrandPere(X,Y):- pere(X,Z),(grandPere(Z,Y);grandMere(Z,Y)).
% X es bisabuela de Y si X es "mere" de Z y
%Z es "grandPere" o "grandMere" de Y
arriereGrandMere(X,Y):- mere(X,Z),(grandPere(Z,Y);grandMere(Z,Y)).
%Y es hijo de X si X es "parent" de Y y si Y es "homme"
fils(Y,X):- parent(X,Y), homme(Y).
%Y es hija de X si X es "parent" de Y y si Y es "femme"
fille(Y,X):- parent(X,Y), femme(Y).
%X y Y son hermanos si Z es "parent" de X y Y, y X no es igual que Y
freres(X,Y):- parent(Z,X), parent(Z,Y), not(X==Y).
%X es hermano de Y si X y Y son "fréres" y X es "homme"
frere(X,Y):- freres(X,Y), homme(X).
%X es hermana de Y si X y Y son "fréres" y X es "femme"
soeur(X,Y):- freres(X,Y), femme(X).
%X es tío de Y si Z es "parent" de Y y
%X es "frére" de Z, o X es "soeur" de W y X es "mariage" de W
loncle(X,Y):- (frere(X,Z);(mariage(X,W),soeur(W,Z))), parent(Z,Y).
%X es tía de Y si Z es "parent" de Y y
%X es "soeur" de Z, o Z es "frere" de W y X es "mariage" de W
tante(X,Y):- (soeur(X,Z);(mariage(X,W),frere(Z,W))), parent(Z,Y).
%X es primo(a) de Y si Z es "loncle" de X y Z es "parent" de Y
cousins(X,Y):- loncle(Z,X), parent(Z,Y).
%X es sobrino(a) de Y si Z es "parent" de X, y Z y Y son "fréres"
neveux(X,Y):- parent(Z,X), freres(Z,Y).
