start(Oracion):- string_lower(Oracion,X), split_string(X, " ", "", L), phrase(inicio, L).
start(Oracion):-  string_lower(Oracion,X),split_string(X, " ", "", L), phrase(fin, L).
start(Oracion):- string_lower(Oracion,X), split_string(X, " ", "", L), phrase(pregunta, L).
%Saludar

inicio --> saludo(Tipo,Num), nombre.
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

fin --> despedida, nombre.
despedida --> d_unica.
despedida --> d_primera, d_segunda.
d_unica --> ["Gracias"].
d_unica --> ["Adios"].
d_primera --> ["Muchas"].
d_segunda --> ["gracias"].



%Preguntas
%Pronombre + sujeto + verbo
pregunta --> pronombre(Num,Tipo), sujeto(Num,Tipo), verbo(Num,Tipo).
%Pronombre + verbo compuesto
pregunta --> pronombre(Num,Tipo), verbo(Num,Tipo), verbo(Num,Tipo).
%Pronombre + verbo + articulo + sujeto
pregunta --> pronombre(Num,Tipo), verbo(Num,Tipo), articulo(Num,Tipo), sujeto(Num,Tipo).
%Pronombre + verbo + nombre
pregunta --> pronombre(Num,Tipo), verbo(Num,Tipo), nombre.
% Pronombre + verbo + articulo + sujeto + preposicion + articulo +
% pregunta --> pronombre(Num,Tipo), verbo(Num,Tipo), articulo(Num,Tipo),
% sujeto(Num,Tipo), preposición, articulo(Num2,Tipo2), enfermedad.

% enfermedad
pronombre(singular,1) --> ["¿Qué"]; ["Qué"].
pronombre(plural,2) --> ["¿Cuáles"]; ["Cuáles"].
pronombre(singular,1) --> ["¿Cuál"]; ["Cuál"].
pronombre(singular,3) --> ["¿Cómo"];["Cómo"].


sujeto(singular,1) --> ["enfermedad"].
sujeto(plural,2) --> ["causas?"]; ["causas"].

sujeto(singular,1) --> ["tratamiento?"]; ["tratamiento"].

verbo(singular,1) -->  ["tengo?"]; ["tengo"].
verbo(plural,2) --> ["son"].
verbo(singular,1) --> ["es"].
verbo(singular,3) --> ["puedo"].
verbo(singular,3) --> ["prevenirla?"]; ["prevenirla"].

articulo(plural,2) --> ["las"].
articulo(singular,1) --> ["el"].
articulo(singular,1) --> ["la"].

preposición --> ["de"].

