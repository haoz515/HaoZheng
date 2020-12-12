test_that("my_knn_cv works properly", {
  expect_equal(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 5, 5),0.1471471)
})

test_that("incorrect input throws error", {
  expect_error(my_knn_cv(my_penguins[, 3:6], my_penguins$species, "a", 5))
  expect_error(my_knn_cv(my_penguins[, 3:6], 4, 1, 5))
})
