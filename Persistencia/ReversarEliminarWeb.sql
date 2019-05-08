SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE ReversarEliminarWeb
	@Web nvarchar(200)
AS
BEGIN

UPDATE [dbo].[Web]
   SET [Activa] = 1
 WHERE Web = @Web 
	
end	
Go