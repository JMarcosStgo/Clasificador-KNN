# Función para calcular la distancia euclidiana entre dos vectores
euclidean_distance <- function(a, b) {
  sqrt(sum((a - b) ^ 2))
}