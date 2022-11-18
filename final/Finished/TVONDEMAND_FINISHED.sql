-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2022 at 09:51 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
--
-- Database: `tvondemand`
--
DROP SCHEMA IF EXISTS tvondemand2;
CREATE SCHEMA tvondemand2;
USE tvondemand2;


-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `actor_index_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `district` varchar(20) DEFAULT NULL,
  `city_id` smallint(5) UNSIGNED NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `episode_id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_date` datetime DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  PRIMARY KEY (`episode_id`),
  KEY `fk_episode_season` (`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `episode_actor`
--

DROP TABLE IF EXISTS `episode_actor`;
CREATE TABLE IF NOT EXISTS `episode_actor` (
  `episode_id` smallint(5) UNSIGNED NOT NULL,
  `actor_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`episode_id`,`actor_id`),
  KEY `fk_episode_actor_actor` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` smallint(5) UNSIGNED DEFAULT NULL,
  `series_id` smallint(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_inventory_movie` (`movie_id`),
  KEY `fk_inventory_series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4421 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `modification_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_spec` enum('admin','employee','customer') CHARACTER SET utf8 DEFAULT 'customer',
  `action` enum('insert','update','delete') CHARACTER SET utf8 NOT NULL,
  `forTable` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_log_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) UNSIGNED NOT NULL,
  `original_language_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `length` smallint(5) UNSIGNED DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `fk_movie_language` (`language_id`),
  KEY `fk_movie_language_original` (`original_language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE IF NOT EXISTS `movie_actor` (
  `actor_id` smallint(5) UNSIGNED NOT NULL,
  `movie_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`),
  KEY `fk_movie_actor_movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `movie_category`
--

DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE IF NOT EXISTS `movie_category` (
  `movie_id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`,`category_id`),
  KEY `fk_movie_category_category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_rental` (`rental_id`),
  KEY `fk_payment_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15981 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

DROP TABLE IF EXISTS `price_list`;
CREATE TABLE IF NOT EXISTS `price_list` (
  `price_list_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `movie_prices` decimal(5,2) DEFAULT NULL,
  `episode_prices` decimal(5,2) DEFAULT NULL,
  `Both_prices` decimal(5,2) DEFAULT NULL,
  `movie_id` smallint(5) UNSIGNED NOT NULL,
  `episode_id` smallint(5) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`price_list_id`),
  KEY `fk_price_list_movie` (`movie_id`),
  KEY `fk_price_list_user` (`user_id`),
  KEY `fk_price_list_series` (`episode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16041 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
CREATE TABLE IF NOT EXISTS `rental` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inventory_id` mediumint(8) UNSIGNED NOT NULL,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date` (`rental_date`,`inventory_id`,`user_id`),
  KEY `fk_rental_inventory` (`inventory_id`),
  KEY `fk_rental_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16041 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
CREATE TABLE IF NOT EXISTS `season` (
  `series_id` smallint(5) UNSIGNED DEFAULT NULL,
  `season_id` smallint(5) UNSIGNED NOT NULL,
  `season_name` varchar(20) NOT NULL,
  PRIMARY KEY (`season_id`),
  KEY `fk_season_series` (`series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `series_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) UNSIGNED NOT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` enum('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `original_language_id` tinyint(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `fk_series_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `series_category`
--

DROP TABLE IF EXISTS `series_category`;
CREATE TABLE IF NOT EXISTS `series_category` (
  `series_id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`series_id`,`category_id`),
  KEY `fk_series_category_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` smallint(5) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `role` set('customer','admin','employee') DEFAULT 'customer',
  `type_of_reg` enum('series','movies','both') DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_customer_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
