/*
USE MS SQL
*/

-- Создаем таблицу ролей
CREATE TABLE [Roles] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL UNIQUE
);

-- Создаем таблицу пользователей
CREATE TABLE [Users] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [PasswordHash] VARBINARY(64) NOT NULL,
    [Salt] VARBINARY(32) NOT NULL,
	[RoleID] INT NOT NULL,
	FOREIGN KEY (RoleID) REFERENCES [Roles](ID)
);

-- Добавляем начальные значения в таблицу ролей
INSERT INTO [Roles] ([Name])
VALUES ('Officer'), ('Admin'), ('User');
