#Heat Map
install.packages(c("ggmap", "maps"))
library(ggmap)
library(maps)

tartu_data <- read.csv("../data/tema7/tartu_housing.csv", sep = ";")
head(tartu_data)

register_google(key = "AIzaSyDX5K8InRabsDuw72bnQ5vKgmivWijAI5Q")

tartu_map <- get_map(location = "tartu", maptype = "satellite", zoom = 12,
                     api_key = "AIzaSyDX5K8InRabsDuw72bnQ5vKgmivWijAI5Q")

ggmap(tartu.map, extent = "device") +
  geom_point(data = tartu_data, aes(x=lon, y = lat),
             colour = "red", alpha = 0.12, size = 2)

tartu.map2 <- get_map(location = "tartu", zoom = 13)
ggmap(tartu.map2, extent = "device") +
  geom_density2d(data = tartu_data, aes(x=lon, y = lat),
      size = .3)+
  stat_density2d(data=tartu_data, aes(x=lon, y=lat, fill = ..level..,
                                      alpha = ..level..),
                size = 0.01, bins = 16, geom = "polygon")+
  scale_fill_gradient(low = "green", high = "red") +
  scale_alpha(range = c(0,0.25), guide = F)

