# Carga las librerías
library(tidyverse)
library(tidytext)

# Cargar todos los ficheros de los mensajes en R
# Primero le indico a R cómo se llaman los ficheros con "list.files()"
# Con "path" le indico dónde están y con "pattern" qué ficheros debe elegir
ficheros <- list.files(path ="datos/mensajes",
                       pattern = "\\d+") # regex: 1 dígito una o más veces
# Necesitamos el número de cada año para identificar los textos
# Estos están dentro de la variable "ficheros" junto con ".txt"
# Usamos la función gsub() para eliminar ".txt" y extraer solo lo que nos interesa
anno <- gsub("\\.txt",
             "",
             ficheros, perl = T)

# Creamos una tabla vacía donde guardaremos los ficheros un poco más adelante
mensajes <- tibble(anno = character(),
                   parrafo = numeric(),
                   texto = character())

# Usamos un bucle para rellenar la tabla
for (i in 1:length(ficheros)){
  discurso <- readLines(paste("datos/mensajes",
                              ficheros[i],
                              sep = "/"))
  temporal <- tibble(anno = anno[i],
                     parrafo = seq_along(discurso),
                     texto = discurso)
  mensajes <- bind_rows(mensajes,
                        temporal)
}

# Generamos una tabla con todas las palabras
mensajes_palabras <- mensajes %>%
  unnest_tokens(palabra, texto)

# Crea la tabla con todas las palabras y calcula frecuencias
mensajes_frecuencias <- mensajes_palabras %>%
  count(palabra, sort = T) %>%
  mutate(relativa = n / sum(n))

# Borra objetos que no sirven y que son temporales
rm(temporal, discurso, i)

# Borra palabras vacías
vacias <- read_tsv("https://tinyurl.com/7PartidasVacias")
mensajes_vaciado <- mensajes_palabras %>%
  anti_join(vacias)

mensajes_vaciado <- mensajes_vaciado %>%
  mutate(rey = anno) %>%
  mutate(rey = ifelse(rey %in% as.character(c(1975:2013)),
                      "Juan Carlos I",
                      "Felipe VI"))

v1 <- 3
v2 <- 101
t <- c(1,2,3,4,5,6,7,8)
# t <- 1:8 Hubiera sido otra manera de hacerlo

v1 %in% t

mensajes_vaciado <- mensajes_vaciado %>%
  mutate(rey = anno) %>%
  mutate(rey = ifelse(rey %in% as.character(c(2014:2020)),
                      "Felipe VI",
                      "Juan Carlos I"))

mensajes_vaciado %>%
  group_by(rey) %>%
  count(palabra, sort = T) %>%
  top_n(10)%>%
  ggplot(aes(reorder(palabra, n),
             n,
             fill = rey)) +
  geom_bar(stat = "identity") +
  facet_wrap(~rey,
             scales = "free_y") +
  labs(x = "",
       y = "Frecuencia absoluta") +
  coord_flip() +
  theme(legend.position="none")
