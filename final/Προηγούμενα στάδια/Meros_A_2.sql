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
    special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
    primary key (series_id),
    CONSTRAINT fk_series_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_series_language_language FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `season`
-- 1 season could have many episodes
--
create table season(
	series_id smallint unsigned not null,
    season_id smallint unsigned not null,
    episodes_num tinyint not null,
    release_year year default null,
    primary key(season_id),
    CONSTRAINT fk_season_series foreign key (series_id) references series (series_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 
-- Table structure for table `episode`
-- 
SET FOREIGN_KEY_CHECKS = 0;
drop table if exists episode;
create table episode(
	season_id smallint unsigned not null,
    episode_id smallint unsigned not null,
    title VARCHAR(128) NOT NULL,
    description TEXT DEFAULT NULL,
    release_date datetime DEFAULT NULL,
    length SMALLINT UNSIGNED DEFAULT NULL,
    primary key(episode_id),
    constraint fk_episode_season foreign key(season_id) references season(season_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `episode_actor`
--
SET FOREIGN_KEY_CHECKS = 0;
drop table if exists episode_actor;
create table episode_actor(
	episode_id smallint unsigned not null,
    actor_id smallint unsigned not null,
    primary key(episode_id, actor_id),
    CONSTRAINT fk_episode_actor_episode FOREIGN KEY (episode_id) REFERENCES episode (episode_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_episode_actor_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



alter table inventory
	add column series_id SMALLINT UNSIGNED after film_id,
    add constraint fk_inventory_series foreign key(series_id) references series(series_id) ON DELETE RESTRICT ON UPDATE CASCADE 
;

--
-- Table structure for table `series_category`
--
SET FOREIGN_KEY_CHECKS = 0;
drop table if exists series_category;
create table series_category(
	series_id smallint unsigned not null,
    category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    primary key(series_id, category_id),
    CONSTRAINT fk_series_category_series FOREIGN KEY (series_id) REFERENCES series (series_id) ON DELETE RESTRICT ON UPDATE CASCADE,
	CONSTRAINT fk_series_category_category FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;