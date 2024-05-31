# Cargar las librerías necesarias
library(dplyr)

# Establecer la ruta de los archivos 
setwd("//yourpath//")
training_file_path <- "/yourpath//wineTraining.data"
test_file_path <- "//yourpath//wineTest.data"

source("KNN-Preprocesamiento.R")
source("KNN-Predict.R")
source("KNN-DistanciaEuclidiana.R")



# leer archivo y normalizar los datos
normalized_data <- normalize_data(training_file_path, test_file_path)
# recuperar datos de la funcion
training_labels <- normalized_data$training_labels
training_features_norm <- normalized_data$training_features_norm
test_labels <- normalized_data$test_labels
test_features_norm <- normalized_data$test_features_norm



# predecir la clase de 3 nuevos objetos

# Número de vecinos más cercanos
k <- 5

# Clasificar 3 objetos de wineTest.data
predictions <- c()
for (i in 1:3) {
  test_instance <- test_features_norm[i, ]
  predicted_class <- knn_predict(train_data = training_features_norm, train_labels = training_labels, test_instance = test_instance, k = k)
  predictions <- c(predictions, predicted_class)
  cat("La clase predicha para el objeto", i, "es:", predicted_class, "\n")
}

# Resultados
cat("Resultados de la clasificación KNN para 3 objetos de wineTest.data con K=5\n\n")
for (i in 1:3) {
  cat("Objeto", i, ":\n")
  print(test_features_norm[i, ])
  cat("Clase predicha:", predictions[i], "\n\n")
}
