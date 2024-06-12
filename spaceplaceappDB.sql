/* use postgreSQL */

CREATE TABLE Gender(
	GenderId SERIAL NOT NULL,
	GenderName VARCHAR(12) DEFAULT('Male') NOT NULL,
	PRIMARY KEY (GenderId)
);

INSERT INTO Gender (GenderName) VALUES ('Male');
INSERT INTO Gender (GenderName) VALUES ('Famale');

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

INSERT INTO Employee (EmployeeName) VALUES ('Guest');

CREATE TABLE Users(
	UserId SERIAL NOT NULL,
	HumanId INTEGER NOT NULL,
	EmployeeId INTEGER DEFAULT(1) NOT NULL,
	UserName VARCHAR(128) NOT NULL,
	UserPass VARCHAR(128) NOT NULL,
	UserMail VARCHAR(256) NULL,
	UserImage TEXT DEFAULT('guest.png') NULL,
	PRIMARY KEY (UserId),
	FOREIGN KEY (HumanId) REFERENCES Human (HumanId),
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId)
);



CREATE TABLE Decorating(
	DecoratingId SERIAL NOT NULL,
	DecoratingName VARCHAR(128) NOT NULL,
	DecoratingImage TEXT DEFAULT('DecoratingPlug.png') NOT NULL, 
	DecoratingDescription TEXT NULL,
	PRIMARY KEY (DecoratingId)
);

CREATE TABLE Tableware(
	TablewareId SERIAL NOT NULL,
	TablewareName VARCHAR(128) NOT NULL,
	TablewareImage TEXT DEFAULT('TablewarePlug.png') NOT NULL, 
	TablewareDescription TEXT NULL,
	PRIMARY KEY (TablewareId)
);


CREATE TABLE Food(
	FoodId SERIAL NOT NULL,
	TablewareId INTEGER DEFAULT(1) NOT NULL,
	DecoratingId INTEGER DEFAULT(1) NOT NULL,
	FoodName VARCHAR(128) NOT NULL,
	FoodImage TEXT DEFAULT('TablewarePlug.png') NOT NULL, 
	FoodDescription TEXT NULL,
	FoodQuantity SMALLINT NULL,
	FoodSize SMALLINT NULL,
	PRIMARY KEY (FoodId),
	FOREIGN KEY (TablewareId) REFERENCES Tableware (TablewareId),
	FOREIGN KEY (DecoratingId) REFERENCES Decorating (DecoratingId)
);


CREATE TABLE Ingredient(
	IngredientId SERIAL NOT NULL,
	IngredientName VARCHAR(128) NOT NULL,
	IngredientImage TEXT DEFAULT('IngredientPlug.png') NOT NULL, 
	IngredientDescription TEXT NULL,
	PRIMARY KEY (IngredientId)
);


CREATE TABLE IngredientsFoods(
	IngredientId INTEGER NOT NULL,
	FoodId INTEGER NOT NULL,
	PRIMARY KEY (IngredientId, FoodId),
	FOREIGN KEY (IngredientId) REFERENCES Ingredient (IngredientId),
	FOREIGN KEY (FoodId) REFERENCES Food (FoodId)
);

/*
DROP TABLE Users CASCADE;
DROP TABLE Human CASCADE;
DROP TABLE Employee;
DROP TABLE Gender;
DROP TABLE IngredientsFoods CASCADE;
DROP TABLE Food CASCADE;
DROP TABLE Decorating;
DROP TABLE Tableware;
DROP TABLE Ingredient;
*/

