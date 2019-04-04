protein <- read.csv("../data/tema5/protein.csv")

#Normalizamos y escalamos todos los datos para que esten en el mismo rango
data <- as.data.frame(scale(protein[,-1]))

data$Country = protein$Country

rownames(data) = data$Country

hc <- hclust(dist(data, method = "euclidean"), method = "ward.D2")
hc

#Visualizamos el Dendogram (Clustering jerarquico)
plot(hc, hang = -0.01, cex = 0.7)

hc2 <- hclust(dist(data, method = "euclidean"),
              method = "single")

plot(hc2, hang = -0.01, cex = 0.7)

