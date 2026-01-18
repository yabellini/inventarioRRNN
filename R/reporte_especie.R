#' Lista todas las especies presentes en un censo
#'
#' Lista todas las especies presentes en un censo con el calculo
#' del porcentaje por especie en cada estrato presente. Si la
#' especie no esta presente en un estrato se presenta NA.
#'
#' Si un estrato no tiene presencia de ninguna especie no se
#' muestra en la tabla.
#'
#' @param numero_censo Numero entero o vector de numeros que identifican los censos a incluir en el reporte. Deben existir en la columna 'censo' del data frame 'inventario_vegetal'.
#'
#' @return Un data frame en formato ancho con las siguientes columnas:
#' \describe{
#' \item{nombreCientificoEspecie}{Nombre cientifico de la especie.}
#' \item{especie}{Nombre comun de la especie.}
#' \item{<estrato>}{Columnas dinamicas para cada estrato presente en los censos seleccionados, con el porcentaje de cobertura de la especie en ese estrato.}
#' }
#' Los valores NA indican que la especie no esta presente en ese estrato.
#'
#' @examples
#' # Reporte de un solo censo
#' reporte_especie(44)
#'
#' # Reporte de varios censos
#' reporte_especie(c(33, 44, 55))
#'
#' @export
reporte_especie <- function(numero_censo){

  if (missing(numero_censo) || is.null(numero_censo)) {
    cli::cli_abort("Debes especificar al menos un valor para {.arg numero_censo}.")
  }

  data <- inventario_vegetal

  inventario <- data[data$censo %in% numero_censo, ]$idInventario

  data <- inventario_flora

  data <- data[data$idInventario %in% inventario, ]

  reporte <- data |>
    dplyr::select(nombreCientificoEspecie, especie, estrato, porcentajeCobertura) |>
    tidyr::pivot_wider(names_from = estrato,
                values_from = porcentajeCobertura)

  return(reporte)

}
