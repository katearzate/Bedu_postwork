# ---------- RETO 1 ---------
#Carga el data set BD_Altura_Alunos.csv
library(ggplot2)
data <- read.csv("C:/Users/Katherine Arzate/Documents/BEDU/Programacion-con-R-Santander-master/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep = ";");
head(data)

#Realiza el histograma con la función hist(), nativa de R
hist(data$Altura,
     breaks = 5,
     main = "Histograma de las alturas de alumnos",
     ylab = "Frecuencia",
     xlab = "Alturas",
     col = "orange"
     )
#Histograma usando la funcion ggplot (instalar el paquete ggplot2)
ggplot(data, aes(Altura))+ 
  geom_histogram(binwidth = 5, col="black", fill = "red") + 
  ggtitle("Histograma de las alturas de alumnos") +
  ylab("Frecuencia") +
  xlab("Alturas") + 
  theme_light()


# ---------- RETO 2 ----------
#Generar un histograma de los minuntos totales (MIN), de los jugadores 
#y agregar una línea donde se muestre la media
game <- read.csv("C:/Users/Katherine Arzate/Documents/BEDU/Programacion-con-R-Santander-master/Sesion-03/Reto-02/players_stats.csv")
head(game)
mint <- mean(game$MIN)  #almacenar la media en una variable

ggplot(game, aes(MIN))+ 
  geom_histogram(binwidth = 40, col="black", fill = "red") + 
  ggtitle("Minutos por jugador", paste("Media=",mint)) +
  ylab("Frecuencia") +
  xlab("Minutos") +
  geom_vline(xintercept =  mint, col = "blue")+
  theme_light()

#Generar un histograma de edad (Age) y agregar una línea con la media
head(game)
edad <- mean(na.omit(game$Age)) #na.omit es para omitir espacios en blanco

ggplot(game, aes(Age))+ 
  geom_histogram(binwidth = 2, col="black", fill = "red") + 
  ggtitle("Edades de jugadores", paste("Media=",edad)) +
  ylab("Frecuencia") +
  xlab("Edad") +
  geom_vline(xintercept =  edad, col = "blue")+
  theme_light()

#Scatterplot de las variables Weight y Height y observar la correlacón 
#que existe entre ambas variables (1 sola gráfica)
peso_alt <- game %>% ggplot(aes(Weight, Height)) + geom_point()
peso_alt

#Jugador mas alto con which.max
alto <- game[which.max(game$Height), c("Name", "Height", "Weight")] 
paste("El jugador más alto es:", alto$Name, ", con una altura de ",(alto$Height)/100, "mtros")

#Jugador mas bajo con which.min
bajo <- game[which.min(game$Height), c("Name", "Height", "Weight")]
paste("El jugador más bajo es:", bajo$Name, ", con una altura de ",(bajo$Height)/100, "mtros")

#Altura promedio
altProm <- mean(na.omit(game$Height))
paste("La altura promedio es ",round(altProm/100, 2)," metros")

#Scatterplot con las asistencias totales (AST.TOV) vs Puntos (PTS)
#y un facet wrap con la posición (Pos)
game %>% ggplot(aes(AST.TOV,PTS))+geom_point()+facet_wrap("Pos")


# ------------- RETO 3 -------------
#Gráfica de la serie d tiempo de los datos (AP)
library(forecast)
data("AirPassengers")
Ap <- AirPassengers


