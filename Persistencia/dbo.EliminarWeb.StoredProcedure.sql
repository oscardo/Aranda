USE [BDAranda]
GO
/****** Object:  StoredProcedure [dbo].[EliminarWeb]    Script Date: 8/05/2019 3:15:31 p. m. ******/
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
