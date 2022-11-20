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
DROP SCHEMA IF EXISTS tvondemand;
CREATE SCHEMA tvondemand;
USE tvondemand;

--
-- Table structure for table `country`
--
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int  NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `city`
--
DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int  NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_id` int  NOT NULL,
  PRIMARY KEY (`city_id`),
  FOREIGN KEY (`city_id`) REFERENCES `country`(`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=590 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `address`
--
DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int  NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `district` varchar(20) DEFAULT NULL,
  `city_id` int  NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=603 DEFAULT CHARSET=utf8mb4;


--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int  NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address_id` int  NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `role` set('customer','admin','employee') DEFAULT 'customer',
  `type_of_reg` enum('series','movies','both') DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_customer_address` (`address_id`),
  FOREIGN KEY (`address_id`) REFERENCES `address`(`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int  NOT NULL AUTO_INCREMENT,
  `user_id` int,
  `modification_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_spec` enum('admin','employee','customer') CHARACTER SET utf8 DEFAULT 'customer',
  `action` enum('insert','update','delete') CHARACTER SET utf8 NOT NULL,
  `forTable` varchar(25) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int  NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int  NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `series`
--
DROP TABLE IF EXISTS `series`;
CREATE TABLE IF NOT EXISTS `series` (
  `series_id` int  NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` int  NOT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` enum('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `original_language_id` int  DEFAULT NULL,
  `season_id` int,
  PRIMARY KEY (`series_id`),
  FOREIGN KEY (`language_id`) REFERENCES `language`(`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
CREATE TABLE IF NOT EXISTS `season` (
  `series_id` int  DEFAULT NULL,
  `season_id` int  NOT NULL,
  `season_name` varchar(20) NOT NULL,
  PRIMARY KEY (`season_id`),
  FOREIGN KEY (`series_id`) REFERENCES `series`(`series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `episode_id` int  NOT NULL AUTO_INCREMENT,
  `season_id` int  NOT NULL,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_date` datetime DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  PRIMARY KEY (`episode_id`),
  FOREIGN KEY (`season_id`) REFERENCES `season`(`season_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `series_category`
--

DROP TABLE IF EXISTS `series_category`;
CREATE TABLE IF NOT EXISTS `series_category` (
  `series_id` int  NOT NULL,
  `category_id` int  NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`series_id`,`category_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`),
  FOREIGN KEY (`series_id`) REFERENCES `series`(`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie`
--
DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` int  NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` int  NOT NULL,
  `length` int  DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  FOREIGN KEY (`language_id`) REFERENCES `language`(`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=975 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `actor`
--
DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` int  NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10026 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie_actor`
--
DROP TABLE IF EXISTS `movie_actor`;
CREATE TABLE IF NOT EXISTS `movie_actor` (
  `actor_id` int  NOT NULL,
  `movie_id` int  NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`),
  FOREIGN KEY (`movie_id`) REFERENCES `movie`(`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `movie_category`
--
DROP TABLE IF EXISTS `movie_category`;
CREATE TABLE IF NOT EXISTS `movie_category` (
  `movie_id` int  NOT NULL,
  `category_id` int  NOT NULL,
  PRIMARY KEY (`movie_id`,`category_id`),
  FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `inventory`
--
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` int  NOT NULL AUTO_INCREMENT,
  `movie_id` int  DEFAULT NULL,
  `series_id` int  DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  FOREIGN KEY (`movie_id`) REFERENCES `movie`(`movie_id`),
  FOREIGN KEY (`series_id`) REFERENCES `series`(`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4421 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `episode_actor`
--
DROP TABLE IF EXISTS `episode_actor`;
CREATE TABLE IF NOT EXISTS `episode_actor` (
  `episode_id` int  NOT NULL,
  `actor_id` int  NOT NULL,
  PRIMARY KEY (`episode_id`,`actor_id`),
  FOREIGN KEY (`actor_id`) REFERENCES `actor`(`actor_id`),
  FOREIGN KEY (`episode_id`) REFERENCES `episode`(`episode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `rental`
--
DROP TABLE IF EXISTS `rental`;
CREATE TABLE IF NOT EXISTS `rental` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `rental_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inventory_id` int  NOT NULL,
  `user_id` int  NOT NULL,
  PRIMARY KEY (`rental_id`),
  UNIQUE KEY `rental_date` (`rental_date`,`inventory_id`,`user_id`),
  FOREIGN KEY (`inventory_id`) REFERENCES `inventory`(`inventory_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16041 DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `payment`
--
DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payment_id` int  NOT NULL AUTO_INCREMENT,
  `user_id` int  NOT NULL,
  `rental_id` int(11) DEFAULT NULL,
  `amount` decimal(5,2) NOT NULL,
  `payment_date` datetime NOT NULL,
  PRIMARY KEY (`payment_id`),
  FOREIGN KEY (`rental_id`) REFERENCES `rental`(`rental_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15981 DEFAULT CHARSET=utf8mb4;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;