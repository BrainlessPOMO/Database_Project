USE tvondemand2;

--
-- Triggers `inventory`
--
DROP TRIGGER IF EXISTS `enimerwsi_log_1_7`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_7` 
BEFORE INSERT ON `inventory` FOR EACH ROW 
BEGIN 
	INSERT INTO `log` (user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'insert', 'inventory');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_8`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_8` BEFORE UPDATE ON `inventory` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'update', 'inventory') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_9`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_9` BEFORE DELETE ON `inventory` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'delete', 'inventory');
END
$$
DELIMITER ;
COMMIT;
-- --------------------------------------------------------

--
-- Triggers `payment`
--
DROP TRIGGER IF EXISTS `enimerwsi_log_1_10`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_10` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'payment');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_11`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_11` BEFORE UPDATE ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer','update', 'payment') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_12`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_12` BEFORE DELETE ON `payment` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.`user_id`, 'customer','delete', 'payment');
END
$$
DELIMITER ;

-- -----------------------------------------------------------------------------------

--
-- Triggers `rental`
--
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_4`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_4` BEFORE INSERT ON `rental` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'rental');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_5`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_5` BEFORE UPDATE ON `rental` FOR EACH ROW BEGIN 
	declare Enoikiaseis int;
    declare old_amount float;
    
    set Enoikiaseis = (
		SELECT COUNT(rental_id) AS Enoikiaseis
		FROM rental 
		INNER JOIN user ON rental.user_id=user.user_id
		WHERE DATE(rental.rental_date) LIKE DATE(NOW()) and user.user_id = OLD.`user_id`
		GROUP BY user.email
    );
    
    set old_amount = (
		SELECT payment.amount as old_amount FROM rental INNER JOIN payment
		ON rental.rental_id=payment.rental_id 
		where `rental`.`user_id` = OLD.`user_id` and DATE(payment.payment_date) LIKE DATE(NOW())
    );
	
    IF Enoikiaseis>=3 THEN
		UPDATE payment SET payment.amount=old_amount/2 where payment.rental_id = OLD.rental_id;
	END IF;
	INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer','update', 'rental') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_6`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_6` BEFORE DELETE ON `rental` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.`user_id`, 'customer','delete', 'rental');
END
$$
DELIMITER ;

--
-- Triggers `user`
--
DROP TRIGGER IF EXISTS `DENIED_user_updates`;
DELIMITER $$
CREATE TRIGGER `DENIED_user_updates` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN 
	IF (old.`user_id` <> new.`user_id`) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Id cannot change!!';
	ELSEIF (old.`first_name` <> new.`first_name`) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user first name cannot change!!';
    ELSEIF (old.`last_name` <> new.`last_name`) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user last name cannot change!!';
	ELSEIF (old.`create_date` <> new.`create_date`) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A user created date cannot change!!';
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_1`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_1` BEFORE INSERT ON `user` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.user_id, 'customer', 'insert', 'user');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_2`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_2` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.user_id, 'customer','update', 'user');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_3`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_3` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.user_id, 'customer','delete', 'user');
END
$$
DELIMITER ;
COMMIT;