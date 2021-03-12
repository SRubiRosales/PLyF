%Regiones
region(noroeste,[baja_california,baja_california_sur,chihuahua,sinaloa,sonora]).
region(noreste,[coahuila,durango,nuevo_leon,san_luis_potosi,tamaulipas]).
region(centro,[ciudad_de_mexico,estado_de_mexico,guerrero,hidalgo,morelos,puebla,tlaxcala]).
region(occidente,[aguascalientes,colima,guanajuato,jalisco,michoacan,nayarit,queretaro,zacatecas]).
region(sureste,[campeche,chiapas,oaxaca,quintana_roo,tabasco,veracruz,yucatan]).

%Zonas sísmicas
riesgo_sismico(alto,[baja_california,jalisco,colima,michoacan,guerrero,oaxaca,chiapas]).
riesgo_sismico(medio,[baja_california_sur,sonora,nayarit,estado_de_mexico,cdmx,morelos,puebla,tlaxcala,veracruz,tabasco]).
riesgo_sismico(bajo,[chihuahua,durango,coahuila,nuevo_leon,tamaulipas,san_luis_potosi,sinaloa,aguascalientes,zacatecas,guanajuato,queretaro,hidalgo,campeche,quintana_roo,yucatan]).

%Volcanes
volcan(baja_california,8).
volcan(baja_california_sur,3).
volcan(puebla,6).
volcan(durango,5).
volcan(michoacan,4).
volcan(estado_de_mexico,4).
volcan(chiapas,2).
volcan(nayarit,2).
volcan(ciudad_de_mexico,1).
volcan(guanajuato,1).
volcan(jalisco,1).
volcan(colima,1).
volcan(tlaxcala,1).
volcan(veracruz,1).
volcan(Estado,0).

%Búsqueda de estado por región o zona sísmica
regiones(Estado, Region):- region(Region,Estados), member(Estado, Estados),!.
zona_sismica(Estado, Zona):- riesgo_sismico(Zona, Estados), member(Estado, Estados),!.
%Información general de un estado.
estado(X,Region,Sismos,Volcanes):-
	regiones(X,Region),
	zona_sismica(X,Sismos),
	volcan(X,Volcanes),!.

%Contar estados de una región/zona sísmica
contar([],0).
contar([_|Xs],N) :-
	contar(Xs,T),
	N is T+1.
n_estados(Region, N):- (region(Region, Estados);riesgo_sismico(Region,Estados)), contar(Estados,N).
%Operación aritmética para número de estados con volcanes
convolcan(N):- N is 32 - 18.
