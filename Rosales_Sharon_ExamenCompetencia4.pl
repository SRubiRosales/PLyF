%Regiones
region(noroeste,[baja_california,baja_california_sur,chihuahua,sinaloa,sonora]).
region(noreste,[coahuila,durango,nuevo_leon,san_luis_potosi,tamaulipas]).
region(centro,[ciudad_de_mexico,estado_de_mexico,guerrero,hidalgo,morelos,puebla,tlaxcala]).
region(occidente,[aguascalientes,colima,guanajuato,jalisco,michoacan,nayarit,queretaro,zacatecas]).
region(sureste,[campeche,chiapas,oaxaca,quintana_roo,tabasco,veracruz,yucatan]).

%Climas (Según el atlas de México de 4° grado, página 16)
clima(noroeste, [desértico, estepario, frio_semifrio, lluvias_en_verano]).
clima(noreste, [desértico, estepario, lluvias_en_verano, lluvias_escasas]).
clima(centro, [estepario, lluvias_en_verano, lluvias_escasas, frio_semifrio]).
clima(occidente, [estepario, lluvias_en_verano, lluvias_escasas, templado]).
clima(sureste, [lluvas_siempre, lluvias_en_verano, lluvias_escasas, estepario, templado]).

%Lugares Turísticos
turismo(noroeste, [playas, sierra]).
turismo(noreste, [ferias-iglesias, museos]).
turismo(centro, [mueseos, sierra, bosques, pueblos_magicos]).
turismo(occidente, [playas, ferias-iglesias, museos, pueblos_magicos]).
turismo(sureste, [playas, sierra, bosques, zonas_arqueologicas]).

temporada(primavera, zonas_arqueologicas).
temporada(verano, playas).
temporada(otono, museos).
temporada(invierno, bosques).

%Búsqueda de estado por región o zona sísmica
regiones(Estado, Region):- region(Region,Estados), member(Estado, Estados), !.
%Búsqueda de clima por estado
climas(Estado, Clima):- regiones(Estado, Region), clima(Region, Clima).
%Lugares turísticos por estado
turistico(Estado, Lugares):- regiones(Estado, Region), turismo(Region, Lugares).
%Región que conviene visitar según la temporada
regionDestino(Estacion, Region):-
	turismo(Region, Lugares),
	temporada(Estacion, Lugar),
	member(Lugar,Lugares).

%Información general de un estado.
estado(X,Region,Climas,Turismo,VisitarEn):-
	regiones(X,Region),
	climas(X,Climas),
	turistico(X,Turismo),
	regionDestino(VisitarEn,Region).

