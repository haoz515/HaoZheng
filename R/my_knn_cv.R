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
#' my_penguins <- drop_na(my_penguins)
#' my_knn_cv(my_penguins[, 3:6], my_penguins$species, 1, 5)
#'
#'
#' @export
my_knn_cv <- function (train, cl, k_nn, k_cv) {
  l <- length(cl)
  fold <- sample(rep(1:k_cv, length = l))
  data <- data.frame("x" = train, "y" = cl, "split" = fold)
  class <- c()
  cv_err <- rep(NA, k_cv)
  # iterate through k times
  for (i in 1:k_cv) {
    # select the rows of train
    data_train <- data %>% dplyr::filter(split != i)
    # slect the rows of test
    data_test <- data %>% dplyr::filter(split == i)
    data_train_14 <- data_train[,1:4]
    data_test_14 <- data_test[,1:4]
    y_hat <- as.character(knn(data_train_14, data_test_14, data_train$y, k_nn))
    class <- c(class, y_hat)
    cv_err[i] = sum(as.numeric(y_hat != as.character(data_test$y))) / l / k_cv
  }
  y_hat <- as.character(knn(train = train, cl = cl, test = train, k = k_nn))
  # calculate the train error
  train_err <- sum(as.numeric(y_hat != as.character(cl))) / length(cl)
  print(train_err)
  # return the class, cvv_err and the train_err
  # train error is calculated within the function
  # the list of output has three objects
  output <- list("Class" = class, "ce" = mean(cv_err), "te" = train_err)
  return(output)
}
