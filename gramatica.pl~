?- consult("Bases.pl").
%:- style_check(-singleton).
%--------------------------------------------
%Hechos simples
%--------------------------------------------
%Verifica si está en la lista
miembro(X,[X|_]).
miembro(X,[_|R]):- miembro(X,R).

concatenar([],L,L).
concatenar([X|M],L,[X|Z]):-concatenar(M,L,Z).

agregar(X,L1,[X|L1]).

cabeza([X,_],X).

que_tipo_es(Oracion,Accion):- start(Oracion,Accion).

start(Oracion,Y):- string_lower(Oracion,X), split_string(X, " ", "", L), inicio(Y,L,[]),!.
start(Oracion,Y):-  string_lower(Oracion,X),split_string(X, " ", "", L), fin(Y,L,[]),!.
start(Oracion,Y):- string_lower(Oracion,X), split_string(X, " ", "", L), pregunta(Y,L,[]),!.

%--------------------------------------------
%Mensajes predeterminados
%--------------------------------------------

mensaje("saludar", "DrLog: Cuénteme, en qué lo puedo ayudar?").
mensaje("adios", "DrLog: Hasta luego").
mensaje("gracias",  "DrLog: Con mucho gusto.").
mensaje("resultado", "DrLog: Usted padece de ").
mensaje("enfermedad", "DrLog: Usted padece de gripe").
mensaje("sintoma","sintoma").

:-op(900,fy,not).
%--------------------------------------------
%Saludos
%--------------------------------------------

inicio("saludar",S0,S):- saludo(Tipo,Num,S0,S1), nombre(S1,S).
saludo(Tipo,Num,S0,S):-  unica(Tipo,Num,S0,S).
saludo(Tipo,Num,S0,S):-  primera(Tipo,Num,S0,S1), segunda(Tipo,Num,S1,S).

unica(1,singular,["hola"|S],S).
primera(1,plural,["buenos"|S],S).
primera(1,singular,["buen"|S],S).


primera(2,plural,["buenas"|S],S).
segunda(1,plural,["dias"|S],S).

segunda(1,singular,["dia"|S],S).


segunda(2,plural,["tardes"|S],S).
segunda(2,plural,["noches"|S],S).
nombre(["drlog"|S],S).
nombre(["doctor"|S],S).
nombre(["dr"|S],S).

%--------------------------------------------
%Finalizar
%--------------------------------------------

%["muchas","gracias"]
fin(Tipo,S0,S):-despedida(Tipo,S0,S1), nombre(S1,S).
despedida(Tipo,S0,S):- d_unica(Tipo,S0,S).
despedida(Tipo,S0,S):-d_primera(Tipo,S0,S1), d_unica(Tipo,S1,S).
d_unica("gracias",["gracias"|S],S).
d_unica("adios",["adios"|S],S).
d_primera("gracias",["muchas"|S],S).


%--------------------------------------------
%Preguntas
%--------------------------------------------

%Pronombre + sujeto + verbo
pregunta(Consulta,S0,S):- pronombre(Num,Tipo,S0,S1), sujeto(Num,Tipo,Consulta,S1,S2), verbo(Num,Tipo,_,S2,S).
%Pronombre + verbo + sujeto
pregunta(Consulta,S0,S):-pronombre(Num,Tipo,S0,S1), verbo(Num,Tipo,_,S1,S2), sujeto(Num,Tipo,Consulta,S2,S).
%Pronombre + verbo compuesto

pregunta(Consulta,S0,S):- pronombre(Num,Tipo,S0,S1), verbo(Num,Tipo,_,S1,S2), verbo(Num,Tipo,_,S2,S).
%Pronombre + verbo + articulo + sujeto
pregunta(Consulta,S0,S):- pronombre(Num,Tipo,S0,S1), verbo(Num,Tipo,_,S1,S2), articulo(Num,Tipo,S2,S3), sujeto(Num,Tipo,Consulta,S3,S).
%Pronombre + verbo + nombre
pregunta(Consulta,S0,S):- pronombre(Num,Tipo,S0,S1), verbo(Num,Tipo,Consulta,S1,S2), nombre(S2,S).

% Pronombre + verbo + articulo + sujeto + preposicion + articulo +
pregunta(Consulta,S0,S):- pronombre(Num,Tipo,S0,S1), verbo(Num,Tipo,_,S1,S2), articulo(Num,Tipo,S2,S3),sujeto(Num,Tipo,Consulta,S3,S4), preposición(S4,S5), articulo(S5,S), cabeza(S,S6), enfermedad(S6).


% enfermedad

pronombre(singular,1,["¿qué"|S],S).
pronombre(singular,1,["qué"|S],S).

pronombre(plural,2,["¿cuáles"|S],S).
pronombre(plural,2,["cuáles"|S],S).

pronombre(singular,1,["¿cuál"|S],S).
pronombre(singular,1,["cuál"|S],S).

pronombre(singular,3,["¿cómo"|S],S).
pronombre(singular,3,["cómo"|S],S).

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
verbo(singular,3,_,["prevenirla"|S],S).
verbo(singular,3,_,["prevenirla?"|S],S).

articulo(plural,2,["las"|S],S).
articulo(singular,1,["el"|S],S).
articulo(singular,1,["la"|S],S).
articulo(["la"|S],S).

preposición(["de"|S],S).

%--------------------------------------------
%Obtener sintomas
%--------------------------------------------
verbo(["tengo"|S],S).
tengo_sintomas(Lista,Lista,[],[]).
tengo_sintomas(Lista,Sintomas,S0,S):- verbo(S0,S1), sintoma(Lista,S1,S),!.

sintoma(Lista,[S0|S],S):- atom_string(Atom, S0), sintomas(Atom), agregar(S0,[],Lista).

%--------------------------------------------
%Conversacion
%--------------------------------------------
obtener_tipo(X,Mensaje):-
    atom_string(X,Y),
    que_tipo_es(Y,Z),
    mensaje(Z,Mensaje).

accion("sintoma",Lista):-
    repeat,(
    nl,
    write("Paciente: "),
    read(Y),
    obtener_tipo(Y,Men),
    write(Men)).




start(_Lista):-
    write("Paciente: "),
    read(X),
    obtener_tipo(X,Mensaje),
    write(Mensaje),
    repeat,(
    nl,
    write("Paciente: "),
    read(Y),
    obtener_tipo(Y,Men),
    accion(Men,Y),
    write("Ok")).

