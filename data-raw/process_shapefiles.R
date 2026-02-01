# Script para procesar y agregar más shapefiles al paquete
# Script to process and add more shapefiles to the package

# Cargar librerías necesarias / Load necessary libraries
library(sf)
library(dplyr)

# ==============================================================================
# INSTRUCCIONES / INSTRUCTIONS
# ==============================================================================
# Este script muestra cómo agregar nuevos shapefiles al paquete inventarioRRNN
# This script shows how to add new shapefiles to the inventarioRRNN package
#
# Pasos / Steps:
# 1. Colocar los archivos shapefile en data-raw/shape_files/
#    Place the shapefile files in data-raw/shape_files/
#
# 2. Leer el shapefile usando sf::st_read()
#    Read the shapefile using sf::st_read()
#
# 3. Limpiar y preparar los datos si es necesario
#    Clean and prepare the data if needed
#
# 4. Guardar el objeto como .rda usando usethis::use_data()
#    Save the object as .rda using usethis::use_data()
#
# 5. Documentar el dataset en R/data.R
#    Document the dataset in R/data.R
#
# 6. Regenerar la documentación con devtools::document()
#    Regenerate documentation with devtools::document()
# ==============================================================================

# EJEMPLO / EXAMPLE:
# Supongamos que queremos agregar un shapefile llamado "parques_naturales"
# Let's say we want to add a shapefile called "parques_naturales"

# Paso 1 y 2: Leer el shapefile / Step 1 & 2: Read the shapefile
# Asegúrate de ajustar la ruta según la ubicación de tus archivos
# Make sure to adjust the path according to your file location

# Ejemplo de lectura de shapefile desde data-raw/shape_files/
# Example of reading shapefile from data-raw/shape_files/
# 
# parques_naturales <- st_read("data-raw/shape_files/generales-geoserver/parques_naturales.shp")

# Paso 3: Limpiar y preparar los datos / Step 3: Clean and prepare the data
# Por ejemplo, seleccionar solo columnas relevantes y renombrarlas
# For example, select only relevant columns and rename them
#
# parques_naturales <- parques_naturales %>%
#   select(
#     nombre = NOMBRE,
#     tipo = TIPO,
#     superficie = SUPERFICIE,
#     geometry
#   )

# Verificar la estructura de los datos / Check data structure
# str(parques_naturales)
# head(parques_naturales)

# Paso 4: Guardar como .rda / Step 4: Save as .rda
# usethis::use_data(parques_naturales, overwrite = TRUE)

# Paso 5: Agregar documentación en R/data.R / Step 5: Add documentation in R/data.R
# Agregar un bloque de documentación similar a los existentes
# Add a documentation block similar to the existing ones:
#
# #' Parques Naturales de La Pampa
# #'
# #' Datos geográficos de los parques naturales de la Provincia de La Pampa.
# #'
# #' @format ## `parques_naturales`
# #' Un conjunto de datos geográfico con X filas y Y variables:
# #' \describe{
# #'   \item{nombre}{Nombre del parque natural}
# #'   \item{tipo}{Tipo de parque (nacional, provincial, etc.)}
# #'   \item{superficie}{Superficie del parque en hectáreas}
# #'   \item{geometry}{Geometría de tipo polígono con el área del parque}
# #' }
# #' @source Descripción de la fuente de los datos
# #' "parques_naturales"

# Paso 6: Regenerar documentación / Step 6: Regenerate documentation
# devtools::document()

# ==============================================================================
# EJEMPLO COMPLETO CON DATOS CLIMÁTICOS
# COMPLETE EXAMPLE WITH CLIMATE DATA
# ==============================================================================

# Función genérica para procesar shapefiles climáticos
# Generic function to process climate shapefiles
process_climate_shapefile <- function(shapefile_path, object_name) {
  # Leer shapefile / Read shapefile
  data <- st_read(shapefile_path)
  
  # Verificar el CRS y transformar a WGS84 si es necesario
  # Check CRS and transform to WGS84 if needed
  if (!is.na(st_crs(data)) && st_crs(data)$epsg != 4326) {
    data <- st_transform(data, crs = 4326)
  }
  
  # Retornar datos / Return data
  return(data)
}

# Ejemplo de uso / Usage example:
# datos_clima <- process_climate_shapefile(
#   "data-raw/shape_files/variables-climáticas-geoServer/nueva_variable.shp",
#   "nueva_variable_climatica"
# )

# ==============================================================================
# FUNCIÓN PARA PROCESAR SHAPEFILES GENERALES
# FUNCTION TO PROCESS GENERAL SHAPEFILES
# ==============================================================================

process_general_shapefile <- function(shapefile_path, 
                                     object_name,
                                     column_mapping = NULL) {
  # Leer shapefile / Read shapefile
  data <- st_read(shapefile_path)
  
  # Verificar el CRS y transformar a WGS84 si es necesario
  # Check CRS and transform to WGS84 if needed
  if (!is.na(st_crs(data)) && st_crs(data)$epsg != 4326) {
    data <- st_transform(data, crs = 4326)
  }
  
  # Aplicar mapeo de columnas si se proporciona
  # Apply column mapping if provided
  if (!is.null(column_mapping)) {
    data <- data %>% select(all_of(column_mapping))
  }
  
  # Retornar datos / Return data
  return(data)
}

# Ejemplo de uso con mapeo de columnas
# Example usage with column mapping:
# mapeo_columnas <- c(
#   id = "ID",
#   nombre = "NOMBRE",
#   tipo = "TIPO",
#   geometry = "geometry"
# )
# 
# nuevo_shapefile <- process_general_shapefile(
#   "data-raw/shape_files/generales-geoserver/nuevo_shapefile.shp",
#   "nuevo_shapefile",
#   column_mapping = mapeo_columnas
# )

# ==============================================================================
# NOTAS IMPORTANTES / IMPORTANT NOTES
# ==============================================================================
# - Los nombres de los objetos deben ser descriptivos y en minúsculas
#   Object names should be descriptive and in lowercase
#
# - Evitar usar caracteres especiales en los nombres (usar _ en lugar de -)
#   Avoid special characters in names (use _ instead of -)
#
# - NO incluir "_la_pampa" o "_v2" en los nombres (ya fueron removidos)
#   DO NOT include "_la_pampa" or "_v2" in names (they were removed)
#
# - Documentar siempre la fuente de los datos
#   Always document the data source
#
# - Verificar que el CRS sea correcto (generalmente WGS84, EPSG:4326)
#   Verify that the CRS is correct (usually WGS84, EPSG:4326)
# ==============================================================================
