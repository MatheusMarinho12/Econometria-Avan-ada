x <- rep(10:4)                       #Repede o dez quatro vezes.
y <- seq(from =  1, to = 10, by = 1) #Sequencia de um em um, de um a dez.
ls()                                 #Retorna lista de objetos existentes
rm()                                 #Apaga um objeto de cada vez.
rm(list= "x","y")                    #Apaga listas desejadas da �rea de trabalho
rm(list = ls())                      #Apaga todas as listas de objetos.
a==3                                 #Para compararmos temos que usar dois sinais de igual.
x <- rnorm(10,mean = 10, sd = 2)     #Com o comando voce cr�a 10 n�meros aleat�rios que seguem uma distribui��o normal de desvio padr�o 2
runif()                              #Gera 10 valores com m�nimo 8 e maximo 12 de valores uniformes.
install.package                      #Instala um pacote.
library()                            #Ler o pacote (� necess�rio ler sempre que instala).
subset(x,linhas,colunas)             #Pego os dados apenas do Brazil como abaixo.
br <- subset(pwt8.0, country == "Brazil", select = c(rgdpna,avh,xr))
colnames(br) <- c("pib", "trabalho", "cambio") #Renomear os nomes das colunas, os nomes precisam estar entre "" e na ordem das colunas desejadas.
plot(br$pib)                         #Cria um gr�fico simples.
dados <- ts(br, start=1950, freq=1)  #Criar uma base de dados.
plot(dados, col="blue", main= "Dados Brasileiros", xlab="Ano") #Plotar o grafico personalizado.
plot(dados, col=c("blue","green","red"), main= "Dados Brasileiros", xlab="Ano",plot.type="single")   #Trazer os graficos todos na mesma imagem.