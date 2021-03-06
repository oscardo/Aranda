USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 8/05/2019 3:15:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
	   @Nombre nvarchar(40)
      ,@ClaveHash binary(64)
      ,@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY


	UPDATE [dbo].[Usuario]
	SET [Activo] = 0
	WHERE Nombre = @Nombre and 
	ClaveHash = HASHBYTES('SHA2_512', @ClaveHash)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END



GO
