# -------- POSTWORK SESION 2 -----------

#datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división
tem1 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
tem2 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
tem3 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#presentacion de los data frames con las sig. funciones:
str(tem1); str(tem2); str(tem3)
head(tem1); head(tem2); head(tem3)
View(tem1); View(tem2); View(tem3)
summary(tem1); summary(tem2); summary(tem3)

#selecciona columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR
library(dplyr)
tem1.1 <- select(tem1, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
tem2.1 <- select(tem2, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
tem3.1 <- select(tem3, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

#los elementos de las columnas de los 3 nuevos data frames deben
#ser del mismo tipo: uso de 'as.Date' y 'mutate' para fechas
tem1.1 <- mutate(tem1.1, Date = as.Date(Date, "%d-%m-%y"))
tem2.1 <- mutate(tem2.1, Date = as.Date(Date, "%d-%m-%y"))
tem3.1 <- mutate(tem3.1, Date = as.Date(Date, "%d-%m-%y"))

lista <- list(tem1.1, tem2.1, tem3.1) #los 3 data frames en una lista

#Con rbind formar un único data frame
comb <- rbind(tem1.1, tem2.1, tem3.1) #se puede hacer así 

#o se puede utilizando la lista creada anteriormente usando 'do.call'
final <- do.call(rbind, lista)

dim(comb)
dim(final)
View(final)