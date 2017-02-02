# Exercise-4

In this exercise, you'll practice fetching data using the [New York Times API](https://developer.nytimes.com/) to fetch movie reviews. To learn more about the API, see the [developer console](https://developer.nytimes.com/movie_reviews_v2.json).

As in previous exercises, you should fork and clone this repository, follow the instructions in `exercise.R` file, then `add` and `commit` your changes so that you can `push` them back up to Github.

## Getting an API Key
You will need to register with the NYT site at <https://developer.nytimes.com/signup> in order to get an API Key. Fill out the form (you can use fake information and a single-use email if you wish). Under "API" select **"Movie Reviews API"** (and note other APIs available for future projects)! The API key should be emailed to you once you sign up.

In order to utilize this key in your script, create a **separate* RScript called `apikey.R` inside this directory. Assign the key that was emailed to you to a variable:

```r
nty.apikey <- "my-api-key-as-a-string-inside-quotes"
```

You should also modify the included `.gitignore` file inside the directory to include your `apikey.R` script so that it doesn't get committed!
