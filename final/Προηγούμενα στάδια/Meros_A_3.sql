 -- sto user_spec apo8ikeuetai to eidos tou user pou ekane thn allagh, an xreiastei na to psaxoun pio meta


create table log(
	log_id smallint unsigned not null auto_increment,
    user_id smallint unsigned unique not null,
    modification_date datetime not null,
    user_spec enum('admin','employee','customer') default 'customer',
    action enum('insert','update','delete') not null,
    forBoard varchar(20),
    primary key(log_id),
    constraint fk_log_customer foreign key (user_id) references customer(customer_id)ON DELETE RESTRICT ON UPDATE CASCADE,
	constraint fk_log_admin foreign key (user_id) references admin(admin_id)ON DELETE RESTRICT ON UPDATE CASCADE,
    constraint fk_log_employee foreign key (user_id) references employee(employee_id)ON DELETE RESTRICT ON UPDATE CASCADE
);
