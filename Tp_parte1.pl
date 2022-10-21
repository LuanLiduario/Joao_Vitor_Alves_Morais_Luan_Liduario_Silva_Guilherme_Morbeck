%1-
% A. Um predicado que insira um elemento no final da lista:

%Elemento é o elemento que deseja adicionar na lista
insereFim(Elemento,[],[Elemento]).%Caso a lista esteja vazia apenas insere Elemento na lista
insereFim( Elemento,[Cabeca|Lista],[Cabeca|Lista2]):-
    insereFim(Elemento,Lista,Lista2).%Retira a cabeça da lista até que a lista esteja vazia

%Predicados utilizados nos predicados de B , C , H:

separarListaN([CABECA|Lista],N,[CABECA|RestoNovo],RestoResultante):-
%Para dividir a Lista, vamos retirando a cabeça dela e colocando em outra lista até que N seja 0
    N>0,%Quando N chega a 0 significa que encontramos o ponto de divisão, então a lista que estava recebendo a cabeça é a primeira
    Nnovo is N-1,%parte da divisão e o resto é a segunda parte da divisão.
    separarListaN(Lista,Nnovo,RestoNovo,RestoResultante).
separarListaN(Lista,0,[],Lista).

concatenar([],Lista,Lista).%Quando a lista estiver vazia o resultado é ela mesma
concatenar([Cabeca|ListaInicial1],ListaInicial2,[Cabeca|ListaResultante]):-
    concatenar(ListaInicial1,ListaInicial2,ListaResultante).
% De Acordo que percorremos a lista inicial 1 a cabeça desta lista é
% inserida em outra lista resultante e retirada da lista inicial 1 na
% proxima chamada de concatenar, depois o mesmo processo é feito na
% lista inicial 2.

% B. Um predicado que insira um elemento em uma determinada posição da
% lista:

insereN(X,N,ListaInicial,ListaResultante):-%X é o elemento que deseja adicionar na lista.
    concatenar(ListaParte1nova,ListaParte2,ListaResultante),%N é a posição que deseja adicionar o elemento.
    insereFim(X,ListaParte1,ListaParte1nova),
    N1 is N-1,
    separarListaN(ListaInicial,N1,ListaParte1,ListaParte2).
% Para inserir em determinado lugar, N, na lista primeiro dividimos a
% lista em N - 1, pois quando inserimos no fim da primeira parte da
% lista inicial , X assumira a posição N, depois juntamos a primeira
% parte com X inserido ao fim dela a segunda parte da lista

% C. Um predicado que remova um elemento em uma determinada posição da
% lista:

removeN(N,ListaInicial,ListaResultante):-%N é a posição que deseja excluir.
    concatenar(ListaParte1,ListaParte2,ListaResultante),
    separarListaN(ListaInicial,N,_,ListaParte2),
        N1 is N-1,%N é a posição que deseja remover da lista.
    separarListaN(ListaInicial,N1,ListaParte1,_).
% Primeiro dividimos a lista na posição N, para obter a parte da lista
% depois de N, ou seja em uma lista [1,2,3], se dividir na posição
% N=2 uma parte será [1,2] e a outra será [3], ou seja [3] é a parte da
% lista depois da posição que desejo remover.
% Depois dividimos a lista na posição N-1,para obter a parte da lista
% antes de N, ou seja em uma lista [1,2,3], se dividir na posição N=2-1
% uma parte da lista será [1] e a outra [2,3], ou seja [1] é a parte da
% lista antes da posição que desejo remover.
% E por ultimo juntamos as duas partes da lista, antes e depois de
% N,para resultar em uma lista sem a posição N.

% D. Um predicado que forneça a intersecção de duas listas:

intersecao(_,_,[]).%Condição de parada
intersecao([Elem|Corpo],Lista,[Elem|Resto]):-%Verifica se o Elem esta nas duas lista se sim é adicionado em uma terceira lista.
	verificar_elemento(Elem,Lista),
	intersecao(Corpo,Lista,Resto).
intersecao([_|Elem],Lista,X):-%Pega o resto da lista e chama intersecao de novo, apenas com o Resto
	intersecao(Elem,Lista,X).

% E. Um predicado que identifique se um conjunto de elementos está
% contido em uma lista (os elementos do conjunto podem estar em qualquer
% ordem na lista):
%NAO TA PRONTO

