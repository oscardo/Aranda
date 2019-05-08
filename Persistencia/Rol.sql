SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
create PROCEDURE UserRol
	@Seleccion int = 0, --1 Crear, 2 = Seleccion, 3 = Modificar, 4 = eliminar, 5 ReversarEliminacion
	@PKRol INT = -1,
	@NombreRol nvarchar(40) = '',
	@NombreRolNue nvarchar(40) = '',
	@Activo bit = 1, 
	@Salida nvarchar(40) output
AS
BEGIN
	if @Seleccion < 1 or @Seleccion > 5
		set @Salida = 'Sin información'
		return @Salida

	IF @Seleccion = 1
		INSERT INTO [dbo].[Rol]
           ([NombreRol]
           ,[Activo])
		VALUES
           (@NombreRol
           ,@Activo)
	
	IF @Seleccion = 2 and @PKRol <> -1
		SELECT [PKRol]
			,[NombreRol]
			,[Activo]
		FROM [dbo].[Rol]
		WHERE PKRol = @PKRol
		and Activo = 1

	IF @Seleccion = 2 and @PKRol = -1
		SELECT [PKRol]
			,[NombreRol]
			,[Activo]
		FROM [dbo].[Rol]
		WHERE Activo = 1
	
	IF @Seleccion = 3 
		UPDATE [dbo].[Rol]
		SET [NombreRol] = @NombreRolNue
		,[Activo] = @Activo
		WHERE PKRol = @PKRol 
		and NombreRol = @NombreRol
	
	IF @Seleccion = 4
		UPDATE [dbo].[Rol]
		SET [Activo] = 0
		WHERE PKRol = @PKRol 
		and NombreRol = @NombreRol
	
	IF @Seleccion = 5
		UPDATE [dbo].[Rol]
		SET [Activo] = 1
		WHERE PKRol = @PKRol 
		and NombreRol = @NombreRol

end	
Go