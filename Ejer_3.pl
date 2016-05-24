
%Ejer 3
%David habla con Ana.
%Julia lee libros en el jardín.
%Los niños leen.
%Pedro juega.
%Elvira juega en la piscina.

frase --> grupo_nominal.
grupo_nominal --> nombre_propio.
grupo_nominal -->  determinante(G,N), sustantivo(G,N).

concuerda -->
	pronombre(Persona,Numero),
	verbo(_,_,Persona,Numero).

pronombre(Persona, Numero) --> [P],
	{
		es_pronombre(P, Persona, Numero)
	}.

verbo(Infinitivo, Tiempo, Persona, Numero) --> [V],
	{
		atom_concat(Raiz,Terminacion,V),
		es_raiz(Raiz, Infinitivo),
		es_terminacion(Terminacion, Tiempo, Persona, Numero)
	}.

determinante(G,N)--> [D],
	{
		es_determinante(D,G,N)
	}.

sustantivo(G,N) --> [S],
	{
		atom_concat(Morfema,Lexema,S),
		es_morfema(Morfema),
		es_lexema(Lexema,G,N)
	}.


nombre_propio--> [pedro].
nombre_propio--> [david].
nombre_propio--> [julia].
nombre_propio--> [elvira].

es_morfema(nin).
es_morfema(perr).

es_lexema(o,singular,masculino).
es_lexema(a,singular,masculino).
es_lexema(os,plural,masculino).
es_lexema(as,plural,masculino).

es_determinante(el,singular,masculino).
es_determinante(la,singular,femenino).
es_determinante(los,plural,masculino).
es_determinante(las,plural,femenino).

es_raiz(habl,hablar).
es_raiz(cant,cantar).

es_terminacion(o, presente, 1, singular).
es_terminacion(as, presente, 2, singular).
es_terminacion(a, presente, 3, singular).
es_terminacion(amos, presente, 1, plural).
es_terminacion(ais, presente, 2, plural).
es_terminacion(an, presente, 3, plural).

es_pronombre(yo, 1, singular).
es_pronombre(tu, 2, singular).
es_pronombre(el, 3, singular).
es_pronombre(nosotros, 1, plural).
es_pronombre(vosotros, 2, plural).
es_pronombre(ellos, 3, plural).