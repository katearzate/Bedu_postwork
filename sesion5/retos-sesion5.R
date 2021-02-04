#----------- RETO 1 -----------------
#Se cree que entre las variables x y y del archivo csv adjunto, podría haber una relación más o menos lineal
datos <- read.csv("datoslineal.csv")
attach(datos)
#1.Ajuste un modelo de regresión lineal simple a los datos, muestre un resumen del modelo ajustado y 
#trace la recta de regresión estimada junto con el gráfico de dispersión
plot(x, y, main = "Grafico de dispersion")
abline(lsfit(x, y))
#2.Obtenga algunas gráficas de diagnóstico y diga si es razonable suponer para los errores aleatoriedad, 
#normalidad y varianza constante.
modelo <- lm(y ~ x)
par(mfrow = c(2, 2)) 
plot(modelo)

#------------ RETO 2 ----------------
#1. Observe caracteristicas del dataframe con funciones tail y dim. obten grafico de dispersion de los datos
library(ggplot2); library(e1071)
tail(datos)
dim(datos)
datos <- mutate(datos, y = factor(y))
ggplot(datos, aes(x = x.1, y = x.2, colour = y)) +
  geom_point() +
  theme_dark() + ggtitle("Datos")
#2. genera un vector para filtrar un conjunto de entrenamiento a partir del conjunto de datos datos.
#con ayuda de las funciones tune y svm ajuste máquinas de vectores de soporte con un kernel radial a los 
#datos de entrenamiento
vec <- sample(300, 150)
tail(as.data.frame(vec))
set.seed(65)
vec.soporte <- tune(svm, y~., data = datos[vec, ],
                    kernel = "radial",
                    ranges = list(cost = c(0.1, 1, 10, 100, 1000),
                                  gamma = c(0.5, 1, 2, 3, 4)))

#3. realiza clasificación con la función predict y el conjunto de datos de prueba.
table(true = datos[-vec, "y"],
      pred = predict(vec.soporte$best.model, newdata = datos[-vec,]))