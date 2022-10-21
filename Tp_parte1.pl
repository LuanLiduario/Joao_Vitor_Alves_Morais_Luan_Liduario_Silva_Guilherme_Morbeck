%1-
% A. Um predicado que insira um elemento no final da lista:

%Elemento � o elemento que deseja adicionar na lista
insereFim(Elemento,[],[Elemento]).%Caso a lista esteja vazia apenas insere Elemento na lista
insereFim( Elemento,[Cabeca|Lista],[Cabeca|Lista2]):-
    insereFim(Elemento,Lista,Lista2).%Retira a cabe�a da lista at� que a lista esteja vazia

%Predicados utilizados nos predicados de B , C , H:

separarListaN([CABECA|Lista],N,[CABECA|RestoNovo],RestoResultante):-
%Para dividir a Lista, vamos retirando a cabe�a dela e colocando em outra lista at� que N seja 0
    N>0,%Quando N chega a 0 significa que encontramos o ponto de divis�o, ent�o a lista que estava recebendo a cabe�a � a primeira
    Nnovo is N-1,%parte da divis�o e o resto � a segunda parte da divis�o.
    separarListaN(Lista,Nnovo,RestoNovo,RestoResultante).
separarListaN(Lista,0,[],Lista).

concatenar([],Lista,Lista).%Quando a lista estiver vazia o resultado � ela mesma
concatenar([Cabeca|ListaInicial1],ListaInicial2,[Cabeca|ListaResultante]):-
    concatenar(ListaInicial1,ListaInicial2,ListaResultante).
% De Acordo que percorremos a lista inicial 1 a cabe�a desta lista �
% inserida em outra lista resultante e retirada da lista inicial 1 na
% proxima chamada de concatenar, depois o mesmo processo � feito na
% lista inicial 2.

% B. Um predicado que insira um elemento em uma determinada posi��o da
% lista:

insereN(X,N,ListaInicial,ListaResultante):-%X � o elemento que deseja adicionar na lista.
    concatenar(ListaParte1nova,ListaParte2,ListaResultante),%N � a posi��o que deseja adicionar o elemento.
    insereFim(X,ListaParte1,ListaParte1nova),
    N1 is N-1,
    separarListaN(ListaInicial,N1,ListaParte1,ListaParte2).
% Para inserir em determinado lugar, N, na lista primeiro dividimos a
% lista em N - 1, pois quando inserimos no fim da primeira parte da
% lista inicial , X assumira a posi��o N, depois juntamos a primeira
% parte com X inserido ao fim dela a segunda parte da lista

% C. Um predicado que remova um elemento em uma determinada posi��o da
% lista:

removeN(N,ListaInicial,ListaResultante):-%N � a posi��o que deseja excluir.
    concatenar(ListaParte1,ListaParte2,ListaResultante),
    separarListaN(ListaInicial,N,_,ListaParte2),
        N1 is N-1,%N � a posi��o que deseja remover da lista.
    separarListaN(ListaInicial,N1,ListaParte1,_).
% Primeiro dividimos a lista na posi��o N, para obter a parte da lista
% depois de N, ou seja em uma lista [1,2,3], se dividir na posi��o
% N=2 uma parte ser� [1,2] e a outra ser� [3], ou seja [3] � a parte da
% lista depois da posi��o que desejo remover.
% Depois dividimos a lista na posi��o N-1,para obter a parte da lista
% antes de N, ou seja em uma lista [1,2,3], se dividir na posi��o N=2-1
% uma parte da lista ser� [1] e a outra [2,3], ou seja [1] � a parte da
% lista antes da posi��o que desejo remover.
% E por ultimo juntamos as duas partes da lista, antes e depois de
% N,para resultar em uma lista sem a posi��o N.

% D. Um predicado que forne�a a intersec��o de duas listas:

intersecao(_,_,[]).%Condi��o de parada
intersecao([Elem|Corpo],Lista,[Elem|Resto]):-%Verifica se o Elem esta nas duas lista se sim � adicionado em uma terceira lista.
	verificar_elemento(Elem,Lista),
	intersecao(Corpo,Lista,Resto).
intersecao([_|Elem],Lista,X):-%Pega o resto da lista e chama intersecao de novo, apenas com o Resto
	intersecao(Elem,Lista,X).

% E. Um predicado que identifique se um conjunto de elementos est�
% contido em uma lista (os elementos do conjunto podem estar em qualquer
% ordem na lista):
%NAO TA PRONTO

