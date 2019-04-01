usarrests <- read.csv("../data/tema3/USArrests.csv", stringsAsFactors = FALSE)

rownames(usarrests) <- usarrests$X

#Eliminamos la columna X
usarrests$X <- NULL

head(usarrests)
apply(usarrests, 2, var)
 