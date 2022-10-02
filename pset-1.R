## Problem set 1 Taller de R
##Mariana  Ordonez 202021691
##Ivan Rodriguez 202112819
##Laura Sofia Arana 202020594

## Taller A ##

## Limpiar el entorno
rm(list=ls())

##Librerias a usar:
require (pacman)
library(readr) 
library(tidyverse)
library(rio)
library(pacman)

##1. Cree un vector que contenga los números del 1 al 100
a = c(1:100)
a
## Cree otro vector que contenga los números impares de 1 a 99
b = c((1:50)*2- 1)
b
## Use el vector de números impares para crear un vector que contenga los números
##pares del primer vector.
d = c(b+1)
d


## 2. Importar/exportar bases de datos

##2.1 Importar
##Importe las bases de datos Enero - Cabecera - Características generales (Personas).csv y Enero -Cabecera - Ocupados.csv.
caractgen <- import("input/Enero - Cabecera - Caracteristicas generales (Personas).csv")
ocu <- import("input/Enero - Cabecera - Ocupados.csv")

#2.2 Exportar
##Exporte a la carpeta output los objetos cargados en el punto anterior, guárdelos como Características
##generales (Personas).rds Ocupados.rds.
export(x=caractgen , file="output/Características generales (Personas).rds")
export(x=ocu , file="output/Ocupados.rds")



##3. Generar variables
##Sobre el objeto que contiene la base Ocupados, genere una variable ocupado que sea igual a 1
ocu$ocupado =1

##Sobre el objeto que contiene las Caracteristicas generales, genere una variable joven que sea igual
##a 1 si la persona tiene entre 18 y 28 años de edad.
caractgen$joven = ifelse(test=caractgen$P6040>18 &caractgen$P6040<28 , yes=1 , no=0)


##4. Eliminar filas/columnas de un conjunto de datos
##Del objeto que contiene las Características generales, deje únicamente las observaciones para las
##personas entre 18 y 70 años de edad.
caractgen_nueva = caractgen %>% subset(P6040 > 18&P6040<70)

## Del objeto que contiene las Características generales, seleccione las variables secuencia_p, orden,
##hogar, directorio, P6020, P6040, P6920, DPTO, fex_c_2011, ESC y MES
##Nota: No se tomó en cuenta P6920 ya que no aparece en el objeto.
caractgen %>% select(SECUENCIA_P, ORDEN, HOGAR, DIRECTORIO, P6020, P6040, DPTO, fex_c_2011, ESC, MES) 

##Del objeto que contiene la base Ocupados, seleccione las variables secuencia_p, orden, hogar,
##directorio, ocupado, INGLABO y P6050
##Nota: No se tomó en cuenta P6920 ya que no aparece en el objeto.
ocu %>% select(SECUENCIA_P, ORDEN, HOGAR, DIRECTORIO, ocupado, INGLABO)

