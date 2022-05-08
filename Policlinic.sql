CREATE DATABASE Polyclinic;

USE Polyclinic;

CREATE TABLE DOCTORS(
					[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
					[Surname]		VARCHAR(255) NOT NULL,
					[Name]			VARCHAR(255) NOT NULL,
					[Patronymic]	VARCHAR(255) NOT NULL,
					[Specialization] VARCHAR(255) NOT NULL,
					);
CREATE TABLE PATIENT(
					[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
					[Surname]		VARCHAR(255) NOT NULL,
					[Name]			VARCHAR(255) NOT NULL,
					[Patronymic]	VARCHAR(255) NOT NULL,
					[DateOfBirth]	DATE NOT NULL,
					[Address]		VARCHAR(255) NOT NULL,
					);
CREATE TABLE RECEPTION(
					[ID] INT IDENTITY(1,1)	PRIMARY KEY NOT NULL,
					[TheCostOfAdmission]	VARCHAR(255) NOT NULL,
					[Percent]				VARCHAR(255) NOT NULL,
					[DateOfAdmission]		DATE	NOT NULL,
					[ID_DOCTORS]			INT		NOT NULL,
					[ID_PATIENT]			INT		NOT NULL,
					FOREIGN KEY ([ID_DOCTORS]) REFERENCES DOCTORS([ID]), --one-to-many
					FOREIGN KEY ([ID_PATIENT]) REFERENCES PATIENT([ID]), --one-to-many
					);

INSERT INTO DOCTORS	([Surname],	[Name],	[Patronymic],	[Specialization]) 
VALUES				('Ivanov',	'Ivan', 'Ivanovich',	'Surgeon');

INSERT INTO PATIENT	([Surname],		[Name],		[Patronymic],	[DateOfBirth],	[Address]) 
VALUES				('Ivanovichev',	'Ivan',		'Ivanovich',	'28.03.2001',	'Stavropol territory, Kislovodsk, Pushkin Street, 12');

INSERT INTO RECEPTION	([TheCostOfAdmission],	[Percent],	[DateOfAdmission],	[ID_DOCTORS],	[ID_PATIENT]) 
VALUES					('1500',				'87%',		'2007.09.25',		'1',			'1');

SELECT	RECEPTION.DateOfAdmission AS 'Дата приёма',
		RECEPTION.TheCostOfAdmission AS 'Стоимость приёма',
		RECEPTION.[Percent] AS 'Процент',
		DOCTORS.Surname AS 'Фамилия', 
		DOCTORS.[Name] AS 'Имя', 
		DOCTORS.Patronymic AS 'Отчество', 
		DOCTORS.Specialization AS 'Специализация'
		FROM DOCTORS INNER JOIN RECEPTION ON DOCTORS.ID = ID_DOCTORS;
