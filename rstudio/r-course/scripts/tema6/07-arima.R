#Modelo autorregresivo integrado de media movil

inf <- read.csv("../data/tema6/infy-monthly.csv")
inf.ts <- ts(inf$Adj.Close, start = c(1999,3), frequency = 12)

inf.arima <- auto.arima(inf.ts)
summary(inf.arima) #Por defecto coge la corrección AICc


inf.fore <- forecast(inf.arima, h = 12)
plot(inf.fore, col = "red",
     fcol = "green")