verificar_elemento(Elem,[Elem|_]).%Verifica se Elem � um elemento da lista,se � a cabe�a ou se esta no corpo
verificar_elemento(Elem,[_|Corpo]):-
    verificar_elemento(Elem,Corpo).%para isso percorremos a lista verificando.

verificar_conjunto([],_).%Condi��o de parada
verificar_conjunto([Cabeca|Resto],Lista):-%Verificamos a cabe�a da lista,e chamamos a fun��o de novo mandando somente o resto
    verificar_elemento(Cabeca,Lista),%Verifica se o elemento (a cabeca) esta na lista.
    verificar_conjunto(Resto,Lista).

% F. Um predicado que retorne o maior valor contido em uma lista
% num�rica:
maior_elemento([Elem],Elem).%Procura o maior Elem(elemento) de uma lista num�rica
maior_elemento([Elem|Resto],NovoMaior):-maior_elemento(Resto,Maior),
	(Elem>Maior -> NovoMaior=Elem;%Se o Elem for maior que Maior, O NovoMaior recebe este elemento,caso n�o seja
        %NovoMaior recebe Maior.
	NovoMaior=Maior).

% G. Um predicado denominado ordena(X, Y) onde Y � uma vers�o ordenada
% da lista X:

ordena(X,Y):-elemento(X,[],Y).%Para ordenar escolhemos o metodo de ordena��o por inser��o

elemento([],Elem,Elem).%O predicado pega o elemento que ser� inserido na lista ordenada
elemento([Cabeca|Corpo],Elem,Ordenar):-
    inserir_lista_ordenada(Cabeca,Elem,NovoElem),
    elemento(Corpo,NovoElem,Ordenar).

inserir_lista_ordenada(Elem,[Cabeca|Corpo],[Cabeca|Novocorpo]):-
    Elem>Cabeca,%Verifica se o elemento que ser� inserido � maior ou menor ou igual a cabe�a da lista ordenada
    inserir_lista_ordenada(Elem,Corpo,Novocorpo).
inserir_lista_ordenada(Elem,[Cabeca|Corpo],[Elem,Cabeca|Corpo]):-
    Elem=<Cabeca.
inserir_lista_ordenada(Elem,[],[Elem]).%Depois de verificar onde o elemento ser� inserido na lista ordenada, o elemento ser� inserido

% H. Um predicado para obter a soma dos N primeiros n�meros naturais:

soma([],0).%definimos um predicado que soma os elementos de uma lista
soma([Elem|Corpo],Soma):-%Nele percorre a lista somando os elementos a Soma.
    soma(Corpo,SomaNova),
    Soma is SomaNova+Elem.

somaN(Lista,N,Soma):-%Ent�o utilizamos o predicado que divide a lista na posi��o N,tal predicado j� foi definido a cima.
     separarListaN(Lista,N,ListaSoma,_),%Depois de utilizar o predicado de divis�o na posi��o N, utilizamos o predicado soma para realizar a soma da lista resu%ltante da divis�o da lista.
     soma(ListaSoma,Soma).

% I. Escreva um predicado denominado pal�ndromo(X) que � verdadeiro se X � uma
%lista cujos elementos invertidos produzem a mesma ordem original:

palindromo(X) :- inverterString(X, X).%Se obter o mesmo resultado inverter String e palindromo ent�o se retorna true, caso contr�rio retorna false
inverterString([],[]).
inverterString([Elem|Corpo],X):-%A lista � invertida, concatenando a cabe%�a ap�s inverter o corpo
    inverterString(Corpo,Corpo1),
    concatenar(Corpo1,[Elem],X).

% J. Escreva um predicado denominado acomoda/2 cujo primeiro argumento � uma
% lista permitindo listas como elementos (ex.[a,[a,b,c]],b,[c,d]]) E cujo segundo
% argumento � outra lista com todos os elementos da primeira acomodados
% em uma
% �nica lista (ex. [a, a, b, c, b, c, d]:

acomoda([],[]).%Condi��o de parada
acomoda(Elem,[Elem]):-
    Elem\=[],%Verifica se a lista � diferente de vazia
    Elem\=[_|_].
acomoda([Cabeca|Corpo],ListaResultante):-
    acomoda(Corpo,Lista2),%mandamos apenas o corpo para acomoda
    acomoda(Cabeca,Lista1),%mandamos apenas a cebe�a para acomoda
    concatenar(Lista1,Lista2,ListaResultante).%Juntamos as listas em uma terceira lista
