#' Mapear ubicacion de censos con una especie
#'
#' Filtra los censos que contienen una especie determinada y retorna
#' los datos geograficos de ubicacion de esos censos.
#'
#' @param nombre_cientifico Nombre cientifico de la especie a buscar (caracter).
#'   Debe coincidir exactamente con los valores en la columna
#'   nombreCientificoEspecie de `inventario_flora`.
#'
#' @return Un objeto ggplot2 con un mapa que muestra la ubicacion geografica de
#' los censos donde se encontro la especie.
#' Si la especie no se encuentra en ningun censo, retorna un mapa sin puntos
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

  #Graficar la especie

  ggplot2::ggplot() +
    # Fondo de departamentos
    ggplot2::geom_sf(data = departamentos,
                     fill = "#ecf0f1",
                     color = "#bdc3c7",
                     size = 0.5,
                     alpha = 0.8) +

    # Puntos de observación
    ggplot2::geom_sf(data = datos_mapa,
                     color = "#f77f00",
                     size = 2,
                     alpha = 0.7,
                     shape = 19) +

    # Títulos y etiquetas
    ggplot2::labs(
      title = paste("Distribucion de", nombre_cientifico),
      subtitle = paste("Registros de censos en La Pampa (n =", nrow(datos_mapa), ")"),
      caption = "Fuente: Datos de censos | Elaborado por el paquete inventarioRRNN"
    ) +

    # Tema profesional
    ggplot2::theme_minimal() +
    ggplot2::theme(
      plot.title = ggplot2::element_text(face = "bold.italic", size = 14, hjust = 0.5),
      plot.subtitle = ggplot2::element_text(size = 11, hjust = 0.5, color = "gray40"),
      plot.caption = ggplot2::element_text(size = 8, color = "gray50", hjust = 1),
      panel.grid = ggplot2::element_line(color = "gray90", size = 0.2),
      axis.title = ggplot2::element_blank(),
      plot.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.background = ggplot2::element_rect(fill = "white", color = NA),
      panel.border = ggplot2::element_rect(color = "gray70", fill = NA, size = 0.5)
    ) +

    # Escala y flecha norte
    ggspatial::annotation_scale(location = "bl", width_hint = 0.3) +
    ggspatial::annotation_north_arrow(location = "tl",
                                      which_north = "true",
                                      style = ggspatial::north_arrow_fancy_orienteering)


}
