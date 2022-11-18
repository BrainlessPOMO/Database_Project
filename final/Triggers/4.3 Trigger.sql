DROP PROCEDURE IF EXISTS DENIED_1;
DELIMITER $$DELIMITER $$
CREATE TRIGGER DENIED_user_updates
BEFORE UPDATE
ON user FOR EACH ROW 
BEGIN 
    IF (old.`user_id` <> new.`user_id`) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Id cannot change!!';
    ELSEIF (old.`first_name` <> new.`first_name`) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user first name cannot change!!';
    ELSEIF (old.`last_name` <> new.`last_name`) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user last name cannot change!!';
    ELSEIF (old.`create_date` <> new.`create_date`) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user created date cannot change!!';
    END IF;
END$$
