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
