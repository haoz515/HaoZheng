test_that("my_rf_cv works properly", {
  expect_is(my_rf_cv(5), "numeric")
})

test_that("incorrect input throws error", {
  expect_error(my_rf_cv("string"))
  expect_error(my_rf_cv(4,5,1,"a"))
})
