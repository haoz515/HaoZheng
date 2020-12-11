#' a linear model fit function
#'
#' This fucntion fits a linear model from the two input
#'
#' @param formula a formula that is used to do the linear model
#' @param data the data that is going to be used
#'
#' @keywords inference
#' @return a table with estimation, standard error, t.value and probability
#' that greater than t.value
#'
#' @examples
#' my_lm(my_gapminder$lifeExp ~ my_gapminder$gdpPercap + my_gapminder$continent, data = my_gapminder)
#'
#'
#' @export
my_lm <- function(formula, data) {
  # extract model matrix X
  X <- model.matrix(object = formula, data = data)
  # extract model matrix Y
  Y <- model.response(model.frame(formula, data))
  # cacluate the beta_hat
  beta <- solve(t(X) %*% X) %*% t(X) %*% Y
  # calculate the degree of freedom
  df <- nrow(data) - nrow(beta)
  # calculate the  sigma square
  sigma_squared <- sum((Y - X %*% beta)^2 / df)
  # calculate the standard error
  s_e <- sqrt(diag(sigma_squared * solve(t(X) %*% X)))
  # calculate the t value
  t_value <- beta / s_e
  # calculatethe p value
  p_val <- 2 * pt(abs(t_value), df, lower.tail = FALSE)
  # create the table and put data we calculated back in
  combine <- cbind(beta, s_e, t_value, p_val)
  # name the columns
  colnames(combine) <- c("estimate", "standard eror", "t.value", "Pr(>|t|)")
  # return the table we combine
  return(combine)
}
