library(randomForest)
library(caret)

bh <- read.csv("../data/tema4/BostonHousing.csv")

set.seed(2018)

t.id <- createDataPartition(bh$MEDV, p = 0.7, list = F)

#Al random forest se le pasa la x que son los predictores, e y que son las variables de salida
#xtest los descriptores de la partición de validación
mod <- randomForest(x = bh[t.id, 1:13], y = bh[t.id, 14],
                    ntree = 1000,
                    xtest = bh[-t.id, 1:13], ytest = bh[-t.id,14],
                    importance = T, keep.forest = T)

mod
#Imprimimos la importancia de cada uno de los niveles
mod$importance

plot(bh[t.id,]$MEDV, predict(mod, newdata = bh[t.id,]),
     xlab = "Actual", ylab = "Predichos")
abline(0,1)

plot(bh[-t.id,]$MEDV, predict(mod, newdata = bh[-t.id,]),
     xlab = "Actual", ylab = "Predichos")
abline(0,1)

#Podemos utilizar los siguientes parametros:
#mtry El numero de predicciones que deben hacerse aleatoriamente 
#mtry= m/3, donde m = # de predictores
#nodesize El minimo tamaño que tienen que tener los nodos para ser considerados
#nodesize = 5
#maxnodes Número de máximo de nodos terminales





