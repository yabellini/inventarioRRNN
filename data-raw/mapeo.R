library(dplyr)
library(glue)

# Function to simulate the stored procedure using CSV files
TreaDatosMapaEspecie <- function(idEspecie) {
  # Load the CSV files into data frames
  inventario_vegetal <- inventario_vegetal
  inventario_flora <- inventario_flora

  # Filter InventarioFlora by idEspecie and get distinct idInventario
  inv_esp <- inventario_flora %>%
    filter(idEspecie == idEspecie) %>%
    distinct(idInventario)

  # Join the data with InventarioVegetal, filter by non-null latitude and longitude
  result <- inventario_vegetal %>%
    inner_join(inv_esp, by = "idInventario") %>%
    filter(!is.na(latitudInventario), !is.na(longitudInventario)) %>%
    mutate(
      lat = latitudInventario,
      lng = longitudInventario,
      icon = glue('images/{tipoComunidadInventario}.png'),
      info = glue('<p>Censo: <a href="http://localhost:58819/InventarioConsulta?id={idInventario}">{nCensoInventario} </a></p>
                   <p>Comunidad: {case_when(
                     tipoComunidadInventario == 1 ~ "Bosque",
                     tipoComunidadInventario == 2 ~ "Arbustal",
                     tipoComunidadInventario == 3 ~ "Pastizal",
                     tipoComunidadInventario == 4 ~ "Matorral",
                     TRUE ~ "Cultivo"
                   )} </p>
                   <p>Latitud: {latitudInventario} </p>
                   <p>Longitud: {longitudInventario} </p>')
    ) %>%
    select(nCensoInventario, nombreComunidadInventario, lugarInventario, relieveInventario,
           nSueloInventario, fechaInventario, lat, lng, icon, info)

  return(result)
}

# Example usage:
# Assuming 'inventario_vegetal.csv' and 'inventario_flora.csv' are the CSV files with your data
# result <- TreaDatosMapaEspecie(123, "inventario_vegetal.csv", "inventario_flora.csv")
# print(result)

#La version SQL

library(DBI)
library(dplyr)
library(glue)

TreaDatosMapaEspecie <- function(conn, idEspecie) {
  # Query to fetch data from InventarioVegetal and InventarioFlora based on idEspecie
  query <- glue("
    SELECT
      InventarioVegetal.nCensoInventario,
      InventarioVegetal.nombreComunidadInventario,
      InventarioVegetal.lugarInventario,
      InventarioVegetal.relieveInventario,
      InventarioVegetal.nSueloInventario,
      InventarioVegetal.fechaInventario,
      InventarioVegetal.latitudInventario as lat,
      InventarioVegetal.longitudInventario as lng,
      CONCAT('images/', CAST(InventarioVegetal.tipoComunidadInventario AS char(1)), '.png') as icon,
      CONCAT(
        '<p>Censo: <a href=\"http://localhost:58819/InventarioConsulta?id=',
        CAST(InventarioVegetal.idInventario AS nvarchar(10)),
        '\">', CAST(InventarioVegetal.nCensoInventario AS nvarchar(10)), ' </a></p>',
        '<p>Comunidad: ',
        CASE
          WHEN InventarioVegetal.tipoComunidadInventario = 1 THEN 'Bosque'
          WHEN InventarioVegetal.tipoComunidadInventario = 2 THEN 'Arbustal'
          WHEN InventarioVegetal.tipoComunidadInventario = 3 THEN 'Pastizal'
          WHEN InventarioVegetal.tipoComunidadInventario = 4 THEN 'Matorral'
          ELSE 'Cultivo'
        END,
        ' </p><p>Latitud: ', CAST(InventarioVegetal.latitudInventario AS nvarchar(10)),
        ' </p><p>Longitud: ', CAST(InventarioVegetal.longitudInventario AS nvarchar(10)), ' </p>'
      ) as info
    FROM InventarioVegetal
    INNER JOIN (
      SELECT DISTINCT idInventario
      FROM InventarioFlora
      WHERE idEspecie = {idEspecie}
    ) InvEsp
    ON InventarioVegetal.idInventario = InvEsp.idInventario
    WHERE latitudInventario IS NOT NULL
      AND longitudInventario IS NOT NULL
  ")

  # Execute the query
  result <- dbGetQuery(conn, query)

  return(result)
}

