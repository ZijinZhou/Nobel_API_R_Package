#' get basic information of nobel prize
#'
#' This function tells some basic information about the Nobel Prize winner given the year or category.
#' @param y The year of wining in character.
#' @param c The category of the prize in character.
#' @return a dataframe of some basic information of nobel prize.
#' @examples
#' get_nobel_info()
#' get_nobel_info(y = "2018")
#' get_nobel_info(y = "2018", c = "physics")
#' @export

get_nobel_info <- function(y = NULL, c = NULL){
  laureate_info <- get_laureate()

  #cleansing data
  laureate <- laureate_info %>%
    #display the hidden part
    dplyr::as_tibble()%>%
    tidyr::unnest(cols = c(prizes))%>%
    #select useful info
    dplyr::select(id,firstname,surname,born,bornCountry,gender,year,category,share,motivation)%>%
    #unite firstname and surname into fullname
    tidyr::unite(fullname, firstname,surname,sep = " ") %>%
    dplyr::mutate(country = stringr::str_replace_all(bornCountry,"\\(|\\)",""))
  #only use the country that exists now
  laureate$born_country <- ifelse(stringr::str_detect(laureate$country,".*now.*")==TRUE,stringr::str_replace_all(laureate$country, ".*now",""), laureate$country)

  laureate <- laureate %>%
    dplyr::select(id,fullname,born,born_country,gender,year,category,share,motivation)

  #get final info by the given year or category
  if(is.null(y)&is.null(c)){
    laureate
  }else if(is.null(y)&!(is.null(c))){
    dplyr::filter(laureate, category == c)
  }else if(is.null(c)&!(is.null(y))){
    dplyr::filter(laureate, year == y)
  }else{
    dplyr::filter(laureate, year == y, category == c)
  }
}
