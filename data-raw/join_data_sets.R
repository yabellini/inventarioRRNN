# Load necessary packages
library(dplyr)

# Join tablas principales con tablas base - Fisionomia

fisonomia_cobertura_full <- fisonomia_cobertura |>
  inner_join(fisonomia, by = "idFisonomia") |>
  inner_join(altura_cobertura, by = "idAlturaCobertura") |>
  select(idInventario, nombreFisonomia, nombreAlturaCobertura, Observacion) |>
  rename(fisonomia = nombreFisonomia,
         alturaCoberturaFisonomia = nombreAlturaCobertura)

# Join tablas principales con tablas base - Formacion

formacion_altura_cobertura_full <- formacion_altura_cobertura |>
  inner_join(formacion, by = "idFormacion") |>
  inner_join(altura_cobertura, by = "idAlturaCobertura") |>
  select(idInventario, nombreFormacion, nombreAlturaCobertura) |>
  rename(alturaCoberturaFormacion = nombreAlturaCobertura,
         formacion = nombreFormacion)

# Join inventario vegetal

inventario_vegetal_full <- inventario_vegetal |>
  inner_join(observadores, by = "idObservador") |>
  inner_join(formacion_altura_cobertura_full, by = "idInventario") |>
  inner_join(fisonomia_cobertura_full, by = "idInventario") |>
  select(-idObservador) |>
  rename(comunidad = nombreComunidadInventario,
         tipoComunidad = tipoComunidadInventario,
         observador = nombreObservador,
         censo = nCensoInventario)


# join inventario flora

inventario_flora_full <- inventario_flora |>
  inner_join(cobertura, by = "idCobertura") |>
  inner_join(estrato, by = "idEstrato") |>
  inner_join(especies, by = "idEspecie") |>
  select(-idEstrato, -idEspecie, -idCobertura) |>
  rename(estrato = nombreEstrato,
         especie = nombreActualEspecie)


# Join inventario_flora and inventario_vegetal with all the other tables already joined
# This join have issues because of the inner join, we lost information.
# Full join is not adecuate in this scenario.

final_dataset <- inner_join(inventario_vegetal_full, inventario_flora_full, by = "idInventario")

# Select only the variables we will use

final_dataset <- select(final_dataset,
                        -idObservador,
                        -poligonoInventario,
                        -nSueloInventario,
                        -idLocalidad,
                        -latitudInventario,
                        -longitudInventario,
                        -idFormacion)


# Join with the geodata info
# The table auxiliar_geo have the geographic information to create maps with the census data.

final_dataset <- left_join(final_dataset, auxiliar_geo, by = "censo")

inventario_data <- final_dataset

# Save the final dataset to a CSV file
write_csv(final_dataset, "final_dataset.csv")


