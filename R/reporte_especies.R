reporte_especies <- function(censo){

  inventario <- inventarioRRNN::inventario_vegetal |>
      filter(censo == censo) |>
      pull(idInventario)

  inventario
  # reporte <- inventarioRRNN::inventario_flora |>
  #     filter(idInventario == inventario) |>
  #     select(nombreCientificoEspecie, especie, estrato, porcentajeCobertura) |>
  #     pivot_wider(names_from = estrato,
  #                 values_from = porcentajeCobertura)
  #
  # reporte
}
