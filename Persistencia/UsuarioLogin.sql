USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioLogin]    Script Date: 8/05/2019 9:02:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UsuarioLogin]
    @Nombre NVARCHAR(40),
    @Clave binary(64),
    @responseMessage NVARCHAR(250)='' OUTPUT
AS
BEGIN

    SET NOCOUNT ON
	--declare @Salt AS NVARCHAR(36)
    DECLARE @PKUsuario INT

    IF EXISTS (SELECT TOP 1 Nombre FROM [dbo].[Usuario] WHERE Nombre=@Nombre)
    BEGIN
        SET @PKUsuario = (SELECT PKUsuario FROM [dbo].[Usuario] WHERE Nombre=@Nombre AND ClaveHash = HASHBYTES('SHA2_512', @Clave) and Activo = 1)

       IF(@PKUsuario IS NULL)
           SET @responseMessage='Clave Incorrecta'
       ELSE 
           SET @responseMessage='Puede Entrar'
    END
    ELSE
       SET @responseMessage='Usuario invalido'

END