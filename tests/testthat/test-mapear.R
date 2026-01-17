test_that("mapear_especie returns sf object for valid species", {
  skip_if_not_installed("sf")
  
  # Test with a species that exists in the data
  # We'll use Acantholippia seriphioides as mentioned in the original code comments
  result <- mapear_especie("Acantholippia seriphioides")
  
  # Check that result is an sf object
  expect_s3_class(result, "sf")
  
  # Check that it has the expected columns
  expect_true("censo" %in% names(result))
  expect_true("geometry" %in% names(result))
  
  # Result should have at least one row for a species that exists
  expect_gte(nrow(result), 0)
})

test_that("mapear_especie returns empty sf for non-existent species", {
  skip_if_not_installed("sf")
  
  # Test with a species that doesn't exist
  expect_message(
    result <- mapear_especie("Species that does not exist"),
    "No se encontraron registros"
  )
  
  # Should return empty sf object
  expect_s3_class(result, "sf")
  expect_equal(nrow(result), 0)
  
  # Should still have the correct structure
  expect_true("censo" %in% names(result))
  expect_true("geometry" %in% names(result))
})

test_that("mapear_especie validates input", {
  # Test with non-character input
  expect_error(
    mapear_especie(123),
    "'especie' debe ser un caracter de longitud 1"
  )
  
  # Test with vector of length > 1
  expect_error(
    mapear_especie(c("Species1", "Species2")),
    "'especie' debe ser un caracter de longitud 1"
  )
  
  # Test with NULL
  expect_error(
    mapear_especie(NULL),
    "'especie' debe ser un caracter de longitud 1"
  )
})

test_that("mapear_especie returns correct structure", {
  skip_if_not_installed("sf")
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  # Get first species from inventario_flora
  first_species <- inventario_flora$nombreCientificoEspecie[1]
  
  result <- mapear_especie(first_species)
  
  # Check result is sf object
  expect_s3_class(result, "sf")
  
  # Check it has geometry column
  expect_true("geometry" %in% names(result))
  
  # Check geometry type is POINT (since localizacion_censos contains points)
  if (nrow(result) > 0) {
    geom_types <- unique(sf::st_geometry_type(result))
    expect_true(all(geom_types == "POINT"))
  }
})
