reporte_especie <- function(numero_censo){

  data <- inventario_vegetal

  if (!is.null(numero_censo)) {
    inventario <- data[data$censo %in% numero_censo, ]$idInventario
  }

  data <- inventario_flora

  data <- data[data$idInventario %in% inventario, ]

  reporte <- data |>
    select(nombreCientificoEspecie, especie, estrato, porcentajeCobertura) |>
    pivot_wider(names_from = estrato,
                values_from = porcentajeCobertura)

  return(reporte)

}
