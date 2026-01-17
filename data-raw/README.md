# Data-raw Directory

This directory contains the raw CSV data files and scripts to process them into the R data objects used by the package.

## Files

### Raw Data Files
- `Censos de vegetacion - *.csv`: Original CSV files exported from the database

### Processing Scripts

#### 1. `read_csv_files.R`
Reads all CSV files and performs initial transformations:
- Handles Spanish locale (comma as decimal separator)
- Transforms geographic coordinates to SF format
- **IMPORTANT**: Uses correct coordinate order (longitude, latitude) for spatial data

#### 2. `join_tablas_base.R`
Joins base lookup tables to create the main datasets:
- Creates `fisonomia` dataset
- Creates `formacion` dataset  
- Joins with species, strata, coverage tables
- Creates `inventario_flora` and `inventario_vegetal` datasets

#### 3. `join_data_sets.R`
Creates combined datasets (experimental - may cause data loss with inner joins)

#### 4. `creacion-paquete.R`
Package creation commands using `usethis` functions to save data to `data/` directory

#### 5. `regenerate_localizacion_censos.R` ⭐ NEW
**Standalone script to regenerate the localizacion_censos dataset**
- Fixes the coordinate order bug
- Adds proper CRS (EPSG:4326)
- Can be run independently

## How to Regenerate Data

### Prerequisites
```r
install.packages(c("readr", "sf", "usethis", "dplyr", "tidyr"))
```

### Regenerate localizacion_censos
```r
source("data-raw/regenerate_localizacion_censos.R")
```

### Regenerate All Data
Run scripts in this order:
```r
source("data-raw/read_csv_files.R")
source("data-raw/join_tablas_base.R")
source("data-raw/creacion-paquete.R")
```

## Bug Fixes

### localizacion_censos Coordinate Order (Fixed 2026-01-17)
**Problem**: Coordinates were specified as `c("latitudInventario", "longitudInventario")` which creates inverted X,Y geometry.

**Fix**: Changed to correct order `c("longitudInventario", "latitudInventario")` and added `crs=4326`

**Impact**: This was preventing proper mapping and spatial filtering operations.

## Notes
- All CSV files use Spanish number formatting (`,` for decimals, `.` for thousands)
- Geographic data uses WGS84 coordinate system (EPSG:4326)
- Some census records lack geographic coordinates (expected)
