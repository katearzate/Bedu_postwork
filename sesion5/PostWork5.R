# ---------- POSTWORK SESION 5 --------------
#
library(dplyr)
soc1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv") 
soc1819 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")	
soc1920 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#1. crea el data frame `SmallData`, que contenga las columnas `date`, `home.team`, 
#`home.score`, `away.team` y `away.score`
conjunto <- list(soc1718, soc1819, soc1920)	
nvoconjunto <- lapply(conjunto, select, Date, HomeTeam, FTHG, AwayTeam, FTAG)

nvoconjunto[[1]] <- mutate(nvoconjunto[[1]], Date = as.Date(Date, "%d/%m/%y"))
nvoconjunto[[2]] <- mutate(nvoconjunto[[2]], Date = as.Date(Date, "%d/%m/%y"))
nvoconjunto[[3]] <- mutate(nvoconjunto[[3]], Date = as.Date(Date, "%d/%m/%y"))
conjuntofinal <- do.call(rbind, nvoconjunto)

SmallData <- select(conjuntofinal, date = Date, home.team = HomeTeam, 	
                    home.score = FTHG, away.team = AwayTeam, 	
                    away.score = FTAG)	
#guarda el data frame como un archivo csv con nombre *soccer.csv*. 
write.csv(x = SmallData, file = "soccer.csv", row.names = FALSE)

#2. Con la función `create.fbRanks.dataframes` del paquete `fbRanks` 
#importe el archivo *soccer.csv* a `R` y asignelo a una variable llamada `listasoccer`.
library(fbRanks)
listasoccer <- create.fbRanks.dataframes(scores.file = "soccer.csv")	
anotaciones <- listasoccer$scores	
equipos <- listasoccer$teams

#3. crea un vector de fechas (`fecha`) que no se repitan y que correspondan a las fechas 
#en las que se jugaron partidos. Crea una variable llamada `n` que contenga el # de fechas diferentes
#crea un ranking de equipos usando unicamente datos desde la fecha inicial y hasta la penultima fecha 
#en la que se jugaron partidos, especificando "max.date" y "min.date"
fecha <- unique(anotaciones$date)	
n <- length(fecha)	
ranking <- rank.teams(scores = anotaciones, teams = equipos,	
                      max.date = fecha[n-1],	
                      min.date = fecha[1])

#4. estima las probabilidades de los eventos, el equipo de casa gana, el equipo visitante gana o el 
#resultado es un empate para los partidos que se jugaron en la ultima fecha del vector de fechas `fecha`.
prediccion <- predict(ranking, date = fecha[n])

