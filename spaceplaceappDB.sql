/* use postgreSQL */

CREATE TABLE Users(
	user_id SERIAL,
	user_name varchar(128) NOT NULL,
	user_pass varchar(128) NOT NULL,
	user_employee varchar(128) DEFAULT('guest') NOT NULL,
	user_gender varchar(12) NOT NULL,
	user_date_of_birth date NOT NULL,
	user_avatar text DEFAULT('guest.png'),
	PRIMARY KEY (user_id)
);
