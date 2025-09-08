-- Movie Ratings Database Schema and Data
-- This file will be automatically executed by DDEV

-- Create people table
CREATE TABLE IF NOT EXISTS people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT,
    relationship VARCHAR(50)
);

-- Create movies table
CREATE TABLE IF NOT EXISTS movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INT,
    genre VARCHAR(50)
);

-- Create ratings table
CREATE TABLE IF NOT EXISTS ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    person_id INT,
    movie_id INT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    watched BOOLEAN DEFAULT TRUE,
    notes TEXT,
    FOREIGN KEY (person_id) REFERENCES people(person_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Clear existing data (in case of re-import)
DELETE FROM ratings;
DELETE FROM movies; 
DELETE FROM people;

-- Reset auto increment
ALTER TABLE people AUTO_INCREMENT = 1;
ALTER TABLE movies AUTO_INCREMENT = 1;
ALTER TABLE ratings AUTO_INCREMENT = 1;

-- Insert people data
INSERT INTO people (name, age, relationship) VALUES
('Randy', 45, 'Father'),
('Elle', 42, 'Mother'),
('Ariah', 9, 'Daughter'),
('Alexandra', 6, 'Daughter'),
('Don', 82, 'Grandfather');

-- Insert movies data
INSERT INTO movies (title, year, genre) VALUES
('Barbie', 2023, 'Comedy/Fantasy'),
('KPop Demon Hunters', 2023, 'Action/Comedy'),
('Spider-Man: Across the Spider-Verse', 2023, 'Animation/Action'),
('The Little Mermaid', 2023, 'Musical/Fantasy'),
('Guardians of the Galaxy Vol. 3', 2023, 'Action/Adventure'),
('Elemental', 2023, 'Animation/Family');

-- Insert all ratings data
-- Barbie ratings
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 1, 3, 'Funny but not really my thing'),
(2, 1, 5, 'Loved the humor and message!'),
(3, 1, 4, 'Pink and fun, good movie'),
(4, 1, 5, 'So pretty! I want to be Barbie'),
(5, 1, 2, 'Too loud and colorful for me');

-- KPop Demon Hunters ratings  
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 2, 4, 'Great action sequences'),
(2, 2, 4, 'Surprisingly entertaining'),
(3, 2, 5, 'Love the music and fighting'),
(4, 2, 3, 'Music was good but scary parts'),
(5, 2, 1, 'Too confusing and loud');

-- Spider-Man: Across the Spider-Verse ratings
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 3, 5, 'Amazing animation and story'),
(2, 3, 4, 'Visually stunning'),
(3, 3, 5, 'Best superhero movie ever!'),
(4, 3, 4, 'Pretty colors but long'),
(5, 3, 3, 'Good story, nice animation');

-- The Little Mermaid ratings
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 4, 3, 'Good but prefer the original'),
(2, 4, 4, 'Beautiful songs and visuals'),
(3, 4, 4, 'Ariel is brave and inspiring'),
(4, 4, 5, 'I want to be a mermaid princess!'),
(5, 4, 4, 'Classic story, well done');

-- Guardians of the Galaxy Vol. 3 ratings
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 5, 4, 'Good conclusion to the trilogy'),
(2, 5, 3, 'Bit too intense in parts'),
(3, 5, 3, 'Good but sad parts made me cry'),
(4, 5, 2, 'Too scary, did not finish'),
(5, 5, 2, 'Too much action for me');

-- Elemental ratings
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 6, 4, 'Clever concept and execution'),
(2, 6, 5, 'Beautiful message about differences'),
(3, 6, 5, 'Ember and Wade are so cute together'),
(4, 6, 4, 'Pretty fire and water characters'),
(5, 6, 4, 'Nice story, easy to follow');

-- Verification
SELECT 'Database setup complete!' as status;
SELECT COUNT(*) as total_people FROM people;
SELECT COUNT(*) as total_movies FROM movies;  
SELECT COUNT(*) as total_ratings FROM ratings;
