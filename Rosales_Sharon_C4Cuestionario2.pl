%Menú con calorías por ración.
%Entradas
guarnicion(queso_fundido, 48).
guarnicion(fideos, 219).
guarnicion(sopa_de_verduras, 98).
guarnicion(crema_de_calabaza, 109).
guarnicion(consome, 38).
guarnicion(ensalada_de_col, 41).
guarnicion(pure_de_papa, 147).
guarnicion(pure_de_camote, 134).
guarnicion(pure_de_manzana, 86).
guarnicion(mousse_de_calabaza, 150).
guarnicion(tallarines_verdes, 207).
guarnicion(arroz_rojo, 149).
guarnicion(arroz_blanco, 135).
guarnicion(verduras_salteadas, 63).
guarnicion(papas_horneadas, 162).
guarnicion(papas_cambray, 144).
guarnicion(papas_con_rajas, 266).
guarnicion(rollos_primavera, 65).
guarnicion(guacamole, 46).
guarnicion(frijoles_charros, 40).


%Platos fuertes
%Res
res(arrachera, 290).
res(carne_asada, 168).
res(albondigas, 171).
res(picadillo, 332).
res(bistec_con_papas, 416).
res(cecina, 112).
%Pollo
pollo(pechuga_con_mole, 170).
pollo(pechuga_rellena, 236).
pollo(milanesa_empanizada, 354).
pollo(pollo_relleno, 339).
pollo(pollo_asado, 124).
pollo(chop_suey, 145).
pollo(estofado, 306).
%Pescado
pescado(filete_al_ajillo, 299).
pescado(filete_empanizado, 285).
pescado(empapelado, 211).
pescado(caldo_de_pescado, 188).
pescado(mojarra_frita, 307).
pescado(salmon, 146).
pescado(sushi, 179).

%Postres
postre(cheesecake_de_cajeta, 410).
postre(cheescake_de_zarzamora, 307).
postre(helado, 133).
postre(crepas, 395).
postre(pastel, 177).
postre(pastel_oreo, 249).
postre(brownie, 129).
postre(cupcake, 227).
postre(carlota_de_limon, 352).
postre(mousse_de_chocolate, 117).
postre(gelatina_frutas, 149).
postre(gelatina_mosaico, 86).
postre(chocolate, 229).
postre(panque_de_nuez, 121).
postre(flan_napolitano, 288).
postre(pastel_imposible, 289).
postre(pay_de_queso, 264).
postre(rollo_de_chocolate, 241).
postre(galletas_de_jengibre, 356).
postre(pastisetas, 166).

%Bebidas
bebida(cafe, 2).
bebida(limonada, 139).
bebida(horchata, 81).
bebida(refresco_enlatado, 252).
bebida(te, 2).
bebida(malteada, 192).
bebida(vino, 125).
bebida(ponche, 74).
bebida(chocolate, 237).
bebida(frappe_clasico, 465).
bebida(frappe_de_moka, 210).
bebida(capuccino, 74).
bebida(smoothie_de_mango, 56).
bebida(chamoyada_de_pina, 317).
bebida(jamaica, 69).
bebida(tamarindo, 111).
bebida(naranjada, 112).
bebida(agua_mineral, 0).
bebida(atole_de_nuez, 243).
bebida(champurrado, 330).

%Platos principales
platoPrincipal(Plato):- pescado(Plato, Cal); res(Plato, Cal); pescado(Plato, Cal).

%Platos principales con valor calórico por ración
platilloPrincipal(Plato, Calorias):- res(Plato, Calorias); pollo(Plato, Calorias); pescado(Plato, Calorias).

%Comida completa que contiene entrada, plato principal, postre y bebida
comida(Guarnicion, PlatoFuerte, Postre, Bebida):-
    guarnicion(Guarnicion, X),
    platoPrincipal(PlatoFuerte),
    postre(Postre, Y),
    bebida(Bebida, Z).

comidaYcalorias(Guarnicion, PlatoFuerte, Postre, Bebida, Calorias, Sano):-
    (guarnicion(Guarnicion, W),%Entrada y sus calorías
    platilloPrincipal(PlatoFuerte, X),%Plato fuerte y sus calorías
    postre(Postre, Y),%Postre y sus calorías
    bebida(Bebida, Z),%Bebida y sus calorías
    total(W, X, Y, Z, Calorias)),%Suma las calorías de cada alimento
    (sano(Calorias, Sano); Sano = false).%Si es sano, es true; si no es sano, es false

%Sumar calorías
total(Guarnicion, PlatoFuerte, Postre, Bebida, Total):-
    Total is Guarnicion + PlatoFuerte + Postre + Bebida.
%La comida es sana si tiene 500 calorías o menos.
% Esto varía según la edad, sexo, estatura, peso y actividad física de
% cada persona.
sano(Calorias, Sano):- Calorias =< 500, Sano = true.
