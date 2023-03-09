/*I am using MS SQL to create this query*/

/*
	Query for cleaning database:

	DROP TABLE [PersonalVisit], [GroupVisit], [InformForThePass], [VisitPurpose], [HostParty], [Group], [Purpose], [Visitor], [Employee], [Division], [Department], [User], [Human];
*/

USE Slivkov;

CREATE TABLE [Human](
	ID INT IDENTITY(1,1) NOT NULL,
	Surname VARCHAR(255) NOT NULL,
	Firstname VARCHAR(255) NOT NULL,
	Patronymic VARCHAR(255) NULL DEFAULT 'He does not have a patronymic',
	DateOfBirth DATE NOT NULL,
	PassportSeries VARCHAR(255) NOT NULL,
	PassportNumber VARCHAR(255) NOT NULL,
	PassportFile VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID)
);

INSERT [Human] VALUES ('Petrov','Petr','Petrovich','1995-12-20','0759', '569832', 'FilePassportForThisHuman.pdf');

SELECT * FROM [Human];

/*	DROP TABLE [Human];		*/

CREATE TABLE [User](
	ID INT IDENTITY(1,1) NOT NULL,
	HumanID INT NOT NULL,
	UserName VARCHAR(255) NOT NULL,
	UserPassword VARCHAR(255) NOT NULL,
	PhoneNumber VARCHAR(255) NULL,
	Email VARCHAR(255) NOT NULL,
	Photo VARCHAR(255) NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (HumanID) REFERENCES [Human](ID)
);

INSERT [User] VALUES ( 1, 'username01','userpassword01','+7(919)123-45-87','MyEmail@mail.ru', 'ava.jpg');

SELECT * FROM [User];

/*	DROP TABLE [User];		*/

CREATE TABLE [Division](
	ID INT IDENTITY(1,1) NOT NULL,
	Division VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
);

INSERT [Division] VALUES ('Security Service');

SELECT * FROM [Division];

/*	DROP TABLE [Division];		*/

CREATE TABLE [Department](
	ID INT IDENTITY(1,1) NOT NULL,
	Department VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
);

INSERT [Department] VALUES ('Security');

SELECT * FROM [Department];

/*	DROP TABLE [Department];		*/

CREATE TABLE [Employee](
	ID INT IDENTITY(1,1) NOT NULL,
	EmployeeÑode INT  NOT NULL,
	UserID INT NOT NULL,
	DivisionID INT NULL,
	DepartmentID INT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES [User](ID),
	FOREIGN KEY (DivisionID) REFERENCES [Division](ID),
	FOREIGN KEY (DepartmentID) REFERENCES [Department](ID),

);

INSERT [Employee] VALUES ( 9367788, 1, 1, 1);

SELECT * FROM [Employee];

/*	DROP TABLE [Employee];		*/

CREATE TABLE [Visitor](
	ID INT IDENTITY(1,1) NOT NULL,
	UserID INT NOT NULL,
	Organization VARCHAR(255) NULL,
	Note VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (UserID) REFERENCES [User](ID),
);

INSERT [Visitor] VALUES ( 1, 'Organization of magnificent forms','Be careful with him');

SELECT * FROM [Visitor];

/*	DROP TABLE [Visitor];		*/

CREATE TABLE [VisitPurpose](
	ID INT IDENTITY(1,1) NOT NULL,
	VisitPurpose VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
);

INSERT [VisitPurpose] VALUES ('Partnership offer');

SELECT * FROM [VisitPurpose];

/*	DROP TABLE [VisitPurpose];		*/

CREATE TABLE [InformForThePass](
	ID INT IDENTITY(1,1) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	VisitPurposeID INT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY	(VisitPurposeID) REFERENCES [VisitPurpose](ID)
);

INSERT [InformForThePass] VALUES ( '2023-03-05','2023-03-06', 1);

SELECT * FROM [InformForThePass];

/*	DROP TABLE [InformForThePass];		*/

CREATE TABLE [HostParty](
	ID INT IDENTITY(1,1) NOT NULL,
	DivisionID INT NOT NULL,
	EmployeeID INT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (DivisionID) REFERENCES [Division](ID),
	FOREIGN KEY (EmployeeID) REFERENCES [Employee](ID),
);

INSERT [HostParty] VALUES (1, 1);

SELECT * FROM [HostParty];

/*	DROP TABLE [HostParty];		*/

CREATE TABLE [Group](
	ID INT IDENTITY(1,1) NOT NULL,
	Groupe VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID),
);

INSERT [Group] VALUES ('24/04/2023_Production_Fomicheva_9367788_Group1');

SELECT * FROM [Group];

/*	DROP TABLE [Group];		*/


CREATE TABLE [PersonalVisit](
	ID INT IDENTITY(1,1) NOT NULL,
	VisitorID INT NOT NULL,
	InformForThePassID INT NOT NULL,
	HostPartyID INT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY	(VisitorID) REFERENCES [Visitor](ID),
	FOREIGN KEY	(PurposeID) REFERENCES [Purpose](ID),
	FOREIGN KEY	(InformForThePassID) REFERENCES [InformForThePass](ID),
	FOREIGN KEY	(HostPartyID) REFERENCES [HostParty](ID),
);

INSERT [PersonalVisit] VALUES ( 1, 1, 1, 1);

SELECT * FROM [PersonalVisit];

/*	DROP TABLE [PersonalVisit];		*/

CREATE TABLE [GroupVisit](
	ID INT IDENTITY(1,1) NOT NULL,
	VisitorID INT NOT NULL,
	GroupID INT NOT NULL,
	InformForThePassID INT NOT NULL,
	HostPartyID INT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY	(VisitorID) REFERENCES [Visitor](ID),
	FOREIGN KEY	(GroupID) REFERENCES [Group](ID),
	FOREIGN KEY	(PurposeID) REFERENCES [Purpose](ID),
	FOREIGN KEY	(InformForThePassID) REFERENCES [InformForThePass](ID),
	FOREIGN KEY	(HostPartyID) REFERENCES [HostParty](ID),
);

INSERT [GroupVisit] VALUES ( 1, 1, 1, 1, 1);

SELECT * FROM [GroupVisit];

/*	DROP TABLE [GroupVisit];		*/
