          #3-Processos Estocásticos, Estacionariedade e Distribuições de Probabilidade

rm(list = ls())          #Removendo todos objetos do ambiente
getwd()                  #Verificando o diretório atual
setwd("c:/Econometria")  # Aleterando o diretório caso seja necessário, para ("c:/EconometriaA") ou "c:/Econometria")
library("readr")                               #Carrega o pacote de leitura de arquivos .csv
br <- read.csv("c:/EconometriaA/br.csv")       #Lê o arquivo br.csv de acordo com o caminho especificado
view(br)                                       #Exibe o objeto "br", criado a partir do arquivo "br.csv"
br <- br[,-1]                                  #Apaga a primeira coluna
colnames(br)[3] <- "Cambio"                    #Renomeia a terceira coluna do objteo "br" para Cambio

PIB <- ts(br$PIB, start = 1950, frequency = 1)   #Cria uma série temporal somente com dados do PIB
plot(PIB)                                        #Cria gráfico do PIB
hist(PIB)                                        #cria um histograma (gráfico em barras com a frequencia no eixo Y e os valores assumidos pela variável no eixo x)

Trabalho <- ts(br$Trabalho, start = 1950, frequency = 1)    #Cria uma série temporal somente com dados do Trabalho
plot(Trabalho)                                              #Cria gráfico do Trabalho
hist(Trabalho)                                              #Cria histograma do Trabalho

Cambio <- ts(br$Cambio, start = 1950, frequency = 1)    #Cria uma série temporal somente com dados do Cambio
plot(Cambio)                                            #Cria gráfico do Cambio
hist(Cambio)                                            #Cria histograma do Cambio

# Comandos Extras

#rnorm (n, media, desvio padrão) : gera n valores distribuidos normalmente de acordo com média e desvio padrão atriobuição no comando.
#Exemplo: rnorm(100,50,2): gera 100 valores com distribuição normal, cuja média dos valores é 50 e desvio padrão é 2.
#runif (n, min, max): gera n valores distribuidos uniformemente com valor mínimo e máximos atriobuidos no comando.
#Exemplo:runif(1000,4000,5000): gera 1000 valores entre 4000 e 5000 com distribuição uniforme
#round (x, digits=n) : arredonda o valor x para n digitos depois do zero.
