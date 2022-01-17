use table tvondemand;
--
-- Table structure for table `series`
-- 1 series could have many seasons
--
create table series(
	series_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL,
    description TEXT DEFAULT NULL,
    language_id TINYINT UNSIGNED NOT NULL,
    original_language_id TINYINT UNSIGNED DEFAULT NULL,
    rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
    special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `season`
-- 1 season could have many episodes
--
create table season(
	series_id smallint unsigned not null,
    season_id smallint unsigned not null,
    episodes_num int not null,
    release_year year default null,
    primary key(season_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `series_actor`
--
create table series_actor(
	series_id smallint unsigned not null,
    actor_id smallint unsigned not null,
    primary key(series_id, actor_id),
    CONSTRAINT fk_series_actor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_series_actor_series FOREIGN KEY (series_id) REFERENCES series (series_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Table structure for table `episode`
-- 
create table episode(
	season_id smallint unsigned not null,
    episode_id smallint unsigned not null,
    title VARCHAR(128) NOT NULL,
    description TEXT DEFAULT NULL,
    release_year YEAR DEFAULT NULL,
    length SMALLINT UNSIGNED DEFAULT NULL,
    primary key(episode_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;