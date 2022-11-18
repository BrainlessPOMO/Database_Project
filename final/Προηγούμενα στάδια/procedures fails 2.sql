	DELIMITER $$
CREATE PROCEDURE pr0c3d(IN typos CHAR,IN arithmos INT,IN apo_date DATE, IN ews_date DATE, OUT codes INT, OUT titles VARCHAR(25))
BEGIN	

	DECLARE counttypos INT;
	SELECT COUNT(*) AS Number, movie.movie_id, movie.title
    FROM rental
	INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id
    INNER JOIN movie ON inventory.movie_id=movie.movie_id
    WHERE rental.rental_date> apo_date AND rental.rental_date< ews_date 
    GROUP BY movie.title
    ORDER BY Number DESC
    LIMIT 0,plithos;
	
	if m
	then
	esle s 
	then
	



SELECT SUM(rental_id) FROM rental
INNER JOIN user ON rental.user_id
WHERE user.email= 'LINDA.WILLIAMS@sakilacustomer.org' 
AND rental.rental_date='2005-05-26'

	SELECT SUM(rental_id) AS Number
	FROM rental
	INNER JOIN inventory ON rental.inventory_id
	INNER JOIN user ON inventory.user_id
	WHERE user.email='APRIL.BURNS@sakilacustomer.org'
	AND rental.rental_date='2005-05-30'


	SELECT SUM(rental_id) AS NumberOfRentals
	FROM rental
	INNER JOIN inventory ON rental.inventory_id
	INNER JOIN series ON inventory.series_id
	INNER JOIN user ON inventory.user_id
	WHERE user.email='RITA.GRAHAM@sakilacustomer.org'
	AND rental.rental_date='2005-05-26 '
