USE Slivkov;

CREATE TABLE [Gender](
ID INT NOT NULL IDENTITY(1, 1),
GenderName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [Gender] VALUES  ('�������');
INSERT [Gender] VALUES  ('�������');

SELECT * FROM [Gender];

/*	DROP TABLE [Gender];		*/

CREATE TABLE [UserRole](
ID INT NOT NULL IDENTITY(1, 1),
UserRoleName VARCHAR(255) NOT NULL,
PRIMARY KEY (ID)
);

INSERT [UserRole] VALUES  ('������������� �������');
INSERT [UserRole] VALUES  ('���������� �� ��');
INSERT [UserRole] VALUES  ('������������ ������');
INSERT [UserRole] VALUES  ('�������� ���');

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

INSERT [UserRole] VALUES  ('�������', '��������', '������������', '����', 'Agripina17', 'obdxbosmqa', 2, 1);
INSERT [UserRole] VALUES  ('��������', '����', '������������', '�������', 'YUrin68', 'hibljzslmv', 1, 2);
INSERT [UserRole] VALUES  ('�������', '�������', '����������', '�����', 'Kliment119', 'lpghliewgw', 1, 3);
INSERT [UserRole] VALUES  ('��������', '�����','��������', '������', 'Zhanna95', 'ultxzjtryl', 2, 4);
INSERT [UserRole] VALUES  ('�������', '�����', '����������', '������', 'Semen150', 'ltlyheruzc', 1, 3);
INSERT [UserRole] VALUES  ('������', '������', '���������', '����', 'YUstina138', 'drfocfsdjm', 1, 3);

SELECT * FROM [User];

/*	DROP TABLE [User];		*/