
numero_censo <- 360
data <- inventario_vegetal

inventario <- data[data$censo %in% numero_censo, ]$idInventario

data <- inventario_flora

data <- data[data$idInventario %in% inventario, ]


duplicados <- data |>
  dplyr::summarise(n = dplyr::n(), .by = c(nombreCientificoEspecie, especie, estrato)) |>
  dplyr::filter(n > 1L)


reporte <- data |>
  dplyr::select(nombreCientificoEspecie, especie, estrato, porcentajeCobertura) |>
  tidyr::pivot_wider(names_from = estrato,
                     values_from = porcentajeCobertura)



# Revisando mapear especie


planta <- "Acantholippia seriphioides"

inventarios <- inventario_flora |>
  dplyr::filter(nombreCientificoEspecie == planta) |>
  dplyr::select(idInventario) |>
  dplyr::distinct()

vegetal <- inventario_vegetal |>
  dplyr::select(idInventario, censo) |>
  dplyr::distinct()

# Join to get censo numbers
censos_con_especie <- inventarios |>
  dplyr::inner_join(vegetal, by = "idInventario")

# Filter location data to only include censos with the species
datos_mapa <- localizacion_censos[localizacion_censos$censo %in% censos_con_especie$censo, ]


