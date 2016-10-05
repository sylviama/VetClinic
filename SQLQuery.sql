/*
  Vet Clinic Database
  Author: Sylvia Ma
  DB Server: SqlServer
*/

/*Drop database if it exists*/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name=N'VetClinic')
BEGIN
	ALTER DATABASE [VetClinic] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [VetClinic] SET ONLINE;
	DROP DATABASE [VetClinic];
END

GO
/*Create Database*/
CREATE DATABASE [VetClinic];
GO

USE[VetClinic];
GO

/*Create Tables*/
CREATE TABLE [dbo].[Pet]
(
	[PetId] INT NOT NULL,
	[PetName] NVARCHAR(30) NOT NULL,
	[HumanOwnderId] INT NOT NULL,
	[VetId] INT NOT NULL,
	[AnimalTypeId] INT NOT NULL,
	[Breed] BOOL,
	CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED([PetId])
);

GO
CREATE TABLE [dbo].[Vet]
(
	[VetId] INT NOT NULL,
	[VetFirstName] NVARCHAR(40) NOT NULL,
	[VetLastName] NVARCHAR(40) NOT NULL,
	CONSTRAINT [PK_Vet] PRIMARY KEY CLUSTERED([VetId])
);

GO
CREATE TABLE [dbo].[Owner]
(
	[OwnerId] INT NOT NULL,
	[OwnerFirstName] NVARCHAR(40) NOT NULL,
	[OwnerLastName] NVARCHAR(40) NOT NULL,
	CONSTRAINT [PK_Owner] PRIMARY KEY CLUSTERED([OwnerId])
);

GO
CREATE TABLE [dbo].[AnimalType]
(
	[AnimalTypeId] INT NOT NULL,
	[AnimalTypeNmae] NVARCHAR(40) NOT NULL,
	CONSTRAINT [PK_AnimalType] PRIMARY KEY CLUSTERED([AnimalTypeId])
);

/*Create Foreign Key*/
ALTER TABLE [dbo].[Pet] ADD CONSTRAINT [FK_HumanOwnerId]
    FOREIGN KEY ([HumanOwnerId]) REFERENCES [dbo].[Owner] ([OwnerId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
CREATE INDEX [IFK_PetHumanOwnerId] ON [dbo].[Pet] ([HumanOwnerId]);

GO
ALTER TABLE [dbo].[Pet] ADD CONSTRAINT [FK_VetId]
    FOREIGN KEY ([VetId]) REFERENCES [dbo].[Vet] ([VetId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
CREATE INDEX [IFK_PetVetId] ON [dbo].[Pet] ([VetId]);

GO
ALTER TABLE [dbo].[Pet] ADD CONSTRAINT [FK_AnimalTypeId]
    FOREIGN KEY ([AnimalTypeId]) REFERENCES [dbo].[AnimalType] ([AnimalTypeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
CREATE INDEX [IFK_PetAnimalTypeId] ON [dbo].[Pet] ([AnimalTypeId]);

GO
/*populate tables*/
INSERT INTO [dbo].[Vet]([VetId],[VetFirstName],[VetLastName]) VALUES (1, Akuna, Ma);
INSERT INTO [dbo].[Vet]([VetId],[VetFirstName],[VetLastName]) VALUES (2, Sylvia, Flying);
INSERT INTO [dbo].[Vet]([VetId],[VetFirstName],[VetLastName]) VALUES (3, Kate, Grey);

INSERT INTO [dbo].[Owner]([OnwerId],[OwnerFirstName],[OnwerLastName]) VALUES (1, Ning, Wu);
INSERT INTO [dbo].[Owner]([OnwerId],[OwnerFirstName],[OnwerLastName]) VALUES (2, Matt, Lauren);
INSERT INTO [dbo].[Owner]([OnwerId],[OwnerFirstName],[OnwerLastName]) VALUES (1, Bob, Kow);

INSERT INTO [dbo].[AnimalType]([AnimalTypeId],[AnimalTypeNmae]) VALUES (1, Dog);
INSERT INTO [dbo].[AnimalType]([AnimalTypeId],[AnimalTypeNmae]) VALUES (2, Cat);

INSERT INTO [dbo].[Pet]([PetId],[PetName],[HumanOwnderId], [VetId], [AnimalTypeId],[Breed]) VALUES (1, MiaoXiang, 1, 2, 2, true);
INSERT INTO [dbo].[Pet]([PetId],[PetName],[HumanOwnderId], [VetId], [AnimalTypeId],[Breed]) VALUES (2, Bian, 2, 3, 2, true);
INSERT INTO [dbo].[Pet]([PetId],[PetName],[HumanOwnderId], [VetId], [AnimalTypeId],[Breed]) VALUES (3, Shalu, 3, 2, 2, false);
