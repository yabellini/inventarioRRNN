test_that("Los datasets geograficos de generales se cargan correctamente", {
  # Test datasets from generales-geoserver
  data(aeropuertos_la_pampa, package = "inventarioRRNN")
  expect_s3_class(aeropuertos_la_pampa, "sf")
  expect_equal(nrow(aeropuertos_la_pampa), 2)
  
  data(microregion_la_pampa, package = "inventarioRRNN")
  expect_s3_class(microregion_la_pampa, "sf")
  expect_equal(nrow(microregion_la_pampa), 10)
  
  data(suelos_la_pampa, package = "inventarioRRNN")
  expect_s3_class(suelos_la_pampa, "sf")
  expect_equal(nrow(suelos_la_pampa), 261)
})

test_that("Los datasets geograficos climaticos se cargan correctamente", {
  # Test datasets from variables-climaticas-geoserver
  data(precipitaciones_anuales_la_pampa, package = "inventarioRRNN")
  expect_s3_class(precipitaciones_anuales_la_pampa, "sf")
  expect_equal(nrow(precipitaciones_anuales_la_pampa), 5)
  
  data(temperatura_media_la_pampa, package = "inventarioRRNN")
  expect_s3_class(temperatura_media_la_pampa, "sf")
  expect_equal(nrow(temperatura_media_la_pampa), 4)
  
  data(horas_frio_anuales_la_pampa, package = "inventarioRRNN")
  expect_s3_class(horas_frio_anuales_la_pampa, "sf")
  expect_equal(nrow(horas_frio_anuales_la_pampa), 4)
})

test_that("Los datasets geograficos tienen columnas geometry", {
  data(aeropuertos_la_pampa, package = "inventarioRRNN")
  expect_true("geometry" %in% names(aeropuertos_la_pampa))
  
  data(precipitaciones_anuales_la_pampa, package = "inventarioRRNN")
  expect_true("geometry" %in% names(precipitaciones_anuales_la_pampa))
})
