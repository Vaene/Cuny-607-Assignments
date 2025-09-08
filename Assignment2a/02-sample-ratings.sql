-- Sample movie ratings data
USE movie_ratings;

-- Ratings for Barbie (movie_id = 1)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 1, 3, 'Funny but not really my thing'),  -- Randy
(2, 1, 5, 'Loved the humor and message!'),   -- Elle
(3, 1, 4, 'Pink and fun, good movie'),       -- Ariah
(4, 1, 5, 'So pretty! I want to be Barbie'), -- Alexandra
(5, 1, 2, 'Too loud and colorful for me');   -- Don

-- Ratings for KPop Demon Hunters (movie_id = 2)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 2, 4, 'Great action sequences'),
(2, 2, 4, 'Surprisingly entertaining'),
(3, 2, 5, 'Love the music and fighting'),
(4, 2, 3, 'Music was good but scary parts'),
(5, 2, 1, 'Too confusing and loud');

-- Ratings for Spider-Man: Across the Spider-Verse (movie_id = 3)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 3, 5, 'Amazing animation and story'),
(2, 3, 4, 'Visually stunning'),
(3, 3, 5, 'Best superhero movie ever!'),
(4, 3, 4, 'Pretty colors but long'),
(5, 3, 3, 'Good story, nice animation');

-- Ratings for The Little Mermaid (movie_id = 4)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 4, 3, 'Good but prefer the original'),
(2, 4, 4, 'Beautiful songs and visuals'),
(3, 4, 4, 'Ariel is brave and inspiring'),
(4, 4, 5, 'I want to be a mermaid princess!'),
(5, 4, 4, 'Classic story, well done');

-- Ratings for Guardians of the Galaxy Vol. 3 (movie_id = 5)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 5, 4, 'Good conclusion to the trilogy'),
(2, 5, 3, 'Bit too intense in parts'),
(3, 5, 3, 'Good but sad parts made me cry'),
(4, 5, 2, 'Too scary, didn\'t finish'),
(5, 5, 2, 'Too much action for me');

-- Ratings for Elemental (movie_id = 6)
INSERT INTO ratings (person_id, movie_id, rating, notes) VALUES
(1, 6, 4, 'Clever concept and execution'),
(2, 6, 5, 'Beautiful message about differences'),
(3, 6, 5, 'Ember and Wade are so cute together'),
(4, 6, 4, 'Pretty fire and water characters'),
(5, 6, 4, 'Nice story, easy to follow');
