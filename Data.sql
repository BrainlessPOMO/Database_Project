USE tvondemand2;
SET FOREIGN_KEY_CHECKS=0;

--
-- Dumping data for table `country`
--
INSERT INTO `country` (`country_id`, `country`) VALUES
(1, 'France'),
(2, 'Germany'),
(3, 'Greece');
 
select * from `country`;

--
-- Dumping data for table `city`
--
INSERT INTO `city` (`city_id`, `city`, `country_id`) VALUES
(1, 'Lyon', 1),
(2, 'Nice', 1),
(3, 'Paris', 1),
(4, 'Aalen', 2),
(5, 'Amberg', 2),
(6, 'Bad Mergentheim', 2),
(7, 'Thessaloniki', 3),
(8, 'Chania', 3),
(9, 'Athens', 3);

select * from `city`;
--
-- Dumping data for table `address`
--
INSERT INTO `address` (`address_id`, `address`, `district`, `city_id`, `postal_code`, `phone`) VALUES
(1, '10 Rue de la Platière', 'Lyon', 1, '69001', '448477190408'),
(3, 'Gmünder Str. 2-16', 'Aalen', 4, '73430', '911872220378'),
(4, 'Eglseer Str. 35-25', 'Amberg', 5, '92224', '440512153169'),
(5, 'Eglseer Str. 35-25', 'Amberg', 5, '92224', '440512153169'),
(6, 'Aisopou 40-42', 'Thessaloniki', 3, '54627', '720998247660');

select * from `address`;
--
-- Dumping data for table `user`
--
INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `address_id`, `active`, `create_date`, `role`, `type_of_reg`) VALUES
(1, 'Shannon', 'Haynes', 'kirstin.jen@yahoo.com', 1, 1, '2011-08-20 01:25:08', 'customer,admin', 'both'),
(2, 'Carl', 'Kremer', 'amelia2002@yahoo.com', 2, 1, '2010-09-10 01:25:08', 'customer,admin', 'both'),
(3, 'LINDA', 'WILLIAMS', 'LINDA.WILLIAMS@gmail.org', 3, 1, '2015-02-02 22:04:36', 'employee', 'series'),
(4, 'SANDRA', 'MARTIN', 'SANDRA.MARTIN@sakilacustomer.org', 4, 0, '2006-02-14 22:04:36', 'customer', 'both'),
(5, 'ANNA', 'HILL', 'ANNA.HILL@gmail.org', 5, 1, '2006-02-14 22:04:36', 'customer', 'series'),
(6, 'VIRGINIA', 'GREEN', 'VIRGINIA.GREEN@yahoo.org', 6, 1, '2006-02-14 22:04:36', 'customer', 'movies');

select * from `user`;
--
-- Dumping data for table `log`
--
-- Table log does not need any data, It will be generated!

--
-- Dumping data for table `category`
--
INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Action'),
(2, 'Animation'),
(3, 'Children'),
(4, 'Classics'),
(5, 'Comedy'),
(6, 'Documentary'),
(7, 'Drama'),
(8, 'Family'),
(9, 'Foreign'),
(10, 'Games'),
(11, 'Horror'),
(12, 'Music'),
(13, 'New'),
(14, 'Sci-Fi'),
(15, 'Sports'),
(16, 'Travel');

select * from `category`;
--
-- Dumping data for table `language`
--
INSERT INTO `language` (`language_id`, `name`) VALUES
(1, 'English'),
(2, 'Italian'),
(3, 'French'),
(4, 'German');

