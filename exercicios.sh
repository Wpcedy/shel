#!bin/bash

# 1

# Para criar variavel basta digitar um nome(não pode começar com numero) e
#colocar um igual(=), o igual vai atribuir algo a variavel
#Ex: nome="Willian", eu estou salvando meu nome na variavel 'nome'

# Para pegar a data atual basta colar dentro do codigo '$()' o comando 'date'
#Ex: $(date)

# Para formatar você precisa pegar os elementos da data e separalos
#Ex: %d <-> dia
#    %m <-> mês
#    %y <-> ano simplificado 19
#    %Y <-> ano extenso 2019
data=$(date +"%d/%m/%Y")

# Para apresentar algo na tela basta digitar 'echo' junto com algo que queira
#escrever sendo texto ou uma variavel
#Ex: echo "Willian"
#Ex: echo $nome
echo $data
#------------------------------------------------------------------------------
# 2
#Obs: o comando 'date' pega tanto data quanto hora, basta formatar comforme
#necessario

# Para formatar você precisa pegar os elementos da hora e separalos
#Ex: %H <-> horas
#    %M <-> minutos
hora=$(date +"%H:%M")

echo $hora

#------------------------------------------------------------------------------
# 3
# O comando 'test' é um verificador, normalmente usado para verificar a
#existencia de algo
# O sub comando '-d' define como alvo diretorios, no caso o 'test -d' faz uma
#busca por diretorio
# Nessa parte do 'echo' na busca por diretorio é para definir um valor de
#acordo com o resultado da busca
#Obs: o codigo '$?' retorna o resultado da ultima operação
diretorio=$(test -d /tmp ; echo $?)

# O comando 'if' é validador de codição, caso uma determinada condição seja
#atendida ele executara um bloco, caso contrario executa outro
#Obs:o comando 'if' não precisa ter o else por obrigatorio, ele poderia ter
#só o 'then'
if [ $diretorio == 0 ];
then
    echo "O diretório existe"
else
    echo "O diretório não existe"
fi

#------------------------------------------------------------------------------
# 4
diretorio=$(test -d /tmp/willian ; echo $?)

if [ $diretorio == 1 ];
then
    echo "O diretório não existe, criando diretório"
    # O comando 'mkdir' cria um pasta, por definição após o 'mkdir' vem o
    #caminho e o ultimo texto será o nome da pasta
    mkdir /tmp/willian
fi

#------------------------------------------------------------------------------
# 5
diretorio=$(test -f /tmp/willian/willian.txt ; echo $?)

if [ $diretorio == 1 ];
then
    echo "O arquivo não existe, criando arquivo"
    # O comando 'touch' cria um arquivo, por definição após o 'touch' vem o
    #caminho e o ultimo texto será o nome do arquivo com sua extensão
    touch /tmp/willian/willian.txt
fi

#------------------------------------------------------------------------------
# 6
usuario=$(who | awk '{print $1}')
mes=$(date +"%m")

# O comando 'read' indica que o usuario precisa digitar algo, o comando '-p' faz
#que o codigo espera o 'enter' do usuario para voltar a executar além de 
#possibilitar que a leitura seja feita 
read -p "Digite o mês do seu aniversário: " aniversario;

# O comanda '-ge' é utilizado para numero, e ele verifica se o primeiro valor
# maior ou igual ao segundo
if [ $aniversario -ge $mes ];
then
    # para fazer conta precisa colocar dentro de '$(())' precisa de dois 
    #parenteses pois o primeiro busca comandos integrados ao shell e o
    #vai efetivamente fazer a conta
    echo "$usuario, falta $(($aniversario - $mes)) meses para o seu aniversário"
else
    echo "$usuario, falta $((12 - $aniversario)) meses para o seu aniversário"
fi
