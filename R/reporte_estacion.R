

reporte_estacion <- function(){

  # data <- inventario_vegetal
  #
  # if (!is.null(numero_censo)) {
  #   inventario <- data[data$censo %in% numero_censo, ]$idInventario
  # }

  flora <- inventario_flora

  flora <- flora[flora$idInventario %in% inventario, ]

  # tenemos que contar por estacion la cantidad de especies
  # mostrarlo con porcentajes

  reporte <- flora |>
    count(estacionalidad, idInventario) |>
    pivot_wider(names_from = estacionalidad,
                values_from = n)


  return(reporte)

}
