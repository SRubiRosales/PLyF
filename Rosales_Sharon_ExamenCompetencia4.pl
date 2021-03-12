%Regiones
region(noroeste,[baja_california,baja_california_sur,chihuahua,sinaloa,sonora]).
region(noreste,[coahuila,durango,nuevo_leon,san_luis_potosi,tamaulipas]).
region(centro,[ciudad_de_mexico,estado_de_mexico,guerrero,hidalgo,morelos,puebla,tlaxcala]).
region(occidente,[aguascalientes,colima,guanajuato,jalisco,michoacan,nayarit,queretaro,zacatecas]).
region(sureste,[campeche,chiapas,oaxaca,quintana_roo,tabasco,veracruz,yucatan]).

%Climas (Seg�n el atlas de M�xico de 4� grado, p�gina 16)
clima(noroeste, [des�rtico, estepario, frio_semifrio, lluvias_en_verano]).
clima(noreste, [des�rtico, estepario, lluvias_en_verano, lluvias_escasas]).
clima(centro, [estepario, lluvias_en_verano, lluvias_escasas, frio_semifrio]).
clima(occidente, [estepario, lluvias_en_verano, lluvias_escasas, templado]).
clima(sureste, [lluvas_siempre, lluvias_en_verano, lluvias_escasas, estepario, templado]).

%Lugares Tur�sticos
turismo(noroeste, [playas, sierra]).
turismo(noreste, [ferias-iglesias, museos]).
turismo(centro, [mueseos, sierra, bosques, pueblos_magicos]).
turismo(occidente, [playas, ferias-iglesias, museos, pueblos_magicos]).
turismo(sureste, [playas, sierra, bosques, zonas_arqueologicas]).

temporada(primavera, zonas_arqueologicas).
temporada(verano, playas).
temporada(otono, museos).
temporada(invierno, bosques).

%B�squeda de estado por regi�n o zona s�smica
regiones(Estado, Region):- region(Region,Estados), member(Estado, Estados), !.
%B�squeda de clima por estado
climas(Estado, Clima):- regiones(Estado, Region), clima(Region, Clima).
%Lugares tur�sticos por estado
turistico(Estado, Lugares):- regiones(Estado, Region), turismo(Region, Lugares).
%Regi�n que conviene visitar seg�n la temporada
regionDestino(Estacion, Region):-
	turismo(Region, Lugares),
	temporada(Estacion, Lugar),
	member(Lugar,Lugares).

%Informaci�n general de un estado.
estado(X,Region,Climas,Turismo,VisitarEn):-
	regiones(X,Region),
	climas(X,Climas),
	turistico(X,Turismo),
	regionDestino(VisitarEn,Region).

