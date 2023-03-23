USE HotelСomplex;

CREATE TABLE [Country](
ID INT NOT NULL IDENTITY(1,1),
CodeCountry NVARCHAR(10) NOT NULL,
FlagCountry NVARCHAR(255) NOT NULL,--Ссылка на флаг страны
ShortName NVARCHAR(255) NOT NULL,
FullName NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Country] VALUES ('+7',	 'flag_Russian.png', 'Russian', 'Russian Federation');
INSERT [Country] VALUES ('+375', 'flag_Belarus.png', 'Belarus', 'Republic of Belarus');
INSERT [Country] VALUES ('+7',	 'flag_Kazakhstan.png', 'Kazakhstan', 'Republic of Kazakhstan');
INSERT [Country] VALUES ('+374', 'flag_Armenia.png', 'Armenia', 'Republic of Armenia');

SELECT * FROM [Country];

/*	DROP TABLE [Country];		*/

CREATE TABLE [Region](
ID INT NOT NULL IDENTITY(1,1),
CountryID INT NOT NULL,
FlagRegion NVARCHAR(255) NOT NULL,--Ссылка на флаг региона
RegionName NVARCHAR(255) NOT NULL,
RegionOKATO NVARCHAR(15) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CountryID) REFERENCES [Country](ID),
);

INSERT [Region] VALUES (1, 'flag_StavropolyskogoKraya.png', 'Stavropol Krai', '07000000000');
INSERT [Region] VALUES (1, 'flag_KrasnodarskogoKraya.png', 'Krasnodar Krai', '03000000000');

SELECT * FROM [Region];

/*	DROP TABLE [Region];		*/

CREATE TABLE [City](
ID INT NOT NULL IDENTITY(1,1),
RegionID INT NOT NULL,
FlagCity NVARCHAR(255) NOT NULL,--Ссылка на флаг региона
CityName NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (RegionID) REFERENCES [Region](ID),
);

INSERT [City] VALUES (1, 'flag_Kislovodsk.png', 'Kislovodsk');
INSERT [City] VALUES (1, 'flag_Stavropol.png', 'Stavropol');

SELECT * FROM [City];

/*	DROP TABLE [City];		*/


CREATE TABLE [Hotel](
ID INT NOT NULL IDENTITY(1,1),
CityID INT NOT NULL,
FullName NVARCHAR(255) NOT NULL,
ShortName NVARCHAR(255) NOT NULL,
Street NVARCHAR(255) NOT NULL,
House NVARCHAR(15) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CityID) REFERENCES [City](ID),
);

INSERT [Hotel] VALUES (1, 'Pellegreen Hotel & Restaurant', 'Pellegreen', 'Пушкина', '12');

SELECT * FROM [Hotel];

/*	DROP TABLE [Hotel];		*/





CREATE TABLE [Gender](
ID INT NOT NULL IDENTITY(1,1),
GenderName NVARCHAR(10) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Gender] VALUES ('Male');
INSERT [Gender] VALUES ('Female');

SELECT * FROM [Gender];

/*	DROP TABLE [Gender];		*/

CREATE TABLE [Human](
ID INT NOT NULL IDENTITY(1,1),
Surname NVARCHAR(255) NOT NULL,
Firstname NVARCHAR(255) NOT NULL,
Patronymic NVARCHAR(255) NULL,
GenderID INT NOT NULL,
DateOfBirth DATE NOT NULL,
PassportSeries INT NOT NULL,
PassportNumber INT NOT NULL,
PassportFile NVARCHAR(255) NOT NULL,
CityAddress NVARCHAR(255) NULL,
ResidenceAddress NVARCHAR(255) NULL,--Оставим разрешенное значение NULL для возможной реализации регистрации детей без прописки(или не только детей)
SNILS NVARCHAR(255) NULL,
INN NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (GenderID) REFERENCES [Gender](ID)
);

INSERT [Human] VALUES ('Ivanov', 'Ivan', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',				'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Petrov', 'Petr', 'Petrovich', 1, 01-02-2003, 1234, 123456, 'Petrov_passport.pdf',			'Санкт-Петербург, улица Пушкина, дом 19, квартира 7, подъезд 4', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Vladimirov', 'Vladimir', 'Vladimirovich', 1, 02-02-2002, 2222, 222222, 'VVV_passport.pdf',	'Кисловодск, проспект Победы, дом 94', '965-658-569-58', '1235-123456-98' );
																													
