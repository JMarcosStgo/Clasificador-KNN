# Función para encontrar el valor de clase usando KNN
knn_predict <- function(train_data, train_labels, test_instance, k) {
  # Calcular la distancia entre el test_instance (el objeto)  y todos los puntos del train_data
  distances <- apply(train_data, 1, euclidean_distance, b = test_instance)
  
  # Combinar las distancias con los labels correspondientes
  distance_labels <- data.frame(distances, train_labels)
  
  # Ordenar las distancias de menor a mayor
  sorted_distances <- distance_labels[order(distance_labels$distances), ]
  
  # Obtener los K más cercanos
  k_nearest <- sorted_distances[1:k, ]
  
  # Obtener la clase mayoritaria entre los K más cercanos
  predicted_class <- as.numeric(names(sort(table(k_nearest$train_labels), decreasing = TRUE))[1])
  
  return(predicted_class)
}