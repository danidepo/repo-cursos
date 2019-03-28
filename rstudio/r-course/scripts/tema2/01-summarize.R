data <- read.csv("../data/tema2/auto-mpg.csv", 
                 header = TRUE,
                 stringsAsFactors = FALSE)

## Si es un valor pequeño y se repite mucho es mejor transformarlo a factores
data$cylinders <- factor(data$cylinders, 
                         level = c(3,4,5,6,8), 
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

summary(data)

str(data)

summary(data$cylinders)

summary(data$mpg)

str(data$cylinders)

install.packages(c("modeest","raster","moments"))

library(modeest) #moda
library(raster) #quantiles, cv
library(moments) # asimetria, curtosis

install.packages("BiocManager")
library(BiocManager)
BiocManager::install("genefilter")

X = data$mpg

### Medidas de Centralizacion ###

mean(X) #sum(X)/length(X)
median(X)
mfv(X) #moda
quantile(X)

### Medidas de Dispersión
var(X)
sd(X)
cv(X) #sd(X)/mean(X)

### Medidas de asimetria con respecto a la media
skewness(X)
kurtosis(X)

par(mfrow = c(1,1))
hist(X)

