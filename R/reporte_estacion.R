#' Listado de cantidad de especies por estacion
#'
#' Listado del total de especies presentes en cada censo
#' realizado agrupadas por la estación del año en que
#' crece cada especie. Opcionalmente muestra porcentajes
#' en lugar de conteos absolutos.
#'
#' @param censos Vector numerico con los numeros de censo a incluir.
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
#' # Reporte de censos especificos
#' reporte_estacion(censos = c(1, 2, 3))
#'
#' # Reporte con porcentajes
#' reporte_estacion(porcentajes = TRUE)
#'
#' # Reporte de solo estacion invernal
#' reporte_estacion(estaciones = "Invernal")
#'
#' @export
reporte_estacion <- function(censos = NULL, estaciones = NULL, porcentajes = FALSE){

  # Get flora data
  flora <- inventario_flora

  # Filter by censos if specified
  if (!is.null(censos)) {
    # Need to map censos to idInventario
    vegetal <- inventario_vegetal
    inventarios_validos <- vegetal[vegetal$censo %in% censos, ]$idInventario
    flora <- flora[flora$idInventario %in% inventarios_validos, ]
  }

  # Filter by estaciones if specified
  if (!is.null(estaciones)) {
    # Validate estaciones
    valid_estaciones <- c("Invernal", "Primavero-estival")
    invalid <- setdiff(estaciones, valid_estaciones)
    if (length(invalid) > 0) {
      warning(paste("Estaciones no validas ignoradas:", paste(invalid, collapse = ", ")))
    }
    flora <- flora[flora$estacionalidad %in% estaciones, ]
  }

  # Count species by seasonality and inventory
  reporte <- flora |>
    dplyr::count(estacionalidad, idInventario) |>
    tidyr::pivot_wider(names_from = estacionalidad,
                values_from = n,
                values_fill = 0)

  # Convert to percentages if requested
  if (porcentajes) {
    # Calculate total species per inventory
    col_names <- setdiff(names(reporte), "idInventario")
    
    # Calculate row totals
    reporte$total <- rowSums(reporte[, col_names, drop = FALSE], na.rm = TRUE)
    
    # Convert counts to percentages
    for (col in col_names) {
      reporte[[col]] <- round(100 * reporte[[col]] / reporte$total, 2)
    }
    
    # Remove total column
    reporte$total <- NULL
  }

  return(reporte)

}

