# ---------------- POSTWORK SESION 7 ---------------------
#
#Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:
#
#1.Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match
#2.Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base
#3.Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el número de goles que metió 
#el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?
library(mongolite)	

setwd("../Sesión 7/") 
match=data.table::fread("../data.csv")	
names(match)	

collection = mongo(collection = "match", db = "match_games")
collection$insert(match)  #insertando el CVS a la BDD	

# Número de registros	
collection$count()	

# Visualizar el fichero 	
collection$find()	

# Basic queries: ¿Cuántos goles metió como local el Real Madrid el la fecha estipulada?	
collection$find('{"date":"2015-12-20", "home_team":"Real Madrid"}')	#No se encontró ningun dato en ese año

#Agregar otro CVS a la DDB	
collection = mongo(collection = "mtcars", db = "match_games") # create connection, database and collection	
collection$insert(mtcars)	

# Cerrando la conexión	
rm(collection)