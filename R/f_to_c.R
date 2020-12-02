#' Fahrenheit Converter
#'
#' This function converts temperature from Fahrenheit to Celcius.
#'
#' @param temp_F Numeric input indicating temperature in Fahrenheit
#' @keywords temperature
#'
#' @return indicating the temperature \code{temp_F} converted to Celsium
#'
#' @examples
#' f_to_c(32)
#' f_to_c(212)
#'
#' @export
f_to_c <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
