USE tvondemand;

--
-- Triggers `inventory`
--
DROP TRIGGER IF EXISTS `update_log_on_inventory_insert`;
DELIMITER $$
CREATE TRIGGER `update_log_on_inventory_insert` 
BEFORE INSERT ON `inventory` FOR EACH ROW 
BEGIN 
	INSERT INTO `log` (user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'insert', 'inventory');
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_inventory_update`;
DELIMITER $$
CREATE TRIGGER `update_log_on_inventory_update` BEFORE UPDATE ON `inventory` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'update', 'inventory') ;
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_inventory_delete`;
DELIMITER $$
CREATE TRIGGER `update_log_on_inventory_delete` BEFORE DELETE ON `inventory` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NULL, 'customer', 'delete', 'inventory');
END
$$
DELIMITER ;
-- --------------------------------------------------------

--
-- Triggers `payment`
--
DROP TRIGGER IF EXISTS `update_log_on_payment_insert`;
DELIMITER $$
CREATE TRIGGER `update_log_on_payment_insert` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'payment');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_log_on_payment_update`;
DELIMITER $$
CREATE TRIGGER `update_log_on_payment_update` BEFORE UPDATE ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer','update', 'payment') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `update_log_on_payment_delete`;
DELIMITER $$
CREATE TRIGGER `update_log_on_payment_delete` BEFORE DELETE ON `payment` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.`user_id`, 'customer','delete', 'payment');
END
$$
DELIMITER ;

-- -----------------------------------------------------------------------------------
--
-- Triggers `rental`
--
DELIMITER ;
DROP TRIGGER IF EXISTS `update_log_on_rental_insert`;
DELIMITER $$
CREATE TRIGGER `update_log_on_rental_insert` BEFORE INSERT ON `rental` FOR EACH ROW BEGIN 
		
    declare `customer_email` varchar(50);
	declare `customer_reg_type` enum('series','movies','both');
	declare `total_today_rentals` int default 0;

	set `customer_email` = (select email from user where user_id = NEW.`user_id`);
	set `customer_reg_type` = (select type_of_reg from user where user_id = NEW.`user_id`);
    call `Procedure2`(customer_email, NEW.`rental_date`, `total_today_rentals`);
    
    IF  `total_today_rentals` >= 3 THEN
		-- kalw to custom procedure pou eftiaxa gia thn eisagwgh sto payment
        call Proc_payment_after_rent_insert(`customer_reg_type`, 2, NEW.`user_id`, NEW.`rental_id`, NEW.`rental_date`);
        
        -- finally insert into log
		INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'rental');
	ELSE
		-- kalw to custom procedure pou eftiaxa gia thn eisagwgh sto payment
		call Proc_payment_after_rent_insert(`customer_reg_type`, 1, NEW.`user_id`, NEW.`rental_id`, NEW.`rental_date`);
        
        -- finally insert into log
		INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'rental');
	END IF;
	
	INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer', 'insert', 'rental');
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_rental_update`;
DELIMITER $$
CREATE TRIGGER `update_log_on_rental_update` BEFORE UPDATE ON `rental` FOR EACH ROW BEGIN 
	INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.`user_id`, 'customer','update', 'rental') ;
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_rental_delete`;
DELIMITER $$
CREATE TRIGGER `update_log_on_rental_delete` BEFORE DELETE ON `rental` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.`user_id`, 'customer','delete', 'rental');
END
$$
DELIMITER ;

-- -----------------------------------------------------------------------------------
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

DROP TRIGGER IF EXISTS `update_log_on_user_insert`;
DELIMITER $$
CREATE TRIGGER `update_log_on_user_insert` BEFORE INSERT ON `user` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(NEW.user_id, 'customer', 'insert', 'user');
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_user_update`;
DELIMITER $$
CREATE TRIGGER `update_log_on_user_update` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN 
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.user_id, 'customer','update', 'user');
END
$$
DELIMITER ;

DROP TRIGGER IF EXISTS `update_log_on_user_delete`;
DELIMITER $$
CREATE TRIGGER `update_log_on_user_delete` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
INSERT INTO log(user_id, user_spec, action, forTable) VALUES(OLD.user_id, 'customer','delete', 'user');
END
$$
DELIMITER ;
COMMIT;