#' get raw data of nobel prize
#'
#' get raw dataframe from API:"http://api.nobelprize.org/v1/prize.json"
#' @return a dataframe of raw data of nobel prize API.
#' @examples
#' get_prize()
#' @export

get_prize <- function(){
  nobel_prize <- "http://api.nobelprize.org/v1/prize.json"
  get_prize <- httr::GET(nobel_prize)
  prize_info <- nobel_prize %>%
    httr::GET()%>%
    httr::content(as = "text")%>%
    jsonlite::fromJSON(simplifyDataFrame = TRUE) %>%
    .[["prizes"]]
  
  #check status
  if(httr::http_status(get_prize)$message != "Success: (200) OK"){
    stop("errors")
  }
    
    prize_info
}