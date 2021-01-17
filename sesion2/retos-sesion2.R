# --------- RETO 1 ---------
set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

# 1. Calcule, la media, mediana y moda de los valores en x
mean(x);median(x);Mode(x)

# 2. Obtenga los deciles de los numeros en x
quantile(x, props = seq(0.1, 0.9, by = 0.1))

# 3. Encuentre el rango intercuartilico, la desviación estándar y varianza muestral
IQR(x); sd(x);var(x)

# --------- RETO 2 ---------

# Considere el data frame mtcars y utilice las funciones str, summary, head y view 
str(mtcars) 
summary(mtcars)
head(mtcars)
View(mtcars)

# --------- RETO 3 ---------
# Descargue los archivos csv que corresponden a las temporadas 2017/2018, 2018/2019, 2019/2020 y 2020/2021 
# Importe los archivos descargados a R

setwd("~/BEDU/Bundesliga")

b1.17 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"
b2.18 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
b3.19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
b4.20 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"

download.file(url = b1.17, desfile="b1 2017-2018", mode="wb")
download.file(url = b2.18, desfile="b2 2018-2019", mode="wb")
download.file(url = b3.19, desfile="b3 2019-2020", mode="wb")
download.file(url = b4.20, desfile="b4 2020-2021", mode="wb")

lista <- lapply(dir(), read.csv)

# seleccionar únicamente las columnas: Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR
library(dplyr)

lista <- lapply(lista, select, Date,HomeTeam:FTR)   #HomeTeam:FTR toma todas las columnas entre esas dos
head(lista[[1]]); head(lista[[2]]); head(lista[[3]]); head(lista[[4]])

# Combine cada uno de los data frames en un único data frame con las funciones rbind y do.call
data <- do.call(rbind, lista)
head(data);tail(data)
dim(data)
