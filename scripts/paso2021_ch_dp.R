# Librerias
library(data.table)
library(readxl)
library(tidyverse)

# Seteo word directory
setwd("I:/Especializacion/GIS/TP1/")

# Limpio la memoria
rm( list=ls() )
gc()

paso <-fread("Paso2021_Chaco.csv", encoding = "UTF-8")

#Filtro por diputados provinciales y me quedo tambien solo con los votos positivos
paso <- paso[tipoVoto=="positivo" & Cargo=="DIPUTADOS PROVINCIALES",]

# Agrego por votos por circuito y agrupacion, y tambien saco los votos positivos totales
paso <- paso[, .(votos = sum(votos)), by=.(IdCircuito, Agrupacion)]
paso[, votosPositivos := sum(votos), by=.(IdCircuito)]

# Creo una tabla auxiliar para obtener los votos totales por agrupacion
votTot <- paso[, .(votos = sum(votos)), by= .(Agrupacion)]
votTot[, porcentaje:= votos/sum(votos)*100]

# Ordeno por votos y me quedo con las 4 fuerzas principales
setorder(votTot, -votos)
votTot <- votTot[, head(.SD, 4)]

# Me quedo solo con los datos de dichas fuerzas
paso <- paso[Agrupacion %in% votTot$Agrupacion,]

# Pivoteo los votos de las agrupaciones para tenerlas en columnas

paso <- pivot_wider(paso, names_from = "Agrupacion", values_from = "votos")

# Guardo los resultados en un archivo de salida
fwrite(paso, "resultadosPaso.csv")
