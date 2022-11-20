USE tvondemand;


DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `Procedure1`$$
CREATE PROCEDURE `Procedure1` 
(
	IN `charactiras` CHAR(1), 
	IN `arithmos` INT, 
	IN `begin_date` DATE, 
	IN `end_date` DATE
)  
BEGIN
	IF (charactiras LIKE 'm') 
		THEN
			SELECT COUNT(*) AS Number,
			movie.movie_id AS KwdikosEidous, 
			movie.title AS PliresTitlos
    		FROM rental
				INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
    			INNER JOIN movie ON inventory.movie_id = movie.movie_id
  	   			WHERE rental.rental_date BETWEEN begin_date AND end_date
   				GROUP BY movie.title
   	 			ORDER BY Number DESC
    			LIMIT 0, arithmos;
		ELSE SELECT COUNT(*) AS Number, 
			series.series_id AS KwdikosEidous,
			series.title AS PliresTitlos
 	    	FROM rental
				INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
  	   	 		INNER JOIN series ON inventory.series_id = series.series_id
    			WHERE rental.rental_date BETWEEN begin_date AND end_date
    			GROUP BY series.title
  	  	 		ORDER BY Number DESC
  	   			LIMIT 0, arithmos;
  		END IF;
END$$
DELIMITER ;
-- ---------------------------------------------------------------------------
DELIMITER $$
DROP PROCEDURE IF EXISTS `Procedure2`$$
CREATE PROCEDURE `Procedure2` 
(
	IN `email` VARCHAR(50),
	IN `Hmerominia` DATE,
    OUT `Rentals` INT
)  
BEGIN
	SET `Rentals`= (
		SELECT COUNT(rental_id) AS Rentals
		FROM `rental`
		RIGHT JOIN `user` ON rental.user_id = user.user_id
		WHERE user.email = email
		and DATE(rental.rental_date) LIKE Hmerominia
	);
END$$
DELIMITER ;

--
DROP PROCEDURE IF EXISTS Procedure3;
delimiter $$
create procedure Procedure3()
begin
	-- counter = metraei tous mhnes apo ton 1o ews ton 12o
    declare counter int;
    declare movie_count_both int;
    declare movie_count_movies int;
    declare episodes_count_both int;
	declare episodes_count_series int;
    declare earnings float;
    
    declare January_Earnings float;
    declare February_Earnings float;
    declare March_Earnings float;
    declare April_Earnings float;
    declare May_Earnings float;
    declare June_Earnings float;
    declare July_Earnings float;
    declare August_Earnings float;
    declare September_Earnings float;
    declare October_Earnings float;
    declare November_Earnings float;
    declare December_Earnings float;
    
    
    set counter = 0;
    

    
    while counter <= 12 do
		-- movie_count_both = to noumero twn atomwn pou exoun enikiasei tainies, kai plhrwnoun 0.3 € ana tainia
		set movie_count_both = (
			SELECT count(movie.movie_id) as number_of_movies FROM movie
			INNER JOIN inventory ON movie.movie_id=inventory.movie_id
			INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
			WHERE month(rental.rental_date) LIKE counter
            and rental.user_id IN (SELECT user_id from user where type_of_reg = 'both')
		);
            
		-- movie_count_movies = to noumero twn atomwn pou exoun enikiasei tainies, kai plhrwnoun 0.4 € ana tainia
        set movie_count_movies = (
			SELECT count(movie.movie_id) as number_of_movies FROM movie
			INNER JOIN inventory ON movie.movie_id=inventory.movie_id
			INNER JOIN rental ON inventory.inventory_id=rental.inventory_id
			WHERE month(rental.rental_date) LIKE counter
            and rental.user_id IN (SELECT user_id from user where type_of_reg = 'movies')
		);    
            
		-- series_count_both = to noumero twn atomwn pou exoun enikiasei seires, kai plhrwnoun 0.1 € ana epeisodio seiras
			set episodes_count_both = (
			SELECT count(`episode_id`) from `episode`
			inner join `season` on `episode`.`season_id` = `season`.`season_id`
			inner join `series` on `season`.`series_id` = `series`.`series_id`
			WHERE series.series_id IN (
				SELECT series.series_id AS number_of_series FROM series
				INNER JOIN inventory ON series.series_id = inventory.series_id
				INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
				WHERE month(rental.rental_date) LIKE 5
				and rental.user_id IN (SELECT user_id from user where type_of_reg = 'both')
			)
		);
            
		-- series_count_series = to noumero twn atomwn pou exoun enikiasei seires, kai plhrwnoun 0.2 € ana epeisodio seiras  
		set episodes_count_series = (
		SELECT count(`episode_id`) from `episode`
		inner join `season` on `episode`.`season_id` = `season`.`season_id`
		inner join `series` on `season`.`series_id` = `series`.`series_id`
		WHERE series.series_id IN (
				SELECT series.series_id AS number_of_series FROM series
				INNER JOIN inventory ON series.series_id = inventory.series_id
				INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
				WHERE month(rental.rental_date) LIKE 5
				and rental.user_id IN (SELECT user_id from user where type_of_reg = 'series')
			)
		);
            
		set earnings = movie_count_both * 0.3 + movie_count_movies * 0.4 + episodes_count_both * 0.1 + episodes_count_series * 0.2;
        
        
        -- emfanizw ta apotelesmata se mhnes
        IF counter = 0 THEN
			set January_Earnings = (select earnings);
		ELSEIF counter = 1 THEN
			set February_Earnings = (select earnings);
		ELSEIF counter = 2 THEN
			set March_Earnings = (select earnings);
		ELSEIF counter = 3 THEN
			set April_Earnings = (select earnings);
		ELSEIF counter = 4 THEN
			set May_Earnings = (select earnings);
		ELSEIF counter = 5 THEN
			set June_Earnings = (select earnings);
		ELSEIF counter = 6 THEN
			set July_Earnings = (select earnings);
		ELSEIF counter = 7 THEN
			set August_Earnings = (select earnings);
		ELSEIF counter = 8 THEN
			set September_Earnings = (select earnings);
		ELSEIF counter = 9 THEN
			set October_Earnings = (select earnings);
		ELSEIF counter = 10 THEN
			set November_Earnings = (select earnings);
		ELSEIF counter = 11 THEN
			set December_Earnings = (select earnings);
		END IF;
		set counter = counter + 1;
  end while; 
	select January_Earnings, February_Earnings, March_Earnings, April_Earnings, May_Earnings, June_Earnings, July_Earnings, August_Earnings, September_Earnings, October_Earnings, November_Earnings, December_Earnings;
