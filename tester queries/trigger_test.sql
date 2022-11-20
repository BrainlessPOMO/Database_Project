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
-- Έλεγχος trigger για το table user
-- ------------------------------------
update `user` set `user_id` = 1 where `user_id` = 6; 						-- ------------------------------------------------------
update `user` set `first_name` = 'Shannon' where `user_id` = 6;				-- Se ola auta ta update den prepei
update `user` set `last_name` = 'Haynes' where `user_id` = 6;				-- na mas afhnei na kanoume allages
update `user` set `create_date` = CURRENT_TIMESTAMP() where `user_id` = 6;	-- ------------------------------------------------------

insert into `user` (`user_id`, `first_name`, `last_name`, `email`, `address_id`, `active`, `create_date`, `role`, `type_of_reg`)
VALUES (7, 'Charla', 'McCartney', 'dejah.fries@yahoo.com', 6, 1, DATE(NOW()), 'customer', 'both');

update `user` set `email` = 'dejah.fries@gmail.com' where `user_id` = 7;
delete from `user` where `user_id` = 7;

-- ------------------------------------
-- Έλεγχος trigger για το table rental
-- ------------------------------------
insert into `rental` (`rental_id`, `inventory_id`, `rental_date`, `user_id`) VALUES (15, 1, CURRENT_TIMESTAMP(), 4);	-- elegxos gia thn ekptwsh
insert into `rental` (`rental_id`, `inventory_id`, `rental_date`, `user_id`) VALUES (16, 1, CURRENT_TIMESTAMP(), 4);	-- se kathe insert sto table rental
insert into `rental` (`rental_id`, `inventory_id`, `rental_date`, `user_id`) VALUES (17, 1, CURRENT_TIMESTAMP(), 4);	-- ginetai kai insert sto log
insert into `rental` (`rental_id`, `inventory_id`, `rental_date`, `user_id`) VALUES (18, 1, CURRENT_TIMESTAMP(), 4);	-- kai sto teleutaio prepei na diairethei to payment / 2

update `rental` set `inventory_id` = 3 where `rental_id` = 7;
delete from `rental` where `rental_id` = 7;
