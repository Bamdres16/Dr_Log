?- consult("Bases.pl").
:- dynamic terms/1.
:- dynamic sint/1.
:- dynamic enfermo_de/1.
:-op(900,fy,not).

%--------------------------------------------
%Hechos y reglas simple
%--------------------------------------------
%Verifica si está en la lista
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
oracion(_,"false").
%----------------------------------
%BNF, Reconoce las palabras clave
%----------------------------------
%----------------------------------
%----------------------------------
%Pregunta
%----------------------------------

%Responde es que me está preguntando el usuario
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
pregunta(S0,S,S6):- pronombre_int(Num,Relacion,S0,S1), verbo(Num,Relacion,_,S1,S2), articulo(Num,Relacion,S2,S3),sujeto(Num,Relacion,_,S3,S4), preposición(S4,S5), articulo(S5,S), cabeza(S,S6,_), atom_string(Atom, S6), enfermedad(Atom).
pregunta(S0,_,S1):- verbo(_,_,_,S0,S1),!.

pregunta([_|S0],_,Tipo):- pregunta(S0,_,Tipo).


pronombre_int(singular,1,["¿qué"|S],S).
pronombre_int(singular,1,["qué"|S],S).

pronombre_int(plural,2,["¿cuáles"|S],S).
pronombre_int(plural,2,["cuáles"|S],S).

pronombre_int(singular,1,["¿cuál"|S],S).
pronombre_int(singular,1,["cuál"|S],S).

pronombre_int(singular,3,["¿cómo"|S],S).
pronombre_int(singular,3,["cómo"|S],S).

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

preposición(["de"|S],S).


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




%----------------------------------
%Acomodar sintomas
%----------------------------------



%----------------------------------
%Mensajes para DrLog
%----------------------------------
mensaje("saludo"):- write("DrLog: Cuénteme, en qué lo puedo ayudar?").
mensaje("adios"):-  write("DrLog: Hasta luego"), fail.
mensaje("gracias"):- write("DrLog: Con mucho gusto, nos vemos pronto."), fail.
mensaje("enfermedad"):- write("DrLog: Usted padece de ").
mensaje(Lista):- is_list(Lista),validar(Lista,_).
mensaje("false"):- write("DrLog: No te entiendo, vuelve a escribirlo").
mensaje("existe"):- write("DrLog: Ese sintoma ya me lo has dicho").
mensaje("primero"):- write("DrLog: ¿Que otro síntoma presenta?").
mensaje("segundo"):- write("DrLog: ¿Que otro síntoma presenta? Al menos requiero 3 síntomas para dar un diagnóstico.").

%----------------------------------
%Deduce que enfermedad tiene
%----------------------------------
buscar([], _ , 0).
buscar(X , E , 1) :-sintomas_de(X, E).
buscar([X|Xs] , E , P) :- enfermedad(E) , atom_string(Atom,X), buscar(Atom , E , S1)  , buscar(Xs , E ,S2) , P is S1 + S2,!.



%----------------------------------
%Conversacion
%----------------------------------
terms(0).
reset:-  retractall(sint(X)),retractall(terms(X)),assert(terms(0)).

validar(Sintomas, Enfermedad):- terms(X), X = 2,(not(guardar(Sintomas,_))->mensaje("existe");buscar(Sintomas,Enfermedad,_), mensaje("enfermedad"), write(Enfermedad),retractall(enfermo_de(Enfermedad)), assert(enfermo_de(Enfermedad)),reset).
validar(Sintomas,_):- terms(X), X = 1,(not(guardar(Sintomas,_))->mensaje("existe");mensaje("segundo")),!.
validar(Sintomas,_):- terms(X), X = 0,(not(guardar(Sintomas,_))->mensaje("existe");mensaje("primero")),!.
guardar([],0).
guardar(Sintomas,Len):- cabeza(Sintomas,C,R), (not(sint(C))-> (assert(sint(C)),terms(X),guardar(R,Len1),retractall(terms(_)), Len is Len1 +1+X,assert(terms(Len)))),!.


start:-
    reset,
    repeat,
    not (nl,
    write("Paciente: "),
    read(Z),
    oracion(Z,Mensaje2),
    mensaje(Mensaje2)).










