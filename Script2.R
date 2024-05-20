########################################################
########################################################
##                                                    ##
##                   INICIACIÓN A R                   ##
##                                                    ##
##                     Script  2                      ##
##                                                    ##
########################################################
########################################################

# Algunas funciones y comandos vienen por defecto en R,
# pero la mayoría hay que instalarlos:

# Instalar paquetes (solo la primera vez)
install.packages("tokenizers")
install.packages("tidyverse")
install.packages("tidytext")

#Cargar los paquetes que vamos a usar en cada sesión con la función library()
library(tokenizers)
library(tidyverse)
library(tidytext)

# Información sobre el paquete y sus funciones
?tidyverse

# Primera prueba

texto <- "En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. Una olla de algo más vaca que carnero, salpicón las más noches, duelos y quebrantos los sábados, lantejas los viernes, algún palomino de añadidura los domingos, consumían las tres partes de su hacienda. El resto della concluían sayo de velarte, calzas de velludo para las fiestas, con sus pantuflos de lo mesmo, y los días de entresemana se honraba con su vellorí de lo más fino. Tenía en su casa una ama que pasaba de los cuarenta, y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza, que así ensillaba el rocín como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta años; era de complexión recia, seco de carnes, enjuto de rostro, gran madrugador y amigo de la caza. Quieren decir que tenía el sobrenombre de Quijada, o Quesada, que en esto hay alguna diferencia en los autores que deste caso escriben; aunque, por conjeturas verosímiles, se deja entender que se llamaba Quejana. Pero esto importa poco a nuestro cuento; basta que en la narración dél no se salga un punto de la verdad."
palabras <- tokenize_words(texto)
palabras

# Leer un archivo de texto en R

# Windows
soneto = readLines("Soneto.txt", encoding = "UTF-8")

# Mac
soneto = readLines("Soneto.txt")
soneto

# ¿Cuántos elementos tiene la variable soneto?
length(soneto)

# ¿Qué tipo de elementos son?
typeof(soneto)
class(soneto)

# Si me interesa el primer verso
soneto[1]

# Si me interesa el último verso
soneto[14]

# Para recuperar varios elementos a la vez
soneto[c(1,14)]

###########################
# Primer análisis textual #
###########################

# Crear una tabla con información del texto

poema <- tibble(línea = seq_along(soneto),
                  verso = soneto)
poema
length(poema)
# Número de filas
nrow(poema)
class(poema)

# Extraigo las palabras
poema_palabras <- poema %>%
  unnest_tokens(palabra, verso)
poema_palabras

# PALABRAS TIPO Y PALABRAS TOKENS #

# ¿Cuántas palabras tipo hay?
poema_palabras %>%
  count(palabra)

# Para ordenarlas por frecuencia

poema_palabras_frec_abs = poema_palabras %>%
  count(palabra,
        sort = TRUE)

poema_palabras_frec_abs

# Contar el número de caracteres: añadimos una columna con la función mutate()

poema_palabras_con_caracteres <- poema_palabras %>%
  mutate(NumLetras = nchar(palabra))

poema_palabras_con_caracteres

# ¿Cuántas palabras hay con un número de letras en concreto?
poema_palabras_con_caracteres %>%
  count(NumLetras)

# Ordenamos los datos anteriores de mayor a menor

poema_palabras_con_caracteres %>%
  count(NumLetras, sort = TRUE)

# FRECUENCIA ABSOLUTA Y FRECUENCIA RELATIVA #

# Calculamos las frecuencias relativas en tantos por mil

poema_frecuencias <- poema_palabras %>%
  count(palabra, sort = T) %>%
  mutate(relativa = 1000 * (n / sum(n))) 

poema_frecuencias

# PALABRAS GRAMATICALES #

# Filtrar las palabras vacías

vacias <- get_stopwords("es")

vacias

vacias <- vacias %>%
  rename(palabra = word)
vacias

poema_vaciado <- poema_palabras_frec_abs %>%
  anti_join(vacias)
view(poema_vaciado)

#################################################
#                 Ejercicio 2:                  #             
# Intenta hacer lo mismo con el Quijote de 1605 #
#################################################