end$$
delimiter ;
-- -----------------------------------------------------------------------------
delimiter $$
DROP PROCEDURE IF EXISTS `Procedure4`$$
CREATE PROCEDURE `Procedure4` 
(
	IN `first_last_name` VARCHAR(45), 
	IN `end_last_name` VARCHAR(45)
)  
BEGIN
  SELECT count(`actor_id`) as plhthos FROM actor 
	WHERE last_name between first_last_name and end_last_name;
    
  SELECT `first_name`, `last_name` FROM actor 
	WHERE last_name between concat(first_last_name, '%') and concat( end_last_name, '%')
	ORDER BY last_name ASC;
END$$
delimiter ;
delimiter $$
DROP PROCEDURE IF EXISTS `Procedure5`$$
CREATE PROCEDURE `Procedure5` (IN `last_name` VARCHAR(45))  BEGIN

	declare count_actors int;
    -- check if there are more than 1 results
  set count_actors = (select count(*) from actor where actor.last_name = last_name);
	IF (count_actors > 1) THEN
	select count_actors as plhthos;
	END IF;
	select  `actor_id`, `first_name`, `last_name` from actor
	where actor.last_name = last_name;
END$$
delimiter ;

-- ---------------------------------------
-- elegxos gia ton typo eggrafhs tou xrhsth kai insert sto payment (prin ginei insert sto rental prepei na ginei insert sto payment)
delimiter $$
DROP PROCEDURE IF EXISTS `Proc_payment_after_rent_insert`$$
CREATE PROCEDURE `Proc_payment_after_rent_insert` (IN `registration_type` enum('series','movies','both'), IN `discount` INT, IN `USER_ID` INT, IN `RENTAL_ID` INT , IN `date` datetime)
BEGIN
	IF `registration_type` = 'series' THEN
		INSERT INTO payment(`user_id`, `rental_id`, `amount`, `payment_date`) VALUES(`USER_ID`, `RENTAL_ID`, 0.2/`discount`, `date`);
	ELSEIF `registration_type` = 'movies' THEN
		INSERT INTO payment(`user_id`, `rental_id`, `amount`, `payment_date`) VALUES(`USER_ID`, `RENTAL_ID`, 0.4/`discount`, `date`);
	ELSE 
		INSERT INTO payment(`user_id`, `rental_id`, `amount`, `payment_date`) VALUES(`USER_ID`, `RENTAL_ID`, 0.4/`discount`, `date`);
	END IF;
END$$
DELIMITER ;