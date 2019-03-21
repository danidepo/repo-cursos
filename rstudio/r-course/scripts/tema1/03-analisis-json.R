install.packages("jsonlite")
library(jsonlite)

dat.1 <- fromJSON("../data/tema1/students.json")
dat.2 <- fromJSON("../data/tema1/student-courses.json")

install.packages("curl")
library(curl)

url <- "http://www.floatrates.com/daily/usd.json"
currencies_json <- fromJSON(url)

currencie.data <- currencies_json$eur

head(dat.1,3)

dat.1$Email

currencie.data[1:2,]
dat.1[c(2,5,8),]
dat.1[,c(2,5)]

head(dat.2,3)

#toJSON(jsonlite)