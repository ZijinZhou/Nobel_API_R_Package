% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_nobel_age.R
\name{get_nobel_age}
\alias{get_nobel_age}
\title{get age information of Nobel Prize winner}
\usage{
get_nobel_age(n = NULL, y = NULL, c = NULL)
}
\arguments{
\item{n}{Full name of winner in character.}

\item{y}{The year of wining in character.}

\item{c}{The category of the prize in character.}
}
\value{
a dataframe of some basic information and age information of the winner.
}
\description{
This function tells the age when the winner won the prize given the name, year or category.
}
\examples{
get_nobel_age(n = "John Goodenough")
get_nobel_age(y = "2018")
get_nobel_age(y = "2018", c = "physics")
}
