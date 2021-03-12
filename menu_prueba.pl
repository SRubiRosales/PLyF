%entradas
entrada(rabanos, 20).
entrada(pate, 90).
entrada(ensalada, 40).
entrada(sopa,35).
%% primer plato (de carne)
carne(ternera, 130).
carne(pollo, 100).
carne(conejo, 120).
%% primer plato (de pescado)
pescado(trucha, 90).
pescado(salmon, 150).
pescado(merluza, 95).
%% postre
postre(flan, 80).
postre(cuajada, 60).
postre(fruta, 50).

calmenu(E,P,T,C) :- entrada(E,CE),
pescado(P,CP),
postre(T,CT),
C is CE+CP+CT.
calmenu(E,P,T,C) :- entrada(E,CE),
carne(P,CP),
postre(T,CT),
C is CE+CP+CT.
