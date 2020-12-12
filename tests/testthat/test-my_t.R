test_that("my_t.test works properly", {
  expect_is(my_t.test(rnorm(10, 2, 1),"greater", 5), "list")
})

test_that("incorrect input throws error", {
  expect_error(my_t.test("string"))
  expect_error(my_t.test(2,3,4,4))
})
