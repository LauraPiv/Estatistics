#Análise Bivariada

#habilitar/baixar pacotes: tidyverse e corrplot

#Associação entre as variáveis hp e mpg:

#Gráfico de Dispersão.
data("mtcars")
plot(mtcars$hp, mtcars$mpg)
#Covariância Amostral
cov(mtcars$hp, mtcars$mpg)
#Correlação Linear de Pearson Amostral
cor(mtcars$hp, mtcars$mpg)
#Gráfico de Correlação Linear de Pearson.
dados <- data.frame(mtcars$hp, mtcars$mpg)
corrplot(cor(dados), method = "number")
# Existe uma correlação negativa forte entre as
#variáveis hp e mpg, o que sugere que quando uma
#variável aumenta, a outra tende a diminuir, e viceversa.

#Associação entre as variáveis mpg e disp:

data("mtcars")
plot(mtcars$disp, mtcars$mpg)
cov(mtcars$disp, mtcars$mpg)
cor(mtcars$disp, mtcars$mpg)
dados <- data.frame(mtcars$disp, mtcars$mpg)
corrplot(cor(dados), method = "number")

#Associação entre as variáveis cyl e mpg

data("mtcars")
plot(mtcars$cyl, mtcars$mpg)
cov(mtcars$cyl, mtcars$mpg)
cor(mtcars$cyl, mtcars$mpg)
dados <- data.frame(mtcars$cyl, mtcars$mpg)
corrplot(cor(dados), method = "number")