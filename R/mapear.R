# funcion mapear especie
# Recibe como parametro la especie que quiere para el mapa

# mapear_especie <- function(especie){
#
#   localizacion <- localizacion_censos
#
#   flora <- inventario_flora
#
#   inventarios <- flora |>
#     filter(nombreCientificoEspecie == especie)
#     select(idInventario)
#
#   datos_mapa <- inner_join(inventarios, localizacion, by = c("idInventario = censo"))
#
#
# }
#
#
# inventarios <- flora |>
#   filter(nombreCientificoEspecie == 'Acantholippia seriphioides') |>
#   select(idInventario)
#
#
# mapa <- localizacion_censos %>%
#   filter(censo %in% inventarios)
#
# localizacion_censos |>
#   filter(censo$censo == 33)
#
# localizacion_censos$censo
