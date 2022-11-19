SHOW TRIGGERS;

-- ------------------------------------
-- Έλεγχος trigger για το table inventory
-- ------------------------------------
insert into `inventory` (`inventory_id`, `movie_id`, `series_id`) VALUES (8, 5, 5);
update `inventory` set `series_id` = 4 where `inventory_id` = 8;
delete from `inventory` where `inventory_id` = 8;

-- ------------------------------------
-- Έλεγχος trigger για το table payment
-- ------------------------------------
insert into `payment` (`payment_id`, `user_id`, `rental_id`, `amount`, `payment_date`) VALUES (16, 1, 3, '5.99', '2020-07-29 07:45:00');
update `payment` set `amount` = 6.99 where `payment_id` = 16;
delete from `payment` where payment_id = 16;

-- ------------------------------------
-- Έλεγχος trigger για το table rental
-- ------------------------------------
insert into `rental` (`rental_id`, `rental_date`, `inventory_id`, `user_id`) VALUES (7, '2021-10-20 00:25:23', 1, 4);
update `rental` set `inventory_id` = 3 where `rental_id` = 7;
delete from `rental` where `rental_id` = 7;

-- ------------------------------------
-- Έλεγχος trigger για το table user
-- ------------------------------------
update `user` set `user_id` = 1 where `user_id` = 6;
update `user` set `first_name` = 'Shannon' where `user_id` = 6;
update `user` set `last_name` = 'Haynes' where `user_id` = 6;
update `user` set `create_date` = CURRENT_TIMESTAMP() where `user_id` = 6;

insert into `user` (`user_id`, `first_name`, `last_name`, `email`, `address_id`, `active`, `create_date`, `role`, `type_of_reg`)
VALUES (7, 'Charla', 'McCartney', 'dejah.fries@yahoo.com', 6, 1, DATE(NOW()), 'customer', 'both');

update `user` set `email` = 'dejah.fries@gmail.com' where `user_id` = 7;
delete from `user` where `user_id` = 7;