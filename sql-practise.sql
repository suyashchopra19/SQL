CREATE TABLE movies (
  id INTEGER PRIMARY KEY,
  name TEXT DEFAULT NULL,
  year INTEGER DEFAULT NULL,
  rank REAL DEFAULT NULL
);

CREATE TABLE actors (
  id INTEGER PRIMARY KEY,
  first_name TEXT DEFAULT NULL,
  last_name TEXT DEFAULT NULL,
  gender TEXT DEFAULT NULL
);

CREATE TABLE roles (
  actor_id INTEGER,
  movie_id INTEGER,
  role_name TEXT DEFAULT NULL
);


SELECT name,year FROM movies
WHERE year=1902 
AND rank>5;


SELECT name,year FROM movies
WHERE year = 1993;



SELECT COUNT(*) FROM movies
WHERE year = 1982;

SELECT * FROM actors
WHERE last_name LIKE 'stack%';

SELECT last_name, COUNT(*) FROM actors
GROUP BY last_name
ORDER BY COUNT(*) DESC 
LIMIT 10;

SELECT first_name, COUNT(*) FROM actors
GROUP BY first_name
ORDER BY COUNT(*) DESC 
LIMIT 10;

SELECT first_name,last_name, COUNT(*) FROM actors
GROUP BY first_name,last_name
ORDER BY COUNT(*) DESC 
LIMIT 10;

SELECT * 
FROM roles INNER JOIN 
	movies 
	ON movies.id = roles.movie_id INNER JOIN
	roles 
	ON actors.id = roles.actor_id;




SELECT actors.first_name, actors.last_name, COUNT(*) AS number
FROM actors INNER JOIN 
	roles
	ON roles.actor_id= actors.id INNER JOIN
	movies
	ON  roles.movie_id = movies.id
	GROUP BY actors.id
	ORDER BY number DESC
	LIMIT 100; 






SELECT genre, Count(*) as num from movies_genres
inner JOIN
movies on movies_genres.movie_id = movies.id
group by genre order by num;

select first_name, last_name
FROM actors INNER JOIN 
	roles
	ON roles.actor_id= actors.id INNER JOIN
	movies
	ON  roles.movie_id = movies.id
	where movies.name = 'Braveheart' and
	movies.year = 1995
	ORDER BY actors.last_name;



select first_name, last_name
FROM directors INNER JOIN 
	roles
	ON roles.actor_id= actors.id INNER JOIN
	movies
	ON  roles.movie_id = movies.id
	where movies.name = 'Braveheart' and
	movies.year = 1995
	ORDER BY actors.last_name;


select first_name, last_name, movies.name, movies.year from directors
inner join 
movies_directors on directors.id = movies_directors.director_id
inner join
movies on movies.id = movies_directors.movie_id
inner join
movies_genres on movies_genres.movie_id = movies.id
where movies_genres.genre = 'Film-Noir' and
movies.year % 4 = 0
order by movies.name;














