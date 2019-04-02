install.packages("MASS")
library(MASS)
library(caret)

bn <- read.csv("../data/tema3/banknote-authentication.csv")
bn$class <- factor(bn$class)

set.seed(2018)

#Creamos la particion
t.id <- createDataPartition(bn$class, p=0.7, list = F)

#Construimos el modelo
mod <- lda(bn[t.id,1:4], bn[t.id,5])

mod <- lda(class ~., data = bn[t.id,])

#Predecimos los que forman parte del modelo
bn[t.id, "Pred"] <- predict(mod, bn[t.id, 1:4])$class

table(bn[t.id, "class"], bn[t.id, "Pred"], dnn = c("Actual", "Predichos"))

#Predecimos los que no forman parte del modelo
bn[-t.id, "Pred"] <- predict(mod, bn[-t.id,1:4])$class

table(bn[-t.id, "class"], bn[-t.id, "Pred"], dnn = c("Actual", "Predichos"))


