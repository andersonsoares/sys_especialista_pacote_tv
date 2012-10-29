%% Sistema Especialista para Recomendacao de um Pacote de Televisao
%% Disciplina: Inteligencia Artificial - Vinicius Ponte Machado
%% Autor: Anderson Soares - 08n10398

%% Para iniciar:
%% 		?- inicio.

inicio :- 	procurar(Pacote),
      		write('O pacote que mais combina com voce eh: '),
      		/*write(Pacote),*/
      		nl,
	  		descrever(Pacote),
			desfazerTodasRespostas.

/* Casos */
procurar(completo) 			:- completo, !.
procurar(mega_esportes) 	:- mega_esportes, !. 	/*filmes+luta+futebol*/
procurar(mega)				:- mega, !. 			/*futebol+filmes*/
procurar(mega_adulto)		:- mega_adulto, !. 		/*filmes + adulto*/
procurar(basico_pro) 		:- basico_pro, !. 		/*filmes*/
procurar(basico).

/* Regras para identificacao de pacotes */
basico_pro :- 		verificar(filmes).

mega :-				verificar(filmes),
					verificar(futebol).
				
mega_esportes :-	verificar(filmes),
					verificar(futebol),
					verificar(lutas).

mega_adulto :-		verificar(filmes),
					verificar(sexo).

completo :- 		verificar(filmes),
					verificar(futebol),
					verificar(lutas),
					verificar(sexo).

/* Descricao de cada pacote */
descrever(basico) :- 		write('Pacote basico'), nl,
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento').
							
descrever(completo) :- 		write('Pacote completo'), nl,
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento'), nl, 
							write('30 canais de filmes incluindo TELECINE e HBO'), nl,
							write('20 canais de futebol com brasileirao 2013, UEFA Champions League'), nl,
							write('2 canais combate(UFC, MMA Brasil)'), nl,
							write('5 Canais adultos').
							
descrever(basico_pro) :- 	write('Pacote basico Pro'), nl,
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento'), nl, 
							write('30 canais de filmes incluindo TELECINE e HBO').

descrever(mega) :- 			write('Pacote Mega'), nl, 
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento'), nl, 
							write('30 canais de filmes incluindo TELECINE e HBO'), nl,
							write('20 canais de futebol com brasileirao 2013, UEFA Champions League').
						
descrever(mega_esportes) :- write('Pacote Mega Esportes'), nl, 
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento'), nl, 
							write('30 canais de filmes incluindo TELECINE e HBO'), nl,
							write('20 canais de futebol com brasileirao 2013, UEFA Champions League'), nl,
							write('2 canais combate(UFC, MMA Brasil)').
							
descrever(mega_adulto) :- write('Pacote Mega Adulto'), nl, 
							write('Contem Noticias Nacionais e Internacionais, programas infantis(desenhos) e mais 50 canais de entretenimento'), nl, 
							write('30 canais de filmes incluindo TELECINE e HBO'), nl,
							write('5 Canais adultos').


/* Aqui se faz a interacao com o usuario, realizando
	perguntas de acordo com o seu gosto
 */
perguntar(Pergunta) :-
    write('Voce gosta de : '),
    write(Pergunta),
    write('? '),
    read(Resposta),
    nl,
    ( (Resposta == sim ; Resposta == s)
      ->
       assert(sim(Pergunta)) ;
       assert(nao(Pergunta)), fail).

:- dynamic sim/1,nao/1.

verificar(S) :-
   (sim(S) 
    ->
    true ;
    (nao(S)
     ->
     fail ;
     perguntar(S))).

/* desfazer todas as respostas */
/* necessario para quando reiniciar o programa nao 'pegar' as respostas do programa que rodou anteriormente */
desfazerTodasRespostas :- retract(sim(_)),fail. 
desfazerTodasRespostas :- retract(nao(_)),fail.
desfazerTodasRespostas.
