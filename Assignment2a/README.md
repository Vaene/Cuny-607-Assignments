# Family Movie Ratings Analysis 🎬

A reproducible data analysis project that collects and analyzes movie ratings from family members using MariaDB and R.

## 📋 Assignment Details

**Participants:**
- Randy (45, Father)
- Elle (42, Mother)
- Ariah (9, Daughter)
- Alexandra (6, Daughter)
- Don (82, Grandfather)

**Movies Rated:**
1. **Barbie** (2023) - Required
2. **KPop Demon Hunters** (2023) - Required  
3. Spider-Man: Across the Spider-Verse (2023)
4. The Little Mermaid (2023)
5. Guardians of the Galaxy Vol. 3 (2023)
6. Elemental (2023)

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- R and RStudio installed

### Setup Instructions

1. **Download/clone this project**
2. **Start the database:**
   - **Mac/Linux**: `./start-database.sh`
   - **Windows**: Double-click `start-database.bat`
   - **Manual**: `docker-compose up -d`

3. **Run the analysis:**
   - Open `movie-ratings-analysis.Rmd` in RStudio
   - Click "Knit" to generate the full analysis report

4. **When finished:**
   ```bash
   docker-compose down
   ```

## 📁 Project Structure

```
movie-ratings-project/
├── docker-compose.yml           # Database configuration
├── .env                         # Environment variables
├── movie-ratings-analysis.Rmd   # Main analysis (KNIT THIS!)
├── setup.R                      # R database utilities
├── start-database.sh           # Mac/Linux startup script
├── start-database.bat          # Windows startup script
├── init/
│   ├── 01-create-tables.sql    # Database schema
│   └── 02-sample-ratings.sql   # Sample ratings data
└── README.md                   # This file
```

## 🎯 What This Project Demonstrates

- ✅ **SQL Database Design**: Normalized schema with people, movies, and ratings tables
- ✅ **Data Collection**: Structured family movie rating survey
- ✅ **R Analysis**: Statistical analysis and visualization using dplyr and ggplot2
- ✅ **Database Integration**: Loading data from MariaDB into R dataframes
- ✅ **Reproducibility**: Complete Docker setup for any platform
- ✅ **Documentation**: Comprehensive R Markdown report

## 📊 Analysis Features

The R Markdown analysis includes:
- Complete dataset overview and summary statistics
- Movie ranking by average rating
- Age group analysis (Children vs Adults vs Seniors)
- Individual rating patterns visualization
- Genre preference analysis
- Detailed comparison of required movies (Barbie vs KPop Demon Hunters)

## 🔧 Technical Details

**Database:**
- MariaDB running in Docker container
- Port: 3306
- Database: `movie_ratings` 
- Username: `movie_user`
- Password: `userpass123`

**R Packages Used:**
- RMariaDB (database connection)
- DBI (database interface)
- dplyr (data manipulation)
- ggplot2 (visualization)
- knitr (report generation)

## 🐛 Troubleshooting

**Database won't start:**
- Ensure Docker Desktop is running
- Check port 3306 isn't in use: `lsof -i :3306`
- View logs: `docker-compose logs mariadb`

**R connection errors:**
- Wait for database to fully start (about 30 seconds)
- Verify container is running: `docker ps`
- Try restarting: `docker-compose restart`

**Package installation issues:**
- Ensure you have internet connection
- Update R to latest version
- Install packages manually if needed

## 🎓 Assignment Requirements Met

- ✅ Six recent popular movies selected
- ✅ At least 5 people surveyed (we have 5 family members)
- ✅ 1-5 rating scale implemented
- ✅ Data stored in SQL database (MariaDB)
- ✅ Data loaded into R dataframes
- ✅ Complete code provided (SQL + R Markdown)
- ✅ GitHub repository ready

## 👥 Contributors

Created for Data Analysis class assignment - demonstrating reproducible research practices with SQL databases and R.

---
*🎬 Happy analyzing! Remember to knit the R Markdown file to see the complete analysis.*
