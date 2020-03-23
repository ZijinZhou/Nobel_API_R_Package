# nobel

**Get information of Nobel Prize by nobel API**    
This package provides users with 7 functions related to Nobel Prize API. The API provides information of Nobel Prize and its laureates. 
The package will make it easier to get and handle with Noble Prize data.
Check documentation here: [Nobel Prize](https://nobelprize.readme.io/) 

Two of the functions are simply getting raw data from two endpoints.     
get_laureate: http://api.nobelprize.org/v1/laureate.json  
get_prize: http://api.nobelprize.org/v1/prize.json

## getting data functions
There is no key of the Nobel API, so simply running the functions without any parameter could work and end up with all the data provided.
```{r}
get_laureate()
get_prize()
```
## further analyzing functions
Other five functions are aimed to dealing with the data got from the API. Noted that all the input parameter should be in form of character.    

`get_nobel_info()`: get a clean dataframe of some basic information of Nobel Prize laureates with given year or category, or both.    
```{r}
get_nobel_info(c = "literature", y = "2012")
```

`get_nobel_age()`:This function shows the age when laureate winning the prize, select the data with the year or category or both, or directly use the full name of the winner.

```{r}
get_nobel_age(n = "Mo Yan")
```

`get_nobel_gender`:This function shows the table of gender or orgnization given the year ot category. Users can choose whether includes the orgnization information in the output besides input the year or category.

```{r}
get_nobel_gender(y = "1997", org = FALSE)
```

`get_nobel_country`:This function shows the rank of countries(only shows the name of the existed country) where winners were born given a year or category.

```{r}
get_nobel_country(c = "physics")
```

`get_nobel_share`:This function shows the share of the prize by given year or category or both.

```{r}
get_nobel_share(y = "2019")
```

## vignette
For more example of anaylsis with these functions, **PLEASE CHECK**: [vignette.rmd](https://github.com/QMSS-G5072-2019/Zijin_Zhou/blob/master/Final_Project/nobel/vignettes/my-vignette.Rmd) here
