CREATE TABLE users(
	user_id integer IDENTITY(1,1),
	user_name varchar(128) NOT NULL,
	user_pass varchar(128) NOT NULL,
	user_employee varchar(128) DEFAULT(guest) NOT NULL,
	user_gender varchar(12) NOT NULL,
	user_date_of_birth date NOT NULL,
	user_avatar text,
	PRIMARY KEY (user_id),
);
