USE HotelComplex;

/*I am using MS SQL to create this query*/

/*
	Query for cleaning database:
	DROP TABLE [ReservationHotelRoom], [HotelRoom], [TypeHotelRoom], [CategoryHotelRoom], [StatusHotelRoom], [Client], [User], [Employee], [EmployeePosition], [Education], [DetailedInformationAboutThePerson], [Human], [Gender], [Hotel], [City], [Region], [Country];
*/



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
INSERT [Region] VALUES (1, 'flag_Moscowskoy_Oblasti.png', 'Moscow Oblast', '46000000000');
INSERT [Region] VALUES (1, 'flag_Arkhangelskoy_Oblasti.png', 'Arkhangelsk Oblast', '11000000000');
INSERT [Region] VALUES (1, 'flag_Sverdlovskoy_Oblasti.png', 'Sverdlovsk Oblast', '65000000000');
INSERT [Region] VALUES (1, 'flag_Leningradskoy_Oblasti.png', 'Leningrad Oblast', '41000000000');

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
INSERT [City] VALUES (3, 'flag_Moscow.png', 'Moscow');
INSERT [City] VALUES (4, 'flag_Arkhangelsk.png', 'Arkhangelsk');
INSERT [City] VALUES (5, 'flag_Yekaterinburg.png', 'Yekaterinburg');
INSERT [City] VALUES (6, 'flag_Saint_Petersburg.png', 'Saint Petersburg');

SELECT * FROM [City];

/*	DROP TABLE [City];		*/


CREATE TABLE [Hotel](
ID INT NOT NULL IDENTITY(1,1),
CityID INT NOT NULL,
FullName NVARCHAR(255) NOT NULL,
ShortName NVARCHAR(255) NOT NULL,
Street NVARCHAR(255) NOT NULL,
House NVARCHAR(15) NOT NULL,
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (CityID) REFERENCES [City](ID),
);

INSERT [Hotel] VALUES (1, 'Pellegreen Hotel & Restaurant', 'Pellegreen', 'Пушкина', '12', 'Красиво жить не запретишь');
INSERT [Hotel] VALUES (1, 'Stavropol Plasa', 'Plasa', 'Красивая', '50', 'Посещение бассейна входит в стоимость номера');
INSERT [Hotel] VALUES (1, 'Jemchujina Stavropolya', 'Jemchujina', 'Карла Маркса', '3', 'Взять немножечко укропу, Сунь туда кошачью попу, Тараканьи лапки, Сикель старой бабки, Один носок, Пи*ды кусок, Ведро воды И х*й туды, Два подпи*дника телячьих, Бычий х*й И три собачьих.');
INSERT [Hotel] VALUES (2, 'Pellegreen Hotel & Restaurant', 'Pellegreen', 'Войтика', '24', 'Красиво жить не запретишь');

SELECT * FROM [Hotel];

/*	DROP TABLE [Hotel];		*/

