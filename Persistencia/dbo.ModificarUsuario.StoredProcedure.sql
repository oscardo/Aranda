USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 8/05/2019 3:15:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ModificarUsuario]
	   @Nombre nvarchar(40)
      ,@ClaveHashAnt binary(64)
      ,@ClaveHashNue binary(64)
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

	UPDATE [dbo].[Usuario]
	SET [ClaveHash] = HASHBYTES('SHA2_512', @ClaveHashNue)
      ,[Nombres] = @Nombres
      ,[Apellido] = @Apellido
      ,[Direccion] = @Direccion
      ,[Telefono] = @Telefono
      ,[Correo] = @Correo
      ,[Edad] = @Edad
      ,[Activo] = @Activo
	WHERE Nombre = @Nombre and 
	ClaveHash = HASHBYTES('SHA2_512', @ClaveHashAnt)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END



GO
