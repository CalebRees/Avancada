
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/14/2018 02:57:32
-- Generated from EDMX file: C:\Users\reesc\Source\Repos\CalebRees\Avancada\Avancada\Avancada\Models\AvanBD.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'SAC'
CREATE TABLE [dbo].[SAC] (
    [IdSAC] int IDENTITY(1,1) NOT NULL,
    [Mensagem] nvarchar(max)  NOT NULL,
    [Data] datetime  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [UsuarioIdUsuario] int  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [IdUsuario] int IDENTITY(1,1) NOT NULL,
    [Nome] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Senha] nvarchar(max)  NOT NULL,
    [CPF] nvarchar(max)  NOT NULL,
    [Tipo] int  NOT NULL
);
GO

-- Creating table 'Cliente'
CREATE TABLE [dbo].[Cliente] (
    [IdCliente] int IDENTITY(1,1) NOT NULL,
    [Saldo] decimal(18,0)  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [Usuario_IdUsuario] int  NOT NULL
);
GO

-- Creating table 'Refeicao'
CREATE TABLE [dbo].[Refeicao] (
    [IdRefeicao] int IDENTITY(1,1) NOT NULL,
    [Principal] nvarchar(max)  NOT NULL,
    [Salada] nvarchar(max)  NOT NULL,
    [Bebida] nvarchar(max)  NOT NULL,
    [Sobremesa] nvarchar(max)  NOT NULL,
    [Vegetariana] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [Dia] datetime  NOT NULL,
    [UsuarioIdUsuario] int  NOT NULL
);
GO

-- Creating table 'Transacao'
CREATE TABLE [dbo].[Transacao] (
    [IdTransacao] int IDENTITY(1,1) NOT NULL,
    [Data] datetime  NOT NULL,
    [Valor] decimal(18,0)  NOT NULL,
    [Forma] nvarchar(max)  NOT NULL,
    [Tipo] nvarchar(max)  NOT NULL,
    [UsuarioIdUsuario] int  NOT NULL,
    [ClienteIdCliente] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdSAC] in table 'SAC'
ALTER TABLE [dbo].[SAC]
ADD CONSTRAINT [PK_SAC]
    PRIMARY KEY CLUSTERED ([IdSAC] ASC);
GO

-- Creating primary key on [IdUsuario] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([IdUsuario] ASC);
GO

-- Creating primary key on [IdCliente] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [PK_Cliente]
    PRIMARY KEY CLUSTERED ([IdCliente] ASC);
GO

-- Creating primary key on [IdRefeicao] in table 'Refeicao'
ALTER TABLE [dbo].[Refeicao]
ADD CONSTRAINT [PK_Refeicao]
    PRIMARY KEY CLUSTERED ([IdRefeicao] ASC);
GO

-- Creating primary key on [IdTransacao] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [PK_Transacao]
    PRIMARY KEY CLUSTERED ([IdTransacao] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UsuarioIdUsuario] in table 'SAC'
ALTER TABLE [dbo].[SAC]
ADD CONSTRAINT [FK_SACUsuario]
    FOREIGN KEY ([UsuarioIdUsuario])
    REFERENCES [dbo].[Usuario]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SACUsuario'
CREATE INDEX [IX_FK_SACUsuario]
ON [dbo].[SAC]
    ([UsuarioIdUsuario]);
GO

-- Creating foreign key on [UsuarioIdUsuario] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [FK_UsuarioTransacao]
    FOREIGN KEY ([UsuarioIdUsuario])
    REFERENCES [dbo].[Usuario]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioTransacao'
CREATE INDEX [IX_FK_UsuarioTransacao]
ON [dbo].[Transacao]
    ([UsuarioIdUsuario]);
GO

-- Creating foreign key on [Usuario_IdUsuario] in table 'Cliente'
ALTER TABLE [dbo].[Cliente]
ADD CONSTRAINT [FK_UsuarioCliente]
    FOREIGN KEY ([Usuario_IdUsuario])
    REFERENCES [dbo].[Usuario]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsuarioCliente'
CREATE INDEX [IX_FK_UsuarioCliente]
ON [dbo].[Cliente]
    ([Usuario_IdUsuario]);
GO

-- Creating foreign key on [UsuarioIdUsuario] in table 'Refeicao'
ALTER TABLE [dbo].[Refeicao]
ADD CONSTRAINT [FK_RefeicaoUsuario]
    FOREIGN KEY ([UsuarioIdUsuario])
    REFERENCES [dbo].[Usuario]
        ([IdUsuario])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RefeicaoUsuario'
CREATE INDEX [IX_FK_RefeicaoUsuario]
ON [dbo].[Refeicao]
    ([UsuarioIdUsuario]);
GO

-- Creating foreign key on [ClienteIdCliente] in table 'Transacao'
ALTER TABLE [dbo].[Transacao]
ADD CONSTRAINT [FK_ClienteTransacao]
    FOREIGN KEY ([ClienteIdCliente])
    REFERENCES [dbo].[Cliente]
        ([IdCliente])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteTransacao'
CREATE INDEX [IX_FK_ClienteTransacao]
ON [dbo].[Transacao]
    ([ClienteIdCliente]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------