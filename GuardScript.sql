USE Slivkov;

CREATE TABLE [Gender](
ID INT NOT NULL IDENTITY(1, 1),
GenderName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [Gender] VALUES  ('Мужской');
INSERT [Gender] VALUES  ('Женский');

SELECT * FROM [Gender];

/*	DROP TABLE [Gender];		*/

CREATE TABLE [UserRole](
ID INT NOT NULL IDENTITY(1, 1),
UserRoleName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [UserRole] VALUES  ('Администратор доступа');
INSERT [UserRole] VALUES  ('Специалист по ИБ');
INSERT [UserRole] VALUES  ('Руководитель отдела');
INSERT [UserRole] VALUES  ('Контролёр ГОЗ');

SELECT * FROM [UserRole];

/*	DROP TABLE [UserRole];		*/

CREATE TABLE [User](
ID INT NOT NULL IDENTITY(1, 1),
Surname VARCHAR(255) NOT NULL,
Firstname VARCHAR(255) NOT NULL,
Patronymic VARCHAR(255) NULL,
SecretWord VARCHAR(255) NOT NULL,
UserLogin VARCHAR(255) NOT NULL,
UserPassword VARCHAR(255) NOT NULL,
GenderID INT NOT NULL,
UserRoleID INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY(GenderID) REFERENCES[Gender](ID),
FOREIGN KEY(UserRoleID) REFERENCES [UserRole](ID),
);

INSERT [UserRole] VALUES  ('Уварова', 'Агрипина', 'Валентиновна', 'Сова', 'Agripina17', 'obdxbosmqa', 2, 1);
INSERT [UserRole] VALUES  ('Горбунов', 'Юрин', 'Валерианович', 'Спутник', 'YUrin68', 'hibljzslmv', 1, 2);
INSERT [UserRole] VALUES  ('Федотов', 'Климент', 'Васильевич', 'Фобос', 'Kliment119', 'lpghliewgw', 1, 3);
INSERT [UserRole] VALUES  ('Бобылева', 'Жанна','Петровна', 'Краска', 'Zhanna95', 'ultxzjtryl', 2, 4);
INSERT [UserRole] VALUES  ('Русаков', 'Семен', 'Леонтьевич', 'Стекло', 'Semen150', 'ltlyheruzc', 1, 3);
INSERT [UserRole] VALUES  ('Гусева', 'Юстина', 'Антоновна', 'Буря', 'YUstina138', 'drfocfsdjm', 1, 3);

SELECT * FROM [User];

/*	DROP TABLE [User];		*/