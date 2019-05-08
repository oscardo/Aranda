USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[ModificarWeb]    Script Date: 8/05/2019 3:15:31 p. m. ******/
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
