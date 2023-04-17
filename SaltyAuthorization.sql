/*
USE MS SQL
*/

-- Создаем таблицу пользователей
CREATE TABLE [Users] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [PasswordHash] VARBINARY(64) NOT NULL,
    [Salt] VARBINARY(32) NOT NULL
);

-- Создаем таблицу ролей
CREATE TABLE [Roles] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL UNIQUE
);

-- Создаем таблицу связей между пользователями и их ролями
CREATE TABLE [UserRoles] (
    [UserId] INT NOT NULL,
    [RoleId] INT NOT NULL,
    CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC),
    CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([Id])
);

-- Добавляем начальные значения в таблицу ролей
INSERT INTO [Roles] ([Name])
VALUES ('Officer'), ('Admin'), ('User');
