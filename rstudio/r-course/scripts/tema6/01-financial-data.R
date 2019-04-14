amzn <- read.csv("../data/tema6/AMZN.csv", stringsAsFactors = F)
head(amzn)
aapl <- read.csv("../data/tema6/AAPL.csv", stringsAsFactors = F)
fb <- read.csv("../data/tema6/FB.csv", stringsAsFactors = F)
goog = read.csv("../data/tema6/GOOG.csv", stringsAsFactors = F)

amzn = amzn[amzn$Date >= '2008-01-01',]
head(amzn)
aapl = aapl[aapl$Date >= '2008-01-01',]
goog = goog[goog$Date >= '2008-01-01',]

str(aapl)
#Hacemos el casting a fecha de las mismas
aapl$Date = as.Date(aapl$Date)
amzn$Date = as.Date(amzn$Date)
fb$Date = as.Date(fb$Date)
goog$Date = as.Date(goog$Date)

library(ggplot2)

ggplot(aapl, aes(Date, Close)) + 
  geom_line(aes(color="Apple")) +
  geom_line(data=amzn, aes(color="Amazon")) +
  geom_line(data=fb, aes(color="Facebook")) +
  geom_line(data=goog, aes(color="Google")) +
  labs(color="Legend") +
  scale_color_manual("", breaks = c("Apple","Amazon", "Facebook", "Google"),
                     values = c("gray", "yellow", "blue", "red")) +
  ggtitle("Comparaciones de cierre de stocks") +
  theme(plot.title = element_text(lineheight = 0.7, face = "bold"))



#########################

#Cargar datos en tiempo real
install.packages("quantmod")
library(quantmod)

getSymbols("AAPL")
barChart(AAPL)
chartSeries(AAPL, TA = "NULL")
head(AAPL)
chartSeries(AAPL[,4], TA = "addMACD()")

getSymbols("NFLX")
barChart(NFLX)
chartSeries(NFLX, TA = "NULL")
chartSeries(NFLX[,4], TA = "addMACD()")

