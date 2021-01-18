# -------- POSTWORK SESION 3 -----------
library(dplyr)
tem1 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
tem2 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
tem3 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

tem1.1 <- select(tem1, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
tem2.1 <- select(tem2, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
tem3.1 <- select(tem3, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

tem1.1 <- mutate(tem1.1, Date = as.Date(Date, "%d/%m/%y"))
tem2.1 <- mutate(tem2.1, Date = as.Date(Date, "%d/%m/%y"))
tem3.1 <- mutate(tem3.1, Date = as.Date(Date, "%d/%m/%y"))

comb <- rbind(tem1.1, tem2.1, tem3.1)
View(comb)

#1.Con el último data frame obtenido en el postwork de la sesión 2, 
#elaborar tablas de frecuencias relativas para estimar las probabilidades:
#
#Prop. de que el equipo que juega en casa anote x goles (x=0,1,2..)
casa <- round((table(comb$FTHG)/(dim(comb)[1]))*100,2)

#Prop. de que el equipo que juega como visitante anote y goles (y=0,1,2..)
visit <- round((table(comb$FTAG)/(dim(comb)[1]))*100,2)

#Prop. de que el equipo que juega en casa anote x goles y el de visita
#anote y goles (x=0,1,2, y=0,1,2,)
ambos <- round(table(comb$FTHG,comb$FTAG)/(dim(comb)[1])*100,2)


#2.Realizar lo siguiente:
#
#Grafico de barras para las prob marginales estimadas de #goles en casa
barplot(casa, main ="Probabilidad de x goles en casa",
     xlab="Numero de goles",ylab="Frecuencia en %",col="blue")

#Grafico de barras para las prob marginales estimadas de #goles de visitantes
barplot(visit, main ="Probabilidad de y goles de visitantes",
        xlab="Numero de goles",ylab="Frecuencia en %",col="red")

#Un heatmap para prob conjuntas estimadas de #goles de casa y de equipo visitante
library(ggplot2)
heatmap(ambos, Colv = NA, Rowv = NA, scale = "column",xlab = "visitante", 
        ylab = "casa", main = "Probabilidades conjuntas de goles")

geom_tile()


