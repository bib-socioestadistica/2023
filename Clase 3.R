###################################
### CAPACITACION EN R - CLASE 3 ###
###################################

## Myrian Aguilar, 23 de Agosto de 2021 ##

####################################################
### Borrar los datos de entorno cargados en memoria 
####################################################
rm(list=ls())


setwd("C:/ARRAYANES/LABORATORIO_R") # entre () y "" va el camino al directorio de trabajo deseado

##Paquetes-----------------
install.packages("tidyverse") # instalo el paquete
library(tidyverse)


install.packages("ggplot2")
library(ggplot2)

#veamoslo en acción

data("BOD") #trae una base de datos de R
ggplot(data= BOD) + geom_line(aes( x = Time, y = 
                                       demand))


#secuencias aleatoreas------
sample(1:10, 10, rep = T)
sample(1:10, 10, replace = T)
sample(1:10, 10, rep = TRUE)
sample(1:10, 10, T)

# genero un vector llamado experimento con una tirada de 1000 valores al azar 
# con repetición dentro del espacio muestral (éxito - falla).

experimento <- sample(c("exito","falla"), 1000, replace=T)
table(experimento)

experimento1 <- sample(c("exito","falla"), 1000, 
                       replace = T, prob = c(0.9, 0.1))# modifico la probabilidad
table(experimento1)

#matriz------
matrix(1:6) 
matrix(1:6, nrow = 2) 
matrix( 1:6, nrow = 2, byrow = TRUE) 

#indexacion de matrices
x <- matrix( 1:6, nrow = 3)   # Creamos una matriz 2 x 3 
x

x[1,2]   #Se muestra el elemento de fila 1 columna 2
x[ ,2]   #Se muestra toda la columna 2
cbind(x,c(0,0,0))      # Se añade una columna de ceros a x 
rbind(x, c(0,0))        # Se añade una fila de ceros a x 

#asignando nombre a filas y columnas

datos <- matrix(c(20, 65, 174, 22, 70, 180, 19, 68, 170), 
                  nrow = 3, byrow = T)   #Se crea una matrix 3x3
datos 
colnames(datos) <- c("edad","peso","altura") # nombres a col
datos
rownames(datos) <- c("paco","pepe","kiko") # nombres a filas
datos 

#otro ejemplo
datos <- matrix(c(20, 65, 174, 22, 70, 180, 19, 68, 170), 
                  nrow = 3, byrow = T)   #Se crea una matrix 3x3
datos 
dimnames(datos) <- list( c("paco", "pepe", "kiko"), 
                           c("edad", "peso", "altura"))
datos 

datos[,"edad"]            # Edades de todas las personas 

#dataframe-----
id <- 1:4
edad <- c(23, 43, 12, 65)
sexo <- c("M", "F", "F", "M")
trabaja <- c(T, T, F, F)
datos <- data.frame( id, edad, sexo, trabaja)
datos

class(datos) # pido la clase

str(datos) # cómo se compone el objeto datos

View(datos) #ver la tabla en una pestaña dentro de la zona del Editor de código

data.frame( nombres = c("julia", "jorge", "javier"), 
            notas = c(4, 7, 9, 5))# devuelve error porque las longitudes de los objetos son diferentes
dim(datos) #devuelve un vector con las dimensiones del dataframe

data(women)#dataframe de prueba que viene instalado en R

head(women)#ver la cabecera del dataframe
tail(women)# vemos la cola del dataframe

id <- 1:4
edad <- c(23, 43, 12, 65)
sexo <- c("M", "F", "F", "M")
trabaja <- c(T, T, F, F)
datos <- data.frame( id, edad, sexo, trabaja)

#generamos otra con los datos nuevos

id <- 5:9
edad <- c(37, 45, 52, 25, 32)
sexo <- c("F", "F", "F", "M", "M")
trabaja <- c(T, F, T, F, F)
datos_nuevos <- data.frame( id, edad, sexo, trabaja)

datos_todos <- rbind(datos, datos_nuevos)
datos_todos


# Creemos una nueva variable llamada estudia y la unimos a datos_todos mediante la 
# función cbind(). Con la función head() observamos la cabecera de la tabla para ver si 
# realmente se cumplió la unión

estudia <- c(T, F, T, F, F, T, T, F, F)
datos_estudia <- cbind(datos_todos, estudia)
head(datos_estudia)

# importar hoja de calculo

require(readr)
mi_csv <- read.csv2( "mydata.csv", header = TRUE, 
                        sep = "," , dec = ".")
head(mi_csv)

install.packages("readxl")
library(readxl)


# desde excel
mi_excel <- read_excel("mydata.xlsx", col_names = TRUE)
head(mi_excel)

#exportar
write.table(mi_csv, file = "mi_csv.txt", sep = ",", 
            row.names = FALSE)
#gestion de tablas
library(tidyr) #activamos 

require(tidyr)
args(gather)

# incidencia de tuberculosis
require(readxl)
tb1 <- read_xlsx("incidencia_tb.xlsx", sheet = "Data")
tb1

tb2 <- gather(data = tb1, key = "año" ,value = "tasa", -Paises)
tb2
#Veamos qué hubiese pasado si no hubiésemos excluido la columna "Paises"

tb2 <- gather(data = tb1, key = "año" ,value = "tasa")
tb2

#conjunto de datos países (basado en el dataset gapminder)

require(readr)
Paises <- read_csv("paises.csv")
Paises
# Como podemos observar, bajo la columna type tenemos valores como pop y lifeExp 
# que son variables con sus respectivos valores por país en la columna value.

Paises2 <- spread(Paises,key = "type", value = "value" )
Paises2

#corregir caracteres

personas <- read_csv2("datospersonas.csv")# lee lo tabla
personas

Encoding(personas$Apellido) <- "latin1"
personas

#separar informacion de una columna
args(separate)
#separar columnas
args(unite)
#Donde:
 # data: el objeto de datos tbl o dataframe
#col: el nombre de la nueva columna donde almacenaremos los valores unidos
#. . . : el listado de columnas a unir separadas por coma
#sep: el caracter separador para la unión. Es opcional, siendo predeterminado el caracter guión bajo (_)
#remove: es opcional y por defecto está activo. Significa que elimina las columnas originales.


#Supongamos que queremos unir los datos de Apellido y Nombre en una sola columna

unite(data = personas, 
        col = "Nombre_completo", Apellido, Nombre, sep = " ")

#qué hubiese pasado si escribíamos
unite(data = personas, 
        col = "Nombre_completo", Apellido, Nombre, sep = "")


###########################
### Fin del script 
###########################