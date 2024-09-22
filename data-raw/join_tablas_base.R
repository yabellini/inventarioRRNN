# This is the scripts with joins to use.
# it creates all the dataframes que use on the package.

# Load necessary packages
library(dplyr)

# Join tablas principales con tablas base - Fisionomia

fisonomia <- fisonomia_cobertura |>
  inner_join(fisonomia_base, by = "idFisonomia") |>
  inner_join(altura_cobertura, by = "idAlturaCobertura") |>
  select(idInventario, nombreFisonomia, nombreAlturaCobertura, Observacion) |>
  rename(fisonomia = nombreFisonomia,
         alturaCoberturaFisonomia = nombreAlturaCobertura)


# Join tablas principales con tablas base - Formacion

formacion <- formacion_altura_cobertura |>
  inner_join(formacion_base, by = "idFormacion") |>
  inner_join(altura_cobertura, by = "idAlturaCobertura") |>
  select(idInventario, nombreFormacion, nombreAlturaCobertura) |>
  rename(alturaCoberturaFormacion = nombreAlturaCobertura,
         formacion = nombreFormacion)

# Join inventario vegetal

inventario_vegetal<- inventario_vegetal |>
  inner_join(observadores, by = "idObservador") |>
  select(-idObservador) |>
  rename(comunidad = nombreComunidadInventario,
         tipoComunidad = tipoComunidadInventario,
         observador = nombreObservador,
         censo = nCensoInventario)


# join inventario flora

inventario_flora<- inventario_flora |>
  inner_join(cobertura, by = "idCobertura") |>
  inner_join(estrato, by = "idEstrato") |>
  inner_join(especies, by = "idEspecie") |>
  select(-idEstrato, -idEspecie, -idCobertura) |>
  rename(estrato = nombreEstrato,
         especie = nombreActualEspecie)


inventario_flora
inventario_vegetal
departamentos

