/*I am using MS SQL to create this query*/

/*
	Query for cleaning database:
	DROP TABLE [WorkingDay], [Employee], [Post];
*/

CREATE TABLE [Post] (
	ID INT NOT NULL IDENTITY (1, 1),
	PostName NVARCHAR(50) NOT NULL UNIQUE,
	PRIMARY KEY(ID)
);

CREATE TABLE [Employee] (
	ID INT NOT NULL IDENTITY (1, 1),
	PostID INT NOT NULL,
	Firstname NVARCHAR(50) NOT NULL,
	Surname NVARCHAR(50) NOT NULL,
	Patronymic NVARCHAR(50) NULL,
	Gender CHAR(10) NOT NULL,
	DateOfBirth DATE NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY (PostID) REFERENCES [Post](ID)
);

CREATE TABLE [WorkingDay](
	ID INT NOT NULL IDENTITY (1, 1),
	EmployeeID INT NOT NULL,
	ThisDay DATE NOT NULL,
	FirstVisit TIME NOT NULL,
	LeftForLunch TIME NOT NULL,
	ReturnedFromLunch TIME NOT NULL,
	LastLeaving TIME NOT NULL,
	PRIMARY KEY(ID),
	FOREIGN KEY (EmployeeID) REFERENCES [Employee](ID)
);
