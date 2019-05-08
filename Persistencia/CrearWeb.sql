SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Oscar Ortiz
-- Create date: 8 de Mayo de 2019
-- Description:	...
-- =============================================
CREATE PROCEDURE CrearWeb
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
Go