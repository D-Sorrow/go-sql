/*EJERCICIO 1 The Walking Dead*/
CREATE TEMPORARY TABLE TWD AS
SELECT sea.title AS title_season, epi.title AS title_episode
FROM series ser
JOIN seasons sea
ON  ser.id = sea.serie_id
JOIN episodes epi
ON sea.id = epi.season_id
WHERE ser.title = "The Walking Dead";

SELECT title_episode 
FROM TWD
WHERE title_season = "Primer Temporada";


/*EJERCICIO 2 Index*/
CREATE INDEX idx_episodes_titles ON episodes(title);

SHOW INDEX FROM episodes;


/*Agregar una película a la tabla movies.*/
INSERT INTO movies VALUES
(22, null, null, "Shrek", 10.0, 4, "1997-09-04 00:00:00", 120, 5);

/*Agregar un género a la tabla genres.*/
INSERT INTO genres VALUES
(13, null, null, "Horror", 13, 1);

/*Asociar a la película del punto 1. genre el género creado en el punto 2.*/
UPDATE movies 
SET genre_id = 13
WHERE id = 22;

/*Modificar la tabla actors para que al menos un actor tenga como favorita la película agregada en el punto 1.*/
UPDATE actors
SET favorite_movie_id =  22
WHERE first_name = "Sam";

/*Crear una tabla temporal copia de la tabla movies.*/
CREATE TEMPORARY TABLE copy_movies AS
SELECT 
	* 
FROM movies;

/*Eliminar de esa tabla temporal todas las películas que hayan ganado menos de 5 awards.*/
DELETE 
FROM copy_movies
WHERE awards < 5;

/*Obtener la lista de todos los géneros que tengan al menos una película.*/

SELECT name 
FROM genres gen 
INNER JOIN movies mo
ON gen.id = mo.genre_id
GROUP BY name;

/*Obtener la lista de actores cuya película favorita haya ganado más de 3 awards.*/

SELECT act.first_name
FROM actors act
JOIN movies mo
ON act.favorite_movie_id = mo.id
WHERE awards > 3;

/*Crear un índice sobre el nombre en la tabla movies.*/

CREATE INDEX idx_movies_titles ON movies(title);

/*Chequee que el índice fue creado correctamente.*/

SHOW INDEX FROM movies

/*En la base de datos movies ¿Existiría una mejora notable al crear índices? Analizar y justificar la respuesta.*/

/*Si mejora el rendimiento puesto que, el motor no tiene que ir comparando valor por valor hasta encontrarlo, en este caso
 con ayuda del indice es capaz de ubicar el valor directamente, esto se debe hacer solo cuando tenga un gran volumen de datos*/


/*¿En qué otra tabla crearía un índice y por qué? Justificar la respuesta*/

/*En la tabla episodios de una serie puesto que al tener un volumen de datos tan extenso es posible optimizar el rendimiento de busqueda si se genera un index
  haciendo uso de los titulos de los episodios*/
