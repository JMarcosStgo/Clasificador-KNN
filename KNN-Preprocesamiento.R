normalize_data <- function(training_file_path, test_file_path) {
  # Leer los archivos .data separados por comas
  training_data <- read.csv(training_file_path, header = FALSE, sep = ",")
  test_data <- read.csv(test_file_path, header = FALSE, sep = ",")
  
  # Separar la columna de clase del resto de las características
  training_labels <- training_data[, 1]
  training_features <- training_data[, -1]
  test_labels <- test_data[, 1]
  test_features <- test_data[, -1]
  
  # Calcular las medias y desviaciones estándar de las columnas numéricas en el conjunto de entrenamiento
  mean_features <- sapply(training_features, mean, na.rm = TRUE)
  sd_features <- sapply(training_features, sd, na.rm = TRUE)
  
  # Normalizar los datos utilizando las medias y desviaciones estándar calculadas
  training_features_norm <- as.data.frame(scale(training_features, center = mean_features, scale = sd_features))
  test_features_norm <- as.data.frame(scale(test_features, center = mean_features, scale = sd_features))
  
  return(list(
    training_labels = training_labels,
    training_features_norm = training_features_norm,
    test_labels = test_labels,
    test_features_norm = test_features_norm
  ))
}
