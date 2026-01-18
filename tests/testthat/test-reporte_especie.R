test_that("reporte_especie devuelve data para un censo valido", {
  skip_if_not(nrow(inventario_vegetal) > 0, "No hay datos para ese censo")

  # Obtener un censo valido del conjunto de datos
  censo_valido <- inventario_vegetal$censo[1]

  resultado <- reporte_especie(censo_valido)

  # Chequear que el resultado es un data frame
  expect_true(is.data.frame(resultado))

  # Chequear que tiene las columnas esperadas
  expect_true("nombreCientificoEspecie" %in% names(resultado))
  expect_true("especie" %in% names(resultado))
})
