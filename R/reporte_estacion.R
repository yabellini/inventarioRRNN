#' Listado de cantidad de especies por estacion
#'
#' Listado del total de especies presentes en cada censo
#' realizado agrupadas por la estación del año en que
#' crece cada especie.
#' Opcionalmente muestra porcentajes en lugar de conteos absolutos.
#'
#'@param censos Vector numerico con los numeros de censo a incluir.
#'   Si es NULL (por defecto), incluye todos los censos.
#' @param estaciones Vector de caracteres con las estaciones a incluir.
#'   Valores posibles: "Invernal", "Primavero-estival".
#'   Si es NULL (por defecto), incluye todas las estaciones.
#' @param porcentajes Logico. Si es TRUE, muestra porcentajes en lugar
#'   de conteos absolutos. Por defecto FALSE.
#'
#' @return Un data frame con una fila por idInventario y columnas para
#'   cada estacionalidad presente. Los valores son conteos de especies
#'   (o porcentajes si porcentajes = TRUE).
#'
#' @examples
#' # Reporte de todas las estaciones
#' reporte_estacion()
#'
#'' # Reporte de censos especificos
#' reporte_estacion(censos = c(404, 377, 573))
#'
#'# Reporte con porcentajes
#' reporte_estacion(porcentajes = TRUE)
#'
#' # Reporte de solo estacion invernal
#' reporte_estacion(estaciones = "Invernal")
#'
#' @export
reporte_estacion <- function(censos = NULL,
                             estaciones = NULL,
                             porcentajes = FALSE){

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
        "Estaciones no v\u00e1lidas ignoradas: {cli::col_red(paste(invalid, collapse = ', '))}"
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
    total_censos <- dplyr::n_distinct(flora$idInventario)
    reporte <- reporte |>
      dplyr::mutate(dplyr::across(-idInventario, ~ (.x / total_censos) * 100))
  }
  return(reporte)
}