select * from `language`;
--
-- Dumping data for table `series`
--
INSERT INTO `series` (`series_id`, `title`, `description`, `release_year`, `language_id`, `rating`, `special_features`, `original_language_id`) VALUES
(1, 'Planet Earth 2', 'David Attenborough returns with a new wildlife documentary that shows life in a variety of habitats', 5, 1, 'G', NULL, 1),
(2, 'Breaking Bad', "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family\'s future", 4, 1, 'R', NULL, 1),
(3, 'Band of Brothers', 'The story of Easy Company of the U.S. Army 101st Airborne Division and their mission in World War II Europe, from Operation Overlord to V-J Day', 3, 1, 'PG-13', NULL, 1),
(4, 'Chernobyl', "In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the world\'s worst man-made catastrophes", 2, 1, 'R', NULL, 1),
(5, 'The Wire', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', 2, 1, 'NC-17', NULL, 1);

select * from `series`;
--
-- Dumping data for table `season`
--
INSERT INTO `season` (`series_id`, `season_id`, `season_name`) VALUES
(1, 1, 'season1'),
(1, 2, 'season1'),
(2, 3, 'season2'),
(2, 4, 'season3'),
(2, 5, 'season4'),
(2, 6, 'season5'),
(3, 7, 'season1'),
(4, 8, 'season1'),
(5, 9, 'season1'),
(5, 10, 'season2'),
(5, 11, 'season3'),
(5, 12, 'season4'),
(5, 13, 'season5');

select * from `season`;
--
-- Dumping data for table `episode`
--

INSERT INTO `episode` (`episode_id`, `season_id`, `title`, `description`, `release_date`, `length`, `rating`) VALUES
(1, 1, 'episode1', 'A new wildlife documentary that shows life in a variety of habitats', '2016-11-06 00:00:00', '1hr20mins', 'G'),
(2, 1, 'episode2', 'A new wildlife documentary that shows life in a variety of habitats', '2016-11-06 00:00:00', '1hr20mins', 'G'),
(3, 1, 'episode3', 'A new wildlife documentary that shows life in a variety of habitats', '2016-11-06 00:00:00', '1hr20mins', 'G'),
(4, 1, 'episode4', 'A new wildlife documentary that shows life in a variety of habitats', '2016-11-06 00:00:00', '1hr20mins', 'G'),
(5, 2, 'episode1', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(6, 2, 'episode2', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(7, 2, 'episode3', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(8, 2, 'episode4', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(9, 2, 'episode5', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(10, 2, 'episode6', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2008-09-28 00:00:00', '45mins', 'R'),
(11, 3, 'episode1', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2009-12-19 00:00:00', '45mins', 'R'),
(12, 3, 'episode2', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2009-12-19 00:00:00', '45mins', 'R'),
(13, 3, 'episode3', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2009-12-19 00:00:00', '45mins', 'R'),
(14, 4, 'episode1', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2010-03-21 00:00:00', '45mins', 'R'),
(15, 4, 'episode2', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2010-03-21 00:00:00', '45mins', 'R'),
(16, 4, 'episode3', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2010-03-21 00:00:00', '45mins', 'R'),
(17, 4, 'episode4', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2010-03-21 00:00:00', '45mins', 'R'),
(18, 5, 'episode1', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2011-07-17 00:00:00', '45mins', 'R'),
(19, 5, 'episode2', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2011-07-17 00:00:00', '45mins', 'R'),
(20, 5, 'episode3', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2011-07-17 00:00:00', '45mins', 'R'),
(21, 6, 'episode1', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2012-11-01 00:00:00', '45mins', 'R'),
(22, 6, 'episode2', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2012-11-01 00:00:00', '45mins', 'R'),
(23, 6, 'episode3', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2012-11-01 00:00:00', '45mins', 'R'),
(24, 6, 'episode4', 'A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his familys future', '2012-11-01 00:00:00', '45mins', 'R'),
(25, 7, 'episode1', 'The story of Easy Company of the U.S. Army 101st Airborne Division', '2001-10-05 00:00:00', '50mins', 'PG-13'),
(26, 7, 'episode2', 'The story of Easy Company of the U.S. Army 101st Airborne Division', '2001-10-05 00:00:00', '50mins', 'PG-13'),
(27, 7, 'episode3', 'The story of Easy Company of the U.S. Army 101st Airborne Division', '2001-10-05 00:00:00', '50mins', 'PG-13'),
(28, 7, 'episode4', 'The story of Easy Company of the U.S. Army 101st Airborne Division', '2001-10-05 00:00:00', '50mins', 'PG-13'),
(29, 7, 'episode5', 'The story of Easy Company of the U.S. Army 101st Airborne Division', '2001-10-05 00:00:00', '50mins', 'PG-13'),
(30, 8, 'episode1', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(31, 8, 'episode2', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(32, 8, 'episode3', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(33, 8, 'episode4', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(34, 8, 'episode5', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(35, 8, 'episode6', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(36, 8, 'episode7', 'In April 1986, an explosion at the Chernobyl nuclear power plant in the Union of Soviet Socialist Republics becomes one of the worlds worst man-made catastrophes', '2019-05-07 00:00:00', '50mins', 'R'),
(37, 9, 'episode1', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2002-01-12 00:00:00', '1hr', 'NC-17'),
(38, 9, 'episode2', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2002-01-12 00:00:00', '1hr', 'NC-17'),
(39, 9, 'episode3', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2002-01-12 00:00:00', '1hr', 'NC-17'),
(40, 10, 'episode1', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2003-01-01 00:00:00', '1hr', 'NC-17'),
(41, 10, 'episode2', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2003-01-01 00:00:00', '1hr', 'NC-17'),
(42, 10, 'episode3', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2003-01-01 00:00:00', '1hr', 'NC-17'),
(43, 11, 'episode1', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2004-09-19 00:00:00', '1hr', 'NC-17'),
(44, 11, 'episode2', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2004-09-19 00:00:00', '1hr', 'NC-17'),
(45, 11, 'episode3', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2004-09-19 00:00:00', '1hr', 'NC-17'),
(46, 12, 'episode1', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2006-09-10 00:00:00', '1hr', 'NC-17'),
(47, 12, 'episode2', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2006-09-10 00:00:00', '1hr', 'NC-17'),
(48, 12, 'episode3', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2006-09-10 00:00:00', '1hr', 'NC-17'),
(49, 13, 'episode1', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2008-01-06 00:00:00', '1hr', 'NC-17'),
(50, 13, 'episode2', 'The Baltimore drug scene, as seen through the eyes of drug dealers and law enforcement', '2008-01-06 00:00:00', '1hr', 'NC-17');

select * from `episode`;
--
-- Dumping data for table `series_category`
--
INSERT INTO `series_category` (`series_id`, `category_id`) VALUES
(1, 6),
(1, 8),
(2, 1),
(2, 2),
(3, 2),
(4, 1),
(4, 7),
(5, 1);

select * from `series_category`;

--
-- Dumping data for table `movie`
--
INSERT INTO `movie` (`movie_id`, `title`, `description`, `release_year`, `language_id`, `length`, `rating`, `special_features`) VALUES
(1, 'ACADEMY DINOSAUR', 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies', 2006, 1, 86, 'PG', 'Deleted Scenes,Behind the Scenes'),
(2, 'AMADEUS HOLY', 'A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon', 2006, 1, 113, 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes'),
(3, 'ANACONDA CONFESSIONS', 'A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia', 2006, 1, 92, 'R', 'Trailers,Deleted Scenes'),
(4, 'ANGELS LIFE', 'A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin', 2006, 1, 74, 'G', 'Trailers'),
(5, 'ANTITRUST TOMATOES', 'A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India', 2006, 3, 168, 'NC-17', 'Trailers,Commentaries,Deleted Scenes');

select * from `movie`;
--
-- Dumping data for table `actor`
--
INSERT INTO `actor` (`actor_id`, `first_name`, `last_name`) VALUES
(1, 'PENELOPE', 'GUINESS'),
(2, 'NICK', 'WAHLBERG'),
(3, 'ED', 'CHASE'),
(4, 'JENNIFER', 'DAVIS'),
(5, 'JOHNNY', 'LOLLOBRIGIDA');

select * from `actor`;
--
-- Dumping data for table `movie_actor`
--
INSERT INTO `movie_actor` (`actor_id`, `movie_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 5),
(2, 3),
(3, 1),
(4, 3),
(4, 4),
(5, 5),
(5, 3),
(5, 1),
(5, 2);

select * from `movie_actor`;
--
-- Dumping data for table `movie_category`
--
INSERT INTO `movie_category` (`movie_id`, `category_id`) VALUES
(1, 1),
(1, 13),
(1, 11),
(2, 7),
(2, 5),
(3, 14),
(4, 9),
(4, 10),
(5, 9),
(5, 7),
(5, 3);

select * from `movie_category`;
-- ----------------------------------------------------------------
-- INVENTORY
-- ----------------------------------------------------------------

INSERT INTO `inventory`(`inventory_id`, `movie_id`, `series_id`) VALUES
(1, 5, 5),
(2, 3, NULL),
(3, 2, 4),
(4, NULL, 4),
(5, NULL, 3),
(6, 2, NULL);

--
-- Dumping data for table `episode_actor`
--
INSERT INTO `episode_actor` (`episode_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(3, 5),
(4, 2),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 2),
(10, 5),
(11, 4),
(12, 1),
(13, 5),
(14, 2),
(15, 1),
(16, 3),
(17, 3),
(18, 2),
(19, 3),
(20, 2),
(21, 1);

select * from `episode_actor`;
--
-- Dumping data for table `rental`
--
INSERT INTO `rental` (`rental_id`, `rental_date`, `inventory_id`, `user_id`) VALUES
(1, '2021-05-26 00:25:23', 1, 4),
(2, '2021-05-26 08:44:08', 2, 2),
(3, '2021-05-27 15:34:01', 3, 1),
(4, '2021-05-28 02:09:19', 4, 5),
(5, '2021-05-29 10:28:45', 5, 6),
(6, '2021-05-29 13:08:06', 6, 3);

select * from `rental`;
-- -----------------------------------------------------------------------------------
-- `PRICE_LIST`
-- -----------------------------------------------------------------------------------

-- INSERT INTO `price_list` (`price_list_id`, `movie_prices`, `episode_prices`, `Both_prices`, `movie_id`, `episode_id`, `user_id`) VALUES


--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `user_id`, `rental_id`, `amount`, `payment_date`) VALUES
(1, 1, 3, '5.99', '2005-07-29 07:45:00'),
(2, 2, 2, '5.99', '2005-07-07 06:01:48'),
(3, 3, 6, '7.99', '2005-08-20 18:11:44'),
(4, 1, 3, '0.99', '2005-08-21 18:29:13'),
(5, 1, 3, '6.99', '2005-05-27 15:34:01'),
(6, 3, 6, '0.99', '2005-05-30 05:36:21'),
(7, 4, 1, '2.99', '2005-06-19 23:47:24'),
(8, 2, 2, '4.99', '2005-07-28 00:56:47'),
(9, 5, 4, '4.99', '2005-07-29 16:17:49'),
(10, 3, 6, '4.99', '2005-07-30 06:03:11'),
(11, 1, 3, '4.99', '2006-02-14 15:16:03'),
(12, 5, 4, '3.99', '2005-06-15 08:41:38'),
(13, 1, 3, '2.99', '2005-08-17 07:12:31'),
(14, 6, 5, '0.99', '2005-08-22 15:52:57'),
(15, 2, 2, '2.99', '2005-05-30 07:14:53');

select * from `payment`;