verificar_elemento(Elem,[Elem|_]).%Verifica se Elem é um elemento da lista,se é a cabeça ou se esta no corpo
verificar_elemento(Elem,[_|Corpo]):-
    verificar_elemento(Elem,Corpo).%para isso percorremos a lista verificando.

verificar_conjunto([],_).%Condição de parada
verificar_conjunto([Cabeca|Resto],Lista):-%Verificamos a cabeça da lista,e chamamos a função de novo mandando somente o resto
    verificar_elemento(Cabeca,Lista),%Verifica se o elemento (a cabeca) esta na lista.
    verificar_conjunto(Resto,Lista).

% F. Um predicado que retorne o maior valor contido em uma lista
% numérica:
maior_elemento([Elem],Elem).%Procura o maior Elem(elemento) de uma lista numérica
maior_elemento([Elem|Resto],NovoMaior):-maior_elemento(Resto,Maior),
	(Elem>Maior -> NovoMaior=Elem;%Se o Elem for maior que Maior, O NovoMaior recebe este elemento,caso não seja
        %NovoMaior recebe Maior.
	NovoMaior=Maior).

% G. Um predicado denominado ordena(X, Y) onde Y é uma versão ordenada
% da lista X:

ordena(X,Y):-elemento(X,[],Y).%Para ordenar escolhemos o metodo de ordenação por inserção

elemento([],Elem,Elem).%O predicado pega o elemento que será inserido na lista ordenada
elemento([Cabeca|Corpo],Elem,Ordenar):-
    inserir_lista_ordenada(Cabeca,Elem,NovoElem),
    elemento(Corpo,NovoElem,Ordenar).

inserir_lista_ordenada(Elem,[Cabeca|Corpo],[Cabeca|Novocorpo]):-
    Elem>Cabeca,%Verifica se o elemento que será inserido é maior ou menor ou igual a cabeça da lista ordenada
    inserir_lista_ordenada(Elem,Corpo,Novocorpo).
inserir_lista_ordenada(Elem,[Cabeca|Corpo],[Elem,Cabeca|Corpo]):-
    Elem=<Cabeca.
inserir_lista_ordenada(Elem,[],[Elem]).%Depois de verificar onde o elemento será inserido na lista ordenada, o elemento será inserido

% H. Um predicado para obter a soma dos N primeiros números naturais:

soma([],0).%definimos um predicado que soma os elementos de uma lista
soma([Elem|Corpo],Soma):-%Nele percorre a lista somando os elementos a Soma.
    soma(Corpo,SomaNova),
    Soma is SomaNova+Elem.

somaN(Lista,N,Soma):-%Então utilizamos o predicado que divide a lista na posição N,tal predicado já foi definido a cima.
     separarListaN(Lista,N,ListaSoma,_),%Depois de utilizar o predicado de divisão na posição N, utilizamos o predicado soma para realizar a soma da lista resu%ltante da divisão da lista.
     soma(ListaSoma,Soma).

% I. Escreva um predicado denominado palíndromo(X) que é verdadeiro se X é uma
%lista cujos elementos invertidos produzem a mesma ordem original:

palindromo(X) :- inverterString(X, X).%Se obter o mesmo resultado inverter String e palindromo então se retorna true, caso contrário retorna false
inverterString([],[]).
inverterString([Elem|Corpo],X):-%A lista é invertida, concatenando a cabe%ça após inverter o corpo
    inverterString(Corpo,Corpo1),
    concatenar(Corpo1,[Elem],X).

% J. Escreva um predicado denominado acomoda/2 cujo primeiro argumento é uma
% lista permitindo listas como elementos (ex.[a,[a,b,c]],b,[c,d]]) E cujo segundo
% argumento é outra lista com todos os elementos da primeira acomodados
% em uma
% única lista (ex. [a, a, b, c, b, c, d]:

acomoda([],[]).%Condição de parada
acomoda(Elem,[Elem]):-
    Elem\=[],%Verifica se a lista é diferente de vazia
    Elem\=[_|_].
acomoda([Cabeca|Corpo],ListaResultante):-
    acomoda(Corpo,Lista2),%mandamos apenas o corpo para acomoda
    acomoda(Cabeca,Lista1),%mandamos apenas a cebeça para acomoda
    concatenar(Lista1,Lista2,ListaResultante).%Juntamos as listas em uma terceira lista
