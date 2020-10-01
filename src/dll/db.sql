USE master
GO

IF NOT EXISTS (
  SELECT [name]
FROM sys.databases
WHERE [name] = N'spacethon'
)
CREATE DATABASE spacethon
GO

-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_TEMPERATURA]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_TEMPERATURA]
(
    id_temperatura INT NOT NULL IDENTITY(1,1),
    temperatura INT NOT NULL,
    PRIMARY KEY (id_temperatura)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_PRESION_ATMOSFERICA] 
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_PRESION_ATMOSFERICA ]
(
    id_presion_atmosferica INT NOT NULL IDENTITY(1,1),
    presion_atmosferica INT NOT NULL,
    PRIMARY KEY (id_presion_atmosferica)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_ALTURA_RIO]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_ALTURA_RIO]
(
    id_altura_rio INT NOT NULL IDENTITY(1,1),
    altura_rio INT NOT NULL,
    PRIMARY KEY (id_altura_rio)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_CAUDAL]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_CAUDAL]
(
    id_caudal INT NOT NULL IDENTITY(1,1),
    caudal INT NOT NULL,
    PRIMARY KEY (id_caudal)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_PRECIPITACION]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_PRECIPITACION]
(
    id_precipitacion INT NOT NULL IDENTITY(1,1),
    precipitacion INT NOT NULL,
    PRIMARY KEY (id_precipitacion)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_MEDICIONES]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_MEDICIONES]
(
    id_mediciones INT NOT NULL IDENTITY(1,1),
    id_temperatura INT NULL,
    id_presion_atmosferica INT NULL,
    id_altura_rio INT NULL,
    id_caudal INT NULL,
    id_precipitacion INT NULL,
    fecha_medicion DATETIME NOT NULL,
    PRIMARY KEY ( id_mediciones ),
    CONSTRAINT  fk_TBL_MEDICIONES_TBL_TEMPERATURA 
    FOREIGN KEY ( id_temperatura )
    REFERENCES    TBL_TEMPERATURA  ( id_temperatura )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT  fk_TBL_MEDICIONES_TBL_PRESION_ATMOSFERICA1 
    FOREIGN KEY ( id_presion_atmosferica )
    REFERENCES    TBL_PRESION_ATMOSFERICA  ( id_presion_atmosferica )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT  fk_TBL_MEDICIONES_TBL_ALTURA_RIO1 
    FOREIGN KEY ( id_altura_rio )
    REFERENCES    TBL_ALTURA_RIO  ( id_altura_rio )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT  fk_TBL_MEDICIONES_TBL_CAUDAL1 
    FOREIGN KEY ( id_caudal )
    REFERENCES    TBL_CAUDAL  ( id_caudal )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT  fk_TBL_MEDICIONES_TBL_PRECIPITACION1 
    FOREIGN KEY ( id_precipitacion )
    REFERENCES    TBL_PRECIPITACION  ( id_precipitacion )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)

-- -----------------------------------------------------
-- Table [spacethon].[dbo].TBL_INSTITUCIONES
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_INSTITUCIONES]
(
    id_institucion INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_institucion)
)

-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_USUARIOS]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_USUARIOS]
(
    id_usuario INT NOT NULL IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(500) NOT NULL UNIQUE,
    password VARCHAR(MAX) NOT NULL,
    rol VARCHAR(10) NOT NULL,
    id_institucion INT NOT NULL,
    PRIMARY KEY ( id_usuario ),
    CONSTRAINT fk_TBL_USUARIOS_TBL_INSTITUCIONES1
    FOREIGN KEY (id_institucion)
    REFERENCES TBL_INSTITUCIONES (id_institucion)
)


-- -----------------------------------------------------
-- Table [spacethon].[dbo].[TBL_LOGS]
-- -----------------------------------------------------
CREATE TABLE [spacethon].[dbo].[TBL_LOGS]
(
    id_log INT NOT NULL IDENTITY(1,1),
    fecha DATETIME NULL,
    id_mediciones INT NOT NULL,
    id_usuarios INT NOT NULL,
    PRIMARY KEY ( id_log ),
    CONSTRAINT  fk_TBL_LOGS_TBL_MEDICIONES1 
    FOREIGN KEY
( id_mediciones )
    REFERENCES    TBL_MEDICIONES
( id_mediciones )
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
    CONSTRAINT  fk_TBL_LOGS_TBL_USUARIOS1
FOREIGN KEY
( id_usuarios )
    REFERENCES    TBL_USUARIOS
( id_usuario )
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION
)
