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



















