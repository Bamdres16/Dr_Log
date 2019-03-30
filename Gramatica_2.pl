?- consult("Bases.pl").
%--------------------------------------------
%Hechos y reglas simple
%--------------------------------------------
%Verifica si est� en la lista
miembro(X,[X|_]).
miembro(X,[_|R]):- miembro(X,R).

concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).

agregar(X,L1,[X|L1]).

cabeza([X|Y],X,Y).

%----------------------------------
%Recibe la oracion como un string
%----------------------------------

oracion(Oracion,Tipo):- string_lower(Oracion,X), split_string(X, " ", "", L), pregunta(L,[],Tipo),!.
oracion(Oracion,Tipo):- string_lower(Oracion,X), split_string(X, " ", "", L), saludo(L,[],Tipo),!.
oracion(Oracion,Tipo):- string_lower(Oracion,X), split_string(X, " ", "", L), despedida(L,[],Tipo),!.

%----------------------------------
%BNF, Reconoce las palabras clave
%----------------------------------
%----------------------------------
%----------------------------------
%Pregunta
%----------------------------------

%Responde es que me est� preguntando el usuario
%Relacion es un tipo, para enlazar preguntas
%Num es si es plural o singular
%---------------------------
%Pronombre + Sujeto + Verbo
%---------------------------
pregunta(S0,S,Responde):- pronombre_int(Num,Relacion,S0,S1),sujeto(Num,Relacion,Responde,S1,S2), verbo(Num,Relacion,_,S2,S).
%
pregunta(S0,S,Responde):- pronombre_int(Num,Relacion,S0,S1), verbo(Num,Relacion,_,S1,S2),sujeto(Num,Relacion,Responde,S2,S).

pregunta(S0,S,Responde):- pronombre_int(Num,Relacion,S0,S1), verbo(Num,Relacion,_,S1,S2), articulo(Num,Relacion,S2,S3), sujeto(Num, Relacion, Responde, S3,S).

pregunta(S0,S,Responde):- pronombre_int(Num,Relacion,S0,S1), verbo(Num,Relacion,Responde,S1,S2), nombre(S2,S).

% Pronombre + verbo + articulo + sujeto + preposicion + articulo +
pregunta(S0,S,S6):- pronombre_int(Num,Relacion,S0,S1), verbo(Num,Relacion,_,S1,S2), articulo(Num,Relacion,S2,S3),sujeto(Num,Relacion,Responde,S3,S4), preposici�n(S4,S5), articulo(S5,S), cabeza(S,S6,_), atom_string(Atom, S6), enfermedad(Atom).
pregunta(S0,_,S1):- verbo(_,_,_,S0,S1),!.

pregunta([_|S0],_,Tipo):- pregunta(S0,_,Tipo).


pronombre_int(singular,1,["�qu�"|S],S).
pronombre_int(singular,1,["qu�"|S],S).

pronombre_int(plural,2,["�cu�les"|S],S).
pronombre_int(plural,2,["cu�les"|S],S).

pronombre_int(singular,1,["�cu�l"|S],S).
pronombre_int(singular,1,["cu�l"|S],S).

pronombre_int(singular,3,["�c�mo"|S],S).
pronombre_int(singular,3,["c�mo"|S],S).

sujeto(singular,1,"enfermedad",["enfermedad"|S],S).
sujeto(singular,1,"enfermedad",["enfermedad?"|S],S).

sujeto(plural,2,"causas",["causas"|S],S).
sujeto(plural,2,"causas",["causas?"|S],S).

sujeto(singular,1,"tratamiento",["tratamiento"|S],S).
sujeto(singular,1,"tratamiento",["tratamiento?"|S],S).
sujeto(singular,3,"prevencion",["prevenirla"|S],S).
sujeto(singular,3,"prevencion",["prevenirla?"|S],S).
sujeto(singular,3,"prevencion",["prevenir"|S],S).

verbo(singular,1,_,["tengo?"|S],S).
verbo(singular,1,_,["tengo"|S],S).
verbo(plural,2,_,["son"|S],S).
verbo(singular,1,_,["es"|S],S).
verbo(singular,3,_,["puedo"|S],S).


articulo(plural,2,["las"|S],S).
articulo(singular,1,["el"|S],S).
articulo(singular,1,["la"|S],S).
articulo(["la"|S],S).

preposici�n(["de"|S],S).


%----------------------------------
%Saludo
%----------------------------------

saludo(S0,_,"saludo"):-  interjeccion(S0,S1),nombre(S1,_),! ; primera(S0,S1), segunda(S1,S2),nombre(S2,_),!.
saludo([_|S0],_,Tipo):- saludo(S0,_,Tipo).


interjeccion(["hola"|S],S).

primera(["buenos"|S],S).
primera(["buen"|S],S).
primera(["buenas"|S],S).

segunda(["dias"|S],S).
segunda(["dia"|S],S).
segunda(["noches"|S],S).
segunda(["tardes"|S],S).

nombre(["drlog"|S],S).
nombre(["doctor"|S],S).
nombre(["dr"|S],S).


%----------------------------------
%Despedida
%----------------------------------

despedida(S0,_,Tipo):-  tipo1(S0,_,Tipo), ! ; tipo2(S0,_,Tipo),!.
despedida([_|S0],_,Tipo):- despedida(S0,_,Tipo).

tipo1(S0,_,Tipo):- d_unica(Tipo,S0,_).
tipo2(S0,_,Tipo):-d_primera(Tipo,S0,S1), d_unica(Tipo,S1,_).

d_unica("gracias",["gracias"|S],S).
d_unica("adios",["adios"|S],S).
d_primera("gracias",["muchas"|S],S).




buscar([], _ , 0).
buscar(X , E , 1) :- sintomas_de(X, E).
buscar([X|Xs] , E , P) :- enfermedad(E) , buscar(X , E , S1) , buscar(Xs , E ,S2) , P is S1 + S2,!.