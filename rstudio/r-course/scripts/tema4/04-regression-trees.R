install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(caret)

set.seed(2018)

bh <- read.csv("../data/tema4/BostonHousing.csv")

t.id <- createDataPartition(bh$MEDV, p = .7, list = F)

bfit <- rpart(MEDV ~., bh[t.id,])
bfit

par(mfrow=c(1,1))

prp(bfit, type = 2, nn = T,
    fallen.leaves = T, faclen = 4,
    varlen = 8, shadow.col = "gray")

bfit$cptable

plotcp(bfit)

#Podamos el arbol por aquel mas pequeño con la desviacion tipica mas el error tipico
bfitpruned <- prune(bfit, cp = 0.02092816)

prp(bfit, type = 2, nn = T,
    fallen.leaves = T, faclen = 4,
    varlen = 8, shadow.col = "gray")

preds <- predict(bifpruned, bh[t.id,])
sqrt(mean((preds - bh[t.id,]$MEDV)^2))

preds <- predict(bfitpruned, bh[-t.id,])
sqrt(mean((preds - bh[-t.id,]$MEDV)^2))

#Si alguna de las variables es categorica

ed <- read.csv("../data/tema4/education.csv")
ed$region <- factor(ed$region)

t.id <- createDataPartition(ed$expense, p = 0.7, list = F)
#Creamos el modelo del valor ajustado
fit <- rpart(expense ~ region+urban+income+under18, data = ed[t.id,])

prp(fit, type = 2, nn = T, fallen.leaves = T,
    faclen = 4, varlen = 8, shadow.col = "gray")

#Generamos el arbol de regresión
#Bagging
install.packages("ipred")
library(ipred)
bagging.fit <- bagging(MEDV ~., data=bh[t.id,])
prediction.t <- predict(bagging.fit, bh[t.id,])
sqrt(mean((prediction.t - bh[t.id,]$MEDV)^2))

#Boosting
install.packages("gbm")
library(gbm)

gbmfit <- gbm(MEDV~., data = bh, distribution = "gaussian")