INSERT [Human] VALUES ('Ivanova', 'Ivanna', 'Ivanovna', 2, 14-02-1997, 1402, 972041, 'IvaII_passport.pdf',			'Харьков, улица Победы, дом 20, квартира 3, подъезд 2', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Sorokina', 'Anastasia', 'Evgenyevna', 2, 01-01-2001, 1111, 111111, 'my_passport.pdf',		'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1' );
INSERT [Human] VALUES ('Eremenko', 'Yuliya', 'Vladislavovna', 2, 01-01-2001, 1111, 111111, 'my_passport.pdf',		'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1' );
																													
INSERT [Human] VALUES ('Sidorov', 'Nikolay', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',			'Архангельск, улица Лизюкова, дом 5');
INSERT [Human] VALUES ('Morozov', 'Evgeniy', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',			'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Strikozov', 'Aleksandr', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',		'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Malishev', 'Anton', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',			'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Skrilenko', 'Vasiliy', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',			'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Novikov', 'Ivan', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf',				'Архангельск, улица Лизюкова, дом 5' );

INSERT [Human] VALUES ('Novikova', 'Elezaveta', 'Petrovna', 2, 03-05-2003, 0305, 203589, 'NovikovaL_passport.pdf', 'Екатеринбург, улица Карла Маркса, дом 3', '054-123-654-98', '6527-123456-12' );
INSERT [Human] VALUES ('Novikova', 'Anastasiya', 'Petrovna', 2, 05-05-2002, 0505, 657159, 'NovikovaA_passport.pdf', 'Екатеринбург, улица Карла Маркса, дом 3', '053-123-654-98', '6528-123456-12' );

SELECT * FROM [Human];

/*	DROP TABLE [Human];		*/

CREATE TABLE [EmployeePosition](--Specialty/profession/position
ID INT NOT NULL IDENTITY(1,1),
Post NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [EmployeePosition] VALUES ('Administrator');--Администратор
INSERT [EmployeePosition] VALUES ('Security');--Охранник
INSERT [EmployeePosition] VALUES ('Maid');--Горничная
INSERT [EmployeePosition] VALUES ('Manager');--Менеджер

SELECT * FROM [EmployeePosition];

/*	DROP TABLE [EmployeePosition];		*/

CREATE TABLE [Education](
ID INT NOT NULL IDENTITY(1,1),
EducationName NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Education] VALUES ('Среднеее общее образование');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Программирование в компьютерных системах"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Экономика и бухгалтерский учет по отраслям"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Строительство и эксплуатация зданий и сооружений"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Обслуживающий персонал в сфере гостиничного бизнеса"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Преподаватель декоративно-прикладного искусства"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Музыкально-инструментальное искусство"');

SELECT * FROM [Education];

/*	DROP TABLE [Education];		*/












CREATE TABLE [Employee](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
RoleID INT NOT NULL,
EducationID INT NOT NULL,
HotelID INT NOT NULL,
Email NVARCHAR(255) NULL,
PhoneNumber NVARCHAR(255) NULL,
SalaryAmount MONEY NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID),
FOREIGN KEY (RoleID) REFERENCES [EmployeePosition](ID),
FOREIGN KEY (EducationID) REFERENCES [Education](ID),
FOREIGN KEY (HotelID) REFERENCES [Hotel](ID),
);

INSERT [Employee] VALUES ( 1, 2, 1, 1, 'Vanek007PRO228super@mail.ru', '+7(918)351-11-26', 23384);	--Ivanov
INSERT [Employee] VALUES ( 2, 1, 2, 1, 'petrov00892@mail.ru', '+7(962)123-11-26', 28384);			--Petrov
INSERT [Employee] VALUES ( 3, 4, 3, 1, 'vvPravilyni@mail.ru', '+7(996)852-11-26', 35384);			--Vladimirov
INSERT [Employee] VALUES ( 4, 3, 5, 1, 'ivaii@mail.ru', '+7(928)964-11-26', 19384);					--Ivanova
INSERT [Employee] VALUES ( 13, 3, 7, 1,  'NovikovaL@mail.ru', '+7(919)111-11-19', 19384);			--NovikovaL
INSERT [Employee] VALUES ( 14, 3, 7, 1,  'NovikovaA@mail.ru', '+7(919)112-12-12', 19384);			--NovikovaA
																								
SELECT * FROM [Employee];

/*	DROP TABLE [Employee];		*/

CREATE TABLE [User](
ID INT NOT NULL IDENTITY(1,1),
EmployeeID INT NOT NULL,
UserName NVARCHAR(255) NOT NULL,
UserPassword NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (EmployeeID) REFERENCES [Employee](ID),
);

INSERT [User] VALUES ( 1, 2, 1, 'Vanek007PRO228super@mail.ru', '+7(918)351-11-26', 23384);
INSERT [User] VALUES ( 2, 1, 2, 'petrov00892@mail.ru', '+7(962)123-11-26', 28384);
INSERT [User] VALUES ( 3, 4, 3, 'vvPravilyni@mail.ru', '+7(996)852-11-26', 35384);
INSERT [User] VALUES ( 4, 3, 5, 'ivaii@mail.ru', '+7(928)964-11-26', 19384);

SELECT * FROM [User];

/*	DROP TABLE [User];		*/

CREATE TABLE [Client](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
Blacklist TINYINT NOT NULL, --Изначально планировал сделать тип данных boolean, но решил оставить место для возможностей дальнейшего развития, поставив tinyint
Survey NVARCHAR(255) NOT NULL,
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID)
);

INSERT [Client] VALUES (5, 0,	'Скрывается от мужа', '');
INSERT [Client] VALUES (6, 1,	'Туризм', 'Делала хатьфу в номере, попав в черный список');
INSERT [Client] VALUES (7, 0,	'Приехал на соревнования', '');
INSERT [Client] VALUES (8, 0,	'Приехал на соревнования', '');
INSERT [Client] VALUES (9, 0,	'Приехал на соревнования', '');
INSERT [Client] VALUES (10, 0,	'Приехал на соревнования', '');
INSERT [Client] VALUES (11, 0,	'Приехал на соревнования', '');
INSERT [Client] VALUES (12, 0,	'Приехал на соревнования', '');

SELECT * FROM [Client];

/*	DROP TABLE [Client];		*/
