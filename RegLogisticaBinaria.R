#Regressão Logística Binária
#Utilizando o dataset mtcars, aplique a
#Regressão Logística Binária para classificar um veículo com transmissão manual 
#ou automática sendo: 0 = automática, 1 = manual, (em função wt e hp)
data("mtcars")
modelo <- glm(am ~ wt + hp, data = mtcars,
              family = binomial)
#a) O gráfico sigmoide para cada variável independente
wt_novo <- seq(min(mtcars$wt), max(mtcars$wt),
               length.out = 100)
previsoes_sigmoide <- predict(modelo, newdata =
                                data.frame(wt = wt_novo, hp = mean(mtcars$hp)),
                              type = "response")
plot(wt_novo, previsoes_sigmoide, type = "l", col =
       "blue")
points(mtcars$wt, mtcars$am, col = "red", pch =
         16)
hp_novo <- seq(min(mtcars$hp), max(mtcars$hp),
               length.out = 100)
previsoes_sigmoide_hp <- predict(modelo,
                                 newdata = data.frame(hp = hp_novo, wt =
                                                        mean(mtcars$wt)), type = "response")
plot(hp_novo, previsoes_sigmoide_hp, type = "l",
     col = "blue")
points(mtcars$hp, mtcars$am, col = "red", pch =
         16)

#b) Previsões de todos os veículos do database
previsoes <- predict(modelo, type = "response")
previsoes_classificadas <- ifelse(previsoes > 0.5,
                                  1, 0)

#c) Matriz de Confusão e Acurácia
matriz_confusao <-
  table(previsoes_classificadas, mtcars$am)
acuracia <- sum(diag(matriz_confusao)) /
  sum(matriz_confusao)

#d) Inclua uma nova coluna no dataset original das classificações previstas
mtcars$Classificacao <- previsoes_classificadas
