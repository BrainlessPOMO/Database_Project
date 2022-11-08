-- The TIMESTAMP and DATETIME data types offer 
-- automatic initialization and updating to the current date and time.
-- 
-- user
--
delimiter //
CREATE TRIGGER enimerwsi_log_1_1
BEFORE INSERT ON user
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'user');
END//
--
CREATE TRIGGER enimerwsi_log_1_2
BEFORE UPDATE ON user
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'user');
END//
--
CREATE TRIGGER enimerwsi_log_1_3
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'user');
END//
--
-- rental
--
CREATE TRIGGER enimerwsi_log_1_4
BEFORE INSERT ON rental
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'rental');
END//
--
CREATE TRIGGER enimerwsi_log_1_5
BEFORE UPDATE ON rental
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'rental') ;
END//
--
CREATE TRIGGER enimerwsi_log_1_6
BEFORE DELETE ON rental
FOR EACH ROW
BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'rental');
END//
--
-- inventory
--
CREATE TRIGGER enimerwsi_log_1_7
BEFORE INSERT ON inventory
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'inventory');
END//
--
CREATE TRIGGER enimerwsi_log_1_8
BEFORE UPDATE ON inventory
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'inventory') ;
END//
--
CREATE TRIGGER enimerwsi_log_1_9
BEFORE DELETE ON inventory
FOR EACH ROW
BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'inventory');
END//
--
-- payment
--
CREATE TRIGGER enimerwsi_log_1_10
BEFORE INSERT ON payment
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer', 'insert', 'payment');
END//
--
CREATE TRIGGER enimerwsi_log_1_11
BEFORE UPDATE ON payment
FOR EACH ROW 
BEGIN 
INSERT INTO log(user_spec, action, forTable) VALUES('customer','update', 'payment') ;
END//
--
CREATE TRIGGER enimerwsi_log_1_12
BEFORE DELETE ON payment
FOR EACH ROW
BEGIN
INSERT INTO log(user_spec, action, forTable) VALUES('customer','delete', 'payment');
END//

delimiter ;
-- 