IF OBJECT_ID (N'TF_GET_USER') IS NOT NULL  
    DROP FUNCTION TF_GET_USER;  
GO
create function TF_GET_USER(@email VARCHAR(100))
returns TABLE
AS
RETURN(
    SELECT email, password, nombre as firstName, apellido as lastName, rol as role, id_usuario as id
FROM TBL_USUARIOS
where email = @email
)
GO