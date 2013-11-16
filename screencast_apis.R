# Working with web APIs in R
## I'm going to show you how to work with data sources on the web, specifically 
## those accessible via an API. Don't worry about what an API is - for our purposes, 
## it's a way to get data from the web. 

# Some background
## Requests to a web resource are organized around verbs: GET to get data, POST to 
## submit data, and more for various other purposes.
## We can use those in R to work with web resources

# First, let's load the httr library, which makes working with web resources easy
library(httr)

## Let's play with some data from the Public Library of Science
## You can go here for more information: http://api.plos.org/solr/examples/
## We can use the default search method to get data, setting query to 'science', 
## rows to 1 to return only 1 result, and say we want json formatted data with the 
## 'wt' parameter

out <- GET("http://api.plos.org/search?q=author:Ethan%20White%20science&rows=1&wt=json")
out

## What's nice about httr is you can get a sense for if your request worked or not, 
## here it did with a 200 status code - but you can get a 400 or 500 code, which 
## indicates a problem, search wikipedia for more on that. In fact, `http_status` 
## provides an easy to figure out if the request was successful.

http_status(out)

## We can easily extract the data with a single function that guesses the type of data, 
## here json

data <- content(out)
data

## Which we can then use to extract data, etc.

data$response$docs[[1]]$title_display

## This approach to get text data programatically is super powerful...