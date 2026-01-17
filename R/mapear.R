#' Mapear ubicacion de censos con una especie
#'
#' Filtra los censos que contienen una especie determinada y retorna
#' los datos geograficos de ubicacion de esos censos.
#'
#' @param especie Nombre cientifico de la especie a buscar (caracter).
#'   Debe coincidir exactamente con los valores en la columna
#'   nombreCientificoEspecie de inventario_flora.
#'
#' @return Un objeto sf (simple features) con la geometria de puntos
#'   que representa la ubicacion geografica de los censos donde se
#'   encontro la especie. Contiene las columnas:
#'   \describe{
#'     \item{censo}{Numero del censo}
#'     \item{geometry}{Coordenadas geograficas (puntos)}
#'   }
#'   Si la especie no se encuentra en ningun censo, retorna un objeto
#'   sf vacio con las mismas columnas.
#'
#' @examples
#' # Mapear ubicacion de censos con Acantholippia seriphioides
#' \dontrun{
#' ubicaciones <- mapear_especie("Acantholippia seriphioides")
#' plot(ubicaciones)
#' }
#'
#' # Ver las primeras ubicaciones
#' \dontrun{
#' head(mapear_especie("Acantholippia seriphioides"))
#' }
#'
#' @export
mapear_especie <- function(especie) {
  # Validate input
  if (!is.character(especie) || length(especie) != 1) {
    stop("'especie' debe ser un caracter de longitud 1")
  }

  # Get flora data
  flora <- inventario_flora

  # Filter flora records for the specified species and get unique inventory IDs
  inventarios <- flora |>
    dplyr::filter(nombreCientificoEspecie == especie) |>
    dplyr::select(idInventario) |>
    dplyr::distinct()

  # If no records found, return empty sf object
  if (nrow(inventarios) == 0) {
    message(paste("No se encontraron registros para la especie:", especie))
    # Return empty sf object with same structure as localizacion_censos
    return(localizacion_censos[0, ])
  }

  # Get location data
  localizacion <- localizacion_censos

  # Join with census locations
  # Match idInventario from flora with censo from localizacion_censos
  # Need to get censo numbers from inventario_vegetal
  vegetal <- inventario_vegetal |>
    dplyr::select(idInventario, censo) |>
    dplyr::distinct()

  # Join to get censo numbers
  censos_con_especie <- inventarios |>
    dplyr::inner_join(vegetal, by = "idInventario")

  # Filter location data to only include censos with the species
  datos_mapa <- localizacion |>
    dplyr::filter(censo %in% censos_con_especie$censo)

  return(datos_mapa)
}
