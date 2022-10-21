%2-
% Para consulta basta trocar a variável NOME pelo nome do animal que deseja consultar.

pele(NOME) :- animal(NOME).%Definimos que se for um animal então tem pele.

animal(NOME) :- peixe(NOME);%Definimos que se for peixe,mamifero ou passaro então é um tipo de animal.
mamifero(NOME);
passaro(NOME).

salmao(alfred).%Fato.
tubarao(tutu).%Fato.
peixe(nemo).%Fato.

peixe(NOME) :- tubarao(NOME);%Definimos se for um tubarão ou um salmão então é um tipo de peixe.
salmao(NOME).

poem_ovos(NOME):-passaro(NOME);%Definimos que se é um pássaro ou, se for um peixe e não é for um tubarão, então põem ovos.
peixe(NOME),not(tubarao(NOME)).%O tubarão apesar de ser um tipo de peixe não põem ovos.

comestivel(NOME) :- salmao(NOME);%Definimos que salmão e vaca são coméstiveis.
vaca(NOME).

nada(NOME) :- peixe(NOME).%Definimos que se é um peixe nada.
nadadeira(NOME) :- nada(NOME).%Definimos que se nada tem nadadeira.

canario(piupiu).%Fato.
avestruz(xica).%Fato.

passaro(X):-avestruz(X);%Definimos se for um avestruz ou um cánario então é um tipo de pássaro.
canario(X).

asas(NOME) :- passaro(NOME);%Definimos se voa ou é um pássaro então tem asas.
voa(NOME).

voa(NOME):- morcego(NOME);%Definimos que se é um morcego ou, se é um pássaro e não é um avestruz, então voa.
passaro(NOME),not(avestruz(NOME)).%Apesar do avestruz ser um tipo de pássaro ele não voa.

cor(NOME,COR):-canario(NOME), COR =  amarelo.%É definido que se o nome do animal digitado for um cánario, a cor é amarelo.

vaca(mimosa).%Fato
morcego(vamp).%Fato


da_leite(NOME):-vaca(NOME).%Definimos que se for uma vaca da leite
anda(NOME):-avestruz(NOME);%Definimos que se for um avestruz ou, um mamifero e não é um morcego, então anda.
mamifero(NOME),not(morcego(NOME)).%Apesar de ser um mamífero o morcego não voa

mamifero(NOME):-vaca(NOME);%Definimos que se for vaca ou um morcego então é um mamifero.
morcego(NOME).
