#' Lista todas las especies presentes en un censo
#'
#' Lista todas las especies presentes en un censo con el calculo
#' del porcentaje por especie en cada estrato presente. Si la
#' especie no esta presente en un estrato se presenta NA.
#'
#' Si un estrato no tiene presencia de ninguna especie no se
#' muestra en la tabla.
#'
#' @param numero_censo
#'
#' @return tabla
#' @examples
#' reporte_especie(44)
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
