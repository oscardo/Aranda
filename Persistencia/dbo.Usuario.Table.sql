USE [BDAranda]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/05/2019 3:15:31 p. m. ******/
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
