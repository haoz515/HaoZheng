data("my_penguins")
my_penguins <- na.omit(my_penguins)

test_that("my_knn_cv works properly", {
  expect_is(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 1, 5), "list")
})

test_that("incorrect input throws error", {
  expect_error(my_knn_cv(c(1,2,3), c(1,233), "stats", "302"))
  expect_error(my_knn_cv("302","303","304","305"))
})
