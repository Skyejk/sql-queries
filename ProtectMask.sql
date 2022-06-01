CREATE DATABASE protectmask;

USE protectmask;


CREATE TABLE AGENT_TYPE(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title] VARCHAR(50) NOT NULL,
	[Image] VARCHAR(100) NULL,
);
/*
*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
*ДАННАЯ БАЗА ЕЩЁ НЕ ЗАКОНЧЕНА!
*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
**/
CREATE TABLE AGENT(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]         VARCHAR(150)    NOT NULL,
	[Address]       VARCHAR(255)    NULL,
	[INN]           VARCHAR(12)     NOT NULL,
	[KPP]           VARCHAR(9)      NULL,
	[DirectorName]  VARCHAR(100)    NULL,
	[Phone]         VARCHAR(20)     NOT NULL,
	[Email]         VARCHAR(255)    NULL,
	[Logo]          VARCHAR(100)    NULL,
	[Priority]      INT             NOT NULL,
    [ID_AGENT_TYPE] INT             NOT NULL,
    FOREIGN KEY ([ID_AGENT_TYPE]) REFERENCES AGENT_TYPE([ID]), --one-to-many
);

CREATE TABLE AGENT_PRIORITY_HISTORY(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ChangeDate]    DATETIME    NOT NULL,
	[PriorityValue] INT         NOT NULL,
    [ID_AGENT]      INT         NOT NULL,
    FOREIGN KEY ([ID_AGENT]) REFERENCES AGENT([ID]), --one-to-many
);

CREATE TABLE SUPPLIER(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]         VARCHAR(150)    NOT NULL,
	[INN]           VARCHAR(12)     NOT NULL,
	[StartDate]     DATE            NOT NULL,
	[QualityRating] INT             NULL,
	[SupplierType]  VARCHAR(20)     NULL,
);

CREATE TABLE MATERIAL_TYPE(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]             VARCHAR(50) NOT NULL,
	[DefectedPercent]   FLOAT       NOT NULL,
);

CREATE TABLE MATERIAL(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]         VARCHAR(100)    NOT NULL,
	[CountInPack]   INT             NOT NULL,
	[Unit]          VARCHAR(10)     NOT NULL,
	[CountInStock]  FLOAT           NULL,
	[MinCount]      FLOAT           NOT NULL,
	[Description]   VARCHAR(MAX)    NULL,
	[Cost]          DECIMAL(10, 2)  NOT NULL,
	[Image]         VARCHAR(100)    NULL,
	[ID_MATERIAL_TYPE] INT          NOT NULL,
    FOREIGN KEY ([ID_MATERIAL_TYPE]) REFERENCES MATERIAL_TYPE([ID]), --one-to-many
);

CREATE TABLE MATERIAL_COUNT_HISTORY(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ChangeDate]    DATETIME    NOT NULL,
	[CountValue]    FLOAT       NOT NULL,
    [ID_MATERIAL]   INT         NOT NULL,
    FOREIGN KEY ([ID_MATERIAL]) REFERENCES MATERIAL([ID]), --one-to-many
);

CREATE TABLE MATERIAL_SUPPLIER(
	[ID_MATERIAL] INT NOT NULL,
	[ID_SUPPLIER] INT NOT NULL,
	PRIMARY KEY CLUSTERED
    (
		[ID_MATERIAL],
		[ID_SUPPLIER]
    ),
    FOREIGN KEY ([ID_MATERIAL]) REFERENCES MATERIAL([ID]), --many-to-many
    FOREIGN KEY ([ID_SUPPLIER]) REFERENCES SUPPLIER([ID]), --many-to-many
);



CREATE TABLE PRODUCT(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]         VARCHAR(100)        NOT NULL,
	[ArticleNumber] VARCHAR(10)         NOT NULL,
	[Description]   VARCHAR(MAX)        NULL,
	[Image]         VARCHAR(100)        NULL,
	[ProductionPersonCount]     INT     NULL,
	[ProductionWorkshopNumber]  INT     NULL,
	[MinCostForAgent] DECIMAL(10, 2)    NOT NULL,
    [ID_PRODUCT_TYPE]           INT     NULL,
);

CREATE TABLE PRODUCT_COST_HISTORY(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[ChangeDate]    DATETIME        NOT NULL,
	[CostValue]     DECIMAL(10, 2)  NOT NULL,
    [ID_PRODUCT]    INT             NOT NULL,
);

CREATE TABLE PRODUCT_MATERIAL(
    [Count]         FLOAT   NULL,
	[ID_PRODUCT]    INT     NOT NULL,
	[ID_MATERIAL]   INT     NOT NULL,
    PRIMARY KEY CLUSTERED
    (
	    [ID_PRODUCT],
	    [ID_MATERIAL]
    )
);

CREATE TABLE PRODUCT_SALE(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[SaleDate]      DATE NOT NULL,
	[ProductCount]  INT NOT NULL,
    [ID_AGENT]      INT NOT NULL,
	[ID_PRODUCT]    INT NOT NULL,
);

CREATE TABLE PRODUCT_TYPE(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]             VARCHAR(50)     NOT NULL,
	[DefectedPercent]   FLOAT           NOT NULL,
);

CREATE TABLE SHOP(
	[ID] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Title]     VARCHAR(150)    NOT NULL,
	[Address]   VARCHAR(300)    NULL,
	[ID_AGENT]  INT             NOT NULL,
);


/*
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
*/
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
