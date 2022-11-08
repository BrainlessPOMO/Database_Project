-- Database TVOnDemand 

-- based on

-- Sakila Sample Database Schema
-- Version 1.2

-- Copyright (c) 2006, 2019, Oracle and/or its affiliates.

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:

-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
-- * Redistributions in binary form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
-- * Neither the name of Oracle nor the names of its contributors may be used
--   to endorse or promote products derived from this software without
--   specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
-- IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


DROP SCHEMA IF EXISTS tvondemand;
CREATE SCHEMA tvondemand;
USE tvondemand;


-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE `actor` (
  `actor_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY  (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(50) NOT NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  country_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (`city_id`),
  CONSTRAINT `fk_city_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `district` VARCHAR(20) DEFAULT NULL,
  `city_id` SMALLINT UNSIGNED NOT NULL,
  `postal_code` VARCHAR(10) DEFAULT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY  (`address_id`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` CHAR(20) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(50) DEFAULT NULL,
  `address_id` SMALLINT UNSIGNED NOT NULL,
  `active` BOOLEAN NOT NULL DEFAULT TRUE,
  `create_date` DATETIME NOT NULL,
  `role` ENUM('customer', 'admin', 'employee') default 'customer',
  PRIMARY KEY  (`user_id`),
  CONSTRAINT `fk_customer_address` FOREIGN KEY (`address_id`) REFERENCES address (`address_id`) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `film_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(128) NOT NULL,
  `description` TEXT DEFAULT NULL,
  `release_year` YEAR DEFAULT NULL,
  `language_id` TINYINT UNSIGNED NOT NULL,
  `original_language_id` TINYINT UNSIGNED DEFAULT NULL,
  `length` SMALLINT UNSIGNED DEFAULT NULL,
  `rating` ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` ENUM('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  PRIMARY KEY  (`film_id`),
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES language (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES language (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `film_actor`
--

CREATE TABLE `film_actor` (
  `actor_id` SMALLINT UNSIGNED NOT NULL,
  `film_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY  (`actor_id`,`film_id`),
  CONSTRAINT `fk_film_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_actor_film` FOREIGN KEY (film_id) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `film_category`
--

CREATE TABLE `film_category` (
  `film_id` SMALLINT UNSIGNED NOT NULL,
  `category_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`film_id`, `category_id`),
  CONSTRAINT `fk_film_category_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_film_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `series_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint UNSIGNED NOT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` enum('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  CONSTRAINT `fk_series_language` FOREIGN KEY (`language_id`) REFERENCES `language`(`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (	
  `inventory_id` MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` SMALLINT UNSIGNED,
  `series_id` SMALLINT UNSIGNED,
  PRIMARY KEY  (`inventory_id`),
  CONSTRAINT `fk_inventory_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_inventory_series` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

CREATE TABLE `rental` (
  `rental_id` INT NOT NULL AUTO_INCREMENT,
  `rental_date` DATETIME NOT NULL,
  `inventory_id` MEDIUMINT UNSIGNED NOT NULL,
  `user_id` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY  (`rental_date`,`inventory_id`,`user_id`),
  CONSTRAINT `fk_rental_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rental_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` SMALLINT UNSIGNED NOT NULL,
  `rental_id` INT DEFAULT NULL,
  `amount` DECIMAL(5,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  PRIMARY KEY  (`payment_id`),
  CONSTRAINT `fk_payment_rental` FOREIGN KEY (`rental_id`) REFERENCES `rental` (`rental_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

CREATE TABLE IF NOT EXISTS `season` (
  `series_id` smallint(5) UNSIGNED NOT NULL,
  `season_id` smallint(5) UNSIGNED NOT NULL,
  `season_name` varchar(20) not null,
  PRIMARY KEY (`season_id`),
  CONSTRAINT `fk_season_series` FOREIGN KEY (`series_id`) REFERENCES `series`(`series_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `episode`
--

CREATE TABLE IF NOT EXISTS `episode` (
  `season_id` smallint(5) UNSIGNED NOT NULL,
  `episode_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_date` datetime DEFAULT NULL,
  `length` smallint(5) UNSIGNED DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `episode_name` VARCHAR(20) not null,
  PRIMARY KEY (`episode_id`),
  CONSTRAINT `fk_episode_season` FOREIGN KEY (`season_id`) REFERENCES `season`(`season_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `episode_actor`
--

CREATE TABLE IF NOT EXISTS `episode_actor` (
  `episode_id` smallint(5) UNSIGNED NOT NULL,
  `actor_id` smallint(5) UNSIGNED NOT NULL,
  CONSTRAINT `episode_actor_id` PRIMARY KEY (`episode_id`,`actor_id`),
  CONSTRAINT `fk_episode_actor_actor` FOREIGN KEY (`actor_id`) REFERENCES `actor`(`actor_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_episode_actor_episode` FOREIGN KEY (`episode_id`) REFERENCES `episode`(`episode_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `series_category`
--

CREATE TABLE IF NOT EXISTS `series_category` (
  `series_id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`series_id`,`category_id`),
  CONSTRAINT `fk_series_category_series` FOREIGN KEY (`series_id`) REFERENCES `series`(`series_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_series_category_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `modification_date` datetime NOT NULL,
  `user_spec` enum('admin','employee','customer') CHARACTER SET utf8 DEFAULT 'customer',
  `action` enum('insert','update','delete') CHARACTER SET utf8 NOT NULL,
  `forTable` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;