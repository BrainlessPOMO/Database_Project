DROP PROCEDURE IF EXISTS Proc3;
delimiter $$
create procedure Proc3()
begin
    declare counter int,
    declare movie_count_both int,
    declare movie_count_movies int,
    declare series_count_both  int,
	declare series_count_series  int,
    declare earnings float
    
    set counter = 0
    
    while counter <= 12 do
        BEGIN        
		set movie_count_both = 
        	(
            SELECT count(movie.movie_id) as number_of_movies FROM movie
			INNER JOIN inventory ON movie.movie_id=inventory.movie_id
			INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
			WHERE month(rental.rental_date) LIKE counter
            and rental.user_id IN (SELECT user_id from user where type_of_reg = 'both')
            )
       
        set movie_count_movies = 
            (
            SELECT count(movie.movie_id) as number_of_movies FROM movie
			INNER JOIN inventory ON movie.movie_id=inventory.movie_id
			INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
			WHERE month(rental.rental_date) LIKE counter
            and rental.user_id IN (SELECT user_id from user where type_of_reg = 'movies')
            )
        
        set series_count_both = 
            (
            SELECT count(series.series_id) AS number_of_series FROM series
			INNER JOIN inventory ON series.series_id = inventory.series_id
			INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
			WHERE month(rental.rental_date) LIKE counter
            and rental.user_id IN (SELECT user_id from user where type_of_reg = 'both')
            )
            
        set series_count_series = 
            (
                SELECT count(series.series_id) AS number_of_series FROM series
				INNER JOIN inventory ON series.series_id = inventory.series_id
				INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
				WHERE month(rental.rental_date) LIKE counter
           		and rental.user_id IN (SELECT user_id from user where type_of_reg = 'series')
             )
            
		set earnings = movie_count_both*(0.3) + movie_count_movies*(0.4) + series_count_both*(0.1) + series_count_series*(0.2)
 IF (counter LIKE 0) THEN
	BEGIN
	select earnings AS January_Earnings
	END
	ELSE IF (counter = 1) THEN
        BEGIN
			SELECT earnings AS February_Earnings
		END
		ELSE IF (counter = 2) THEN
        BEGIN
			select earnings as March_Earnings
        END
		ELSE IF (counter = 3) THEN 
        BEGIN
			select earnings as April_Earnings
        END
		ELSE IF (counter = 4) THEN
        BEGIN
			select earnings as May_Earnings
        END
		ELSE IF (counter = 5) THEN
        BEGIN
			select earnings as June_Earnings
        END
		ELSE IF (counter = 6) THEN
        BEGIN
			select earnings as July_Earnings
        END
		ELSE IF (counter = 7) THEN
        BEGIN
			select earnings as August_Earnings
        END
		ELSE IF (counter = 8) THEN
        BEGIN
			select earnings as September_Earnings
        END
		ELSE IF (counter = 9) THEN
        BEGIN
			select earnings as October_Earnings
        END
		ELSE IF (counter = 10) THEN
        BEGIN
			select earnings as November_Earnings
        END
		ELSE IF (counter = 11) THEN
        BEGIN
			select earnings as December_Earnings
	END
END$
delimiter ;