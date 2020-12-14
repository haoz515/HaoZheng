test_that("my_t.test works properly", {
  expect_is(my_t.test(rnorm(10, 0, 1),"less", 5), "list")
  expect_is(my_t.test(rnorm(10, 0, 1),"greater", 5), "list")
  expect_is(my_t.test(rnorm(10, 0, 1),"two.sided", 5), "list")
})

test_that("incorrect input throws error", {
  expect_error(my_t.test("stat302"))
  expect_error(my_t.test("stat302",1,"stat 302"))
})

