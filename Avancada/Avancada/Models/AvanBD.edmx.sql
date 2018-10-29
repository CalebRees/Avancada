
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/24/2018 14:12:03
-- Generated from EDMX file: C:\Users\RenatoNR\source\repos\CalebRees\Avancada\Avancada\Avancada\Models\AvanBD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AvancadaBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_NutricionistaCardapio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cardapio] DROP CONSTRAINT [FK_NutricionistaCardapio];
GO
IF OBJECT_ID(N'[dbo].[FK_RefeicaoCardapio]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cardapio] DROP CONSTRAINT [FK_RefeicaoCardapio];
GO
IF OBJECT_ID(N'[dbo].[FK_ClienteTransacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transacao] DROP CONSTRAINT [FK_ClienteTransacao];
GO
IF OBJECT_ID(N'[dbo].[FK_FuncionarioTransacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transacao] DROP CONSTRAINT [FK_FuncionarioTransacao];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Nutricionista]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Nutricionista];
GO
IF OBJECT_ID(N'[dbo].[Cardapio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cardapio];
GO
IF OBJECT_ID(N'[dbo].[Refeicao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Refeicao];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Transacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transacao];
GO
IF OBJECT_ID(N'[dbo].[GerenteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GerenteSet];
GO
IF OBJECT_ID(N'[dbo].[FuncionarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FuncionarioSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Nutricionista'
CREATE TABLE [dbo].[Nutricionista] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(90)  NOT NULL,
    [Email] nvarchar(45)  NOT NULL,
    [Senha] nvarchar(45)  NOT NULL,
    [CPF] nvarchar(11)  NOT NULL,
    [Salario] decimal(5,2)  NOT NULL
);
GO

-- Creating table 'Cardapio'
CREATE TABLE [dbo].[Cardapio] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Aprovacao] bit  NOT NULL,
    [NutricionistaId] int  NOT NULL,
    [RefeicaoId] int  NOT NULL
);
GO

-- Creating table 'Refeicao'
CREATE TABLE [dbo].[Refeicao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Principal] nvarchar(45)  NOT NULL,
    [Salada] nvarchar(45)  NOT NULL,
    [Bebida] nvarchar(45)  NOT NULL,
    [Sobremesa] nvarchar(45)  NOT NULL,
    [Vegetariana] nvarchar(45)  NOT NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(90)  NOT NULL,
    [Email] nvarchar(35)  NOT NULL,
    [Senha] nvarchar(16)  NOT NULL,
    [CPF] nvarchar(11)  NOT NULL,
    [Saldo] decimal(5,2)  NOT NULL,
    [Inteiro] int  NOT NULL
);
GO

-- Creating table 'Transacao'
CREATE TABLE [dbo].[Transacao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Valor] decimal(3,2)  NOT NULL,
    [Forma] int  NOT NULL,
    [ClienteId] int  NOT NULL,
    [FuncionarioId] int  NOT NULL
);
GO

-- Creating table 'GerenteSet'
CREATE TABLE [dbo].[GerenteSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(90)  NOT NULL,
    [Email] nvarchar(45)  NOT NULL,
    [Senha] nvarchar(45)  NOT NULL,
    [CPF] nvarchar(11)  NOT NULL,
    [Salario] decimal(5,2)  NOT NULL
);
GO

-- Creating table 'FuncionarioSet'
CREATE TABLE [dbo].[FuncionarioSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(90)  NOT NULL,
    [Email] nvarchar(45)  NOT NULL,
    [Senha] nvarchar(45)  NOT NULL,
    [CPF] nvarchar(11)  NOT NULL,
    [Salario] decimal(5,2)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Nutricionista'
ALTER TABLE [dbo].[Nutricionista]
ADD CONSTRAINT [PK_Nutricionista]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cardapio'
ALTER TABLE [dbo].[Cardapio]
ADD CONSTRAINT [PK_Cardapio]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Refeicao'
ALTER TABLE [dbo].[Refeicao]
ADD CONSTRAINT [PK_Refeicao]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [PK_Transacao]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'GerenteSet'
ALTER TABLE [dbo].[GerenteSet]
ADD CONSTRAINT [PK_GerenteSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FuncionarioSet'
ALTER TABLE [dbo].[FuncionarioSet]
ADD CONSTRAINT [PK_FuncionarioSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [NutricionistaId] in table 'Cardapio'
ALTER TABLE [dbo].[Cardapio]
ADD CONSTRAINT [FK_NutricionistaCardapio]
    FOREIGN KEY ([NutricionistaId])
    REFERENCES [dbo].[Nutricionista]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NutricionistaCardapio'
CREATE INDEX [IX_FK_NutricionistaCardapio]
ON [dbo].[Cardapio]
    ([NutricionistaId]);
GO

-- Creating foreign key on [RefeicaoId] in table 'Cardapio'
ALTER TABLE [dbo].[Cardapio]
ADD CONSTRAINT [FK_RefeicaoCardapio]
    FOREIGN KEY ([RefeicaoId])
    REFERENCES [dbo].[Refeicao]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RefeicaoCardapio'
CREATE INDEX [IX_FK_RefeicaoCardapio]
ON [dbo].[Cardapio]
    ([RefeicaoId]);
GO

-- Creating foreign key on [ClienteId] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [FK_ClienteTransacao]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteTransacao'
CREATE INDEX [IX_FK_ClienteTransacao]
ON [dbo].[Transacao]
    ([ClienteId]);
GO

-- Creating foreign key on [FuncionarioId] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [FK_FuncionarioTransacao]
    FOREIGN KEY ([FuncionarioId])
    REFERENCES [dbo].[FuncionarioSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FuncionarioTransacao'
CREATE INDEX [IX_FK_FuncionarioTransacao]
ON [dbo].[Transacao]
    ([FuncionarioId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------