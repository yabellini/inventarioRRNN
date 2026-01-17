# Script to regenerate localizacion_censos.rda with correct coordinate order
# This script fixes the issue where coordinates were reversed (lat, lon instead of lon, lat)

# Load necessary packages
library(readr)
library(sf)

# Set working directory to data-raw
setwd("/home/runner/work/inventarioRRNN/inventarioRRNN/data-raw")

# Read the csv file 'Censos de vegetacion - AuxiliarGEO.csv' as a geographic dataset
# Note: Spanish locale uses comma as decimal separator
auxiliar_geo <- read_csv("Censos de vegetacion - AuxiliarGEO.csv",
                         locale = locale(decimal_mark = ",", grouping_mark = "."),
                         show_col_types = FALSE)

# Create sf object with CORRECT coordinate order: (longitude, latitude)
# Also add the CRS specification (EPSG:4326 = WGS84)
localizacion_censos <- st_as_sf(auxiliar_geo, 
                                coords = c("longitudInventario","latitudInventario"), 
                                crs = 4326)

# Save the corrected data
usethis::use_data(localizacion_censos, overwrite = TRUE)

# Print summary to verify
print("localizacion_censos data regenerated successfully!")
print(paste("Number of records:", nrow(localizacion_censos)))
print("First few records:")
print(head(localizacion_censos))
print("CRS:")
print(st_crs(localizacion_censos))
