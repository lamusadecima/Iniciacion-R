########################################################
########################################################
##                                                    ##
##                   INICIACIÓN A R                   ##
##                                                    ##
##                     Script  3                      ##
##                                                    ##
########################################################
########################################################

# Adaptado de Fradejas Rueda, J. M. (2019). Cuentapalabras. 
#Estilometría y análisis de textos con R para filólogos. 
#7 Partidas Digital-Universidad de Valladolid. 
#http://www.aic.uva.es/cuentapalabras/

# Fijamos el directorio de trabajo
# En Windows
setwd("C:/seminarioR")

#En Mac
setwd("Desktop/seminarioR") 

# Crea dentro de "seminarioR" un directorio que se llame "datos"
# y dentro de este uno llamado "mensajes"

dir.create("datos")
dir.create("datos/mensajes")

# Comprueba que está vacío
list.files("datos/mensajes")

# Descargar los mensajes de Navidad

# Creamos un vector con los años
annos <- c("1975", "1976", "1977", "1978", "1979", "1980", "1981", "1982", "1983", "1984", "1985", "1986", "1987", "1988", "1989", "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019", "2020")

# Como los mensajes están en formato de texto plano,
# le decimos que añada la terminación ".txt"
# a todos los elementos (años) del vector
annos <- paste(annos, "txt", sep = ".")

annos

# Creamos otra variable para la ruta donde están los mensajes
ruta <- "https://raw.githubusercontent.com/7PartidasDigital/AnaText/master/datos/mensajes/"

# Descargamos todos los textos a la vez con un bucle

for (i in 1:length(annos)){ # Para indicarle cuántas pasadas tiene que hacer, le decimos que tantas como elementos hay dentro del vector años
  entrada <- readLines(paste(ruta,
                             annos[i],
                             sep = ""),
                       encoding = "UTF-8")
  # Tenemos que indicarle dónde están los archivos con
  # la variable ruta y el nombre de cada fichero.
  # Los unimos con la función paste()
  # Añadimos el parámetro de encoding para evitar problemas en Windows
  writeLines(entrada,
             paste("datos/mensajes",
                   annos[i],
                   sep = "/"))
  # con writeLines() grabamos los ficheros en el directorio creado
  # Tiene dos argumentos: qué grabar (entrada)
  # y cómo se llamará cada fichero (annos).
  # Con sep = "/" indicamos el cambio a nivel de directorio
  # después de "mensajes"
}

# Comprobamos que ha funcionado
list.files("datos/mensajes")

