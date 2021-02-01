#----------- POSTWORK SESION 6 ----------------

# Importe el conjunto de datos match.data.csv a `R`:	

# 1. Agregue una nueva columna `sumagoles` que contenga la suma de goles por partido	
# 2. Obtenga el promedio por mes de la suma de goles	
# 3. Creé la serie de tiempo del promedio por mes de la suma de goles hasta diciembre de 2019	
# 4. Grafique la serie de tiempo	

library(tidyverse)

data <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-06/Postwork/match.data.csv") 

data_ts <- data %>%
  mutate(sumagoles = home.score + away.score) %>% 
  group_by(date = lubridate::floor_date(as.Date(date), unit = "month")) %>% 
  summarise(promgoles = mean(sumagoles))

data_ts %>%
  ggplot(aes(date, promgoles)) +
  geom_line() +
  geom_point() +
  scale_x_date(date_labels = "%b. %Y")