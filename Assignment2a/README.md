# Family Movie Ratings Analysis with DDEV 🎬

A reproducible data analysis project using DDEV, MariaDB, and R to analyze family movie ratings.

## 📋 Project Overview

**Assignment:** Collect ratings for 6 recent movies from 5+ people, store in SQL database, analyze with R.

**Family Participants:**
- Randy (56, Father) 
- Elle (42, Mother)
- Ariah (9, Daughter)
- Alexandra (6, Daughter)
- Don (82, Grandfather)

**Movies Analyzed:**
1. **Barbie** (2023) - Required ✅
2. **KPop Demon Hunters** (2025) - Required ✅
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
   cd movie-ratings-project
   ddev start
   ```

2. **Import database:**
   ```bash
   ddev import-db --src=.ddev/mysql/movie_ratings.sql
   ```

3. **Run analysis:**
   - Open `movie-ratings-analysis.Rmd` in RStudio
   - Click "Knit" to generate the full report

### Stop when done:
```bash
ddev stop
```

## 📁 Project Structure

```
movie-ratings-project/
├── .ddev/
│   ├── config.yaml                    # DDEV configuration
│   └── mysql/
│       └── movie_ratings.sql          # Database schema + data
├── movie-ratings-analysis.Rmd         # ⭐ MAIN ANALYSIS FILE ⭐
├── setup.R                            # R database connection utilities
└── README.md                          # This file
```

## 🎯 Why DDEV?

✅ **Simpler setup** - No complex Docker Compose files
✅ **Reliable database startup** - DDEV handles initialization perfectly  
✅ **Standard configuration** - Same setup works everywhere
✅ **Better performance** - Optimized for local development
✅ **Easy management** - `ddev start`, `ddev stop`, `ddev restart`

## 📊 Analysis Features

The R Markdown report includes:
- Complete dataset overview with family ratings
- Statistical summaries and movie rankings
- Visualizations: bar charts, heatmaps, age group analysis
- Comparison of required movies (Barbie vs KPop Demon Hunters)
- Individual rating patterns and preferences
- Professional charts using ggplot2

## 🔧 Database Details

**DDEV Connection Info:**
- Host: `127.0.0.1` 
- Port: `3306`
- Database: `db`
- Username: `db`
- Password: `db`

**Tables:**
- `people` - Family member details
- `movies` - Movie information  
- `ratings` - Individual movie ratings with notes

## 🛠️ Troubleshooting

**DDEV won't start:**
```bash
ddev poweroff  # Stop all DDEV projects
ddev start     # Try again
```

**Database not ready:**
```bash
ddev restart
ddev import-db --src=movie_ratings.sql
```

**R package issues:**
```r
# In R console:
options(repos = c(CRAN = "https://cran.rstudio.com/"))
install.packages(c("RMariaDB", "DBI", "dplyr", "ggplot2"))
```

**Check DDEV status:**
```bash
ddev describe    # Show project info
ddev logs        # Check for errors
```

## ✅ Assignment Requirements Met

- ✅ 6 recent popular movies selected
- ✅ 5+ people surveyed (family of 5)
- ✅ 1-5 rating scale implemented
- ✅ Data stored in SQL database (MariaDB via DDEV)
- ✅ Data loaded into R dataframes  
- ✅ Complete code provided (SQL + R Markdown)
- ✅ Fully reproducible setup
- ✅ Professional analysis with visualizations

## 🎬 Sample Commands

```bash
# Setup
ddev start
ddev import-db --src=.ddev/mysql/movie_ratings.sql

# Check database
ddev mysql -e "SELECT COUNT(*) FROM ratings;"

# Access database directly  
ddev mysql

# Stop when done
ddev stop
```

---

**🎯 Ready to analyze!** Just run `ddev start`, import the database, and knit the R Markdown file for your complete movie ratings analysis report.
