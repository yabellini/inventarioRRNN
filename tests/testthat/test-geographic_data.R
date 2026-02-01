test_that("Los datasets geograficos de generales se cargan correctamente", {
  # Test datasets from generales-geoserver
  data(aeropuertos, package = "inventarioRRNN")
  expect_s3_class(aeropuertos, "sf")
  expect_equal(nrow(aeropuertos), 2)

  data(microregion_la_pampa, package = "inventarioRRNN")
  expect_s3_class(microregion, "sf")
  expect_equal(nrow(microregion), 10)

  data(suelos_la_pampa, package = "inventarioRRNN")
  expect_s3_class(suelos, "sf")
  expect_equal(nrow(suelos), 261)
})

test_that("Los datasets geograficos climaticos se cargan correctamente", {
  # Test datasets from variables-climaticas-geoserver
  data(precipitaciones_anuales, package = "inventarioRRNN")
  expect_s3_class(precipitaciones_anuales, "sf")
  expect_equal(nrow(precipitaciones_anuales), 5)

  data(temperatura_media_la_pampa, package = "inventarioRRNN")
  expect_s3_class(temperatura_media, "sf")
  expect_equal(nrow(temperatura_media), 4)

  data(horas_frio_anuales_la_pampa, package = "inventarioRRNN")
  expect_s3_class(horas_frio_anuales, "sf")
  expect_equal(nrow(horas_frio_anuales), 4)
})

test_that("Los datasets geograficos tienen columnas geometry", {
  data(aeropuertos_la_pampa, package = "inventarioRRNN")
  expect_true("geometry" %in% names(aeropuertos))

  data(precipitaciones_anuales_la_pampa, package = "inventarioRRNN")
  expect_true("geometry" %in% names(precipitaciones_anuales))
})
