%Menú de restaurante
%Entradas
guarnicion(queso_fundido).
guarnicion(fideos).
guarnicion(sopa).
guarnicion(crema).
guarnicion(consome).
guarnicion(ensalada_de_col).
guarnicion(pure_de_papa).
guarnicion(pure_de_camote).
guarnicion(mousse_de_calabaza).
guarnicion(tallarines_verdes).

%Carne de res
res(arrachera).
res(carne_asada).
res(sirloin).
res(albondigas).
res(picadillo).
res(picadillo_verde).
res(bistec_con_papas).
res(cecina).
res(tacos_de_cabeza).
res(pastel_de_carne).

%Pollo
pollo(pechuga_con_mole).
pollo(pechuga_rellena).
pollo(milanesa_empanizada).
pollo(pollo_relleno).
pollo(pollo_azado).
pollo(chop_suey).
pollo(nuggets).
pollo(estofado).
pollo(caldo_de_pollo).
pollo(tinga).
pollo(enchiladas).

%Pescado
pescado(filete_al_ajillo).
pescado(filete_empanizado).
pescado(a_la_veracruzana).
pescado(empapelado).
pescado(caldo_de_pescado).
pescado(mojarra_frita).
pescado(rollo_de_pescado).
pescado(ceviche).
pescado(salmon).
pescado(sushi).

%Postres
postre(cheesecake).
postre(helado).
postre(crepas).
postre(pastel).
postre(pastel_oreo).
postre(brownie).
postre(cupcake).
postre(carlota_de_limon).
postre(mousse).
postre(gelatina).
postre(chocolate).

%Bebidas
bebida(cafe).
bebida(limonada).
bebida(horchata).
bebida(refresco_enlatado).
bebida(te).
bebida(malteada).
bebida(vino).
bebida(ponche).
bebida(chocolate).
bebida(frappe).

%Platos principales
platilloPrincipal(Plato):- res(Plato).
platilloPrincipal(Plato):- pollo(Plato).
platilloPrincipal(Plato):- pescado(Plato).

%Comida completa que contiene entrada, plato principal, postre y bebida
comida(W,X,Y,Z):- guarnicion(W), platilloPrincipal(X), postre(Y), bebida(Z).

