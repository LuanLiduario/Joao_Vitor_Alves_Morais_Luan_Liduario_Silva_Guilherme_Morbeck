%2-
% Para consulta basta trocar a vari�vel NOME pelo nome do animal que deseja consultar.

pele(NOME) :- animal(NOME).%Definimos que se for um animal ent�o tem pele.

animal(NOME) :- peixe(NOME);%Definimos que se for peixe,mamifero ou passaro ent�o � um tipo de animal.
mamifero(NOME);
passaro(NOME).

salmao(alfred).%Fato.
tubarao(tutu).%Fato.
peixe(nemo).%Fato.

peixe(NOME) :- tubarao(NOME);%Definimos se for um tubar�o ou um salm�o ent�o � um tipo de peixe.
salmao(NOME).

poem_ovos(NOME):-passaro(NOME);%Definimos que se � um p�ssaro ou, se for um peixe e n�o � for um tubar�o, ent�o p�em ovos.
peixe(NOME),not(tubarao(NOME)).%O tubar�o apesar de ser um tipo de peixe n�o p�em ovos.

comestivel(NOME) :- salmao(NOME);%Definimos que salm�o e vaca s�o com�stiveis.
vaca(NOME).

nada(NOME) :- peixe(NOME).%Definimos que se � um peixe nada.
nadadeira(NOME) :- nada(NOME).%Definimos que se nada tem nadadeira.

canario(piupiu).%Fato.
avestruz(xica).%Fato.

passaro(X):-avestruz(X);%Definimos se for um avestruz ou um c�nario ent�o � um tipo de p�ssaro.
canario(X).

asas(NOME) :- passaro(NOME);%Definimos se voa ou � um p�ssaro ent�o tem asas.
voa(NOME).

voa(NOME):- morcego(NOME);%Definimos que se � um morcego ou, se � um p�ssaro e n�o � um avestruz, ent�o voa.
passaro(NOME),not(avestruz(NOME)).%Apesar do avestruz ser um tipo de p�ssaro ele n�o voa.

cor(NOME,COR):-canario(NOME), COR =  amarelo.%� definido que se o nome do animal digitado for um c�nario, a cor � amarelo.

vaca(mimosa).%Fato
morcego(vamp).%Fato


da_leite(NOME):-vaca(NOME).%Definimos que se for uma vaca da leite
anda(NOME):-avestruz(NOME);%Definimos que se for um avestruz ou, um mamifero e n�o � um morcego, ent�o anda.
mamifero(NOME),not(morcego(NOME)).%Apesar de ser um mam�fero o morcego n�o voa

mamifero(NOME):-vaca(NOME);%Definimos que se for vaca ou um morcego ent�o � um mamifero.
morcego(NOME).
