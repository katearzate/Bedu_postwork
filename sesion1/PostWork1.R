# -------- POSTWORK SESION 1 -----------

#importar datos de soccer de temporada 2019/2020, 1° division
soccer <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#extraer las columnas que contienen # de goles anotados por los equipos que jugaron 
#en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)
casa <- soccer$FTHG
visit <- soccer$FTAG
?table #revisar como funciona 'table'

#Tablas de frecuencias relativas para estimar probabilidades
#1. Prob. de que FTHG anote x goles (x=0,1,2..)
tot <- dim(soccer)[1]  #para saber la cantidad de renglones
(table(casa)/tot)*100  #se multiplica para tener el resultado en %

#2. Prob. de que FTAG anote y goles (y=0,1,2..)
(table(visit)/tot)*100

#3. Prob. de que FTHG anote x goles y FTAG anote y goles (x=0,1,2.. y=0,1,2..)
(table(casa,visit)/tot)*100
