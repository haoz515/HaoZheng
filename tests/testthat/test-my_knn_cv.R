data("my_penguins")
test_that("my_knn_cv works properly", {
  #expect_is(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 1, 5),"list")
})

test_that("incorrect input throws error", {
  expect_error(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 5))
  expect_error(my_knn_cv(1, 4, 1, 5))
})
