#' Listado de cantidad de especies por estacion
#'
#' Listado del total de especies presentes en cada censo
#' realizado agrupadas por la estación del año en que
#' crece cada especie.
#' Opcionalmente muestra porcentajes en lugar de conteos absolutos.
#'
#' @return tabla
#'
#' @examples
#' reporte_estacion()
#'
#' @export
reporte_estacion <- function(censos = NULL, estaciones = NULL, porcentajes = FALSE){

  flora <- inventario_flora

  # Filtrar por censo si esta presente

  if (!is.null(censos)) {
    vegetal <- inventario_vegetal
    inventarios_validos <- vegetal[vegetal$censo %in% censos, ]$idInventario
    flora <- flora[flora$idInventario %in% inventarios_validos, ]
  }
  # Filtrar por estaciones si esta presente

  if (!is.null(estaciones)) {

    # Validar las estaciones
    valid_estaciones <- c("Invernal", "Primavero-estival")
    invalid <- setdiff(estaciones, valid_estaciones)

    if (length(invalid) > 0) {
      cli::cli_warn(
        "Estaciones no válidas ignoradas: {cli::col_red(paste(invalid, collapse = ', '))}"
      )
    }
    flora <- flora[flora$estacionalidad %in% estaciones, ]
  }

  # tenemos que contar por estacion la cantidad de especies
  # TODO: mostrarlo con porcentajes

  reporte <- flora |>
    dplyr::count(estacionalidad, idInventario) |>
    tidyr::pivot_wider(names_from = estacionalidad,
                values_from = n,
                values_fill = 0)

  if (porcentajes) {
    total_censos <- n_distinct(flora$idInventario)
    reporte <- reporte |>
      dplyr::mutate(across(-idInventario, ~ (.x / total_censos) * 100))
  }

  return(reporte)

}
