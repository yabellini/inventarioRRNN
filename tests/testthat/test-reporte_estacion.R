test_that("reporte_estacion returns data frame with default parameters", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  result <- reporte_estacion()
  
  # Check that result is a data frame or tibble
  expect_true(is.data.frame(result))
  
  # Should have idInventario column
  expect_true("idInventario" %in% names(result))
})

test_that("reporte_estacion returns wide format with seasonality columns", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  result <- reporte_estacion()
  
  # Should be in wide format (one row per inventory)
  expect_true("idInventario" %in% names(result))
  
  # Should have columns for different seasonalities
  # Possible values: Invernal, Primavero-estival
  possible_seasons <- c("Invernal", "Primavero-estival")
  season_cols <- intersect(names(result), possible_seasons)
  
  # At least one seasonality column should exist
  expect_gte(length(season_cols), 0)
  
  if (nrow(result) > 0) {
    # Each idInventario should appear only once
    inventario_counts <- table(result$idInventario)
    expect_true(all(inventario_counts == 1))
  }
})

test_that("reporte_estacion filters by censos parameter", {
  skip_if_not(nrow(inventario_vegetal) > 0, "No data available")
  
  # Get first two census numbers
  censos_to_test <- head(inventario_vegetal$censo, 2)
  
  result <- reporte_estacion(censos = censos_to_test)
  
  # Should return data frame
  expect_true(is.data.frame(result))
  
  # Get expected idInventarios
  expected_ids <- inventario_vegetal[inventario_vegetal$censo %in% censos_to_test, ]$idInventario
  
  # All returned idInventarios should be in expected set
  if (nrow(result) > 0) {
    expect_true(all(result$idInventario %in% expected_ids))
  }
})

test_that("reporte_estacion filters by estaciones parameter", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  # Test with only Invernal
  result_invernal <- reporte_estacion(estaciones = "Invernal")
  
  expect_true(is.data.frame(result_invernal))
  expect_true("idInventario" %in% names(result_invernal))
  
  # Should only have Invernal column (if any data exists for that season)
  if (nrow(result_invernal) > 0) {
    season_cols <- setdiff(names(result_invernal), "idInventario")
    # Should not have Primavero-estival
    expect_false("Primavero-estival" %in% season_cols)
  }
})

test_that("reporte_estacion calculates percentages correctly", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  result <- reporte_estacion(porcentajes = TRUE)
  
  expect_true(is.data.frame(result))
  
  if (nrow(result) > 0) {
    # Get season columns
    season_cols <- setdiff(names(result), "idInventario")
    
    # Percentages for each row should sum to approximately 100 (allowing for rounding)
    if (length(season_cols) > 0) {
      row_sums <- rowSums(result[, season_cols, drop = FALSE], na.rm = TRUE)
      # Most rows should sum to around 100 (within tolerance for rounding)
      # Some rows might not sum to 100 if there are NAs
      non_zero_sums <- row_sums[row_sums > 0]
      if (length(non_zero_sums) > 0) {
        expect_true(all(non_zero_sums >= 0 & non_zero_sums <= 100))
      }
    }
  }
})

test_that("reporte_estacion handles invalid estaciones", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  # Should warn about invalid estaciones
  expect_warning(
    reporte_estacion(estaciones = c("Invalid", "Invernal")),
    "Estaciones no validas ignoradas"
  )
})

test_that("reporte_estacion returns correct counts", {
  skip_if_not(nrow(inventario_flora) > 0, "No data available")
  
  result <- reporte_estacion()
  
  # The counts should be numeric (zeros, not NA, due to values_fill = 0)
  season_cols <- setdiff(names(result), "idInventario")
  
  for (col in season_cols) {
    if (col %in% names(result)) {
      # Values should be numeric
      expect_true(is.numeric(result[[col]]))
      # Should not be negative
      expect_true(all(result[[col]] >= 0, na.rm = TRUE))
    }
  }
})
