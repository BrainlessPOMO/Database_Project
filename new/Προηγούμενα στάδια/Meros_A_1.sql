--
-- Table structure for table `employee`
--
-- theorw oti oi employees den mporoun na noikiasoun kapoia tainia h seira
-- alla mporoun na perastoun ws customers gia na exoun kai auth thn dynatothta
-- 
drop table if exists employee;
create table employee (
	employee_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50) DEFAULT NULL,
    address_id SMALLINT UNSIGNED NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    create_date DATETIME NOT NULL,
    primary key (employee_id),
    CONSTRAINT fk_employee_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `admins`
--
-- theorw oti oi employees den mporoun na noikiasoun kapoia tainia h seira
-- alla mporoun na perastoun ws customers gia na exoun kai auth thn dynatothta
--
drop table if exists admin;
create table admin (
	admin_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(50) DEFAULT NULL,
    address_id SMALLINT UNSIGNED NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    create_date DATETIME NOT NULL,
    primary key (admin_id),
    CONSTRAINT fk_admin_address FOREIGN KEY (address_id) REFERENCES address (address_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- hasMovies & hasSeries represents customers ability to watch movies or series
-- if hasMovies is true they can watch movies
-- if hasSeries is true they can watch series
alter table customer
	add column hasMovies boolean default false after create_date,
    add column hasSeries boolean default false after hasMovies
;

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` smallint(11) NOT NULL AUTO_INCREMENT,
  `movie_prices` ENUM ('0.4 per_movie') ,
  `series_prices` ENUM ('0.2 per_series') ,
  `Both_prices` ENUM ('0.3 per_movie and 0.1 per series'),
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `series_id` SMALLINT UNSIGNED NOT NULL,
  `user_id`SMALLINT UNSIGNED NOT NULL
  PRIMARY KEY (`menu_id`),
  KEY `fk_menu_movie` (`movie_id`),
  KEY `fk_menu_user` (`user_id`),
  KEY `fk_menu_series` (`series_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16041 DEFAULT CHARSET=utf8mb4;
