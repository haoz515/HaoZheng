#' a function about knn
#'
#' The function predicts output class species using covariates
#'
#' @param train dataframe used to predict output
#' @param cl class value of training dataset
#' @param k_nn a numeric value that  specify the quantity of neighbours
#' @param k_cv a numeric value specify the number of folding
#'
#' @keywords inference
#' @return a table with estimation, standard error, t.value and probability
#' that greater than t.value
#'
#' @examples
#' data(my_penguins)
#' my_penguins <- tidyr::drop_na(my_penguins)
#' my_knn_cv(my_penguins[, 3:6], my_penguins$species, 1, 5)
#'
#'
#' @export

my_knn_cv <- function(train, cl, k_nn, k_cv) {
  l <- length(cl)
  fold <- sample(rep(1:k_cv, length = len))
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  cv_err <- rep(0, k_cv)
  for (i in 1:k_cv) {
    data_train_14 <- which(fold != i)
    data_test_14 <- which(fold == i)
    y_hat <- knn(train[data_train_14, ], train[data_test_14, ], cl[data_train_14], k_nn)
    # record the prediction and the misclassification rate
    cv_err[i] <- (sum(y_hat != cl[data_test_14])) / length(data_test_14)
  }
  class <- class::knn(train, train, cl, k_nn)
  output <- list("class" = class, "cv_err" = mean(cv_err))
  return(output)
}
