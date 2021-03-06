USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 8/05/2019 3:15:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearUsuario]
	   @Nombre nvarchar(40)
      ,@ClaveHash binary(64)
      ,@Nombres  nvarchar(40)
      ,@Apellido nvarchar(40)
      ,@Direccion nvarchar(60)
      ,@Telefono nvarchar(12)
      ,@Correo nvarchar(30)
      ,@Edad tinyint
      ,@Activo bit
	  ,@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY

	INSERT INTO [dbo].[Usuario]
           ([Nombre]
           ,[ClaveHash]
           ,[Nombres]
           ,[Apellido]
           ,[Direccion]
           ,[Telefono]
           ,[Correo]
           ,[Edad]
           ,[Activo])
     VALUES
           (@Nombre
           ,HASHBYTES('SHA2_512', @ClaveHash)
           ,@Nombres
           ,@Apellido 
           ,@Direccion
           ,@Telefono 
           ,@Correo
           ,@Edad
           ,@Activo)


        SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END



GO
