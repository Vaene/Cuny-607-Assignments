# setup.R - Database connection utilities for Movie Ratings Project (DDEV Version)

# Set CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install required packages if not already installed
required_packages <- c("RMariaDB", "DBI", "dplyr", "ggplot2", "knitr")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  cat("Installing missing packages:", paste(new_packages, collapse = ", "), "\n")
  install.packages(new_packages, repos = "https://cran.rstudio.com/")
}

# Load libraries
library(RMariaDB)
library(DBI)
library(dplyr)
library(ggplot2)

# DDEV Database connection function
connect_to_movie_db <- function() {
  # DDEV database connection parameters (use the actual mapped port)
  host <- "127.0.0.1"
  port <- 49457  # <-- Change this from 3306 to 49457
  user <- "db"
  password <- "db"
  dbname <- "db"
  
  # Create connection with error handling
  tryCatch({
    con <- dbConnect(MariaDB(), host = host, port = port, user = user, 
                     password = password, dbname = dbname)
    cat("✅ Successfully connected to DDEV movie ratings database!\n")
    return(con)
  }, error = function(e) {
    cat("❌ Error connecting to database:", e$message, "\n")
    cat("Make sure DDEV is running with: ddev start\n")
    stop("Database connection failed")
  })
}

# Test database connection and tables
test_db_connection <- function() {
  cat("Testing database connection...\n")
  con <- connect_to_movie_db()

  # Check for our tables
  tables <- dbListTables(con)
  expected_tables <- c("people", "movies", "ratings")

  missing_tables <- expected_tables[!(expected_tables %in% tables)]

  if(length(missing_tables) == 0) {
    cat("✅ All required tables found:", paste(tables, collapse = ", "), "\n")

    # Quick data check
    people_count <- dbGetQuery(con, "SELECT COUNT(*) as count FROM people")$count
    movies_count <- dbGetQuery(con, "SELECT COUNT(*) as count FROM movies")$count  
    ratings_count <- dbGetQuery(con, "SELECT COUNT(*) as count FROM ratings")$count

    cat("📊 Data summary: ", people_count, "people,", movies_count, "movies,", ratings_count, "ratings\n")

    dbDisconnect(con)
    return(TRUE)
  } else {
    dbDisconnect(con)
    stop("❌ Missing tables: ", paste(missing_tables, collapse = ", "), "\nRun: ddev import-db --src=.ddev/mysql/movie_ratings.sql")
  }
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

cat("✅ DDEV setup complete! Use ddev start, then connect with connect_to_movie_db()\n")
