#' get country rank information of Nobel Prize winner
#'
#' This function tells the born country of the winner given year or category.
#' @param y The year of wining in character.
#' @param c The category of the prize in character.
#' @return a dataframe of the rank of country win the Prize given year or category.
#' @examples
#' get_nobel_country(y = "2018")
#' get_nobel_country(c = "physics")
#' @export

get_nobel_country <- function(y = NULL, c = NULL){

  country_info <- get_nobel_info(y,c) %>%
    dplyr::count(born_country) %>%
    dplyr::arrange(desc(n))%>%
    stats::na.omit()

  country_info
}
