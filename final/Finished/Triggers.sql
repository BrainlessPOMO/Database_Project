USE tvondemand2;

--
-- Triggers `inventory`
--
DROP TRIGGER IF EXISTS `enimerwsi_log_1_7`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_7` BEFORE INSERT ON `inventory` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'inventory');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_8`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_8` BEFORE UPDATE ON `inventory` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'inventory') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_9`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_9` BEFORE DELETE ON `inventory` FOR EACH ROW BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'inventory');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Triggers `payment`
--
DROP TRIGGER IF EXISTS `enimerwsi_log_1_10`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_10` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'payment');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_11`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_11` BEFORE UPDATE ON `payment` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'payment') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_12`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_12` BEFORE DELETE ON `payment` FOR EACH ROW BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'payment');
END
$$
DELIMITER ;

-- -----------------------------------------------------------------------------------

--
-- Triggers `rental`
--
DROP TRIGGER IF EXISTS `EKPTWSI`;
DELIMITER $$
CREATE TRIGGER `EKPTWSI` 
BEFORE UPDATE ON `rental` 
FOR EACH ROW BEGIN
    CALL ProcedureEkptwsi;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_4`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_4` BEFORE INSERT ON `rental` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'rental');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_5`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_5` BEFORE UPDATE ON `rental` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'rental') ;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_6`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_6` BEFORE DELETE ON `rental` FOR EACH ROW BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'rental');
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
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'user');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_2`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_2` BEFORE UPDATE ON `user` FOR EACH ROW BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'user');
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `enimerwsi_log_1_3`;
DELIMITER $$
CREATE TRIGGER `enimerwsi_log_1_3` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'user');
END
$$
DELIMITER ;
COMMIT;