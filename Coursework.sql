USE HotelСomplex;

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
ResidenceAddress NVARCHAR(255) NULL,<!--Оставим разрешенное значение NULL для возможной реализации регистрации детей без прописки(или не только детей)-->
SNILS NVARCHAR(255) NULL,
INN NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (GenderID) REFERENCES [Gender](ID)
);

INSERT [Human] VALUES ('Ivanov', 'Ivan', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Petrov', 'Petr', 'Petrovich', 1, 01-02-2003, 1234, 123456, 'Petrov_passport.pdf', 'Санкт-Петербург, улица Пушкина, дом 19, квартира 7, подъезд 4', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Vladimirov', 'Vladimir', 'Vladimirovich', 1, 02-02-2002, 2222, 222222, 'VVV_passport.pdf', 'Кисловодск, проспект Победы, дом 94', '965-658-569-58', '1235-123456-98' );

INSERT [Human] VALUES ('Ivanova', 'Ivanna', 'Ivanovna', 2, 14-02-1997, 1402, 972041, 'IvaII_passport.pdf', 'Харьков, улица Победы, дом 20, квартира 3, подъезд 2', '965-658-569-58', '1235-123456-98' );
INSERT [Human] VALUES ('Sorokina', 'Anastasia', 'Evgenyevna', 2, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1' );
INSERT [Human] VALUES ('Eremenko', 'Yuliya', 'Vladislavovna', 2, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Москва, улица Орджоникидзе, дом 9, квартира 1, подъезд 1' );

INSERT [Human] VALUES ('Sidorov', 'Nikolay', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5');
INSERT [Human] VALUES ('Morozov', 'Evgeniy', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Strikozov', 'Aleksandr', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Malishev', 'Anton', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Skrilenko', 'Vasiliy', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5' );
INSERT [Human] VALUES ('Novikov', 'Ivan', 'Ivanovich', 1, 01-01-2001, 1111, 111111, 'my_passport.pdf', 'Архангельск, улица Лизюкова, дом 5' );

SELECT * FROM [Human];

/*	DROP TABLE [Human];		*/

CREATE TABLE [EmployeePosition](<!--Specialty/profession/position-->
ID INT NOT NULL IDENTITY(1,1),
Post NVARCHAR(255) NOT NULL,
);

INSERT [EmployeePosition] VALUES ('Administrator');<!--Администратор-->
INSERT [EmployeePosition] VALUES ('Security');<!--Охранник-->
INSERT [EmployeePosition] VALUES ('Maid');<!--Горничная-->
INSERT [EmployeePosition] VALUES ('Manager');<!--Менеджер-->

SELECT * FROM [EmployeePosition];

/*	DROP TABLE [EmployeePosition];		*/

CREATE TABLE [Education](
ID INT NOT NULL IDENTITY(1,1),
EducationName NVARCHAR(255) NOT NULL,
);

INSERT [Education] VALUES ('Среднеее общее образование');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Программирование в компьютерных системах"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Экономика и бухгалтерский учет по отраслям"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Строительство и эксплуатация зданий и сооружений"');
INSERT [Education] VALUES ('Среднее специальное образование по специальности "Обслуживающий персонал в сфере гостиничного бизнеса"');

SELECT * FROM [Education];

/*	DROP TABLE [Education];		*/

CREATE TABLE [Employee](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
RoleID INT NOT NULL,
EducationID NVARCHAR(255) NOT NULL,
Email NVARCHAR(255) NULL,
PhoneNumber NVARCHAR(255) NULL,
SalaryAmount MONEY NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID),
FOREIGN KEY (RoleID) REFERENCES [EmployeePosition](ID),
FOREIGN KEY (EducationID) REFERENCES [Education](ID),
);

INSERT [Employee] VALUES ( 1, 2, 1, 'Vanek007PRO228super@mail.ru', '+7(918)351-11-26', 23384);
INSERT [Employee] VALUES ( 2, 1, 2, 'petrov00892@mail.ru', '+7(962)123-11-26', 28384);
INSERT [Employee] VALUES ( 3, 4, 3, 'vvPravilyni@mail.ru', '+7(996)852-11-26', 35384);
INSERT [Employee] VALUES ( 4, 3, 5, 'ivaii@mail.ru', '+7(928)964-11-26', 19384);

SELECT *FROM [Employee]();

/*	DROP TABLE [Employee];		*/

CREATE TABLE [Client](
ID INT NOT NULL IDENTITY(1,1),
HumanID INT NOT NULL,
Blacklist TINYINT NOT NULL, <!--Изначально планировал сделать тип данных boolean, но решил оставить место для возможностей дальнейшего развития, поставив tinyint-->
DescriptionNotes NVARCHAR(255) NULL,
PRIMARY KEY (ID),
FOREIGN KEY (HumanID) REFERENCES [Human](ID)
);

INSERT [Client] VALUES (5, 0, '');
INSERT [Client] VALUES (6, 0, '');
INSERT [Client] VALUES (7, 0, '');
INSERT [Client] VALUES (8, 0, '');
INSERT [Client] VALUES (9, 0, '');
INSERT [Client] VALUES (10, 0, '');
INSERT [Client] VALUES (11, 0, '');
INSERT [Client] VALUES (12, 0, '');
