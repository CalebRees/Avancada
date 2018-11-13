
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/13/2018 03:50:48
-- Generated from EDMX file: C:\Users\Renato\Source\Repos\Avancada2\Avancada\Avancada\Models\AvanBD.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClienteTransacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transacao] DROP CONSTRAINT [FK_ClienteTransacao];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioTransacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Transacao] DROP CONSTRAINT [FK_UsuarioTransacao];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioRefeicao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Refeicao] DROP CONSTRAINT [FK_UsuarioRefeicao];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsuarioSet] DROP CONSTRAINT [FK_UsuarioCliente];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Refeicao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Refeicao];
GO
IF OBJECT_ID(N'[dbo].[Cliente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cliente];
GO
IF OBJECT_ID(N'[dbo].[Transacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Transacao];
GO
IF OBJECT_ID(N'[dbo].[UsuarioSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsuarioSet];
GO
IF OBJECT_ID(N'[dbo].[SACSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SACSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Refeicao'
CREATE TABLE [dbo].[Refeicao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Principal] nvarchar(45)  NOT NULL,
    [Salada] nvarchar(45)  NOT NULL,
    [Bebida] nvarchar(45)  NOT NULL,
    [Sobremesa] nvarchar(45)  NOT NULL,
    [Vegetariana] nvarchar(45)  NOT NULL,
    [UsuarioId] int  NOT NULL,
    [Data] datetime  NOT NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Saldo] decimal(5,2)  NOT NULL,
	[Tipo]  nvarchar(max) NOT NULL CHECK ([Tipo]  IN('Professor', 'Aluno', 'Funcionario')),);
GO

-- Creating table 'Transacao'
CREATE TABLE [dbo].[Transacao] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Valor] decimal(3,2)  NOT NULL,
	[Forma] nvarchar(max) NOT NULL CHECK ([Forma] IN('CartaoCredito', 'Debito', 'Credito','Dinheiro')),
    [ClienteId] int  NOT NULL,
    [UsuarioId] int  NOT NULL
);
GO

-- Creating table 'UsuarioSet'
CREATE TABLE [dbo].[UsuarioSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL,
    [CPF] nvarchar(max)  NOT NULL,
	[Tipo] nvarchar(max) NOT NULL CHECK ([Tipo] IN('Gerente', 'Nutricionista', 'Caixa','Cliente')),
    [Cliente_Id] int  NOT NULL
);
GO

-- Creating table 'SACSet'
CREATE TABLE [dbo].[SACSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [mensagem] nvarchar(max)  NOT NULL,
    [data] nvarchar(max)  NOT NULL,
    [tipo] nvarchar(max)  NOT NULL,
    [tipoclientr] nvarchar(max)  NOT NULL,
    [Property1] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

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

-- Creating primary key on [Id] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [PK_UsuarioSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SACSet'
ALTER TABLE [dbo].[SACSet]
ADD CONSTRAINT [PK_SACSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

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

-- Creating foreign key on [UsuarioId] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [FK_UsuarioTransacao]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[UsuarioSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioTransacao'
CREATE INDEX [IX_FK_UsuarioTransacao]
ON [dbo].[Transacao]
    ([UsuarioId]);
GO

-- Creating foreign key on [UsuarioId] in table 'Refeicao'
ALTER TABLE [dbo].[Refeicao]
ADD CONSTRAINT [FK_UsuarioRefeicao]
    FOREIGN KEY ([UsuarioId])
    REFERENCES [dbo].[UsuarioSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioRefeicao'
CREATE INDEX [IX_FK_UsuarioRefeicao]
ON [dbo].[Refeicao]
    ([UsuarioId]);
GO

-- Creating foreign key on [Cliente_Id] in table 'UsuarioSet'
ALTER TABLE [dbo].[UsuarioSet]
ADD CONSTRAINT [FK_UsuarioCliente]
    FOREIGN KEY ([Cliente_Id])
    REFERENCES [dbo].[Cliente]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCliente'
CREATE INDEX [IX_FK_UsuarioCliente]
ON [dbo].[UsuarioSet]
    ([Cliente_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------