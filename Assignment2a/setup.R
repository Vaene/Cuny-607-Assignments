# setup.R - Database connection utilities for Movie Ratings Project

# Set CRAN mirror first
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install required packages if not already installed
required_packages <- c("RMariaDB", "DBI", "dplyr", "ggplot2", "here", "knitr")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  cat("Installing missing packages:", paste(new_packages, collapse = ", "), "\n")
  install.packages(new_packages, repos = "https://cran.rstudio.com/")
}

# Load libraries with error handling
library(RMariaDB)
library(DBI)
library(dplyr)
library(ggplot2)
library(here)

# Database connection function
connect_to_movie_db <- function() {
  # Connection parameters
  host <- "localhost"
  port <- 3306
  user <- "movie_user"
  password <- "userpass123"
  dbname <- "movie_ratings"

  # Create connection with error handling
  tryCatch({
    con <- dbConnect(
      MariaDB(),
      host = host,
      port = port,
      user = user,
      password = password,
      dbname = dbname
    )

    cat("Successfully connected to movie ratings database!\n")
    return(con)

  }, error = function(e) {
    cat("Error connecting to database:", e$message, "\n")
    cat("Make sure Docker container is running and database is ready.\n")
    stop("Database connection failed")
  })
}

# Wait for database to be ready
wait_for_movie_db <- function(max_attempts = 60) {
  cat("Waiting for movie database to be ready...\n")

  for (i in 1:max_attempts) {
    tryCatch({
      con <- connect_to_movie_db()
      dbDisconnect(con)
      cat("Database is ready!\n")
      return(TRUE)
    }, error = function(e) {
      cat("Waiting for database... (attempt", i, "of", max_attempts, ")\n")
      Sys.sleep(3)
    })
  }
  stop("Database failed to start after ", max_attempts, " attempts")
}

# Helper function to get all ratings with names
get_ratings_with_names <- function(con) {
  query <- "
    SELECT 
      p.name as person_name,
      p.age,
      p.relationship,
      m.title as movie_title,
      m.year as movie_year,
      m.genre,
      r.rating,
      r.notes
    FROM ratings r
    JOIN people p ON r.person_id = p.person_id
    JOIN movies m ON r.movie_id = m.movie_id
    ORDER BY m.title, p.age DESC
  "

  return(dbGetQuery(con, query))
}

# Helper function to calculate movie averages
get_movie_averages <- function(con) {
  query <- "
    SELECT 
      m.title,
      COUNT(r.rating) as num_ratings,
      ROUND(AVG(r.rating), 2) as avg_rating,
      MIN(r.rating) as min_rating,
      MAX(r.rating) as max_rating
    FROM movies m
    LEFT JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id, m.title
    ORDER BY avg_rating DESC
  "

  return(dbGetQuery(con, query))
}

cat("Setup complete! Use connect_to_movie_db() to connect to the database.\n")
