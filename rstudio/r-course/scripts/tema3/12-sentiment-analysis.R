install.packages(c("twitteR","RColorBrewer", "plyr",
                   "ggplot2", "devtools", "httr"))
require(devtools)

install_url("https://cran.r-project.org/src/contrib/Archive/Rstem/Rstem_0.4-1.tar.gz")
install_url("https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz")

library(rstem)

install.packages("sentimentr")

install_url("https://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.1.tar.gz")

library(slam)
library(sentimentr)
library(twitteR)

api_key <- "qLZwV6Bih8iwa0jyGqfEnksXx"
api_secret <- "hXR623vWXQUKjsYvKka7kWO5NX4pMGxpVQUMpTyWHBrFapoHSN"
access_token <- "5114321-jgUHFDTXGeRBj1kE9lBqkb1CseeIYclwq48HsM4K38"
access_token_secret <- "KuBjf5yX7xE7JPUgMIzJfkimdnVcpOMDXdZkWAhhPggPl"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

tweets <- searchTwitter("machinelearning", n = 1500, lang = "en")

texts <- sapply(tweets, function(x) x$getText())

head(texts)

clean.data <- function(text) {
  #Eliminar re-tweets y @ del texto original
  text = gsub("(RT|VIA)((?:\\b\\W*@\\w+)+)","", text)
  text = gsub("@\\w+", "", text)
  #eliminar signos de puntuación y digitos del 0 al 9
  text = gsub("[[:punct:]]", "", text)
  text = gsub("[[:digit:]]", "", text)
  #eliminar links html, tabulaciones y espaciones adicionales
  text = gsub("http\\w+","", text)
  text = gsub("[ \t]{2,}","", text)
  text = gsub("^\\s+|\\s+$", "", text)
}

texts <- clean.data(texts)

head(texts)

handle.error <- function(x) {
  #crear el valor omitido
  y = NA
  #TRY_CATCH ERROR
  try_error <- tryCatch(tolower(x), error = function(e) e)
  #si no hay error
  if (!inherits(try_error, "error"))
      y = tolower(x)
  #devolvemos el resultado
  return(y)
}

texts = sapply(texts, handle.error)
head(texts)

texts <- texts[!is.na(texts)]

names(texts) <- NULL


## analisis de sentimiento

#class_emo <- classify_emotionr(texts, algoritm = "bayes", prior = 1)

class_emo <- sentimentr::emotion(texts, algoritm = "bayes", prior = 1)

head(class_emo)


#emotion <- class_emo[,7]
#emotion[is.na(emotion)]<-"unknown"
