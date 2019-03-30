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
%Preguntas
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


pregunta(S0,_,S1):-cabeza(S0,"tengo",S1),!.
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
sujeto(singular,3,"tratamiento",["tratarla"|S],S).
sujeto(singular,3,"tratamiento",["tratarlo"|S],S).
sujeto(singular,3,"tratamiento",["tratar"|S],S).


sujeto(singular,3,"prevencion",["prevenirla"|S],S).
sujeto(singular,3,"prevencion",["prevenirla?"|S],S).
sujeto(singular,3,"prevencion",["prevenir"|S],S).

verbo(singular,1,_,["tengo?"|S],S).
verbo(singular,1,_,["tengo"|S],S).
verbo(plural,2,_,["son"|S],S).
verbo(singular,1,_,["es"|S],S).

verbo(singular,3,_,["puedo"|S],S).
verbo(singular,3,_,["puede"|S],S).



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
%Causas
%----------------------------------
listar_causas:- enfermo_de(X), findall(Z,causas_de(Z,X),L), write("DrLog: La "), write(X), write(" puede ser causada por "),cabeza(L,C,R), listar_causas(C,R).
listar_causas(Head,[]):- write("y "),write(Head), write(".") .
listar_causas(Head,Resto):- write(Head), write(", "), cabeza(Resto,C,R),listar_causas(C,R).

%----------------------------------
%Prevencion
%----------------------------------
listar_prevencion:- enfermo_de(X), findall(Z,prevencion_de(Z,X),L), write("DrLog: Para la "), write(X), write(" se recomienda que "),cabeza(L,C,R), listar_causas(C,R).
listar_prevencion(Head,[]):- write("y "),write(Head), write(".") .
listar_prevencion(Head,Resto):- write(Head), write(", "), cabeza(Resto,C,R),listar_prevencion(C,R).
%----------------------------------
%Tratamiento
%----------------------------------
listar_tratamiento:- enfermo_de(X), findall(Z,tratamiento_de(Z,X),L), write("DrLog: La "), write(X), write(" se puede tratar con "),cabeza(L,C,R), listar_causas(C,R).
listar_tratamiento(Head,[]):- write("y "),write(Head), write(".") .
listar_tratamiento(Head,Resto):- write(Head), write(", "), cabeza(Resto,C,R),listar_tratamiento(C,R).

%----------------------------------
%Mensajes para DrLog
%----------------------------------
mensaje("saludo"):- write("DrLog: Cuénteme, en qué lo puedo ayudar?").
mensaje("adios"):-  write("DrLog: Hasta luego"), fail.
mensaje("gracias"):- write("DrLog: Con mucho gusto, nos vemos pronto."), fail.
mensaje("enfermedad"):- (enfermo_de(X)-> write("DrLog: Usted padece de "), write(X)); mensaje("nulo").
mensaje("nulo"):- write("DrLog: Debe ingresar sus sintomas").
mensaje("enfermo"):- write("DrLog: Usted padece de ").

mensaje(Lista):- is_list(Lista),validar(Lista,_).
mensaje("false"):- write("DrLog: No te entiendo, vuelve a escribirlo").
mensaje("existe"):- write("DrLog: Ese sintoma ya me lo has dicho").
mensaje("primero"):- write("DrLog: ¿Que otro síntoma presenta?").
mensaje("segundo"):- write("DrLog: ¿Que otro síntoma presenta? Al menos requiero 3 síntomas para dar un diagnóstico.").
mensaje("desconocido"):- write("DrLog: Puede que estés enfermo,pero no estoy entrenado para eso aún").
mensaje("causas"):- listar_causas.
mensaje("tratamiento"):- listar_tratamiento.
mensaje("prevencion"):-listar_prevencion.
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
resetall:- reset, retractall(enfermo_de(_)).
validar(Sintomas, Enfermedad):- terms(2),findall(S,sint(S),Lista),append(Sintomas,Lista,C),(not(guardar(Sintomas,_))->mensaje("existe");(buscar(C,Enfermedad,_), mensaje("enfermo"), write(Enfermedad),retractall(enfermo_de(_)), assert(enfermo_de(Enfermedad)),reset);mensaje("desconocido"),reset).
validar(Sintomas,_):- terms(1),(not(guardar(Sintomas,_))->mensaje("existe");mensaje("segundo")),!.
validar(Sintomas,_):- terms(0),resetall,(not(guardar(Sintomas,_))->mensaje("existe");mensaje("primero")),!.
guardar([],0).
guardar(Sintomas,Len):- cabeza(Sintomas,C,R),(not(sint(C))-> (assert(sint(C)),terms(X),guardar(R,Len1),retractall(terms(_)), Len is Len1 +1+X,assert(terms(Len)))),!.

start:-
    resetall,
    repeat,
    not (nl,
    write("Paciente: "),
    read(Z),
    atom_string(Z,L),
    oracion(L,Mensaje2),
    mensaje(Mensaje2)).
