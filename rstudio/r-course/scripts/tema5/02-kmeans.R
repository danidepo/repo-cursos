protein <- read.csv("../data/tema5/protein.csv")
rownames(protein) = protein$Country
protein$Country = NULL
protein.scaled = as.data.frame(scale(protein))

library(devtools)
devtools::install_github("kassambara/factoextra")

km <- kmeans(protein.scaled, 4)
km

aggregate(protein.scaled, by = list(cluster = km$cluster), mean)

install.packages("rlang")

library(factoextra)

fviz_cluster(km, data = protein.scaled)


#####################

install.packages(c("OpenImageR", "ClusterR"))
library(OpenImageR)
library(ClusterR)

imagename <- "../data/tema5/jb.jpg"

img <- readImage(imagename)

img.resize <- resizeImage(img, 350, 350, method = "bilinear")

imageShow(img.resize)

img.vector <- apply(img.resize, 3, as.vector)

dim(img.vector)

kmmb <- MiniBatchKmeans(img.vector, clusters = 10, 
                        batch_size = 20, num_init = 5,
                        max_iters = 100, init_fraction = 0.2,
                        initializer = "kmeans++",
                        early_stop_iter = 10, verbose = F)

kmmb

#Calculamos la predicción del color respecto al cluster junto
prmb <- predict_MBatchKMeans(img.vector, kmmb$centroids)

get.cent.mb <- kmmb$centroids

new.img <- get.cent.mb[prmb,]

dim(new.img) <- c(nrow(img.resize), ncol(img.resize), 3)

imageShow(new.img)




