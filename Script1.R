########################################################
########################################################
##                                                    ##
##                   INICIACIÓN A R                   ##
##                                                    ##
##                     Script  1                      ##
##                                                    ##
########################################################
########################################################

# Algunas funciones básicas de R

# Funciones matemáticas en R
# Operadores: =, <-, ==, +, etc.

1 + 1
10-5
10 * 4532
45320 / 10
10 * pi

# Raíz cuadrada
sqrt(144)
#Para las potencias
2^3
#Valor absoluto
abs(-4)
#Redondear
round(1.8)

# Para entender los índices
10:100

# ¿Qué pasa si tecleas una orden incompleta como 3-?

#Crear variables
x = 10
10 -> x
x <- 10

# Inspeccionar una variable
x

# Algunas pruebas
x-2
x
y = 5
x + y
x
y
z = x + y
z

y == x        # Comparar x con y. "==" (igualdad) "!=" (desigualdad)

# Creo variables con texto

k = "HELLO WORLD!"

VariableMicrorrelato = "Cuando despertó, el dinosaurio todavía estaba allí"

# Función en R

print(k) # imprimir en pantalla la variable
print("HELLO WORLD!")

nchar(VariableMicrorrelato) #contar el número de caracteres

# Para acceder a la documentación
help()
help(sqrt)

#Lista de variables
ls()

#Eliminar una variable
rm(z)

# Directorio de trabajo

# Crear un directorio de trabajo

# Para Windows
dir.create("C:/seminarioR")
#Para Mac
dir.create("Desktop/seminarioR")

# Fijar el directorio de trabajo

# En Windows
setwd("C:/seminarioR") # ruta donde están los archivos con los que quiero trabajar

#En Mac
setwd("Desktop/seminarioR") # ruta donde están los archivos con los que quiero trabajar

# Para saber en qué directorio estoy

getwd()

# Coloca dentro de la carpeta "seminarioR" que acabas de crear
# los documentos txt que has descargado de GitHub

#################################################################
#               Ejercicio1:                                     #
# Si a vale 546 y b vale 328, ¿la suma de ambos es igual a 844? #
#            Debes llegar hasta TRUE                            #
# Cuenta el número de caracteres de "HELLO WORLD!"              #
#################################################################
