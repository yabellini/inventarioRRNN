# This script have the task ned it to read the CSV files
# transform the geographic information
# and keep only the variable we will use.

# Load necessary packages
library(readr)
library(tibble)
library(sf)
library(stringr)

# Read CSV files into tibbles
# The NA are present ad "" or "NULL"

altura_cobertura <- read_csv("data-raw/Censos de vegetacion - AlturaCobertura.csv", na = c("","NULL"))
cobertura <- read_csv("data-raw/Censos de vegetacion - Cobertura.csv", na = c("","NULL"))
especies <- read_csv("data-raw/Censos de vegetacion - Especies.csv", na = c("","NULL"))
estrato <- read_csv("data-raw/Censos de vegetacion - Estrato.csv", na = c("","NULL"))
fisonomia_base <- read_csv("data-raw/Censos de vegetacion - Fisonomia.csv", na = c("","NULL"))
fisonomia_cobertura <- read_csv("data-raw/Censos de vegetacion - FisonomiaCobertura.csv", na = c("","NULL"))
formacion_base <- read_csv("data-raw/Censos de vegetacion - Formacion.csv", na = c("","NULL"))
formacion_altura_cobertura <- read_csv("data-raw/Censos de vegetacion - FormacionAlturaCobertura.csv", na = c("","NULL"))
inventario_flora <- read_csv("data-raw/Censos de vegetacion - InventarioFlora.csv", na = c("","NULL"))
inventario_vegetal <- read_csv("data-raw/Censos de vegetacion - InventarioVegetal.csv", na = c("","NULL"))
observadores <- read_csv("data-raw/Censos de vegetacion - Observadores.csv", na = c("","NULL"))


# Inventario Vegetal have all the census data.  It also have a geographic information on lat and long
# Some cencus don't have a geographic location.
# To transform character data to geographic data, first we need to change the , as decimal point as a .
# We use the str_replace for that
# Then we filter the records that doesn't have information
# Then we transform the cooridinates.

# inventario_vegetal <- inventario_vegetal |>
#  mutate(latitudInventario = as.double(str_replace(latitudInventario, ",", ".")),
#         longitudInventario = as.double(str_replace(longitudInventario, ",", "."))) |>
#  filter(latitudInventario != "NULL") |>
#  st_as_sf(coords=c("longitudInventario","latitudInventario"), crs=4326)

# This transformation made us to lost information, because of that we generate another
# table with all the data that have geographic information as a way to not lost the census
# without location as coordinates.  So we don't need to use the above transformation.

# Read the csv file 'Censos de vegetacion - AuxiliarGEO.csv' as a geographic dataset

auxiliar_geo <- read_csv("data-raw/Censos de vegetacion - AuxiliarGEO.csv",
                         locale = locale(decimal_mark = ",", grouping_mark = "."))

localizacion_censos <- st_as_sf(auxiliar_geo, coords=c("latitudInventario","longitudInventario"))

ggplot() +
  geom_sf(data = auxiliar_geo) +
  ggtitle("Censos")


# Geographic data localidad

localidad <- read_csv("data-raw/Censos de vegetacion - Localidades.csv",
                      locale = locale(decimal_mark = ",", grouping_mark = "."))

localidad <- st_as_sf(localidad, coords=c("longitudLocalidad","latitudLocalidad"), crs=4326)

ggplot() +
  geom_sf(data = localidad) +
  ggtitle("Localidades")


# Read the csv file 'Censos de vegetacion - Departamentos.csv' as a geographic dataset

departamentos <- st_read("data-raw/Censos de vegetacion - DepartamentosLP.csv")

departamentos <- st_as_sf(departamentos, wkt = "geomTDepartamento")

ggplot() +
  geom_sf(data = departamentos) +
  ggtitle("Departamentos")

# Select only the columns we will use

inventario_vegetal <- select(inventario_vegetal,
                             -poligonoInventario,
                             -nSueloInventario,
                             -idLocalidad,
                             -latitudInventario,
                             -longitudInventario)

localidad <- select(localidad,
                    GeomLocalidad,
                    GeomTLocalidad)

departamentos <- select(departamentos,
                        -geomDepartamento,
                        -geometry,
                        -idProvincia)

# Tables that we use all their columns

# altura cobertura
# auxiliar_geo
# cobertura
# especies
# estrato
# fisonomia_base
# fisonomia_cobertura
# formacion_base
# formacion_altura_cobertura
# inventario_flora
# observadores



