# -------- RETO 1 ------------
netflix <- read.csv("https:\\raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")
dim(netflix)  #dimensiones del archivo
class(netflix) #tipo de objeto

#Titulos estrenados despues del 2015
net2015 <- subset(netflix, release_year > 2015) 
#puede ser de esta opcion o de la siguiente:
net.2015 <- netflix[netflix$release_year > 2015,]
head(net2015)
head(net.2015)

write.csv(net2015, "res.netflix.csv") #escribir resultados 


# -------- RETO 2 ----------
#leer y amacenar data frame de ventas de libros por Amazon
amazon.best <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/bestsellers%20with%20categories.csv")

t(amazon.best)  #muestra transpuesto el data frame
as.data.frame(t(amazon.best)) #convierte en data frame
tAmazon <- as.data.frame(t(amazon.best))

colnames(tAmazon) <- tAmazon[1,]
row.names(tAmazon)  

which.min(tAmazon["Price",])  #libro de menor precio
which.max(tAmazon["Price",])  #libro de mayor precio


# -------- RETO 3 ----------
ran <- rnorm(44)  #vector de 44 entradas aleatorias

#loop que eleva al cubo las 1eras 15 entradas
#y les suma 12, almacenando esos datos en 'ele'
ele <- vector() 
for(i in 1:15) {
  ele[i] <- (ran[i]^3)+12
  print(ele)
}


#data frame: 1ra columna es # aleatorio y la 2da el resultado
df.al <- data.frame(ran = ran[1:15],ele) 

# Pseudocódigo: 

# ran <- (se crea vector con rnorm de 44 entradas aleatorias)
# ele <- (inicializa un vector donde será almacenado el resultado)
#
# for (contador desde 1 hasta 15 ){
#   ele[contador] <- (operación realizada)
#   (se imprime el resultado (ele))
# }

