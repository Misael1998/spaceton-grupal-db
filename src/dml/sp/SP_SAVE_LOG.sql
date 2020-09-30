-- Create a new stored procedure called 'SP_SAVE_LOG' in schema 'spacethon.dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'spacethon.dbo'
    AND SPECIFIC_NAME = N'SP_SAVE_LOG'
)
DROP PROCEDURE dbo.SP_SAVE_LOG
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.SP_SAVE_LOG
    @user       int,
    @reading    int
-- add more stored procedure parameters here
AS
-- Insert rows into table 'TBL_LOGS'
INSERT INTO TBL_LOGS
    ( -- columns to insert data into
    [id_usuarios], [id_mediciones], [fecha]
    )
VALUES
    ( -- first row: values for the columns in the list above
        @user, @reading, GETDATE()
    )
GO