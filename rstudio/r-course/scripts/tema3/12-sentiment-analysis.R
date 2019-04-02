install.packages(c("twitteR","RColorBrewer", "plyr",
                   "ggplot2", "devtools", "httr"))
require(devtools)

install_url("https://cran.r-project.org/src/contrib/Archive/Rstem/Rstem_0.4-1.tar.gz")
install_url("https://cran.r-project.org/src/contrib/Archive/slam/slam_0.1-37.tar.gz")

library(rstem)

install.packages("sentimentr")

install_url("https://cran.r-project.org/src/contrib/Archive/sentiment/sentiment_0.2.tar.gz")

library(slam)
library(sentimentr)
library(twitteR)

api_key <- "qLZwV6Bih8iwa0jyGqfEnksXx"
api_secret <- "hXR623vWXQUKjsYvKka7kWO5NX4pMGxpVQUMpTyWHBrFapoHSN"
access_token <- "5114321-jgUHFDTXGeRBj1kE9lBqkb1CseeIYclwq48HsM4K38"
access_token_secret <- "KuBjf5yX7xE7JPUgMIzJfkimdnVcpOMDXdZkWAhhPggPl"

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
