@echo off
echo 🎬 Starting Movie Ratings Database...
echo ======================================

REM Check if Docker is running
docker info >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not running. Please start Docker Desktop first.
    pause
    exit /b 1
)

REM Start the database
echo 🐳 Starting MariaDB container...
docker-compose up -d

REM Wait for database to be healthy
echo ⏳ Waiting for database to be ready...
:wait_loop
docker-compose exec -T mariadb mysqladmin ping -h localhost --silent >nul 2>&1
if %errorlevel% neq 0 (
    echo    ... still waiting
    timeout /t 2 /nobreak >nul
    goto wait_loop
)

echo ✅ Database is ready!
echo.
echo 📊 Database Information:
echo    URL: localhost:3306
echo    Database: movie_ratings
echo    Username: movie_user
echo.
echo 🎯 Next steps:
echo    1. Open RStudio
echo    2. Open 'movie-ratings-analysis.Rmd'
echo    3. Click 'Knit' to run the analysis
echo.
echo 🛑 To stop: docker-compose down
pause
