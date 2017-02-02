### Exercise 4 ###
library("httr")
library("jsonlite")
library("dplyr")

# Use `source()` to load your API key variable.
# Make sure you've set your working directory!

source("apikey.R")

# Define a function that takes in the name of a movie as an argument and returns
# a list of information about that movie. The steps for this algorithm are below:

GetMovieInfo <- function(movie.name){
  
    # Construct an HTTP request to search for reviews for the given movie.
    # The base URI is `https://api.nytimes.com/svc/movies/v2/`
    # The resource is `reviews/search.json`
    # See the interactive console for more detail:
    #   https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
    # You should use YOUR api key (as the `api-key` parameter)

    base.uri <- "https://api.nytimes.com/svc/movies/v2/"
    resource <- "reviews/search.json"
    query.params <- list("api-key" = nty.apikey, "query" = movie.name)
    
    query.url <- paste0(base.uri,resource)
    response <- GET(query.url,query=query.params)
    
    # Send the HTTP Request to download the data
    # Extract the content and convert it from JSON
    
    body <- fromJSON(content(response,"text"))
    # What kind of data structure did this return?
    
    is.data.frame(body)
    is.list(body)
    # Returns a list.
    
    # Manually inspect the returned data and identify what content you wish to work with


    # Flatten that content into a data structure called `reviews`
    body <- data.frame(body)
    reviews <- flatten(body)
    # From the most recent review, store the headline, short summary, and link to
    # the full article, each in their own variables
    most.recent <- filter(reviews, results.publication_date == max(results.publication_date))
    h <- most.recent$results.headline
    s.s <- most.recent$results.summary_short
    l <- most.recent$results.link.url
    
    result.list <- c(headline = h, short.summary = s.s, link = l)
    # Return an list of the three pieces of information from above
    return(result.list)
}

print( GetMovieInfo("Iron Man") )

# Test that your function works with a movie of your choice
