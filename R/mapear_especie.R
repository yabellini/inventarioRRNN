#' Mapear ubicacion de censos con una especie
#'
#' Filtra los censos que contienen una especie determinada y retorna
#' los datos geograficos de ubicacion de esos censos.
#'
#' @param nombre_cientifico Nombre cientifico de la especie a buscar (caracter).
#'   Debe coincidir exactamente con los valores en la columna
#'   nombreCientificoEspecie de `inventario_flora`.
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
#' @export
mapear_especie <- function(nombre_cientifico) {

  if (!is.character(nombre_cientifico) || length(nombre_cientifico) != 1) {
    cli::cli_abort("{.arg especie} debe ser un caracter de longitud 1.")
  }

  inventarios <- inventario_flora |>
    dplyr::filter(nombreCientificoEspecie == nombre_cientifico) |>
    dplyr::select(idInventario) |>
    dplyr::distinct()

  # Join with census locations
  # Match idInventario from flora with censo from localizacion_censos
  # Need to get censo numbers from inventario_vegetal
  vegetal <- inventario_vegetal |>
    dplyr::select(idInventario, censo) |>
    dplyr::distinct()

  # Join para obtener los numeros de censo
  censos_con_especie <- inventarios |>
    dplyr::inner_join(vegetal, by = "idInventario")

  # Filtrar los datos de ubicación para incluir solo censos con la especie.
  datos_mapa <- localizacion_censos[localizacion_censos$censo %in% censos_con_especie$censo, ]

  datos_mapa
}
