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

# Wait for database to be healthy
echo "⏳ Waiting for database to be ready..."
timeout=60
while ! docker-compose exec -T mariadb mysqladmin ping -h localhost --silent; do
    sleep 2
    timeout=$((timeout - 2))
    if [ $timeout -le 0 ]; then
        echo "❌ Database startup timeout"
        echo "Check logs with: docker-compose logs mariadb"
        exit 1
    fi
    echo "   ... still waiting"
done

echo "✅ Database is ready!"
echo ""
echo "📊 Database Information:"
echo "   URL: localhost:3306"
echo "   Database: movie_ratings"
echo "   Username: movie_user"
echo ""
echo "🎯 Next steps:"
echo "   1. Open RStudio"
echo "   2. Open 'movie-ratings-analysis.Rmd'"
echo "   3. Click 'Knit' to run the analysis"
echo ""
echo "🛑 To stop: docker-compose down"
