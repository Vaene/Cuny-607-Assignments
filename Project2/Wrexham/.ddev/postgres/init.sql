-- Create database and schema
CREATE DATABASE IF NOT EXISTS football_analysis;

\c football_analysis;

-- Create matches table (tidy format)
CREATE TABLE IF NOT EXISTS matches (
    match_id SERIAL PRIMARY KEY,
    division VARCHAR(2),
    season VARCHAR(9),
    match_date DATE,
    match_time TIME,
    home_team VARCHAR(100),
    away_team VARCHAR(100),
    full_time_home_goals INTEGER,
    full_time_away_goals INTEGER,
    full_time_result CHAR(1),
    half_time_home_goals INTEGER,
    half_time_away_goals INTEGER,
    half_time_result CHAR(1),
    referee VARCHAR(100),
    home_shots INTEGER,
    away_shots INTEGER,
    home_shots_on_target INTEGER,
    away_shots_on_target INTEGER,
    home_fouls INTEGER,
    away_fouls INTEGER,
    home_corners INTEGER,
    away_corners INTEGER,
    home_yellow_cards INTEGER,
    away_yellow_cards INTEGER,
    home_red_cards INTEGER,
    away_red_cards INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create team performance summary table
CREATE TABLE IF NOT EXISTS team_season_stats (
    stat_id SERIAL PRIMARY KEY,
    team_name VARCHAR(100),
    season VARCHAR(9),
    division VARCHAR(2),
    matches_played INTEGER,
    wins INTEGER,
    draws INTEGER,
    losses INTEGER,
    goals_for INTEGER,
    goals_against INTEGER,
    goal_difference INTEGER,
    points INTEGER,
    home_wins INTEGER,
    away_wins INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX idx_matches_home_team ON matches(home_team);
CREATE INDEX idx_matches_away_team ON matches(away_team);
CREATE INDEX idx_matches_division ON matches(division);
CREATE INDEX idx_matches_season ON matches(season);
CREATE INDEX idx_team_stats_season ON team_season_stats(team_name, season);

-- Grant permissions
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO db;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO db;
