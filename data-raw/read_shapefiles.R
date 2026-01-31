# Script para leer archivos shape y grabarlos en formato RDA para el paquete
# This script reads all shapefiles from a folder and saves them in .rda format
# suitable for inclusion in an R package

# Cargar paquetes necesarios / Load necessary packages
library(sf)
library(tools)

# Función para leer todos los archivos shape de una carpeta
# Function to read all shapefiles from a folder
read_all_shapefiles <- function(folder_path) {
  
  # Verificar que la carpeta existe
  # Check that folder exists
  if (!dir.exists(folder_path)) {
    stop("La carpeta especificada no existe / Specified folder does not exist: ", folder_path)
  }
  
  # Buscar todos los archivos .shp en la carpeta
  # Find all .shp files in the folder
  shp_files <- list.files(path = folder_path, 
                         pattern = "\\.shp$", 
                         full.names = TRUE,
                         ignore.case = TRUE)
  
  if (length(shp_files) == 0) {
    warning("No se encontraron archivos shape en la carpeta / No shapefiles found in folder: ", folder_path)
    return(NULL)
  }
  
  # Crear una lista para almacenar los datos
  # Create a list to store the data
  shapefiles_data <- list()
  
  # Leer cada archivo shape
  # Read each shapefile
  for (shp_file in shp_files) {
    # Obtener el nombre base del archivo (sin extensión) para usar como nombre del objeto
    # Get the base name of the file (without extension) to use as object name
    object_name <- file_path_sans_ext(basename(shp_file))
    
    # Limpiar el nombre para que sea un nombre de objeto R válido
    # Clean the name to make it a valid R object name
    object_name <- make.names(object_name)
    
    message("Leyendo / Reading: ", basename(shp_file))
    
    # Leer el shapefile usando sf
    # Read the shapefile using sf
    tryCatch({
      shape_data <- st_read(shp_file, quiet = FALSE)
      
      # Guardar en la lista con el nombre del objeto
      # Save in the list with the object name
      shapefiles_data[[object_name]] <- shape_data
      
      message("  - Filas / Rows: ", nrow(shape_data))
      message("  - Columnas / Columns: ", ncol(shape_data))
      message("  - CRS: ", st_crs(shape_data)$input)
      
    }, error = function(e) {
      warning("Error al leer / Error reading ", basename(shp_file), ": ", e$message)
    })
  }
  
  return(shapefiles_data)
}

# Función para guardar los shapefiles en formato RDA para el paquete
# Function to save shapefiles in .rda format for the package
save_shapefiles_to_package <- function(shapefiles_data, overwrite = FALSE) {
  
  if (is.null(shapefiles_data) || length(shapefiles_data) == 0) {
    warning("No hay datos para guardar / No data to save")
    return(invisible(NULL))
  }
  
  # Guardar cada shapefile como un objeto de datos del paquete
  # Save each shapefile as a package data object
  for (object_name in names(shapefiles_data)) {
    message("\nGuardando / Saving '", object_name, "' como datos del paquete / as package data...")
    
    # Asignar el objeto al entorno global con su nombre
    # Assign the object to the global environment with its name
    assign(object_name, shapefiles_data[[object_name]], envir = .GlobalEnv)
    
    # Usar usethis::use_data para guardar el objeto
    # Use usethis::use_data to save the object
    tryCatch({
      usethis::use_data(
        list = object_name,
        overwrite = overwrite,
        compress = "xz"
      )
      message("✓ '", object_name, "' guardado en data/", object_name, ".rda")
    }, error = function(e) {
      warning("Error al guardar / Error saving '", object_name, "': ", e$message)
    })
  }
  
  message("\n=== Proceso completado / Process completed ===")
  message("Archivos guardados / Files saved: ", length(shapefiles_data))
  message("\nRecordatorio / Reminder:")
  message("- Documentar los datos en R/data.R (ver https://r-pkgs.org/data.html)")
  message("- Document the data in R/data.R (see https://r-pkgs.org/data.html)")
  message("- Ejecutar / Run devtools::document() para actualizar la documentación")
  
  invisible(shapefiles_data)
}

# Ejemplo de uso / Example usage:
# 
# # 1. Leer todos los shapefiles de una carpeta
# #    Read all shapefiles from a folder
# folder <- "ruta/a/carpeta/con/shapefiles"  # Cambiar por la ruta real / Change to actual path
# shapefiles <- read_all_shapefiles(folder)
# 
# # 2. Guardar los shapefiles como datos del paquete
# #    Save the shapefiles as package data
# save_shapefiles_to_package(shapefiles, overwrite = TRUE)
# 
# # Alternativa: hacer todo en un paso
# # Alternative: do everything in one step
# # shapefiles <- read_all_shapefiles("ruta/a/carpeta") |> 
# #   save_shapefiles_to_package(overwrite = TRUE)
