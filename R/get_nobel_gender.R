#' get gender information of nobel prize
#'
#' This function tells the gender(female,male or orgnization) about the Nobel Prize winner given the year or category.
#' @param y The year of wining in character.
#' @param c The category of the prize in character.
#' @param org Choose whether display organization in the output. Input TRUE or FALSE. Default by TRUE.
#' @return a dataframe of gender information of nobel prize.
#' @examples
#' get_nobel_gender(org = FALSE)
#' get_nobel_gender(y = "1966")
#' get_nobel_gender(c = "physics")
#' @export

get_nobel_gender <- function(y = NULL, c = NULL, org = TRUE){
  gendertest <- get_nobel_info(y, c)%>%
    dplyr::count(gender)%>%
    stats::na.omit()

  female <- any(gendertest$gender=="female")!=TRUE
  male <- any(gendertest$gender=="male")!=TRUE
  orgnization <- any(gendertest$gender=="org")!=TRUE

  f <- c("female",0)
  m <- c("male",0)
  o <- c("org",0)

  if(female){
    gendertest <- rbind(f,gendertest)
  }

  if(male){
    gendertest <- rbind(gendertest,m)
  }

  if(org == FALSE){
    gender <- dplyr::filter(gendertest,gender == "female"|gender == "male")
  }else{
    if(orgnization){
      gender <- rbind(gendertest,o)
    }else{
      gender <- gendertest
    }
    gender <- gender
  }

  gender
}
