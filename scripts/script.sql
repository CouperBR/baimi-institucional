USE [master]
GO
/****** Object:  Database [db-baimi]    Script Date: 31/07/2020 18:04:19 ******/
CREATE DATABASE [db-baimi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db-baimi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db-baimi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db-baimi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db-baimi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db-baimi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db-baimi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db-baimi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db-baimi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db-baimi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db-baimi] SET ARITHABORT OFF 
GO
ALTER DATABASE [db-baimi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db-baimi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db-baimi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db-baimi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db-baimi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db-baimi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db-baimi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db-baimi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db-baimi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db-baimi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db-baimi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db-baimi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db-baimi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db-baimi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db-baimi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db-baimi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db-baimi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db-baimi] SET RECOVERY FULL 
GO
ALTER DATABASE [db-baimi] SET  MULTI_USER 
GO
ALTER DATABASE [db-baimi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db-baimi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db-baimi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db-baimi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db-baimi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db-baimi', N'ON'
GO
USE [db-baimi]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 31/07/2020 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome_completo] [varchar](200) NOT NULL,
	[cpf] [nchar](11) NULL,
	[data_nascimento] [datetime] NULL,
	[telefone_contato] [varchar](30) NOT NULL,
	[endereco_completo_entrega] [varchar](max) NOT NULL,
	[ponto_referencia] [varchar](max) NULL,
	[email] [varchar](500) NOT NULL,
	[indicacao] [varchar](max) NULL,
	[telefone_indicacao] [varchar](30) NULL,
	[forma_pagamento] [varchar](500) NULL,
	[observacoes] [varchar](max) NULL,
	[data_compra] [datetime] NULL,
 CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra_produto]    Script Date: 31/07/2020 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compra_produto](
	[produto_id] [int] NOT NULL,
	[compra_id] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contato]    Script Date: 31/07/2020 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](500) NOT NULL,
	[assunto] [varchar](100) NOT NULL,
	[mensagem] [varchar](max) NOT NULL,
	[data] [datetime] NOT NULL,
 CONSTRAINT [PK_contato] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 31/07/2020 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[produto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](100) NULL,
	[descricao_curta] [varchar](150) NULL,
	[vendidos] [int] NULL,
	[valor] [decimal](18, 0) NULL,
	[numero_max_parcelas] [int] NULL,
	[desconto_avista] [int] NULL,
	[caracteristicas] [varchar](max) NULL,
	[descricao_longa] [varchar](max) NULL,
	[url_foto] [varchar](max) NULL,
	[entrega_gratis] [bit] NULL,
 CONSTRAINT [PK_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 31/07/2020 18:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](150) NOT NULL,
	[senha] [varchar](max) NOT NULL,
	[email] [varchar](500) NOT NULL,
	[created_on] [date] NOT NULL,
	[updated_on] [date] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[compra] ON 

INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (1, N'csd', N'45650900582', CAST(N'2020-07-10T00:00:00.000' AS DateTime), N'(94)94894-9848', N'c', N'cd', N'douglasmsp@hotmail.com', N'c', N'(98)49849-4894', N'cd', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (2, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'SDA', N'ASD', N'douglasmsp@hotmail.com', N'c', N'(98)49849-4894', N'DA', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (3, N'csd', N'45650900582', CAST(N'2020-07-08T00:00:00.000' AS DateTime), N'(94)94894-9848', N'cdc', N'sd', N'douglasmsp@hotmail.com', N's', N'(71)92222-2222', N'ds', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (4, N'csd', N'45650900582', CAST(N'2020-07-14T00:00:00.000' AS DateTime), N'(94)94894-9848', N'cd', N'c', N'douglasmsp@hotmail.com', N'dc', N'(98)49849-4894', N'cd', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (5, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (6, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (7, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (8, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (9, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (10, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (11, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (12, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (13, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL, NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (14, N'csd', N'           ', CAST(N'2020-07-28T00:00:00.000' AS DateTime), N'(94)94894-9848', N'fafd', N'sdf', N'douglasmsp@hotmail.com', N'sdc', N'(98)49849-4894', N'sdf', N'sdf', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes], [data_compra]) VALUES (15, N'csd', N'           ', CAST(N'2020-07-28T00:00:00.000' AS DateTime), N'(94)94894-9848', N'sadf', N'sadf', N'douglasmsp@hotmail.com', N'c', N'(98)49849-4894', N'sad', N'sdaf', CAST(N'2020-07-27T20:39:39.407' AS DateTime))
SET IDENTITY_INSERT [dbo].[compra] OFF
SET IDENTITY_INSERT [dbo].[compra_produto] ON 

INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 2, 4)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 3, 6)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 4, 7)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 14, 17)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 15, 18)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 1, 1)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 5, 8)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 6, 9)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 7, 10)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 8, 11)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 9, 12)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 10, 13)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 11, 14)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 12, 15)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (4, 13, 16)
SET IDENTITY_INSERT [dbo].[compra_produto] OFF
SET IDENTITY_INSERT [dbo].[contato] ON 

INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (1, N'teste', N'teste', N'tteste', N'teste', CAST(N'2020-07-10T19:33:20.913' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (2, N'elidio', N'douglasmsp@hotmail.com', N'df', N'cd', CAST(N'2020-07-10T19:37:49.073' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (3, N'elidio', N'douglasmsp@hotmail.com', N'df', N'cd', CAST(N'2020-07-10T19:48:35.590' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (4, N'd', N'douglasmsp@hotmail.com', N'd', N'd', CAST(N'2020-07-13T17:48:20.670' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (5, N'elidio', N'douglasmsp@hotmail.com', N'fg', N'df', CAST(N'2020-07-13T18:08:35.150' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (6, N'elidio', N'douglasmsp@hotmail.com', N'df', N'fsdf', CAST(N'2020-07-13T18:10:00.197' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (7, N'elidio', N'douglasmsp@hotmail.com', N'dsfsd', N'sdf', CAST(N'2020-07-13T18:11:52.413' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (8, N'elidio', N'douglasmsp@hotmail.com', N'sdf', N'sdf', CAST(N'2020-07-13T18:14:18.780' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (9, N'elidio', N'douglasmsp@hotmail.com', N'df', N'sad', CAST(N'2020-07-13T18:15:36.380' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (10, N'elidio', N'douglasmsp@hotmail.com', N'df', N'sda', CAST(N'2020-07-13T18:16:06.023' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (11, N'elidio', N'douglasmsp@hotmail.com', N'df', N'sda', CAST(N'2020-07-13T18:19:43.557' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (12, N'elidio', N'douglasmsp@hotmail.com', N'dfs', N'sd', CAST(N'2020-07-13T18:19:59.173' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (13, N'elidio', N'douglasmsp@hotmail.com', N'sd', N'sd', CAST(N'2020-07-13T18:20:44.677' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (14, N'elidio', N'douglasmsp@hotmail.com', N'sd', N'sdf', CAST(N'2020-07-13T18:22:15.977' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (15, N'elidio', N'douglasmsp@hotmail.com', N'dfz', N'zx', CAST(N'2020-07-13T18:53:23.140' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (16, N'elidio', N'douglasmsp@hotmail.com', N'dfz', N'zx', CAST(N'2020-07-13T18:54:41.260' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (17, N'elidio', N'douglasmsp@hotmail.com', N'zx', N'xz', CAST(N'2020-07-13T18:55:52.390' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (18, N'elidio', N'douglasmsp@hotmail.com', N'asd', N'asd', CAST(N'2020-07-13T18:58:03.187' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (19, N'elidio', N'douglasmsp@hotmail.com', N'df', N'fd', CAST(N'2020-07-14T17:57:21.350' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (20, N'elidio', N'douglasmsp@hotmail.com', N'df', N'fd', CAST(N'2020-07-14T17:58:08.150' AS DateTime))
INSERT [dbo].[contato] ([id], [nome], [email], [assunto], [mensagem], [data]) VALUES (21, N'elidio', N'douglasmsp@hotmail.com', N'df', N'df', CAST(N'2020-07-14T18:01:44.197' AS DateTime))
SET IDENTITY_INSERT [dbo].[contato] OFF
SET IDENTITY_INSERT [dbo].[produto] ON 

INSERT [dbo].[produto] ([id], [nome], [descricao_curta], [vendidos], [valor], [numero_max_parcelas], [desconto_avista], [caracteristicas], [descricao_longa], [url_foto], [entrega_gratis]) VALUES (2, N'Motorola Moto G4 Plus G4 Plus G4 Plus G4 Plus G4 Plus', N'teste', 10, CAST(1500 AS Decimal(18, 0)), 11, 15, N'teste', N'teste', N'phone_68-6-31-17.png', NULL)
INSERT [dbo].[produto] ([id], [nome], [descricao_curta], [vendidos], [valor], [numero_max_parcelas], [desconto_avista], [caracteristicas], [descricao_longa], [url_foto], [entrega_gratis]) VALUES (4, N'a', N'a', 1, CAST(1000 AS Decimal(18, 0)), 5, 10, N'teste', N'teste', N'phone_533-16-31-17.png', NULL)
SET IDENTITY_INSERT [dbo].[produto] OFF
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id], [nome], [senha], [email], [created_on], [updated_on]) VALUES (1, N'elidio', N'$2y$12$OVMENhNMoqDqRUpR5Nx45uHgTAFI983HTPOEE2UeQ6JwkAWjG5gDC', N'douglasmsp@hotmail.com', CAST(N'2020-07-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[usuario] OFF
/****** Object:  Index [produto_compra_unique]    Script Date: 31/07/2020 18:04:20 ******/
ALTER TABLE [dbo].[compra_produto] ADD  CONSTRAINT [produto_compra_unique] UNIQUE NONCLUSTERED 
(
	[produto_id] ASC,
	[compra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[compra_produto]  WITH CHECK ADD  CONSTRAINT [product_compra_produto] FOREIGN KEY([produto_id])
REFERENCES [dbo].[produto] ([id])
GO
ALTER TABLE [dbo].[compra_produto] CHECK CONSTRAINT [product_compra_produto]
GO
ALTER TABLE [dbo].[compra_produto]  WITH CHECK ADD  CONSTRAINT [produto_compra_compra] FOREIGN KEY([compra_id])
REFERENCES [dbo].[compra] ([id])
GO
ALTER TABLE [dbo].[compra_produto] CHECK CONSTRAINT [produto_compra_compra]
GO
USE [master]
GO
ALTER DATABASE [db-baimi] SET  READ_WRITE 
GO
