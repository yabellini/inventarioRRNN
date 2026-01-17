#' Lista todas las especies presentes en un censo
#'
#' Lista todas las especies presentes en un censo con el calculo
#' del porcentaje por especie en cada estrato presente. Si la
#' especie no esta presente en un estrato se presenta NA.
#'
#' Si un estrato no tiene presencia de ninguna especie no se
#' muestra en la tabla.
#'
#' @param numero_censo Numero entero o vector de numeros que identifican
#'   los censos a incluir en el reporte. Deben existir en la columna
#'   'censo' de inventario_vegetal.
#'
#' @return Un data frame en formato ancho con las siguientes columnas:
#'   \describe{
#'     \item{nombreCientificoEspecie}{Nombre cientifico de la especie}
#'     \item{especie}{Nombre comun de la especie}
#'     \item{...}{Una columna por cada estrato presente, con los valores
#'       de porcentaje de cobertura (2.50, 5.00, 7.50, 12.50, 17.50,
#'       25.00, 37.50, 50.00, 62.50)}
#'   }
#'   Los valores NA indican que la especie no esta presente en ese estrato.
#'
#' @examples
#' # Reporte de un solo censo
#' reporte_especie(44)
#'
#' # Reporte de multiples censos
#' \dontrun{
#' reporte_especie(c(44, 45, 46))
#' }
#'
#' @export
reporte_especie <- function(numero_censo){

  data <- inventario_vegetal

  if (!is.null(numero_censo)) {
    inventario <- data[data$censo %in% numero_censo, ]$idInventario
  }

  data <- inventario_flora

  data <- data[data$idInventario %in% inventario, ]

  reporte <- data |>
    dplyr::select(nombreCientificoEspecie, especie, estrato, porcentajeCobertura) |>
    tidyr::pivot_wider(names_from = estrato,
                values_from = porcentajeCobertura)

  return(reporte)

}
