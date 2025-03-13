#Regressão Linear Múltipla
#Baixar e habilitar corrplot e scatterplot3d
dados <- data.frame(horas_estudo = c(4, 6, 3, 5, 7),
                    horas_sono = c(7, 6, 8, 7, 6),
                    pontuacao = c(85, 90, 75, 80, 95))
#a) Estudo da associação entre todas as variáveis
plot(dados)
cov(dados)
cor(dados)
corrplot(cor(dados))

#b) Elaborar o gráfico da Regressão Linear Múltipla
modelo <- lm(pontuacao ~ horas_estudo +
               horas_sono, data = dados)
graph <- scatterplot3d(dados$pontuacao ~
                         dados$horas_estudo + dados$horas_sono,
                       pch = 16, angle = 30, color = "steelblue", box = FALSE,
                       xlab="Horas Estudo", ylab="Horas
Sono", zlab="Pontuação")
graph$plane3d(modelo, col="black", draw_polygon =TRUE)

#c) Verifique a adequação do modelo (R² e Teste F)
summary(modelo)

#d) Se horas_estudo= 10 e horas_sono=8, qual a pontuação esperada? 
nova_obs <- data.frame(horas_estudo = 10,
                       horas_sono = 8)
previsão <- predict(modelo, newdata = nova_obs)
previsão