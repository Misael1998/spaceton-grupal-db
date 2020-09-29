USE spacethon
GO
-- Create a new stored procedure called 'SP_REGISTER_USER' in schema ' dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N' dbo'
    AND SPECIFIC_NAME = N'SP_REGISTER_USER'
)
DROP PROCEDURE  dbo.SP_REGISTER_USER
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE  dbo.SP_REGISTER_USER
    @firstName  VARCHAR(100),
    @lastName   VARCHAR(100),
    @email      VARCHAR(500),
    @password   VARCHAR(MAX),
    @role       VARCHAR(10),
    @status     VARCHAR(1) out,
    @userID     INT = NULL out
-- add more stored procedure parameters here
AS
-- body of the stored procedure
DECLARE @user table (id int)
-- Insert rows into table 'spacethon.dbo.TBL_USUARIOS'
INSERT INTO spacethon.dbo.TBL_USUARIOS
    ( -- columns to insert data into
    nombre,
    apellido,
    email,
    password,
    rol
    )
OUTPUT inserted.id_usuario into @user
VALUES
    ( -- first row: values for the columns in the list above
        @firstName,
        @lastName,
        @email,
        @password,
        @role
    )

set @userID = (select id
from @user)
set @status = 's'
return
GO