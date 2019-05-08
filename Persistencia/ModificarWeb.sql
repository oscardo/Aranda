SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE ModificarWeb
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
Go