?- consult("Bases.pl").
%Hechos simples
%Verifica si está en la lista
miembro(X,[X|_]).
miembro(X,[_|R]):- miembro(X,R).

que_tipo_es(Oracion,Accion):- start(Oracion,Accion).

start(Oracion,Y):- string_lower(Oracion,X), split_string(X, " ", "", L), phrase(inicio(Y), L),!.
start(Oracion,Y):-  string_lower(Oracion,X),split_string(X, " ", "", L), phrase(fin(Y), L),!.
start(Oracion,Y):- string_lower(Oracion,X), split_string(X, " ", "", L), phrase(pregunta(Y), L),!.


inicio("saludar") --> saludo(Tipo,Num), nombre.
saludo(Tipo,Num) --> unica.
saludo(Tipo,Num) --> primera(Tipo,Num), segunda(Tipo,Num).

unica --> ["Hola"]; ["hola"].
primera(1,plural) --> ["Buenos"]; ["buenos"].


primera(1,singular) --> ["Buen"]; ["buen"].


primera(2,plural) --> ["Buenas"]; ["buenas"].
segunda(1,plural) --> ["dias"].

segunda(1,singular) --> ["Dia"].


segunda(2,plural) --> ["tardes"].
segunda(2,plural) --> ["noches"].
nombre --> ["DrLog"]; ["drlog"]; ["Doctor"]; ["doctor"]; ["Dr"];["dr"].

%Finalizar

fin(Tipo) --> despedida(Tipo), nombre.
despedida(Tipo) --> d_unica(Tipo).
despedida(Tipo) --> d_primera(Tipo), d_unica(Tipo).
d_unica("gracias") --> ["gracias"].
d_unica("adios") --> ["adios"].
d_primera("gracias") --> ["muchas"].



%Preguntas
%Pronombre + sujeto + verbo
pregunta(Consulta) --> pronombre(Num,Tipo), sujeto(Num,Tipo,Consulta), verbo(Num,Tipo,_).
%Pronombre + verbo + sujeto
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo,_), sujeto(Num,Tipo,Consulta).
%Pronombre + verbo compuesto

pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo,_), verbo(Num,Tipo,_).
%Pronombre + verbo + articulo + sujeto
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo,_), articulo(Num,Tipo), sujeto(Num,Tipo,Consulta).
%Pronombre + verbo + nombre
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo,_), nombre.

% Pronombre + verbo + articulo + sujeto + preposicion + articulo +
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo,_), articulo(Num,Tipo),sujeto(Num,Tipo,Consulta), preposición, articulo, enfermedad.
pregunta(Consulta) --> verbo(Num,Tipo,Consulta), sintomas.

% enfermedad
pronombre(singular,1) --> ["¿qué"]; ["qué"].
pronombre(plural,2) --> ["¿cuáles"]; ["cuáles"].
pronombre(singular,1) --> ["¿cuál"]; ["cuál"].
pronombre(singular,3) --> ["¿cómo"];["cómo"].


sujeto(singular,1,"enfermedad") --> ["enfermedad"].
sujeto(plural,2,"causas") --> ["causas?"]; ["causas"].
sujeto(singular,1,"tratamiento") --> ["tratamiento?"]; ["tratamiento"].
sujeto(singular,3,"prevencion") --> ["prevenirla"]; ["prevenirla?"];["prevenir"].

verbo(singular,1,_) -->  ["tengo?"].
verbo(singular,1,"sintoma") -->  ["tengo"].
verbo(plural,2,_) --> ["son"].
verbo(singular,1,_) --> ["es"].
verbo(singular,3,_) --> ["puedo"].
verbo(singular,3,_) --> ["prevenirla?"]; ["prevenirla"].

articulo(plural,2) --> ["las"].
articulo(singular,1) --> ["el"].
articulo(singular,1) --> ["la"].
articulo --> ["la"].
preposición --> ["de"].


mensaje("saludar", "DrLog: Cuénteme, en qué lo puedo ayudar?").
mensaje("adios", "DrLog: Hasta luego").
mensaje("gracias",  "DrLog: Con mucho gusto.").
mensaje("resultado", "DrLog: Usted padece de ").
mensaje("enfermedad", "DrLog: Usted padece de gripe").
mensaje("sintoma","sintoma").
:-op(900,fy,not).

obtener_tipo(X,Mensaje):-
    atom_string(X,Y),
    que_tipo_es(Y,Z),
    mensaje(Z,Mensaje).
es_sintoma([_|A], "sintoma",[A|Resto]).

start:-
    start([]).

start(Lista):-
     write("Paciente: "),
    read(X),
    obtener_tipo(X,Mensaje),
    write(Mensaje),
    repeat,not (
    nl,
    write("Paciente: "),
    read(Y),
    obtener_tipo(Y,Men),
    es_sintoma(Y, Men,[A|_]),
    write(A)).

