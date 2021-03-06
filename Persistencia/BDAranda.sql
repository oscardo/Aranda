USE [BDAranda]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[PKRol] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [nvarchar](40) NOT NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[PKRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[PKUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](40) NOT NULL,
	[ClaveHash] [binary](64) NOT NULL,
	[Nombres] [nvarchar](40) NULL,
	[Apellido] [nvarchar](40) NULL,
	[Direccion] [nvarchar](60) NULL,
	[Telefono] [nvarchar](12) NULL,
	[Correo] [nvarchar](30) NULL,
	[Edad] [tinyint] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Usuario_PKUsuario] PRIMARY KEY CLUSTERED 
(
	[PKUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRol]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRol](
	[PKUsuarioRol] [int] IDENTITY(1,1) NOT NULL,
	[FKUsuario] [int] NOT NULL,
	[FKRol] [int] NOT NULL,
	[FKWeb] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_UsuarioRol] PRIMARY KEY CLUSTERED 
(
	[PKUsuarioRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web](
	[PKWeb] [int] IDENTITY(1,1) NOT NULL,
	[Web] [nchar](200) NULL,
	[Activa] [bit] NULL,
 CONSTRAINT [PK_Web] PRIMARY KEY CLUSTERED 
(
	[PKWeb] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Rol] FOREIGN KEY([FKRol])
REFERENCES [dbo].[Rol] ([PKRol])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Rol]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Usuario] FOREIGN KEY([FKUsuario])
REFERENCES [dbo].[Usuario] ([PKUsuario])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Usuario]
GO
ALTER TABLE [dbo].[UsuarioRol]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRol_Web] FOREIGN KEY([FKWeb])
REFERENCES [dbo].[Web] ([PKWeb])
GO
ALTER TABLE [dbo].[UsuarioRol] CHECK CONSTRAINT [FK_UsuarioRol_Web]
GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 8/05/2019 3:18:34 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[CrearWeb]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE [dbo].[CrearWeb]
	@Web nvarchar(200),
	@Activa bit = 1
AS
BEGIN
	
INSERT INTO [dbo].[Web]
           ([Web]
           ,[Activa])
     VALUES
           (@Web
           ,@Activa)


	
end	
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 8/05/2019 3:18:34 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarWeb]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE [dbo].[EliminarWeb]
	@Web nvarchar(200)
AS
BEGIN

UPDATE [dbo].[Web]
   SET [Activa] = 0
 WHERE Web = @Web 
	
end	
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 8/05/2019 3:18:34 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarWeb]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE [dbo].[ModificarWeb]
	@WebAnt nvarchar(200),
	@Web nvarchar(200),
	@Activa bit = 1
AS
BEGIN

UPDATE [dbo].[Web]
   SET [Web] = @Web
      ,[Activa] = @Activa
 WHERE Web = @WebAnt 
	
end	
GO
/****** Object:  StoredProcedure [dbo].[ReversarEliminarUsuario]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReversarEliminarUsuario]
	   @Nombre nvarchar(40)
      ,@ClaveHash binary(64)
      ,@responseMessage NVARCHAR(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    BEGIN TRY


	UPDATE [dbo].[Usuario]
	SET [Activo] = 1
	WHERE Nombre = @Nombre and 
	ClaveHash = HASHBYTES('SHA2_512', @ClaveHash)

    SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

END



GO
/****** Object:  StoredProcedure [dbo].[ReversarEliminarWeb]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE [dbo].[ReversarEliminarWeb]
	@Web nvarchar(200)
AS
BEGIN

UPDATE [dbo].[Web]
   SET [Activa] = 1
 WHERE Web = @Web 
	
end	
GO
/****** Object:  StoredProcedure [dbo].[SeleccionWeb]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE [dbo].[SeleccionWeb]
	@Todos int = 0,
	@PKWeb int
AS
BEGIN
	
	if @Todos = 1
		SELECT [PKWeb]
			,[Web]
			,[Activa]
		FROM [dbo].[Web]
		where PKWeb = @PKWeb
		and Activa = 1
	else
		SELECT [PKWeb]
			,[Web]
			,[Activa]
		FROM [dbo].[Web]
		where Activa = 1
end	
GO
/****** Object:  StoredProcedure [dbo].[UserRol]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
create PROCEDURE [dbo].[UserRol]
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
GO
/****** Object:  StoredProcedure [dbo].[UsuarioLogin]    Script Date: 8/05/2019 3:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioLogin]
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

	return @PKUsuario
END
GO
