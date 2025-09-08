-- Movie Ratings Database Schema
USE movie_ratings;

-- Create people table
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    relationship VARCHAR(50)
);

-- Create movies table
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INT,
    genre VARCHAR(50)
);

-- Create ratings table
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    movie_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    watched BOOLEAN DEFAULT TRUE,
    notes TEXT,
    FOREIGN KEY (person_id) REFERENCES people(person_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert people data
INSERT INTO people (name, age, relationship) VALUES
('Randy', 45, 'Father'),
('Elle', 42, 'Mother'),
('Ariah', 9, 'Daughter'),
('Alexandra', 6, 'Daughter'),
('Don', 82, 'Grandfather');

-- Insert movies data (6 recent popular movies suitable for wide age range)
INSERT INTO movies (title, year, genre) VALUES
('Barbie', 2023, 'Comedy/Fantasy'),
('KPop Demon Hunters', 2023, 'Action/Comedy'),
('Spider-Man: Across the Spider-Verse', 2023, 'Animation/Action'),
('The Little Mermaid', 2023, 'Musical/Fantasy'),
('Guardians of the Galaxy Vol. 3', 2023, 'Action/Adventure'),
('Elemental', 2023, 'Animation/Family');
