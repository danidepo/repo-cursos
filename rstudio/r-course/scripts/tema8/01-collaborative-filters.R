# Sistema de recomendaciones
install.packages("recommenderlab")
library(recommenderlab)

data(MovieLense)

head(MovieLense)

rating_movies <- MovieLense[rowCounts(MovieLense) > 50,
                  colCounts(MovieLense) > 100]

#Matriz Sparsed
rating_movies@data[1,1]
rating_movies@data[1,]
rating_movies@data[,1]

head(rownames(rating_movies))
head(colnames(rating_movies))

t.id <- sample(x = c(T,F), size = nrow(rating_movies),
               replace = T, prob = c(0.8,0.2))

data_train <- rating_movies[t.id,]
data_test <- rating_movies[-t.id,]

# Filtrado colaborativo basado en los items (IBCF)

ibcf <- Recommender(data = data_train, 
                    method = "IBCF",
                    parameter = list(k = 30))

ibcf.mod <- getModel(ibcf)

ibcf.mod

n_rec <- 10
ibcf.pred <- predict(object = ibcf, 
                     newdata = data_test,
                     n = n_rec)

ibcf.pred

ibcf.rec.matrix <- sapply(ibcf.pred@items, function(x) {colnames(rating_movies)[x]})

View(ibcf.rec.matrix[,1:3])

# Filtrado colaborativo basado en usuarios (UBCF)

ubcf <- Recommender(data = data_train, method = "UBCF")
ubcf.mod <- getModel(ubcf)
ubcf.mod

ubcf.pred <- predict(object = ubcf,
                     newdata = data_test,
                     n = n_rec)
ubcf.pred
ubcf.rec.matrix <- sapply(ubcf.pred@items, function(x) {colnames(rating_movies)[x]})

View(ubcf.rec.matrix[,1:3])

# Representación de la matriz de recomendaciones

recommender_models <- recommenderRegistry$get_entries(dataType = "realRatingMatrix")

names(recommender_models)

image(MovieLense, main = "Mapa de calor de la matriz de valoraciones de películas")

min_n_movies <- quantile(rowCounts(MovieLense), 0.99)
min_n_users <- quantile(colCounts(MovieLense), 0.99)
min_n_movies
min_n_users

image(MovieLense[rowCounts(MovieLense) > min_n_movies, 
                 colCounts(MovieLense) > min_n_users])

rating_movies <- MovieLense[rowCounts(MovieLense) > 50,
                            colCounts(MovieLense) > 100]
min_r_movies <- quantile(rowCounts(rating_movies), 0.98)
min_r_users <- quantile(colCounts(rating_movies), 0.98)

image(rating_movies[rowCounts(rating_movies) > min_r_movies,
                    colCounts(rating_movies) > min_r_users],
      main = "Mapa de calor del top de peliculas y usuarios")
