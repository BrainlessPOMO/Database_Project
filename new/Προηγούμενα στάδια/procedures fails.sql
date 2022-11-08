DROP PROCEDURE IF EXISTS Procedure1;
DELIMITER $$
CREATE PROCEDURE Procedure1
(IN charactiras CHAR,IN arithmos INT,IN apo_date DATE, IN ews_date DATE, OUT codes INT, OUT titles VARCHAR(25))
BEGIN
	DECLARE KwdikosEidous INT;
	DECLARE PliresTitlos VARCHAR(25);
	DECLARE DATE1 DATE;
	DECLARE DATE2 DATE;
    DECLARE plithos INT;
    
	IF (charactiras=m) 
    	BEGIN
			SELECT COUNT(*) AS Number, movie.movie_id, movie.title
    		FROM rental
			INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id
    		INNER JOIN movie ON inventory.movie_id=movie.movie_id
  	   		WHERE rental.rental_date>DATE1 AND rental.rental_date<DATE2 
   			GROUP BY movie.title
   	 		ORDER BY Number DESC
    		LIMIT 0,plithos
    		WHERE plithos=arithmos AND DATE1=apo_date AND DATE2=ews_date
		END
	ELSE
        BEGIN  
			SELECT COUNT(*) AS Number,series.series_id,series.title
 	    	FROM rental
			INNER JOIN inventory ON rental.inventory_id=inventory.inventory_id
  	   	 	INNER JOIN series ON inventory.series_id=series.series_id
    		WHERE rental.rental_date> DATE1 AND rental.rental_date< DATE2
  	   		GROUP BY series.title
  	  	 	ORDER BY Number DESC
  	   		LIMIT 0,plithos
  	  		WHERE plithos=arithmos AND DATE1=apo_date AND DATE2=ews_date;
		END;
END
END$$
DELIMITER ;
