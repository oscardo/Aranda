USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[SeleccionWeb]    Script Date: 8/05/2019 3:15:31 p. m. ******/
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
