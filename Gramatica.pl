%Saludar

inicio --> saludo(Gen,Num), nombre.
saludo(Gen,Num) --> unica.
saludo(Gen,Num) --> primera(Gen,Num), segunda(Gen,Num).

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

