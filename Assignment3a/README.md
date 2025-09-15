# Family Movie Ratings Analysis with DDEV 🎬

A reproducible data analysis project using DDEV, MariaDB, and R to analyze family movie ratings with Global Baseline Estimate recommendations.

## 📋 Project Overview

**Assignment:** Collect ratings for 6 recent movies from 5+ people, store in SQL database, analyze with R, and implement a recommendation system.

**Family Participants:**
- Randy (56, Father)
- Elle (42, Mother)
- Ariah (9, Daughter)
- Alexandra (6, Daughter)
- Don (82, Grandfather)

**Movies Analyzed:**
1. **Barbie** (2023) - Focus Film ✅
2. **KPop Demon Hunters** (2025) - Focus Film ✅
3. Spider-Man: Across the Spider-Verse (2023)
4. The Little Mermaid (2023)
5. Guardians of the Galaxy Vol. 3 (2023)
6. Elemental (2023)

## 🚀 Quick Start with DDEV

### Prerequisites
- [DDEV installed](https://ddev.readthedocs.io/en/stable/#installation)
- R and RStudio installed
- Docker Desktop running

### Setup (3 easy steps!)

1. **Start DDEV:**
   ```bash
   cd Assignment3a
   ddev start
# Import database:

```
ddev import-db --src=.ddev/mysql/movie_ratings.sql
```

# Check your port number:

```
ddev describe
```

Look for the line showing db:3306 -> 127.0.0.1:XXXXX and note the port number (e.g., 65409)

Update setup.R with correct port:
Edit setup.R and update the port number in connect_to_movie_db():

```
con <- dbConnect(
  RMariaDB::MariaDB(),
  host = "127.0.0.1",
  port = 65409,  # Use YOUR port from ddev describe
  user = "db",
  password = "db",
  dbname = "db"
)
```
# Run analysis:

Open movie-ratings-analysis3a.Rmd in RStudio
Click "Knit" to generate the full report

# Stop when done:
```
ddev stop
```

# 📁 Project Structure
```
Assignment3a/
├── .ddev/
│   ├── config.yaml                    # DDEV configuration
│   └── mysql/
│       └── movie_ratings.sql          # Database schema + data
├── movie-ratings-analysis3a.Rmd       # ⭐ MAIN ANALYSIS FILE ⭐
├── setup.R                            # R database connection utilities
└── README.md                          # This file
```

# 🎯 Why DDEV?
✅ Simpler setup - No complex Docker Compose files
✅ Reliable database startup - DDEV handles initialization perfectly
✅ Standard configuration - Same setup works everywhere
✅ Better performance - Optimized for local development
✅ Easy management - ddev start, ddev stop, ddev restart

# 📊 Analysis Features
The R Markdown report includes:

Complete dataset overview with family ratings
Statistical summaries and movie rankings
Visualizations: bar charts, heatmaps, age group analysis
Comparison of focus movies (Barbie vs KPop Demon Hunters)
Individual rating patterns and preferences
NEW: Global Baseline Estimate recommendation system
NEW: Personalized movie predictions for family members
Professional charts using ggplot2
# 🔧 Database Details
DDEV Connection Info:

Host: 127.0.0.1
Port: Check with ddev describe (usually 65409 or similar)
Database: db
Username: db
Password: db
Tables:

people - Family member details
movies - Movie information
ratings - Individual movie ratings with notes
🛠️ Troubleshooting
# Database connection failed error:

```
# 1. Check DDEV is running
ddev describe

# 2. Note the db port number (e.g., db:3306 -> 127.0.0.1:65409)
# 3. Update setup.R with the correct port number
```

# DDEV won't start:

```
ddev poweroff   # Stop all DDEV projects
ddev start      # Try again
```

# Database not ready:

```
ddev restart
ddev import-db --src=.ddev/mysql/movie_ratings.sql
```
# R package issues:

```
# In R console:
options(repos = c(CRAN = "https://cran.rstudio.com/"))
install.packages(c("RMariaDB", "DBI", "dplyr", "ggplot2", "knitr"))
```
# Check DDEV status:
```
ddev describe   # Show project info and ports
ddev logs       # Check for errors
```

✅ 6 recent popular movies selected
✅ 5+ people surveyed (family of 5)
✅ 1-5 rating scale implemented
✅ Data stored in SQL database (MariaDB via DDEV)
✅ Data loaded into R dataframes
✅ Complete code provided (SQL + R Markdown)
✅ Fully reproducible setup
✅ Professional analysis with visualizations
✅ BONUS: Global Baseline Estimate recommendation system implemented

# 🎬 Sample Commands
```
# Setup
```
ddev start
ddev describe  # IMPORTANT: Note the db port number!
ddev import-db --src=.ddev/mysql/movie_ratings.sql

# Check database
ddev mysql -e "SELECT COUNT(*) FROM ratings;"
ddev mysql -e "SHOW TABLES;"

# Access database directly
ddev mysql

# Stop when done
ddev stop
```
# 📈 Global Baseline Estimate Feature
The analysis now includes a recommendation system that:

Calculates overall rating tendencies for each family member
Identifies movie-specific rating biases
Predicts ratings for unseen movie-person combinations
Provides personalized movie recommendations
Evaluates model performance with MAE and RMSE metrics
🎯 Ready to analyze! Just run ddev start, check your port with ddev describe, update setup.R, import the database, and knit the R Markdown file for your complete movie ratings analysis report with recommendations.