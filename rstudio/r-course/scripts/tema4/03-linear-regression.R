#Utilizamos el paquete caret para la particion de datos
library(caret)

auto <- read.csv("../data/tema4/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels = c("3c","4c","5c","6c","8c"))
set.seed(2018)

t.id <- createDataPartition(auto$mpg, p = 0.7, list = F)

#Vemos que columnas excluimos en el analisis
names(auto)

#Creamos el modelo lineal pasandole los identificadores de entrenamiento
#No necesitamos crear variables dummies, el lm lo hace automaticamente para las variables
#categoricas

mod <- lm(mpg ~., data = auto[t.id, -c(1,8,9)])

mod

#Podemos predecir el consumo, a partir de obtener un valor de mpg = 38.607312 +
#     + 7.212652*4c + 5.610350*5c + 3.307172*6c + 6.211343*8c +
#     + 0.006878 * displacement - 0.072209 * horsepower +
#     - 0.005156 * weight + 0.024852 * acceleration

summary(mod)

boxplot(mod$residuals)

sqrt(mean((mod$fitted.values - auto[t.id,]$mpg)^2))

pred <- predict(mod, auto[-t.id, -c(1,8,9)])

sqrt(mean((pred - auto[-t.id,]$mpg)^2))

par(mfrow=c(2,2))
plot(mod)

# En el primer grafico el modelo explica bastante bien y no tiene ningun patron inherente
# Se ven residuales los valores 300 y 269
# El grafico de apalancamiento, la distancia de cook, los que se distancian son los 290...

#300
#38.0
#6c
#262.0
#85
#3015  mucho peso
#17.0
#82
#oldsmobile cutlass ciera (diesel)

#269
#46.6 muchas millas por galeon
#4c
#86.0
#65
#2110
#17.9
#80
#mazda glc

#Reordenamiento de las variable de referencia a 4c
#Recomendado utilizar como variable de referencia la que tenga mas casos
auto <- within(auto, cylinders <- relevel(cylinders, ref="4c"))

mod <- lm(mpg ~., data = auto[t.id, -c(1,8,9)])
mod

pred <- predict(mod, auto[-t.id, -c(1,8,9)])
sqrt(mean((pred-auto[-t.id,]$mpg)^2))
plot(mod)
