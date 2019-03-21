data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")

data.cleaned <- na.omit(data)

is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

#Limpiar NA de solamente la variable Income
data.income.cleaned <- data[!is.na(data$Income),]
#Filas completas para un data frame
complete.cases(data)

data.cleaned.2 <- data[complete.cases(data),]

#Convertir los ceros de ingresos en NA
data$Income[data$Income == 0] <- NA

#Medidas de centralizacion y dispersion

#Media
mean(data$Income)
mean(data$Income, na.rm = TRUE)

#Desviacion
sd(data$Income)
sd(data$Income, na.rm = TRUE)
