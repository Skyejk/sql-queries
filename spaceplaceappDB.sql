/* use postgreSQL */

CREATE TABLE Gender(
	GenderId SERIAL NOT NULL,
	GenderName VARCHAR(12) DEFAULT('Male') NOT NULL,
	PRIMARY KEY (GenderId)
);

INSERT INTO Gender VALUES ('Male');
INSERT INTO Gender VALUES ('Famale');

CREATE TABLE Human(
	HumanId SERIAL NOT NULL,
	GenderId INTEGER DEFAULT(1) NOT NULL,
	HumanLastName VARCHAR(128) NOT NULL,
	HumanFirstName VARCHAR(128) NOT NULL,
	HumanPatronymic VARCHAR(128) NULL,
	HumanDateOfBirth DATE DEFAULT CURRENT_DATE NOT NULL,
	PRIMARY KEY (HumanId),
	FOREIGN KEY (GenderId) REFERENCES Gender (GenderId)
);

CREATE TABLE Employee(
	EmployeeId SERIAL NOT NULL,
	EmployeeName VARCHAR(48) DEFAULT('Guest') NOT NULL,
	PRIMARY KEY (EmployeeId)
);

INSERT INTO Employee VALUES ('Guest');

CREATE TABLE Users(
	UserId SERIAL NOT NULL,
	HumanId INTEGER NOT NULL,
	EmployeeId INTEGER DEFAULT(1) NOT NULL,
	UserName varchar(128) NOT NULL,
	UserPass varchar(128) NOT NULL,
	UserMail varchar(256) NULL,
	UserImage text DEFAULT('guest.png') NULL,
	PRIMARY KEY (user_id),
	FOREIGN KEY (HumanId) REFERENCES Human (HumanId),
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
);
