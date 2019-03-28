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

fin("despedirse") --> despedida, nombre.
despedida --> d_unica.
despedida --> d_primera, d_unica.
d_unica --> ["gracias"].
d_unica --> ["adios"].
d_primera --> ["muchas"].



%Preguntas
%Pronombre + sujeto + verbo
pregunta(Consulta) --> pronombre(Num,Tipo), sujeto(Num,Tipo,Consulta), verbo(Num,Tipo).
%Pronombre + verbo + sujeto
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo), sujeto(Num,Tipo,Consulta).
%Pronombre + verbo compuesto

pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo), verbo(Num,Tipo).
%Pronombre + verbo + articulo + sujeto
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo), articulo(Num,Tipo), sujeto(Num,Tipo,Consulta).
%Pronombre + verbo + nombre
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo), nombre.

% Pronombre + verbo + articulo + sujeto + preposicion + articulo +
pregunta(Consulta) --> pronombre(Num,Tipo), verbo(Num,Tipo), articulo(Num,Tipo),sujeto(Num,Tipo,Consulta), preposición, articulo, enfermedad.

% enfermedad
pronombre(singular,1) --> ["¿qué"]; ["qué"].
pronombre(plural,2) --> ["¿cuáles"]; ["cuáles"].
pronombre(singular,1) --> ["¿cuál"]; ["cuál"].
pronombre(singular,3) --> ["¿cómo"];["cómo"].


sujeto(singular,1,"enfermedad") --> ["enfermedad"].
sujeto(plural,2,"causas") --> ["causas?"]; ["causas"].
sujeto(singular,1,"tratamiento") --> ["tratamiento?"]; ["tratamiento"].
sujeto(singular,3,"prevencion") --> ["prevenirla"]; ["prevenirla?"];["prevenir"].

verbo(singular,1) -->  ["tengo?"]; ["tengo"].
verbo(plural,2) --> ["son"].
verbo(singular,1) --> ["es"].
verbo(singular,3) --> ["puedo"].
verbo(singular,3) --> ["prevenirla?"]; ["prevenirla"].

articulo(plural,2) --> ["las"].
articulo(singular,1) --> ["el"].
articulo(singular,1) --> ["la"].
articulo --> ["la"].
preposición --> ["de"].




