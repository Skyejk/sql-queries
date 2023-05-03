USE MSSQLServer.dbo;

CREATE TABLE [Human](
	ID INT IDENTITY(1,1) NOT NULL,
	Surname VARCHAR(50) NOT NULL,
	Firstname VARCHAR(50) NOT NULL,
	Patronymic VARCHAR(50),
	DateOfBirth DATE NOT NULL,
	Gender CHAR(1) NOT NULL,
	PassportSeria CHAR(4) NOT NULL,
	PassportNumber CHAR(6) NOT NULL,
	PhoneNumber VARCHAR(12) NOT NULL,
	AdditionalNumber VARCHAR(12),
	EmailAddress VARCHAR(100) NOT NULL,
	PRIMARY KEY (ID),
);

CREATE TABLE [Group](
	ID INT IDENTITY(1,1) NOT NULL,
	GroupName VARCHAR(50) NOT NULL UNIQUE,
	ShortGroupName VARCHAR(15) NOT NULL UNIQUE,
	PRIMARY KEY (ID),
);

INSERT [Group] VALUES	('Компьютерные системы и комплексы', '09.02.01'),
						('Компьютерные сети', '09.02.02'),
						('Программные решения для бизнеса', '09.02.03'),
						('Информационные системы (по отраслям)', '09.02.04'),
						('Прикладная информатика (по отраслям)', '09.02.05'),
						('Сетевое и системное администрирование', '09.02.06'),
						('Информационные системы и программирование', '09.02.07'),
						('Мастер по обработке цифровой информации', '230103.02'),
						('Наладчик компьютерных сетей', '230103.03'),
						('Наладчик аппаратного и программного обеспечения', '230103.04');

CREATE TABLE [Student](
	ID INT IDENTITY(1,1) NOT NULL,
	HumanID INT NOT NULL,
	GroupID INT NOT NULL,
	Course SMALLINT NOT NULL,-- значение 0 для тех, кто уже выпустился
	DateOfReceipt DATE NOT NULL,
	DateOfIssue DATE NOT NULL,


	PRIMARY KEY (ID),
	FOREIGN KEY (HumanID) REFERENCES[Human](ID),
	FOREIGN KEY (GroupID) REFERENCES[Group](ID),
);

CREATE TABLE [Lesson](
	ID INT IDENTITY(1,1) NOT NULL,
	LessonName VARCHAR(100) NOT NULL UNIQUE,
	PRIMARY KEY (ID),
);
INSERT [Group] VALUES	('Основы программирования'),
						('Основы баз данных'),
						('Программирование на языке C#'),
						('Программирование на языке C++'),
						('Программирование на языке Phyton'),
						('Программирование на языке Rubby'),
						('Программирование на языке Java'),
						('Проектирование'),
						('Математическая логика'),
						('Теория вероятности'),
						('Проектирование');

CREATE TABLE [Teacher](
	ID INT IDENTITY(1,1) NOT NULL,
	HumanID INT NOT NULL,
	LessonID INT NOT NULL,
	DateOfEmployment DATE NOT NULL,
	DateOfDismissal DATE NOT NULL,


	PRIMARY KEY (ID),
	FOREIGN KEY (HumanID) REFERENCES[Human](ID),
	FOREIGN KEY (LessonID) REFERENCES[Lesson](ID),
);
