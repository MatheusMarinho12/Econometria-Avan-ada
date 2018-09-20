

#Aula 9 - Diagnósticos de Resíduos 2
install.packages("lmtest")
install.packages("aTSA")




data(jocci)                                                #Carregar o banco de dados do jocci.  Base de dados ja está no R (indeicie de commodids dos EUA) - Department of commerce commodity price index - USA
View(jocci)
JOCCI <- as.data.frame(jocci)                                     #Y é o Index Jocci . dy é a variação (expressa pela diferença) em logaritmos.
joccits <- ts(JOCCI$dy,start = 1959,frequency = 12)               #Criar uma tabela.
plot(joccits, main="Índice Jocci", xlab="Ano", ylab="Indice")     #Plotar a tabela do indice Jocci

#Definindo Formato dos Modelos
ar6model <- dy~dy1+dy2+dy3+dy4+dy5+dy6  #O ultimo dy representa o AR, exemplo AR6
ar5model <- dy~dy1+dy2+dy3+dy4+dy5      #DY ~(está sendo esplicado) por DY1.
ar4model <- dy~dy1+dy2+dy3+dy4
ar3model <- dy~dy1+dy2+dy3
ar2model <- dy~dy1+dy2
ar1model <- dy~dy1

#Executando os Teste LM-Breuch-Godfrey

TesteBGAR6 <- bgtest(ar6model,data=JOCCI)     #Faz o teste de H0 de cada modelo criado no passo anterior.
TesteBGAR5 <- bgtest(ar5model,data=JOCCI)
TesteBGAR4 <- bgtest(ar4model,data=JOCCI)
TesteBGAR3 <- bgtest(ar3model,data=JOCCI)
TesteBGAR2 <- bgtest(ar2model,data=JOCCI)
TesteBGAR1 <- bgtest(ar1model,data=JOCCI)

P_Valores_BG <- c(TesteBGAR6$p.value,        #Cria um vetor chamado P_Valores_BG, que é o p-valor dos testes ARn 
               TesteBGAR5$p.value,           #Cria tabelas com as informações.
               TesteBGAR4$p.value,
               TesteBGAR3$p.value,
               TesteBGAR2$p.value,
               TesteBGAR1$p.value)

Modelos <- c("ar6model","ar5model","ar4model","ar3model","ar2model","ar1model")   #Modelos serve para juntar em uma tabela, os testes não são para comparação, se o AR rejeita H0, voltamos para o test de ic bic para pegar outro ARn.

Resultados <- data.frame(Modelos,P_Valores_BG)
View(Resultados)


#Teste Reset
TesteReset6 <- resettest(ar6model,data=JOCCI)
TesteReset5 <- resettest(ar5model,data=JOCCI)
TesteReset4 <- resettest(ar4model,data=JOCCI)    #Para o Reset, H0 = modelo foi especificado corretamente (igual no slide)
TesteReset3 <- resettest(ar3model,data=JOCCI)    #De 0,00 até 0,05 Rejeita H0.
TesteReset2 <- resettest(ar2model,data=JOCCI)    #De 0,05 em diante, Aceitamos H0.
TesteReset1 <- resettest(ar1model,data=JOCCI)

P_Valores_RESET <- c(TesteReset6$p.value,
                     TesteReset5$p.value,
                     TesteReset4$p.value,
                     TesteReset3$p.value,
                     TesteReset2$p.value,
                     TesteReset1$p.value)

Resultados <- data.frame(Modelos,P_Valores_BG, P_Valores_RESET)
View(Resultados)


#Carregando o arquivo xls
variacao_PIB <- read.table("c:/Econometria/variacao.xls", header = T)                 #Lê o arquivo variacao.xls na pasta c:/Econometria
variacao_PIB <- as.data.frame(variacao_PIB[,-1])                                      #Apaga a primeira coluna



#Executando os Teste ARCH-LM
      
AR1_VAR <- arima(JOCCI$dy,c(1,0,0))    #ARIMA é um modelo.
AR2_VAR <- arima(JOCCI$dy,c(2,0,0))    #AR1_VAR <- arima(variacao_PIB,c(1,0,0))
arch.test(AR1_VAR)                         #nome tab <- modelo(local(p,d,q))
                                      #H0 = não ha heterocedasticidade.
                                      #Abaixo de 0,05 Rejeitamos H0


#Para salvar, FILE/ Save As