CREATE TABLE [TypeHotelRoom](
ID INT NOT NULL IDENTITY(1,1),
TypeName NVARCHAR(20) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [TypeHotelRoom] VALUES ('Single');
INSERT [TypeHotelRoom] VALUES ('Double');
INSERT [TypeHotelRoom] VALUES ('Triple');
INSERT [TypeHotelRoom] VALUES ('Quadriple');
INSERT [TypeHotelRoom] VALUES ('Extra Bed');
INSERT [TypeHotelRoom] VALUES ('Bed Only');
INSERT [TypeHotelRoom] VALUES ('Run of the house');

SELECT * FROM [TypeHotelRoom];

/*	DROP TABLE [TypeHotelRoom];		*/

CREATE TABLE [CategoryHotelRoom](
ID INT NOT NULL IDENTITY(1,1),
TypeName NVARCHAR(20) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [CategoryHotelRoom] VALUES ('Standart');
INSERT [CategoryHotelRoom] VALUES ('Bedroom');
INSERT [CategoryHotelRoom] VALUES ('Balcony');
INSERT [CategoryHotelRoom] VALUES ('Superior');
INSERT [CategoryHotelRoom] VALUES ('Corner room');
INSERT [CategoryHotelRoom] VALUES ('Studio');
INSERT [CategoryHotelRoom] VALUES ('Family Room');
INSERT [CategoryHotelRoom] VALUES ('Family studio');
INSERT [CategoryHotelRoom] VALUES ('Suite');
INSERT [CategoryHotelRoom] VALUES ('Suite mini');
INSERT [CategoryHotelRoom] VALUES ('Junior suite');
INSERT [CategoryHotelRoom] VALUES ('De luxe');
INSERT [CategoryHotelRoom] VALUES ('Executive suite');
INSERT [CategoryHotelRoom] VALUES ('Business');
INSERT [CategoryHotelRoom] VALUES ('Honeymoon Room');
INSERT [CategoryHotelRoom] VALUES ('Connected Rooms');
INSERT [CategoryHotelRoom] VALUES ('Duplex');
INSERT [CategoryHotelRoom] VALUES ('Apartment');
INSERT [CategoryHotelRoom] VALUES ('President');

SELECT * FROM [CategoryHotelRoom];

/*	DROP TABLE [CategoryHotelRoom];		*/

CREATE TABLE [StatusHotelRoom](
ID INT NOT NULL IDENTITY(1,1),
StatusName NVARCHAR(20) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [StatusHotelRoom] VALUES ('Free');
INSERT [StatusHotelRoom] VALUES ('Occupied');
INSERT [StatusHotelRoom] VALUES ('Booked');


SELECT * FROM [StatusHotelRoom];

/*	DROP TABLE [StatusHotelRoom];		*/

CREATE TABLE [HotelRoom](
ID INT NOT NULL IDENTITY(1,1),
HotelID INT NOT NULL,
CategoryID INT NOT NULL,
TypeID INT NOT NULL,
FloorHR INT NOT NULL,
NumberOfRoomsHR INT NOT NULL,
PriceHR MONEY NOT NULL,
StatusID INT NOT NULL,
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HotelID) REFERENCES [Hotel](ID),
FOREIGN KEY (CategoryID) REFERENCES [CategoryHotelRoom](ID),
FOREIGN KEY (TypeID) REFERENCES [TypeHotelRoom](ID),
FOREIGN KEY (StatusID) REFERENCES [StatusHotelRoom](ID),
);

INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 1, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 1, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 2, 'Стандартная комната, без дополнительных удобств, окон нет');
INSERT [HotelRoom] VALUES (1, 1, 1, 1, 1, 1000, 1, 'Стандартная комната, без дополнительных удобств, окон нет');

INSERT [HotelRoom] VALUES (1, 4, 2, 2, 1, 2500, 3, 'Комната повышенного комфорта, с видом на парковку и ближний город.');
INSERT [HotelRoom] VALUES (1, 4, 2, 2, 1, 2500, 1, 'Комната повышенного комфорта, с видом на парковку и ближний город.');
INSERT [HotelRoom] VALUES (1, 4, 2, 2, 1, 2500, 2, 'Комната повышенного комфорта, с видом на парковку и ближний город.');
INSERT [HotelRoom] VALUES (1, 4, 2, 2, 1, 2500, 1, 'Комната повышенного комфорта, с видом на парковку и ближний город.');

SELECT * FROM [HotelRoom];

/*	DROP TABLE [HotelRoom];		*/







CREATE TABLE [Gender](
ID INT NOT NULL IDENTITY(1,1),
GenderName NVARCHAR(10) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Gender] VALUES ('Male');
INSERT [Gender] VALUES ('Female');

SELECT * FROM [Gender];

/*	DROP TABLE [Gender];		*/

CREATE TABLE [Human](--для бронирования с сайта
ID INT NOT NULL IDENTITY(1,1),
Surname NVARCHAR(255) NOT NULL,
Firstname NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [Human] VALUES ('Ivanov', 'Ivan');
INSERT [Human] VALUES ('Petrov', 'Petr');
INSERT [Human] VALUES ('Vladimirov', 'Vladimir');

INSERT [Human] VALUES ('Ivanova', 'Ivanna');
INSERT [Human] VALUES ('Sorokina', 'Anastasia');
INSERT [Human] VALUES ('Eremenko', 'Yuliya');


INSERT [Human] VALUES ('Sidorov', 'Nikolay');
INSERT [Human] VALUES ('Morozov', 'Evgeniy');
INSERT [Human] VALUES ('Strikozov', 'Aleksandr');
INSERT [Human] VALUES ('Malishev', 'Anton');
INSERT [Human] VALUES ('Skrilenko', 'Vasiliy');
INSERT [Human] VALUES ('Novikov', 'Ivan');

INSERT [Human] VALUES ('Novikova', 'Elezaveta');
INSERT [Human] VALUES ('Novikova', 'Anastasiya');

SELECT * FROM [Human];

/*	DROP TABLE [Human];		*/

CREATE TABLE [DetailedInformationAboutThePerson](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
Patronymic NVARCHAR(255) NULL,
GenderID INT NOT NULL,
DateOfBirth DATE NOT NULL,
PassportSeries INT NOT NULL,
PassportNumber INT NOT NULL,
PassportFile NVARCHAR(255) NOT NULL,
CityAddressID INT NULL,
ResidenceAddress NVARCHAR(255) NULL,--Оставим разрешенное значение NULL для возможной реализации регистрации детей без прописки(или не только детей)
SNILS NVARCHAR(255) NULL,
INN NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID),
FOREIGN KEY (GenderID) REFERENCES [Gender](ID),
FOREIGN KEY (CityAddressID) REFERENCES [City](ID),
);

INSERT [DetailedInformationAboutThePerson] VALUES (1, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			3, 'Улица Орджоникидзе, дом 9, квартира 1, подъезд 1', '965-658-569-58', '1235-123456-98' );
INSERT [DetailedInformationAboutThePerson] VALUES (2, 'Petrovich',		1,		'2001-01-01', 1234, 123456, 'Petrov_passport.pdf',		6, 'Улица Пушкина, дом 19, квартира 7, подъезд 4', '965-658-569-58', '1235-123456-98' );
INSERT [DetailedInformationAboutThePerson] VALUES (3, 'Vladimirovich',	1,		'2001-01-01', 2222, 222222, 'VVV_passport.pdf',			1, 'Проспект Победы, дом 94', '965-658-569-58', '1235-123456-98' );

INSERT [DetailedInformationAboutThePerson] VALUES (4, 'Ivanovna',		2,		'2001-01-01', 1402, 972041, 'IvaII_passport.pdf',			3, 'Улица Победы, дом 20, квартира 3, подъезд 2', '965-658-569-58', '1235-123456-98' );
INSERT [DetailedInformationAboutThePerson] VALUES (5, 'Evgenyevna',		2,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			3, 'Улица Орджоникидзе, дом 9, квартира 1, подъезд 1', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (6, 'Vladislavovna',	2,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			5, 'Улица Петрова, дом 39, квартира 12', '', '' );

INSERT [DetailedInformationAboutThePerson] VALUES (7, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (8, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (9, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (10, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (11, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );
INSERT [DetailedInformationAboutThePerson] VALUES (12, 'Ivanovich',		1,		'2001-01-01', 1111, 111111, 'my_passport.pdf',			4, 'Улица Лизюкова, дом 5', '', '' );

INSERT [DetailedInformationAboutThePerson] VALUES (13, 'Petrovna',		2,		'2001-01-01', 0305, 203589, 'NovikovaL_passport.pdf',		6, 'Улица Карла Маркса, дом 3', '054-123-654-98', '6527-123456-12' );
INSERT [DetailedInformationAboutThePerson] VALUES (14, 'Petrovna',		2,		'2001-01-01', 0505, 657159, 'NovikovaA_passport.pdf',		6, 'Улица Карла Маркса, дом 3', '053-123-654-98', '6528-123456-12' );

SELECT * FROM [DetailedInformationAboutThePerson];

/*	DROP TABLE [DetailedInformationAboutThePerson];		*/



CREATE TABLE [EmployeePosition](--Specialty/profession/position
ID INT NOT NULL IDENTITY(1,1),
Post NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
);

INSERT [EmployeePosition] VALUES ('Administrator');--Администратор
INSERT [EmployeePosition] VALUES ('Security');--Охранник
INSERT [EmployeePosition] VALUES ('Maid');--Горничная
INSERT [EmployeePosition] VALUES ('Manager');--Менеджер
INSERT [EmployeePosition] VALUES ('Registrar');--Регистратор

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
DetailedInformationAboutThePersonID INT NOT NULL,
RoleID INT NOT NULL,
EducationID INT NOT NULL,
HotelID INT NOT NULL,
Email NVARCHAR(255) NULL UNIQUE,
PhoneNumber NVARCHAR(255) NULL UNIQUE,
SalaryAmount MONEY NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (DetailedInformationAboutThePersonID) REFERENCES [DetailedInformationAboutThePerson](ID),
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
UserName NVARCHAR(255) NOT NULL UNIQUE,
UserPassword NVARCHAR(255) NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (EmployeeID) REFERENCES [Employee](ID),
);

INSERT [User] VALUES ( 1, 'Vanek007PRO228super', 'asdf134');
INSERT [User] VALUES ( 2, 'petrov00892', 'qwer1243');
INSERT [User] VALUES ( 3, 'vvPravilyni', 'sdgfs4321');
INSERT [User] VALUES ( 4, 'ivaii', 'uyrt134');
INSERT [User] VALUES ( 4, 'NovikovaL', 'oiyt8754');
INSERT [User] VALUES ( 4, 'NovikovaA', 'mcbcn5346');

SELECT * FROM [User];

/*	DROP TABLE [User];		*/

CREATE TABLE [Client](
ID INT NOT NULL IDENTITY(1,1),
DetailedInformationAboutThePersonID INT NOT NULL,
Blacklist TINYINT NOT NULL, --Изначально планировал сделать тип данных boolean, но решил оставить место для возможностей дальнейшего развития, поставив tinyint
Survey NVARCHAR(255) NOT NULL,
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (DetailedInformationAboutThePersonID) REFERENCES [DetailedInformationAboutThePerson](ID)
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











CREATE TABLE [ReservationHotelRoom](
ID INT NOT NULL IDENTITY(1,1),
HotelRoomID INT NOT NULL,
ClientID INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HotelRoomID) REFERENCES [HotelRoom](ID),
FOREIGN KEY (ClientID) REFERENCES [Client](ID),
);

INSERT [ReservationHotelRoom] VALUES (3, 3,  '20-03-2023', '01-04-2023', '');
INSERT [ReservationHotelRoom] VALUES (4, 4,  '20-03-2023', '01-04-2023', '');
INSERT [ReservationHotelRoom] VALUES (5, 5,  '20-03-2023', '01-04-2023', '');
INSERT [ReservationHotelRoom] VALUES (6, 6, '20-03-2023', '01-04-2023', '');
INSERT [ReservationHotelRoom] VALUES (7, 7, '20-03-2023', '01-04-2023', '');
INSERT [ReservationHotelRoom] VALUES (8, 8, '20-03-2023', '01-04-2023', '');

SELECT * FROM [ReservationHotelRoom];

/*	DROP TABLE [ReservationHotelRoom];		*/
