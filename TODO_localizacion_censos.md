# Instructions to Complete localizacion_censos Fix

## What Was Fixed

The data-raw/read_csv_files.R script had a critical bug where coordinates were specified in the wrong order:
- **Before**: `coords=c("latitudInventario","longitudInventario")` (WRONG - lat, lon)
- **After**: `coords=c("longitudInventario","latitudInventario"), crs=4326` (CORRECT - lon, lat)

## What Still Needs to Be Done

The `data/localizacion_censos.rda` file needs to be regenerated using the corrected script.

### Option 1: Run the Regeneration Script (Recommended)

```r
# Install dependencies if needed
install.packages(c("readr", "sf", "usethis"))

# Run the regeneration script
source("data-raw/regenerate_localizacion_censos.R")
```

This will:
1. Read the raw CSV file with correct Spanish locale settings
2. Create SF object with correct coordinate order (longitude, latitude)
3. Set proper CRS (EPSG:4326 for WGS84)
4. Save to `data/localizacion_censos.rda` using `usethis::use_data()`

### Option 2: Run Full Data Pipeline

If you want to regenerate all datasets:

```r
# Install all dependencies
install.packages(c("readr", "sf", "usethis", "dplyr", "tidyr", "tibble", "stringr"))

# Run in order
source("data-raw/read_csv_files.R")
source("data-raw/join_tablas_base.R")
# Then selectively run the use_data() commands from creacion-paquete.R
```

## Why This Matters

The coordinate order bug causes:
- ❌ Maps to display points in wrong locations (X/Y swapped)  
- ❌ Spatial joins and filters to fail or give incorrect results
- ❌ CRS transformations to behave unexpectedly

With the fix:
- ✅ Locations display correctly on maps
- ✅ Spatial operations work properly
- ✅ Data can be joined with other spatial layers (like departamentos)

## Verification

After regeneration, verify with:

```r
library(inventarioRRNN)
library(sf)

# Load data
data(localizacion_censos)

# Check structure
str(localizacion_censos)

# Verify CRS
st_crs(localizacion_censos)  # Should be EPSG:4326

# Check coordinates are reasonable for La Pampa, Argentina  
# Longitude should be around -64 to -68 (West)
# Latitude should be around -35 to -38 (South)
st_bbox(localizacion_censos)
```

Expected output:
```
         xmin         ymin         xmax         ymax 
-68.xxxxxxx -38.xxxxxxx -64.xxxxxxx -35.xxxxxxx
```

## Package Builder Responsibilities

Since R package building requires R to be properly installed and configured, the maintainer should:

1. Run the regeneration script
2. Verify the output
3. Commit the updated `data/localizacion_censos.rda` file
4. Test that the package loads correctly
5. Verify CI/CD passes

## Files Changed in This Fix

- ✅ `data-raw/read_csv_files.R` - Fixed coordinate order  
- ✅ `data-raw/regenerate_localizacion_censos.R` - New standalone regeneration script
- ✅ `data-raw/README.md` - Documentation of data processing pipeline
- ✅ `DESCRIPTION` - Added sf package dependency
- ⏳ `data/localizacion_censos.rda` - **Needs to be regenerated** (requires R)

##Actions Summary

**Completed**: Fixed the source code bug
**Pending**: Regenerate the binary .rda file (requires package maintainer with R setup)
