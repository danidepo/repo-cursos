dat <- read.csv("../data/tema4/rmse.csv")

#Nos preguntamos si los datos predichos son buenos

#Error cuadratico, nos dice cuanto nos equivocamos en funcion del valor original
rmse <- sqrt(mean((dat$price - dat$pred)^2))
rmse

plot(dat$price, dat$pred, xlab = "Actual", ylab="Predicho")

#Cuanto mas cerca un punto este de la recta menos error tiene
abline(0,1)

rmse <- function(actual, predicted) {
  return(sqrt(mean((actual-predicted)^2)))
}

rmse(dat$price, dat$pred)
