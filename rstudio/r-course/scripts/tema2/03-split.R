#split / unsplit
data <- read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)

carslist <- split(data, data$cylinders) #separa en lista de listas de dataframes

carslist[1] # es una lista por tanto accedemos al objeto
carslist[[1]] # me devuelve el dataframe

str(carslist[[1]])

names(carslist[[1]])
