data("my_penguins")

test_that("my_knn_cv works properly", {
  test_1 <- my_knn_cv(penguins_df[, 3:6], penguins_df$species, 1, 5)
  expect_is(test_1,"list")
})

test_that("incorrect input throws error", {
  expect_error(my_knn_cv(my_penguins[, 3:6], my_penguins$species, 5))
  expect_error(my_knn_cv(1, 4, 1, 5))
})
