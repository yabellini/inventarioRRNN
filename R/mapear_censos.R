#' Mapear ubicacion de censos con ubicacion geografica
#'
#'
#' @return un objeto ggplot2 con un mapa que muestra la ubicacion geografica de
#' todos los censos realizados en La Pampa.
#'
#' @export
mapear_censos <- function() {


  #Graficar los censos

  ggplot2::ggplot() +
    # Fondo de departamentos
    ggplot2::geom_sf(data = departamentos,
                     fill = "#ecf0f1",
                     color = "#bdc3c7",
                     size = 0.5,
                     alpha = 0.8) +

    # Puntos de observación
    ggplot2::geom_sf(data = localizacion_censos,
                     color = "green4",
                     size = 2,
                     alpha = 0.7,
                     shape = 19) +

    # Títulos y etiquetas
    ggplot2::labs(
      title = "Censos de vegetacion en La Pampa",
      subtitle = paste("Cantidad en la base de datos (n =", nrow(localizacion_censos),
                       ")"),
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
