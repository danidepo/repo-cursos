inf <- read.csv("../data/tema6/infy-monthly.csv")

tail(inf)

#Prevision de valores

#1. Creamos la serie temporal
inf.ts <- ts(inf$Adj.Close, start = c(1999,3), frequency = 12)
inf.ts
plot(inf.ts)

inf.hw <- HoltWinters(inf.ts)
head(inf.hw)

#Representamos la prediccion (en rojo)
plot(inf.hw, col = "blue", col.predicted = "red")

inf.hw$SSE

#Valores utilizados 
inf.hw$alpha
inf.hw$beta
inf.hw$gamma

head(inf.hw$fitted)

install.packages("forecast")
library(forecast)
infy.fore <- forecast(inf.hw, h = 24)
plot(infy.fore)

#Consultamos los valores de la predicción
infy.fore$lower
infy.fore$upper

