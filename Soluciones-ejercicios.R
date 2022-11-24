########################################################
########################################################
##                                                    ##
##                   INICIACIÓN A R                   ##
##                                                    ##
## Seminario del máster en Humanidades Digitales UNIR ##
##             Soluciones ejercicios                  ##
##                                                    ##
########################################################
########################################################

###############
# Ejercicio 1 #
###############

# Primera parte
a = 546
b = 328
a + b == 844
a + b != 844

# Segunda parte
nchar(k)

###############
# Ejercicio 2 #
###############

#Cargar los paquetes que vamos a usar en cada sesión con la función library()
library(tokenizers)
library(tidyverse)
library(tidytext)

# Leer un archivo de texto en R

# Windows
quijote1 = readLines("quijote-1605.txt", encoding = "UTF-8")

# Mac
quijote1 = readLines("quijote-1605.txt")
quijote1

# ¿Cuántas líneas?
length(quijote1)

typeof(quijote1)
quijote1[1]
quijote1[2]
quijote1[22]

tabla_quijote1 <- tibble(linea = seq_along(quijote1),
                  texto = quijote1)

tabla_quijote1

quijote1_palabras <- tabla_quijote1 %>%
  unnest_tokens(palabra, texto)
quijote1_palabras

# ¿Cuántas palabras tipo hay?
quijote1_palabras %>%
  count(palabra)

# Para ordenarlas por frecuencia

quijote1_palabras_frec_abs = quijote1_palabras %>%
  count(palabra,
        sort = TRUE)
quijote1_palabras_frec_abs

# Contar el número de caracteres: añadimos una columna con la función mutate()

quijote1_palabras_con_caracteres <- quijote1_palabras %>%
  mutate(NumLetras = nchar(palabra))

quijote1_palabras_con_caracteres

# ¿Cuántas palabras hay con un número de letras en concreto?
quijote1_palabras_con_caracteres %>%
  count(NumLetras)

# Ordenamos los datos anteriores de mayor a menor

quijote1_palabras_con_caracteres %>%
  count(NumLetras, sort = TRUE)

# Calculamos las frecuencias relativas en tantos por mil

quijote1_frecuencias <- quijote1_palabras %>%
  count(palabra, sort = T) %>%
  mutate(relativa = 1000 * (n / sum(n))) 
quijote1_frecuencias

# Filtrar las palabras vacías

vacias <- get_stopwords("es")

vacias

vacias <- vacias %>%
  rename(palabra = word)
vacias

quijote1_vaciado <- quijote1_palabras_frec_abs %>%
  anti_join(vacias)
view(quijote1_vaciado)

