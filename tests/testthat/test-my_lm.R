test_that("the output has a correct data type", {
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent,
                  data = my_gapminder), "matrix")
})

test_that("input incorrect throws errort", {
  expect_error(my_lm("a string"))
})
