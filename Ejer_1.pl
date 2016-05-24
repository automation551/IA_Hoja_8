%Ejer 1,2
preguntaVerbo:-
	write("verbo: "),
	read(V),
	verbo(I,T,P,N,[V],[]),
	write(I), write(T), write(P), write(N).

preguntaConcor:-
	write("Pronombre: "),
	read(P),
	write("verbo: "),
	read(V),
	concuerda([P,V],[]).

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

	%Diccionario
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
