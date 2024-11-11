#' Listado de cantidad de especies por estacion
#'
#' Listado del total de especies presentes en cada censo
#' realizado agrupadas por la estación del año en que
#' crece cada especie.
#'
#' @return tabla
#'
#' @examples
#' reporte_estacion()
#'
#' @export
reporte_estacion <- function(){

  # TODO: pasarle como parametro un listado de censos.
  # TODO: pasarle como parametro un listado de estaciones.
  # data <- inventario_vegetal
  #
  # if (!is.null(numero_censo)) {
  #   inventario <- data[data$censo %in% numero_censo, ]$idInventario
  # }

  flora <- inventario_flora

#  flora <- flora[flora$idInventario %in% inventario, ]

  # tenemos que contar por estacion la cantidad de especies
  # TODO: mostrarlo con porcentajes

  reporte <- flora |>
    dplyr::count(estacionalidad, idInventario) |>
    tidyr::pivot_wider(names_from = estacionalidad,
                values_from = n)


  return(reporte)

}
