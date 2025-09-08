#!/bin/bash

echo "🎬 Starting Movie Ratings Database..."
echo "======================================"

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

# Start the database
echo "🐳 Starting MariaDB container..."
docker-compose up -d

# Wait for database to be ready with better method
echo "⏳ Waiting for database to be ready..."
echo "   This may take 30-60 seconds for first startup..."

# Wait for the container to be running first
while [ "$(docker inspect -f '{{.State.Status}}' movie-ratings-db 2>/dev/null)" != "running" ]; do
    echo "   ... waiting for container to start"
    sleep 2
done

# Now wait for MySQL to be ready using a simple connection test
timeout=120
counter=0
while [ $counter -lt $timeout ]; do
    if docker exec movie-ratings-db mysql -u movie_user -puserpass123 -e "SELECT 1;" movie_ratings > /dev/null 2>&1; then
        break
    fi
    echo "   ... database starting up (${counter}s elapsed)"
    sleep 3
    counter=$((counter + 3))
done

if [ $counter -ge $timeout ]; then
    echo "❌ Database startup timeout after ${timeout} seconds"
    echo "Check logs with: docker-compose logs mariadb"
    exit 1
fi

echo "✅ Database is ready!"
echo ""
echo "📊 Database Information:"
echo "   URL: localhost:3306"
echo "   Database: movie_ratings"
echo "   Username: movie_user"
echo "   Password: userpass123"
echo ""
echo "🎯 Next steps:"
echo "   1. Open RStudio"
echo "   2. Open 'movie-ratings-analysis.Rmd'"
echo "   3. Click 'Knit' to run the analysis"
echo ""
echo "🛑 To stop: docker-compose down"
