
usethis::use_data(inventario_flora)
usethis::use_data(inventario_vegetal)
usethis::use_data(formacion)
usethis::use_data(fisonomia)
usethis::use_data(localizacion_censos)

usethis::use_data(departamentos, overwrite = TRUE)


# > usethis::use_data(inventario_data)
# ✔ Adding R to Depends field in DESCRIPTION.
# ✔ Creating data/.
# ✔ Setting LazyData to "true" in DESCRIPTION.
# ✔ Saving "inventario_data" to "data/inventario_data.rda".
# ☐ Document your data (see <https://r-pkgs.org/data.html>).
# > usethis::use_data(departamentos)
# ✔ Saving "departamentos" to "data/departamentos.rda".
# ☐ Document your data (see <https://r-pkgs.org/data.html>).

# > usethis::use_data_raw()
# ✔ Adding "^data-raw$" to .Rbuildignore.
# ✔ Writing data-raw/DATASET.R.
# ☐ Modify data-raw/DATASET.R.
# ☐ Finish writing the data preparation script in data-raw/DATASET.R.
# ☐ Use `usethis::use_data()` to add prepared data to package.

devtools::document()

# > devtools::document()
# ℹ Updating inventarioRRNN documentation
# ℹ Loading inventarioRRNN
# Writing inventario.Rd
