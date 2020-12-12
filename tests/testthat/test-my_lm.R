test_that("the output has a correct data type(it should be a table)", {
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent,
                  data = my_gapminder), "table")
})

test_that("input incorrect throws errort", {
  expect_error(my_lm("a string"))
})
