#' a t.test function
#'
#' This fucntion do a t.test with three input parameters
#'
#' @param x a data vector with numeric values
#' @param alternative a string to specify the test(greater, less or two.sided)
#' @param mu a value of mean of null hypothesis
#'
#' @return a list, with mean of null hypothesis \code{mu}, and test type
#' given by \code{alternative} and a numeric p_value
#'
#' @examples
#' my_t.test(my_gapminder$lifeExp,"two.sided",60)
#' my_t.test(my_gapminder$lifeExp,"less",60)
#' my_t.test(my_gapminder$lifeExp,"greater",60)
#'
#' @export
my_t.test <- function(x, alternative, mu) {
  # do the test if the input is valid
  if (alternative == "less" | alternative == "greater" |
      alternative == "two.sided") {
    length <- length(x)
    # calculate the t.value
    t_val <- (mean(x) - mu) / (sd(x) / sqrt(length))
    # calculate the degree of freedom
    df <- length - 1
    # alternative hypothesis of less
    if (alternative == "less") {
      p_val = pt(-abs(t_val), df, lower.tail = FALSE)
      if(p_val > 0.05){
        return(list("test_stat is " = t_val, "degree of freedom is " = df,
                  "alternative hypothesis: true mean is less than"
                  = mu, "p-value is "= p_val, "we cannot reject the null
                  hypothesis and conclude that the true mean life
                  expectancy is less than 60"))
      } else {
        return(list("test_stat is " = t_val, "degree of freedom is " = df,
                    "alternative hypothesis: true mean is less than"
                    = mu, "p-value is "= p_val, "we have sufficient evidence
                    to reject the null hypothesis and conclude that the true
                    mean life expectancy is less than 60."))
      }
      # alternative hypothesis of greater
    } else if (alternative == "greater") {
      p_val = pt(-abs(t_val), df, lower.tail = TRUE)
      if(p_val > 0.05){
        return(list("test_stat is "= t_val, "degree of freedom is "= df,
                    "alternative hypothesis: true mean is greater than"
                    = mu, "p-value is "= p_val,"we cannot reject the null
                  hypothesis and conclude that the true mean life
                  expectancy is greater than 60"))
      } else {
        return(list("test_stat is "= t_val, "degree of freedom is "= df,
                    "alternative hypothesis: true mean is greater than"
                    = mu, "p-value is "= p_val,"we reject the null
                  hypothesis and conclude that the true mean life
                  expectancy is greater than 60"))
      }
      return(list("test_stat is "= t_val, "degree of freedom is "= df,
                  "alternative hypothesis: true mean is greater than"
                  = mu, "p-value is "= p_val))
    } else if(alternative == "two.sided"){
      # alternative hypothesis of two.sided
      p_val = 2 * pt(-abs(t_val), df, lower.tail = TRUE)
      if(p_val >0.05) {
        return(list("test_stat is "= t_val, "degree of freedom is "= df,
                    "alternative hypothesis: true mean is not equal to"
                    = mu, "p-value is "= p_val, "we cannot reject the null
                    hypothesis and conclude that the true mean life
                    is 60"))
      } else {
        return(list("test_stat is "= t_val, "degree of freedom is "= df,
                    "alternative hypothesis: true mean is not equal to"
                    = mu, "p-value is "= p_val, "we reject the null
                    hypothesis and conclude that the true mean life
                    is 60"))
      }
    }
    # throw the error message if the input is not valid
  } else {
    stop("The alternative can only be less, greater or two.sided")
  }
}
