protein <- read.csv("../data/tema5/protein.csv")

#Normalizamos y escalamos todos los datos para que esten en el mismo rango
data <- as.data.frame(scale(protein[,-1]))

data$Country = protein$Country

rownames(data) = data$Country

hc <- hclust(dist(data, method = "euclidean"), method = "ward.D2")
hc

#Visualizamos el Dendogram (Clustering jerarquico)
plot(hc, hang = -0.01, cex = 0.7)

hc2 <- hclust(dist(data, method = "euclidean"),   #manhattan
              method = "single") #minimo

plot(hc2, hang = -0.01, cex = 0.7)

hc3 <- hclust(dist(data, method = "euclidean"),   #manhattan
              method = "complete") #maximo

plot(hc3, hang = -0.01, cex = 0.7)

hc3$merge

hc4 <- hclust(dist(data, method = "euclidean"),   #manhattan
              method = "average") #promedio

plot(hc4, hang = -0.01, cex = 0.7)

hc4$merge

d<- dist(data, method = "euclidean")

#Distancia euclidean comparan dos elementos como de lejos estan una de otra
d

alb <- data["Albania",-10]
aus <- data["Austria",-10]
alb-aus
sqrt(sum((alb-aus)^2))
sum(abs(alb-aus))




