%Menú de restaurante
%Entradas
guarnicion(queso_fundido).
guarnicion(consome).

%Carne de res
res(arrachera).
res(carne_asada).

%Pollo
pollo(pechuga_con_mole).
pollo(milanesa_empanizada).

%Pescado
pescado(empapelado).
pescado(mojarra_frita).

%Postres
postre(helado).

%Bebidas
bebida(limonada).

%Platos principales
platilloPrincipal(Plato):- res(Plato).
platilloPrincipal(Plato):- pollo(Plato).
platilloPrincipal(Plato):- pescado(Plato).

%Comida completa que contiene entrada, plato principal, postre y bebida
comida(W,X,Y,Z):- guarnicion(W), platilloPrincipal(X), postre(Y), bebida(Z).

