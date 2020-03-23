#' get raw data of nobel prize laureate
#'
#' get raw dataframe from API:"http://api.nobelprize.org/v1/laureate.json"
#' @return a dataframe of raw data of nobel prize laureate API.
#' @examples
#' get_laureate()
#' @export

get_laureate <- function(){
  #get data from api
  nobel_laureate <- "http://api.nobelprize.org/v1/laureate.json"
  get_nobel <- httr::GET(nobel_laureate)
  laureate_info <- nobel_laureate %>%
    httr::GET()%>%
    httr::content(as = "text")%>%
    jsonlite::fromJSON(simplifyDataFrame = TRUE) %>%
    .[["laureates"]]

  #check status
  if(httr::http_status(get_nobel)$message != "Success: (200) OK"){
    stop("errors")
  }
laureate_info
}
