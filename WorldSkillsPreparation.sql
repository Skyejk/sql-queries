CREATE DATABASE ws2023

CREATE TABLE [Human](
ID INT NOT NULL IDENTITY(1,1),
Surname NVARCHAR(255) NOT NULL,
Firstname NVARCHAR(255) NOT NULL,
Patronymic NVARCHAR(255) NULL,
Gender CHAR(1) NOT NULL,
DateOfBirth DATE NOT NULL,
PRIMARY KEY (ID)
);
CREATE TABLE [User](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
UserName NVARCHAR(255) NOT NULL,
UserPassword NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID)
);


INSERT [Human] VALUES ('Ivanov', 'Ivan' ,'Ivanovich' ,'M', '01-01-2001');
INSERT [Human] VALUES ('Petrov', 'Petr' ,'Petrovich' ,'M', '02-02-2002');
INSERT [Human] VALUES ('Lizovskaya', 'Liza' ,'Alexandrovna','F', '03-03-2003');

INSERT [User] VALUES (1, 'Ivan1234', 'qwerty');
INSERT [User] VALUES (2, 'Petr1234', 'asdfgh');
INSERT [User] VALUES (3, 'Liza1234', 'zxcvbn');

SELECT * FROM [Human];
SELECT * FROM [User];
