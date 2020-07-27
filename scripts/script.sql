USE [db-baimi]
GO
/****** Object:  Table [dbo].[compra]    Script Date: 27/07/2020 18:15:48 ******/
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
 CONSTRAINT [PK_compra] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[compra_produto]    Script Date: 27/07/2020 18:15:48 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contato]    Script Date: 27/07/2020 18:15:48 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[produto]    Script Date: 27/07/2020 18:15:48 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/07/2020 18:15:48 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[compra] ON 

INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (1, N'csd', N'45650900582', CAST(N'2020-07-10T00:00:00.000' AS DateTime), N'(94)94894-9848', N'c', N'cd', N'douglasmsp@hotmail.com', N'c', N'(98)49849-4894', N'cd', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (2, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'SDA', N'ASD', N'douglasmsp@hotmail.com', N'c', N'(98)49849-4894', N'DA', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (3, N'csd', N'45650900582', CAST(N'2020-07-08T00:00:00.000' AS DateTime), N'(94)94894-9848', N'cdc', N'sd', N'douglasmsp@hotmail.com', N's', N'(71)92222-2222', N'ds', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (4, N'csd', N'45650900582', CAST(N'2020-07-14T00:00:00.000' AS DateTime), N'(94)94894-9848', N'cd', N'c', N'douglasmsp@hotmail.com', N'dc', N'(98)49849-4894', N'cd', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (5, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (6, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (7, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (8, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (9, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (10, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (11, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (12, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
INSERT [dbo].[compra] ([id], [nome_completo], [cpf], [data_nascimento], [telefone_contato], [endereco_completo_entrega], [ponto_referencia], [email], [indicacao], [telefone_indicacao], [forma_pagamento], [observacoes]) VALUES (13, N'csd', N'45650900582', CAST(N'2020-07-22T00:00:00.000' AS DateTime), N'(94)94894-9848', N'dc', N'cd', N'douglasmsp@hotmail.com', N'cd', N'(98)49849-4894', N'sx', NULL)
SET IDENTITY_INSERT [dbo].[compra] OFF
SET IDENTITY_INSERT [dbo].[compra_produto] ON 

INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 2, 4)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 3, 6)
INSERT [dbo].[compra_produto] ([produto_id], [compra_id], [id]) VALUES (2, 4, 7)
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
/****** Object:  Index [produto_compra_unique]    Script Date: 27/07/2020 18:15:48 ******/
ALTER TABLE [dbo].[compra_produto] ADD  CONSTRAINT [produto_compra_unique] UNIQUE NONCLUSTERED 
(
	[produto_id] ASC,
	[compra_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
