#' get share information of Nobel Prize
#'
#' This function tells the share of the prize given year or category.
#' @param y The year in character.
#' @param c The category of the prize in character.
#' @return a dataframe of share information of the prize with year and category.
#' @examples
#' get_nobel_age(y = "2018")
#' get_nobel_age(y = "2018", c = "physics")
#' @export

get_nobel_share <- function(y = NULL, c = NULL){
  prize_info <- get_prize()

  share <- vector()
  for(i in 1:nrow(prize_info)){
    if(is.null(prize_info$laureates[i][[1]])==TRUE){
      share[i] <- 1
    }else{
      share[i] <- nrow(as.data.frame(prize_info$laureates[i]))
    }
  }

  share_info <- cbind(prize_info,share)%>%
    dplyr::select(year,category,share)

  if(is.null(y)&is.null(c)){
    share_info
  }else if(is.null(y)&!(is.null(c))){
    dplyr::filter(share_info, category == c)
  }else if(is.null(c)&!(is.null(y))){
    dplyr::filter(share_info, year == y)
  }else if(!(is.null(c))&(!is.null(y))){
    dplyr::filter(share_info, year == y, category == c)
  }else{
    return("error")
  }

}
