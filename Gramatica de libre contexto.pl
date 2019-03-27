inicio(S0,S):- sintagma_nominal(S0,S).

sintagma_nominal(S0,S):- determinante(S0,S1), nombre(S1,S).


determinante(["hola"|S],S).
determinante(["buenos dias"|S],S).
determinante(["buenas noches"|S],S).
determinante(["buenas tardes"|S],S).
determinante(["Hola"|S],S).
determinante(["Buenos dias"|S],S).
determinante(["Buenas noches"|S],S).
determinante(["Buenas tardes"|S],S).


nombre(["DrLog"|S],S).
nombre(["Doctor"|S],S).
nombre(["drlog"|S],S).
nombre(["doctor"|S],S).



