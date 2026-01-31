# Ejemplo de uso del script read_shapefiles.R
# Example usage of the read_shapefiles.R script
#
# Este script demuestra cómo usar las funciones para leer shapefiles
# y convertirlos en datos para el paquete de R
#
# This script demonstrates how to use the functions to read shapefiles
# and convert them into R package data

# Cargar el script con las funciones
# Load the script with the functions
source("data-raw/read_shapefiles.R")

# ==============================================================================
# EJEMPLO 1: Leer todos los shapefiles de una carpeta
# EXAMPLE 1: Read all shapefiles from a folder
# ==============================================================================

# Especificar la ruta a la carpeta con los shapefiles
# Specify the path to the folder with the shapefiles
# folder_shapefiles <- "ruta/a/carpeta/con/shapefiles"

# NOTA: Reemplazar con la ruta real de la carpeta
# NOTE: Replace with the actual path to the folder
# Por ejemplo / For example:
# folder_shapefiles <- "data-raw/shapes"
# folder_shapefiles <- "/home/user/mis_shapefiles"

# Leer todos los shapefiles
# Read all shapefiles
# shapefiles_data <- read_all_shapefiles(folder_shapefiles)

# Ver qué shapefiles se leyeron
# See which shapefiles were read
# print(names(shapefiles_data))

# ==============================================================================
# EJEMPLO 2: Guardar los shapefiles como datos del paquete
# EXAMPLE 2: Save the shapefiles as package data
# ==============================================================================

# Guardar todos los shapefiles leídos
# Save all read shapefiles
# save_shapefiles_to_package(shapefiles_data, overwrite = TRUE)

# ==============================================================================
# EJEMPLO 3: Hacer todo en un solo paso usando pipe
# EXAMPLE 3: Do everything in one step using pipe
# ==============================================================================

# Leer y guardar en un solo comando
# Read and save in a single command
# read_all_shapefiles(folder_shapefiles) |> 
#   save_shapefiles_to_package(overwrite = TRUE)

# ==============================================================================
# EJEMPLO 4: Procesar solo un shapefile específico
# EXAMPLE 4: Process only a specific shapefile
# ==============================================================================

# Leer todos los shapefiles
# Read all shapefiles
# all_shapes <- read_all_shapefiles(folder_shapefiles)

# Seleccionar solo uno para guardar
# Select only one to save
# departamentos_shape <- list(departamentos = all_shapes$departamentos)
# save_shapefiles_to_package(departamentos_shape, overwrite = TRUE)

# ==============================================================================
# DESPUÉS DE GUARDAR LOS DATOS / AFTER SAVING THE DATA
# ==============================================================================

# No olvidar:
# Don't forget:
# 1. Documentar los nuevos datos en R/data.R
#    Document the new data in R/data.R
#
# 2. Ejecutar devtools::document() para actualizar la documentación
#    Run devtools::document() to update documentation
#
# 3. Verificar que los datos se guardaron correctamente en data/
#    Verify that the data was saved correctly in data/
#
# 4. Probar que los datos se pueden cargar
#    Test that the data can be loaded
#    devtools::load_all()
#    data(nombre_del_shapefile)
