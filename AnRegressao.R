#Análise de Regressão
#Baixar/instalar o pacote: corrplot

Dados <- data.frame(Qtd_Poluente = c(1, 2, 3, 4, 5, 6), 
                    Dano_Eco = c(3, 6, 7, 10, 10, 12))
#Estudo da associação entre as variáveis Qtd_Poluente e Dano_Eco
plot(Dados$Qtd_Poluente, Dados$Dano_Eco)
cov(Dados$Qtd_Poluente, Dados$Dano_Eco)
cor(Dados$Qtd_Poluente, Dados$Dano_Eco)
corrplot(cor(Dados))
#Reta de Regressão Linear Simples no Gráfico de Dispersão. 
plot(Dados$Qtd_Poluente, Dados$Dano_Eco,
        xlab = "Quantidade de Poluentes",
        ylab = "Dano Ecológico",
        main = "Gráfico de Dispersão com Reta de
Regressão")
modelo <- lm(Dano_Eco ~ Qtd_Poluente, data =
               Dados)
abline(modelo, col = "red")
#Adequação do modelo (montagem daequação com base nos resultados)
summary(modelo)
#Previsão se a quantidade de poluente for 9µg/L
nova_obs <- data.frame(Qtd_Poluente = 9)
previsão <- predict(modelo, newdata = nova_obs)
previsão