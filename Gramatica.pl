%Saludar

inicio --> saludo(Tipo,Num), nombre.
saludo(Tipo,Num) --> unica.
saludo(Tipo,Num) --> primera(Tipo,Num), segunda(Tipo,Num).

unica --> ["Hola"].
primera(1,plural) --> ["Buenos"].
primera(1,plural) --> ["buenos"].

primera(1,singular) --> ["Buen"].
primera(1,singular) --> ["buen"].

primera(2,plural) --> ["Buenas"].
primera(2,plural) --> ["buenas"].

segunda(1,plural) --> ["dias"].

segunda(1,singular) --> ["Dia"].


segunda(2,plural) --> ["tardes"].
segunda(2,plural) --> ["noches"].
nombre --> ["DrLog"].
nombre --> ["drlog"].
nombre --> ["Doctor"].
nombre --> ["doctor"].
nombre --> ["Dr"].
nombre --> ["dr"].


%Finalizar

fin --> despedida, nombre.
despedida --> d_unica.
despedida --> d_primera, d_segunda.
d_unica --> ["Gracias"].
d_unica --> ["Adios"].
d_primera --> ["Muchas"].
d_segunda --> ["gracias"].



%Preguntas
