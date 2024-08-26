USE Akelon;

CREATE TABLE [Gender](
ID INT NOT NULL IDENTITY(1, 1),
GenderName VARCHAR(5) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [Gender] VALUES  ('Man');
INSERT [Gender] VALUES  ('Woman');

SELECT * FROM [Gender];

/*	DROP TABLE [Gender];		*/

CREATE TABLE [UserRole](
ID INT NOT NULL IDENTITY(1, 1),
UserRoleName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [UserRole] VALUES  ('Administrator');
INSERT [UserRole] VALUES  ('Client');
INSERT [UserRole] VALUES  ('Vendor');
INSERT [UserRole] VALUES  ('Contractor');
INSERT [UserRole] VALUES  ('Agent');
INSERT [UserRole] VALUES  ('Warehouseman');

SELECT * FROM [UserRole];

/*	DROP TABLE [UserRole];		*/

CREATE TABLE [Human](
ID INT NOT NULL IDENTITY(1, 1),
Surname VARCHAR(255) NOT NULL,
Firstname VARCHAR(255) NOT NULL,
Patronymic VARCHAR(255) NULL,
DateOfBurth DATE NULL,
GenderID INT NOT NULL,
UserRoleID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY(GenderID) REFERENCES[Gender](ID),
FOREIGN KEY(UserRoleID) REFERENCES [UserRole](ID)
);

INSERT [Human] VALUES  ('Ivanov', 'Ivan', 'Ivanovich',			 NULL, 1, 6);
INSERT [Human] VALUES  ('Mntr', 'Mntr', 'Mntr',					 NULL, 1, 1);
INSERT [Human] VALUES  ('Voronova', 'Zlata', 'Alekseevna',		 NULL, 2, 2);
INSERT [Human] VALUES  ('Zhuravlev', 'David', 'Aleksanrovich',	 NULL, 1, 2);
INSERT [Human] VALUES  ('Muravyeva', 'Zhanna', 'Lyvovna',		 NULL, 2, 2);
INSERT [Human] VALUES  ('Andreev', 'Kirill', 'Dmitrievich',		 NULL, 1, 2);
INSERT [Human] VALUES  ('Petrov', 'Petr', 'Petrovich',			 NULL, 1, 6);

SELECT * FROM [Human];

/*	DROP TABLE [Human];		*/

CREATE TABLE [Organization](
ID INT NOT NULL IDENTITY(1, 1),
OrganizationName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [Organization] VALUES  ('OOO Nadezhda');
INSERT [Organization] VALUES  ('OOO Zvezda');
INSERT [Organization] VALUES  ('OOO Deny');
INSERT [Organization] VALUES  ('OOO Sneg');

SELECT * FROM [Organization];

/*	DROP TABLE [Organization];		*/

CREATE TABLE [Country](
ID INT NOT NULL IDENTITY(1,1),
CodeCountry NVARCHAR(10) NOT NULL,
ShortName NVARCHAR(255) NOT NULL,
FullName NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [Country] VALUES ('+7',	 'Russian', 'Russian Federation');
INSERT [Country] VALUES ('+375', 'Belarus', 'Republic of Belarus');
INSERT [Country] VALUES ('+7',	 'Kazakhstan', 'Republic of Kazakhstan');
INSERT [Country] VALUES ('+374', 'Armenia', 'Republic of Armenia');

SELECT * FROM [Country];

/*	DROP TABLE [Country];		*/

CREATE TABLE [Region](
ID INT NOT NULL IDENTITY(1,1),
CountryID INT NOT NULL,
RegionName NVARCHAR(255) NOT NULL,
RegionOKATO NVARCHAR(15) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CountryID) REFERENCES [Country](ID)
);

INSERT [Region] VALUES (1, 'Stavropol Krai', '07000000000');
INSERT [Region] VALUES (1, 'Krasnodar Krai', '03000000000');
INSERT [Region] VALUES (1, 'Moscow Oblast', '46000000000');
INSERT [Region] VALUES (1, 'Arkhangelsk Oblast', '11000000000');
INSERT [Region] VALUES (1, 'Sverdlovsk Oblast', '65000000000');
INSERT [Region] VALUES (1, 'Leningrad Oblast', '41000000000');
INSERT [Region] VALUES (1, 'Penza Oblast', '56000000000');
INSERT [Region] VALUES (1, 'Bryansk Oblast', '15000000000');
INSERT [Region] VALUES (1, 'Orenburg Oblast', '53000000000');
INSERT [Region] VALUES (1, 'Ivanov Oblast', '24000000000');

SELECT * FROM [Region];

/*	DROP TABLE [Region];		*/

CREATE TABLE [City](
ID INT NOT NULL IDENTITY(1,1),
RegionID INT NOT NULL,
CityName NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (RegionID) REFERENCES [Region](ID)
);

INSERT [City] VALUES (1, 'Kislovodsk');
INSERT [City] VALUES (1, 'Stavropol');
INSERT [City] VALUES (3, 'Moscow');
INSERT [City] VALUES (4, 'Arkhangelsk');
INSERT [City] VALUES (5, 'Yekaterinburg');
INSERT [City] VALUES (6, 'Saint Petersburg');
INSERT [City] VALUES (7, 'Klin');
INSERT [City] VALUES (8, 'Krasnogorsk');
INSERT [City] VALUES (9, 'Voskresensk');
INSERT [City] VALUES (10, 'Orehovo-Zuevo');

SELECT * FROM [City];

/*	DROP TABLE [City];		*/

CREATE TABLE [RemainingAddress](
ID INT NOT NULL IDENTITY(1,1),
CityID INT NOT NULL,
StreetName NVARCHAR(255) NOT NULL,
Home NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CityID) REFERENCES [City](ID)
);

INSERT [RemainingAddress] VALUES (7, 'Stalina', '74');
INSERT [RemainingAddress] VALUES (8, 'Lenina', '53');
INSERT [RemainingAddress] VALUES (9, 'Chehova', '7');
INSERT [RemainingAddress] VALUES (10,'Chehova', '53');

SELECT * FROM [RemainingAddress];

/*	DROP TABLE [RemainingAddress];		*/

CREATE TABLE [CurrentClient](
ID INT NOT NULL IDENTITY(1,1),
AddressID INT NOT NULL,
OrganizationID INT NOT NULL,
HumanID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (AddressID) REFERENCES [RemainingAddress](ID),
FOREIGN KEY (OrganizationID) REFERENCES [Organization](ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID)
);

INSERT [CurrentClient] VALUES (1, 1, 3);
INSERT [CurrentClient] VALUES (2, 2, 4);
INSERT [CurrentClient] VALUES (3, 3, 5);
INSERT [CurrentClient] VALUES (4, 4, 6);

SELECT * FROM [CurrentClient];

/*	DROP TABLE [CurrentClient];		*/






CREATE TABLE [Unit](
ID INT NOT NULL IDENTITY(1,1),
NameUnit VARCHAR(20) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Unit] VALUES ('Килограмм');
INSERT [Unit] VALUES ('Порция');
INSERT [Unit] VALUES ('Штука');
INSERT [Unit] VALUES ('Литр');

SELECT * FROM [Unit];

/*	DROP TABLE [Unit];		*/

CREATE TABLE [Product](
ID INT NOT NULL IDENTITY(1,1),
UnitID INT NOT NULL,
ProductName VARCHAR(255),
Price MONEY NULL,
PRIMARY KEY (ID),
FOREIGN KEY (UnitID) REFERENCES [Unit](ID)
);

INSERT [Product] VALUES (4, 'Вода', 50);
INSERT [Product] VALUES (4, 'Лимонад', 70);
INSERT [Product] VALUES (4, 'Апельсиновый сок', 100);
INSERT [Product] VALUES (4, 'Йогурт', 75);
INSERT [Product] VALUES (4, 'Молоко', 120);
INSERT [Product] VALUES (4, 'Сливки', 150);
INSERT [Product] VALUES (1, 'Масло сливочное', 70);
INSERT [Product] VALUES (4, 'Кефир', 100);
INSERT [Product] VALUES (4, 'Сметана', 130);
INSERT [Product] VALUES (1, 'Творог', 110);
INSERT [Product] VALUES (3, 'Яйцо куриное', 80);
INSERT [Product] VALUES (1, 'Мороженное', 400);
INSERT [Product] VALUES (1, 'Сыр', 300);
INSERT [Product] VALUES (1, 'Какао', 100);
INSERT [Product] VALUES (1, 'Кофе', 500);
INSERT [Product] VALUES (1, 'Чай', 150);
INSERT [Product] VALUES (1, 'Шоколад', 110);
INSERT [Product] VALUES (1, 'Печенье', 150);
INSERT [Product] VALUES (1, 'Вафли', 130);
INSERT [Product] VALUES (3, 'Чипсы', NULL);
INSERT [Product] VALUES (3, 'Сухарики', NULL);
INSERT [Product] VALUES (3, 'Кукурузные палочки', NULL);
INSERT [Product] VALUES (3, 'Солёные палочки', NULL);
INSERT [Product] VALUES (1, 'Зефирки', 1000);
INSERT [Product] VALUES (1, 'Мармеладки', 100);
INSERT [Product] VALUES (1, 'Рахат лукум', 10);
INSERT [Product] VALUES (1, 'Лакрица', 350);


SELECT * FROM [Product];

/*	DROP TABLE [Product];		*/

CREATE TABLE [Order](
ID INT NOT NULL IDENTITY(1,1),
ProductID INT NOT NULL,
ClientID INT NOT NULL,
OrderNumber INT NOT NULL,
RequiredQuantity INT NOT NULL,
DatePlacement Date NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (ProductID) REFERENCES [Product](ID),
FOREIGN KEY (ClientID) REFERENCES [CurrentClient](ID),
);

INSERT [Order] VALUES (5, 1, 233, 30, '2023-03-15');
INSERT [Order] VALUES (5, 1, 234, 50, '17-03-2023');
INSERT [Order] VALUES (5, 2, 236, 25, '14-05-2023');
INSERT [Order] VALUES (5, 4, 237, 22, '16-06-2023');
INSERT [Order] VALUES (5, 3, 235, 38, '20-04-2023');
INSERT [Order] VALUES (5, 3, 238, 27, '16-06-2023');
INSERT [Order] VALUES (5, 4, 239, 10, '22-06-2023');
INSERT [Order] VALUES (5, 4, 237, 14, '23-01-2023');
INSERT [Order] VALUES (20, 2, 241, 25, '14-08-2024');
INSERT [Order] VALUES (21, 2, 242, 27, '15-08-2024');
INSERT [Order] VALUES (22, 2, 243, 23, '16-08-2024');
INSERT [Order] VALUES (23, 2, 244, 25, '16-08-2024');
INSERT [Order] VALUES (24, 4, 254, 20, '20-08-2024');
INSERT [Order] VALUES (25, 1, 255, 6, '21-08-2024');
INSERT [Order] VALUES (26, 3, 256, 14, '22-08-2024');
INSERT [Order] VALUES (27, 4, 257, 60, '23-08-2024');

SELECT * FROM [Order];

/*	DROP TABLE [Order];		*/

CREATE TABLE [Warehouse](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL, /* 1, 7*/
ProductID INT NOT NULL,
ProductQuantity INT NULL,
DeliveryDate DATE NOT NULL,
PRIMARY KEY(ID),
FOREIGN KEY(HumanID) REFERENCES [Human](ID),
FOREIGN KEY(ProductID) REFERENCES [Product](ID),
);

INSERT [Warehouse] VALUES (1, 1, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 2, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 3, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 4, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 5, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 6, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 7, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 8, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 9, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 10, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 11, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 12, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 13, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 14, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 15, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 16, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 17, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 18, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 19, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 20, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 21, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 22, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 23, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 24, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 25, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 26, 1000, '2022-01-12');
INSERT [Warehouse] VALUES (7, 27, 1000, '2022-01-12');

SELECT * FROM [Warehouse];

/*	DROP TABLE [Warehouse];		*/

/* Drop all database:

	DROP TABLE [Warehouse];
	DROP TABLE [ORDER];
	DROP TABLE [Product];
	DROP TABLE [Unit];
	DROP TABLE [CurrentClient];
	DROP TABLE [RemainingAddress];
	DROP TABLE [City];
	DROP TABLE [Region];
	DROP TABLE [Country];
	DROP TABLE [Organization];
	DROP TABLE [Human];
	DROP TABLE [UserRole];
	DROP TABLE [Gender];
	
*/


/*Первый запрос*/

SELECT * FROM [Product]
JOIN [Order] ON [Product].ID = [Order].ProductID
WHERE [Product].Price IS NULL;

/*Второй запрос*/

UPDATE [Product]
SET Price = Price * 1.05
WHERE ID IN (
	SELECT DISTINCT ID FROM [Order]
	WHERE DatePlacement >= DATEADD(MONTH, -1, GETDATE()
	)
);

/*Третий запрос*/

ALTER TABLE [Order]
ADD [Наименование] VARCHAR(255);

UPDATE [Order]
SET [Наименование] = 'Заявка № ' + CAST([Order].OrderNumber AS VARCHAR) + ' на приобретение ' + [Product].ProductName
FROM [Order] JOIN [Product] ON [Order].ProductID = [Product].ID;
