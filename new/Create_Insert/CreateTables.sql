--Δημιουργία πίνακα 'user'

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
); ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4;


--Δημιουργία πίνακα 'series'

ROP TABLE IF EXISTS `series`;
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
);

--Δημιουργία πίνακα 'episode'

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
);

--Δημιουργία πίνακα 'season'

DROP TABLE IF EXISTS `season`;
CREATE TABLE IF NOT EXISTS `season` (
  `series_id` smallint(5) UNSIGNED DEFAULT NULL,
  `season_id` smallint(5) UNSIGNED NOT NULL,
  `season_name` varchar(20) NOT NULL,
  PRIMARY KEY (`season_id`),
  KEY `fk_season_series` (`series_id`)
);

--Δημιουργία πίνακα 'episode_actor'

DROP TABLE IF EXISTS `episode_actor`;
CREATE TABLE IF NOT EXISTS `episode_actor` (
  `episode_id` smallint(5) UNSIGNED NOT NULL,
  `actor_id` smallint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`episode_id`,`actor_id`),
  KEY `fk_episode_actor_actor` (`actor_id`)
);

--Τροποποίηση του πίνακα 'series_category'

DROP TABLE IF EXISTS `series_category`;
CREATE TABLE IF NOT EXISTS `series_category` (
  `series_id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`series_id`,`category_id`),
  KEY `fk_series_category_category` (`category_id`)
);

--Δημιουργία πίνακα 'log'

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` smallint(5) UNSIGNED NOT NULL,
  `modification_date` datetime NOT NULL,
  `user_spec` enum('admin','employee','customer') CHARACTER SET utf8 DEFAULT 'customer',
  `action` enum('insert','update','delete') CHARACTER SET utf8 NOT NULL,
  `forTable` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_log_user` (`user_id`)
);

--Τροποποίηση του πίνακα 'inventory'

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `inventory_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` smallint(5) UNSIGNED DEFAULT NULL,
  `series_id` smallint(5) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_inventory_movie` (`movie_id`),
  KEY `fk_inventory_series` (`series_id`)
);

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
