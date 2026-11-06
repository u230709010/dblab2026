# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.

select title, budget, ranking
from movies
where budget > 10000000 and ranking < 6;

# 2. Show the action films with a rating higher than 8.8, produced after 2009.

select title,rating,year
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
WHERE g.genre_name = 'Action' AND m.rating > 8.8 AND m.year > 2009;

# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.

SELECT title, duration, oscars 
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
WHERE g.genre_name = 'Drama' AND m.duration > 150 AND m.oscars > 2;

select title,duration,oscars
from movies
where duration > 150 and oscars >2
and movie_id in(select movie_id from genres where genre_name='Drama')

# 4. Show the thriller films whose budget is greater than 25 million$.
select movie_id,title,budget
from movies
where budget > 2500000 and movie_id in
(select movie_id from genres where genre_name = 'Thriller')

select movies.movie_id, movies.title,movies.budget
from movies
join genres on movies.movie_id =genres.movie_id
where movies.budget >2500000 and genres.genre_name = 'Thriller'


# 5. Show the drama films whose language is Italian and produced between 1990-2000.		 
SELECT m.title, m.year
FROM movies m
JOIN genres g ON m.movie_id = g.movie_id
JOIN languages l ON m.movie_id = l.movie_id
WHERE g.genre_name = 'Drama' 
  AND l.language_name = 'Italian' 
  AND m.year BETWEEN 1990 AND 2000;
  
SELECT title, year
FROM movies
WHERE year BETWEEN 1990 AND 2000
  AND movie_id IN (SELECT movie_id FROM genres WHERE genre_name = 'Drama')
  AND movie_id IN (SELECT movie_id FROM languages WHERE language_name = 'Italian');

# 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.	 