# Data-raw Directory

This directory contains the raw CSV data files and scripts to process them into the R data objects used by the package. These files were exported from a relational geographic database used for the inventory of natural resources in La Pampa, Argentina.

## Files

### Raw Data Files
- `Censos de vegetacion - *.csv`: Original CSV files exported from the database

### Processing Scripts

#### 1. `read_csv_files.R`
Reads all CSV files and performs initial transformations:
- Handles Spanish locale (comma as decimal separator)
- Transforms geographic coordinates to SF format


#### 2. `join_tablas_base.R`
Joins base lookup tables to create the main datasets:
- Creates `fisonomia` dataset
- Creates `formacion` dataset
- Joins with `species`, `strata`, `coverage` tables
- Creates `inventario_flora` and `inventario_vegetal` datasets

#### 3. `join_data_sets.R`
Creates the combined datasets used on the main functions:
- Creates the final `fisonomia`
- Creates the final `formacion`
- Creates the final `inventario_flora`
- Creates the final `inventario_vegetal`

#### 4. `creacion-paquete.R`
Package creation commands using `usethis` functions to save data to `data/` directory

#### 5. `read_shapefiles.R`
Utility script to read all shapefiles from a folder and convert them to .rda format for the R package:
- Reads all `.shp` files from a specified folder
- Converts shapefiles to `sf` objects
- Saves them as `.rda` files using `usethis::use_data()`
- Provides bilingual documentation (Spanish/English)

## How to Regenerate Data

To regenerate the data objects used in the package, run the scripts in the following order:

```r
source("data-raw/read_csv_files.R")
source("data-raw/join_tablas_base.R")
source("data-raw/creacion-paquete.R")
```

### Using Shapefiles

To add shapefiles to the package:

```r
source("data-raw/read_shapefiles.R")

# Read all shapefiles from a folder
folder <- "path/to/folder/with/shapefiles"
shapefiles <- read_all_shapefiles(folder)

# Save as package data
save_shapefiles_to_package(shapefiles, overwrite = TRUE)

# Or do both steps at once
# read_all_shapefiles("path/to/folder") |> 
#   save_shapefiles_to_package(overwrite = TRUE)
```

## Notes

- All CSV files use Spanish number formatting (`,` for decimals, `.` for thousands)
- Geographic data uses WGS84 coordinate system (EPSG:4326)
- Some census records lack geographic coordinates (expected)
