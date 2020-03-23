#' get age information of Nobel Prize winner
#'
#' This function tells the age when the winner won the prize given the name, year or category.
#' @param n Full name of winner in character.
#' @param y The year of wining in character.
#' @param c The category of the prize in character.
#' @return a dataframe of some basic information and age information of the winner.
#' @examples
#' get_nobel_age(n = "John Goodenough")
#' get_nobel_age(y = "2018")
#' get_nobel_age(y = "2018", c = "physics")
#' @export

get_nobel_age <- function(n = NULL, y = NULL, c = NULL){

  laureate <- get_nobel_info()

  if(is.null(n)){
    basic_info <- get_nobel_info(y,c)
  }else{
    basic_info <- dplyr::filter(laureate, fullname == n)
  }

  age_info <- basic_info %>%
    dplyr::mutate(bornyear = stringr::str_sub(as.matrix(.[,"born"]),1,4))%>%
    dplyr::mutate(age = as.numeric(year)-as.numeric(bornyear))%>%
    dplyr::select(fullname, year,category,age)

  age_info
}
