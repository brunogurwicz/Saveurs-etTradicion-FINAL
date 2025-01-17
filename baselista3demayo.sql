USE [master]
GO
/****** Object:  Database [Saveurs]    Script Date: 3/5/2024 10:31:22 ******/
CREATE DATABASE [Saveurs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Saveurs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Saveurs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Saveurs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Saveurs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Saveurs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Saveurs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Saveurs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Saveurs] SET ARITHABORT OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Saveurs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Saveurs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Saveurs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Saveurs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Saveurs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Saveurs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Saveurs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Saveurs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Saveurs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Saveurs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Saveurs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Saveurs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Saveurs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Saveurs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Saveurs] SET RECOVERY FULL 
GO
ALTER DATABASE [Saveurs] SET  MULTI_USER 
GO
ALTER DATABASE [Saveurs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Saveurs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Saveurs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Saveurs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Saveurs] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Saveurs', N'ON'
GO
ALTER DATABASE [Saveurs] SET QUERY_STORE = OFF
GO
USE [Saveurs]
GO
/****** Object:  User [alumno]    Script Date: 3/5/2024 10:31:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[NombreCategoria] [varchar](200) NULL,
	[Descripcion] [varchar](500) NULL,
	[Imagen] [varchar](150) NULL,
	[Banner] [varchar](500) NULL,
 CONSTRAINT [PK__Categori__A3C02A100680C461] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[IdComentario] [int] IDENTITY(1,1) NOT NULL,
	[TexCom] [varchar](400) NOT NULL,
	[IdReceta] [int] NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[IdComentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[IdIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Ingrediente] [varchar](150) NOT NULL,
 CONSTRAINT [PK__Ingredie__3DA4DD60CCC790B6] PRIMARY KEY CLUSTERED 
(
	[IdIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[IdReceta] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdCategoria] [int] NOT NULL,
	[Imagen] [varchar](2000) NULL,
	[Titulo] [varchar](150) NULL,
	[Descripcion] [varchar](500) NULL,
	[Pasos] [varchar](900) NULL,
	[CantidadPersonas] [int] NULL,
	[Tiempo] [varchar](50) NULL,
	[Precio] [int] NULL,
	[Video] [varchar](650) NULL,
	[Ingredientes] [varchar](max) NULL,
	[Cantidad] [varchar](max) NULL,
 CONSTRAINT [PK__Receta__2CEFF1570F5578D6] PRIMARY KEY CLUSTERED 
(
	[IdReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta_Carrousel]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta_Carrousel](
	[IdRecetaCarrousel] [int] IDENTITY(1,1) NOT NULL,
	[IdReceta] [int] NOT NULL,
 CONSTRAINT [PK__Receta_C__1441D1D26561C84A] PRIMARY KEY CLUSTERED 
(
	[IdRecetaCarrousel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetaxIngrediente]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetaxIngrediente](
	[IdRecetaxIngrediente] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [varchar](50) NOT NULL,
	[IdReceta] [int] NULL,
	[IdIngrediente] [int] NOT NULL,
 CONSTRAINT [PK_RecetaxIngrediente] PRIMARY KEY CLUSTERED 
(
	[IdRecetaxIngrediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Mail] [varchar](200) NOT NULL,
	[Contraseña] [varchar](200) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Foto] [varchar](200) NULL,
	[IdRecetaFavorita] [int] NULL,
 CONSTRAINT [PK__Usuario__5B65BF97C9B713E0] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (1, N'Pastas', N'Una gran variedad de pastas caseras, faciles y rapidas de hacer para disfrutar en familia, en soledad o con amigos o tu pareja.', N'https://hips.hearstapps.com/del.h-cdn.co/assets/17/24/1024x576/hd-aspect-1497458683-delish-one-pot-chicken-alfredo-1-1024.jpg?resize=1200:*', N'Pasta.png')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (2, N'Carnes', N'Los mejores cortes de carne para disfrutar en casa.', N'https://media.gq.com.mx/photos/620bcf7243f71a078a355280/master/pass/carnes-85650597.jpg', N'Carne.png')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (3, N'Postres', N'Los postres mas ricos para que los disfrutes cuando se te antojen.', N'https://www.clara.es/medio/2021/11/28/postres-navidenos_3f462fd7_1280x1115.jpg', N'Postre.png')
INSERT [dbo].[Categoria] ([IdCategoria], [NombreCategoria], [Descripcion], [Imagen], [Banner]) VALUES (4, N'Ensaladas', N'Una gran variedad de ensaladas para todos los gustos...', N'https://s1.abcstatics.com/media/gurmesevilla/2013/08/ensalada-caribena.jpg', N'ENSALADAS_DE_LA_HUERTA.png')
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([IdComentario], [TexCom], [IdReceta]) VALUES (1, N'messi', 10)
INSERT [dbo].[Comentario] ([IdComentario], [TexCom], [IdReceta]) VALUES (2, N'fa', 10)
INSERT [dbo].[Comentario] ([IdComentario], [TexCom], [IdReceta]) VALUES (3, N'ñ', 10)
INSERT [dbo].[Comentario] ([IdComentario], [TexCom], [IdReceta]) VALUES (4, N'muy lueno', 10)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (1, N'Tomates')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (2, N'Lechuga')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (3, N'Cebollas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (4, N'Ajo')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (5, N'perejil')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (6, N'atun')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (7, N'Pepino')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (8, N'Pimienta')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (9, N'Sal')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (10, N'Aceite de Oliva')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (11, N'vinagre')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (12, N'maiz')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (13, N'Leche')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (14, N'Azúcar morena')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (15, N'naranja')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (16, N'Vainilla')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (17, N'maizena')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (18, N'agua')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (19, N'Licor')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (20, N'crema')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (21, N'cocoa')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (22, N'fresas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (23, N'canela')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (24, N'Bizcocho')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (25, N'Peras')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (26, N'brocoli')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (27, N'Tomates cherry')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (28, N'Vino blanco')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (29, N'Pastas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (30, N'Mariscos')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (31, N'Huevos')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (32, N'Azúcar')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (33, N'Harina')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (34, N'Licor de café')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (35, N'Café')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (36, N'Cacao en polvo')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (37, N'Papas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (38, N'Nuez moscada')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (39, N'Carne molida')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (40, N'Tomate triturado')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (41, N'Queso parmesano')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (42, N'Albahaca')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (43, N'Chocolate')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (44, N'Manteca')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (45, N'Helado de vainilla')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (46, N'Salsa de chocolate')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (47, N'Pan para crutones')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (48, N'Mayonesa')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (49, N'Jugo de limón')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (50, N'Mostaza Dijon')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (51, N'Pepino')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (52, N'Aceitunas')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (53, N'Piezas de pollo ')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (54, N'Zanahorias')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (55, N'Carne de ternera')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (56, N'Tallos de apio')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (57, N'Vino Tinto')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (58, N'Caldo de carne')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (59, N'Hierbas frescas ')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (60, N'Quinoa')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (61, N'Hojas Verdes')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (62, N'Palta')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (63, N'Vinagreta de Limón')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (64, N'soja')
INSERT [dbo].[Ingrediente] ([IdIngrediente], [Nombre_Ingrediente]) VALUES (65, N'rucula')
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (1, 1, 1, N'https://assets.unileversolutions.com/recipes-v2/232008.jpg', N'Pastas con Mariscos', N'Deliciosas pastas con mariscos: una fusión exquisita de sabores frescos del mar y pasta al dente.', N'Paso Para hacer pastas con mariscos, primero cocina la pasta al dente y resérvala. En una sartén grande, saltea ajo picado en aceite de oliva. 
Paso Agrega mariscos variados como camarones, mejillones y calamares. 
Paso Cuando estén casi cocidos, añade tomates cherry cortados por la mitad y un chorrito de vino blanco. 
Paso Cocina hasta que los mariscos estén hechos. 
Paso Incorpora la pasta escurrida y mezcla bien. Condimenta con sal, pimienta y perejil fresco picado. ¡Listo para disfrutar!', 2, N'20 minutos', 1600, N'https://www.youtube.com/embed/hH1ZldJGqKs?https://www.youtube.com/embed/2174nZiUcj0?si=wkEK640jRIeyFMfS', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (2, 2, 3, N'https://assets.unileversolutions.com/recipes-v2/248351.jpg', N'Sopa Inglesa Italiana', N'Sopa Inglesa Italiana: Postre cremoso con bizcochos bañados en café y crema de chocolate.', N'Paso  Preparación de la crema: Batir 6 yemas de huevo con 150g de azúcar hasta obtener una mezcla pálida. Agregar 50g de harina y 500ml de leche caliente. Cocinar a fuego lento hasta espesar. Añadir esencia de vainilla y 50ml de licor de café. Dejar enfriar.
Paso Montaje: Remojar bizcochos en café y colocar en un recipiente.
Paso Capa de crema: Extender una capa de crema sobre los bizcochos.
Paso Otra capa de bizcochos: Añadir otra capa de bizcochos remojados en café.
Paso Finalización: Cubrir con el resto de la crema.
Paso Decoración: Espolvorear cacao en polvo sobre la superficie.', 4, N'30-40 minutos', 9886, N'https://www.youtube.com/watch?v=xCPRPPtifuE', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (3, 3, 1, N'https://www.laitalianapastas.com/wp-content/uploads/2017/05/noquispapa.jpg', N'Ñoquis con Salsa Bolognesa', N'Ñoquis con salsa boloñesa: Delicia italiana reconfortante y sabrosa.', N'Paso Preparación de la masa de ñoquis: Cocina 1kg de papas hasta que estén tiernas, pélalas y pásalas por un prensapuré. Agrega 1 huevo, sal y nuez moscada. Incorpora 250g de harina y forma una masa.
Paso Formación de los ñoquis: Divide la masa en porciones y forma cilindros. Corta los cilindros en trozos y haz marcas con un tenedor.
Paso Cocción de los ñoquis: Hierve agua con sal en una olla grande. Cocina los ñoquis en lotes hasta que floten en la superficie. Retira y reserva.
Paso Preparación de la salsa boloñesa: En una sartén, sofríe cebolla, zanahoria y apio picados. Agrega 500g de carne molida y cocina hasta dorar. Incorpora 400g de tomate triturado, sal, pimienta y hierbas italianas. Cocina a fuego lento durante 20 minutos.
Paso Servir: Sirve los ñoquis con la salsa boloñesa por encima. Espolvorea con queso parmesano rallado y hojas de albahaca fresca', 6, N'1 hora', 4500, N'https://www.youtube.com/embed/fIbjvSTCgWo?si=hFuj-vDhrQnSMRvx', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (4, 4, 1, N'https://uvn-brightspot.s3.amazonaws.com/assets/vixes/imj/elgranchef/F/Fideos%20con%20tuco%203.jpg', N'Fideos con Salsa Fileto', N'Fideos con tuco: Placer sencillo y reconfortante, típico de la cocina italiana.', N'Paso Cocinar la pasta: Hierve agua con sal en una olla grande. Agrega 400g de fideos y cocina hasta que estén al dente. Escurre y reserva.
Paso Preparar la salsa tuco: En una sartén grande, sofríe cebolla y ajo picados en aceite de oliva. Agrega 500g de carne molida y cocina hasta dorar.
Paso Añadir tomate: Incorpora 800g de tomate triturado, sal, pimienta y hierbas italianas al gusto. Cocina a fuego lento durante 20-30 minutos, revolviendo ocasionalmente.
Paso Servir: Sirve los fideos en platos individuales y cubre con la salsa tuco caliente. Espolvorea con queso parmesano rallado y hojas de albahaca fresca, si lo deseas.', 4, N'30-40 minutos', 3500, N'https://www.youtube.com/embed/0DcAsFrPS3Q?si=oUVcRLlYWn9W79W9', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (8, 1, 3, N'https://cdn.colombia.com/gastronomia/2014/03/17/postre-de-brownie-y-helado-3443.jpg', N'Brownies con Helado', N'Postre decadente y delicioso para satisfacer tus antojos.', N'Paso Preparar la masa de brownie: Derrite 200g de chocolate y 170g de mantequilla. Mezcla con 200g de azúcar y 3 huevos. Agrega 100g de harina y una pizca de sal. Vierte en un molde y hornea a 180°C durante 20-25 minutos. Deja enfriar.
Paso Corte y servido: Corta los brownies en porciones. Sirve cada porción con una bola de helado de vainilla o chocolate. Decora con salsa de chocolate, nueces picadas o frutos rojos si lo deseas.', 2, N'30-35 minutos', 6700, N'https://www.youtube.com/embed/Ag-Lv0eo1qI?si=hvZ8fQA55mPuQM5J', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (9, 1, 3, N'https://mojo.generalmills.com/api/public/content/d0OzlvMawUWJ6G_dDAdWQg_gmi_hi_res_jpeg.jpeg?v=271f2d6e&t=16e3ce250f244648bef28c5949fb99ff', N'Flan Casero', N'Postre suave y cremoso, irresistible para cualquier ocasión.', N'Paso Caramelo: Derrite 200g de azúcar y vierte en moldes. Deja enfriar.
Paso Mezcla: Bate 4 huevos, 4 yemas, 150g de azúcar, 500ml de leche, 200ml de crema, y vainilla.
Paso Cocción: Vierte en los moldes, hornea en baño maría a 180°C por 45-50 min.
Paso Enfriar y desmoldar: Refrigera 4 horas, desmolda y sirve.', 6, N'1 hora y 30 minutos', 3100, N'https://www.youtube.com/embed/UxJ8FkRAXYg?si=JAim6wgKEiEsN1Bd', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (10, 2, 4, N'https://www.gourmet.cl/wp-content/uploads/2016/09/Ensalada_C%C3%A9sar-web-553x458.jpg', N'Ensalada César', N'Fresca, crujiente y llena de sabor, un clásico delicioso.', N'Paso Preparar aderezo: Mezcla 3 cucharadas de mayonesa, 2 cucharadas de aceite de oliva, 2 cucharadas de jugo de limón, 1 diente de ajo picado, 1 cucharadita de mostaza Dijon, 1 cucharadita de salsa Worcestershire, sal y pimienta al gusto.
Paso  Preparar crutones: Corta pan en cubos, mezcla con aceite de oliva, ajo en polvo y sal. Hornea a 180°C hasta que estén dorados.
Paso Armar ensalada: En un tazón grande, combina lechuga romana picada, crutones, y queso parmesano rallado.
Paso Agregar aderezo: Vierte el aderezo sobre la ensalada y mezcla suavemente hasta que esté bien cubierta.
Paso Servir: Sirve la ensalada en platos individuales y adorna con más queso parmesano y pimienta negra recién molida.', 3, N'20 minutos', 3540, N'https://www.youtube.com/embed/ef-gPM9UcRo?si=3o8e5KFNVDDExjJ5', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (11, 3, 4, N'https://assets.unileversolutions.com/recipes-v2/243135.jpg', N'Ensalada Mixta Estilo Español', N'Fresca, colorida y llena de sabores mediterráneos.', N'Paso Preparar la vinagreta: Mezcla 3 cucharadas de vinagre de vino tinto, 1 cucharadita de mostaza Dijon, 1 diente de ajo picado, sal y pimienta. Agrega lentamente 6 cucharadas de aceite de oliva mientras bates hasta emulsionar.
Paso Cocer los huevos: Hierve 4 huevos hasta que estén cocidos, luego pela y corta en cuartos.
Paso Preparar las verduras: Lava y corta en rodajas 2 tomates, 1 pepino y 1 cebolla roja.
Paso Montar la ensalada: Coloca en una fuente grande lechuga mixta, tomates, pepino, cebolla y aceitunas al gusto. Agrega los huevos duros.
Paso Servir: Aliña la ensalada con la vinagreta preparada y decora con unas hojas de albahaca fresca.', 2, N'20-25 minutos', 4200, N'https://www.youtube.com/embed/hH1ZldJGqKs?si=7vopT9qk8yAqe1t6', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (12, 4, 2, N'https://www.justspices.es/media/recipe/Pollo-al-horno-con-verduras.jpg', N'Pollo al horno con verduras', N'Sabroso y saludable plato de comida reconfortante', N'Paso Preparar el pollo: Coloca piezas de pollo en una bandeja para hornear. Espolvorea con sal, pimienta, ajo en polvo y hierbas secas al gusto.
Paso Preparar las verduras: Corta zanahorias, papas, cebollas y pimientos en trozos. Colócalos alrededor del pollo en la bandeja.
Paso Rociar con aceite: Rocía el pollo y las verduras con aceite de oliva. Asegúrate de que estén bien cubiertos para una cocción uniforme.
Paso Hornear: Precalienta el horno a 200°C. Hornea el pollo y las verduras durante aproximadamente 45-50 minutos, o hasta que el pollo esté cocido y dorado y las verduras estén tiernas.
Paso Servir: Sirve el pollo y las verduras calientes, acompañados de una ensalada fresca o arroz.', 5, N'50-60 minutos', 6879, N'https://www.youtube.com/embed/u5Uy3-okg_M?si=I3kizMxw-17Y6PQo', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (14, 2, 2, N'https://recetasdecocina.elmundo.es/wp-content/uploads/2020/07/estofado-de-ternera.jpg', N'Estofado de ternera', N'Plato reconfortante y sabroso para disfrutar en familia.', N'Paso Preparar la carne: Corta 800g de carne de ternera en cubos. Sazónala con sal y pimienta. Pásala por harina.
Paso Dorar la carne: Calienta aceite en una olla y dora la carne por todos los lados. Retira y reserva.
Paso Cocinar las verduras: En la misma olla, cocina 2 cebollas, 3 zanahorias y 2 tallos de apio cortados en trozos hasta que estén dorados.
Paso Agregar líquidos y especias: Regresa la carne a la olla. Añade 3 tazas de caldo de carne, 1 taza de vino tinto, 2 hojas de laurel y 1 cucharadita de tomillo seco.
Paso Cocinar a fuego lento: Cubre la olla y cocina a fuego lento durante 2-3 horas, o hasta que la carne esté tierna y se deshaga fácilmente.
Paso Servir: Sirve caliente con puré de papas, arroz o pan.', 4, N' 2-3 horas', 9450, N'https://www.youtube.com/embed/mRCG1sZfjMU?si=MNJb8oIOy7-ayxdG', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (15, 3, 2, N'https://progcarne.com/storage/app/uploads/public/603/ebd/dc6/603ebddc6fc6e640514451.jpg', N'Lomito a la Parrilla', N'ugoso y sabroso plato asado para disfrutar al aire libre.', N'Paso Marinado: Mezcla aceite de oliva, ajo picado, jugo de limón, sal, pimienta y hierbas frescas. Cubre los filetes y deja marinar por al menos 30 minutos.
Paso Preparar la parrilla: Calienta la parrilla a fuego medio-alto y engrásala ligeramente para evitar que el filete se pegue.
Paso Asar los filetes: Coloca los filetes en la parrilla caliente y cocina de 4 a 6 minutos por cada lado, dependiendo del grosor y el punto de cocción deseado.
Paso Descanso: Retira los filetes de la parrilla y deja reposar durante unos minutos antes de servir.
Paso Servir: Sirve los filetes calientes, acompañados de tus guarniciones favoritas como ensalada, papas asadas o vegetales a la parrilla.', 6, N'40-45 minutos', 84100, N'https://www.youtube.com/embed/pf5Q5XU1RyQ?si=rBJLvtApQM97E2xU', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (16, 4, 4, N'https://images.cookforyourlife.org/wp-content/uploads/2022/09/Citrus-Avocado-Salad.png', N'Ensalada de quinoa y palta', N'Fresca y nutritiva, una explosión de sabores.', N'Paso Cocinar la quinoa: Enjuaga 1 taza de quinoa y cocina según las instrucciones del paquete. Deja enfriar.
Paso Preparar los ingredientes: Corta 1 aguacate en cubos, 1 pepino y 1 pimiento rojo en rodajas finas. Pica 1/4 de taza de cilantro fresco.
Paso Hacer el aderezo: Mezcla 2 cucharadas de aceite de oliva, 1 cucharada de jugo de limón, 1 diente de ajo picado, sal y pimienta al gusto.
Paso Combinar: En un tazón grande, mezcla la quinoa cocida, aguacate, pepino, pimiento y cilantro.
Paso Aliñar: Vierte el aderezo sobre la ensalada y mezcla suavemente hasta que esté bien combinado.
Paso Servir: Sirve la ensalada de quinoa y aguacate en platos individuales y disfruta como plato principal o acompañamiento.', 4, N'20 minutos', 5417, N'https://www.youtube.com/embed/CtgroL2gx4Q?si=yyBTC5rIr26kRKhI', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (17, 1, 4, NULL, N'sasadas', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (18, 2, 4, NULL, N'2', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (19, 2, 4, NULL, N'3', N'rico', NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (20, 2, 4, NULL, N'4nuevo', N'nuevo', NULL, 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (21, 2, 4, NULL, N'6', N'6', N'paso hola paso chau', 0, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (22, 2, 4, NULL, N'sushi', N'bfnbfh', N'paso hacer paso comer', 1, NULL, 0, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (23, 2, 4, NULL, N'Sushi', N'fdsjlñdj', N'Paso hacer paso comer', 5, N'3', 5000, NULL, NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (24, 2, 4, NULL, N'Sushi', N'fsjglkjl', N'paso hacer paso comer', 3, N'3', 5000, N'https://www.youtube.com/embed/3_nDgGcwCCA?si=UUiTO-xqhXsI-cnu', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (25, 2, 4, N'https://img.food.boxspace.in/image/rbk_5a72a81a53333/xhdpi.jpg', N'Sushi', N'sdfslkj', N'paso hacer paso comer', 1, N'4', 5000, N'https://www.youtube.com/embed/3_nDgGcwCCA?si=UUiTO-xqhXsI-cnu', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (26, 2, 4, N'https://img.food.boxspace.in/image/rbk_5a72a81a53333/xhdpi.jpg', N'Sushi final', N'ddfskjlk', N'paso hacer paso festejar', 23, N'10', 50000, N'https://www.youtube.com/embed/3_nDgGcwCCA?si=UUiTO-xqhXsI-cnu', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (27, 2, 4, N'https://img.food.boxspace.in/image/rbk_5a72a81a53333/xhdpi.jpg', N'hola', N'djkhdjk', N'paso hacer paso hola', 2, N'2', 5000, N'https://www.youtube.com/embed/3_nDgGcwCCA?si=UUiTO-xqhXsI-cnu', NULL, NULL)
INSERT [dbo].[Receta] ([IdReceta], [IdUsuario], [IdCategoria], [Imagen], [Titulo], [Descripcion], [Pasos], [CantidadPersonas], [Tiempo], [Precio], [Video], [Ingredientes], [Cantidad]) VALUES (28, 2, 4, N'https://img.food.boxspace.in/image/rbk_5a72a81a53333/xhdpi.jpg', N'pizza', N'pizza rica y', N'paso comparla paso calentarla', 2, N'3', 50000, N'https://www.youtube.com/embed/3_nDgGcwCCA?si=UUiTO-xqhXsI-cnu', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta_Carrousel] ON 

INSERT [dbo].[Receta_Carrousel] ([IdRecetaCarrousel], [IdReceta]) VALUES (1, 8)
INSERT [dbo].[Receta_Carrousel] ([IdRecetaCarrousel], [IdReceta]) VALUES (3, 2)
INSERT [dbo].[Receta_Carrousel] ([IdRecetaCarrousel], [IdReceta]) VALUES (5, 9)
SET IDENTITY_INSERT [dbo].[Receta_Carrousel] OFF
GO
SET IDENTITY_INSERT [dbo].[RecetaxIngrediente] ON 

INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (1, N'400-500g', 1, 29)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (2, N'500g', 1, 30)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (3, N'3-4 dientes', 1, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (4, N'250g', 1, 27)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (5, N'1/4 de taza', 1, 28)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (6, N'1/4 de taza', 1, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (7, N'a gusto', 1, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (8, N'a gusto', 1, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (9, N'6 yemas', 2, 31)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (10, N'150g', 2, 32)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (11, N'50g', 2, 33)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (12, N'500ml', 2, 13)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (13, N'', 2, 16)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (14, N'50ml ', 2, 34)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (15, N'a gusto', 2, 24)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (16, N'a gusto', 2, 35)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (17, N'a gusto', 2, 36)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (18, N'1kg', 3, 37)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (19, N'1', 3, 31)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (20, N'a gusto', 3, 38)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (21, N'a gusto', 3, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (22, N'250g', 3, 33)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (23, N'a gusto', 3, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (24, N'500g ', 3, 39)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (25, N'400g', 3, 40)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (26, N'a gusto', 3, 41)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (27, N'a gusto', 3, 42)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (28, N'400g', 4, 29)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (29, N'a gusto', 4, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (30, N'1', 4, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (31, N'2 dientes', 4, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (32, N'800g', 4, 40)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (33, N'a gusto', 4, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (34, N'a gusto', 4, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (35, N'a gusto', 4, 41)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (36, N'a gusto', 4, 42)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (41, N'200g', 8, 43)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (42, N'170g', 8, 44)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (43, N'200g', 8, 32)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (44, N'3', 8, 31)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (45, N'100g', 8, 33)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (46, N'1 bocha', 8, 45)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (47, N'a gusto', 8, 46)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (48, N'200g', 9, 32)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (49, N'4 ', 9, 31)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (50, N'500ml', 9, 13)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (51, N'200ml ', 9, 20)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (52, N'a gusto', 9, 16)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (53, N'a gusto', 10, 2)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (54, N'a gusto', 10, 47)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (55, N'a gusto', 10, 41)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (56, N'a gusto', 10, 48)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (57, N'a gusto', 10, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (58, N'a gusto', 10, 49)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (59, N'a gusto', 10, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (60, N'a gusto', 10, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (61, N'a gusto', 11, 2)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (62, N'a gusto', 11, 1)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (63, N'a gusto', 11, 7)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (64, N'a gusto', 11, 52)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (65, N'2', 11, 31)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (66, N'a gusto', 11, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (67, N'a gusto', 11, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (68, N'a gusto', 11, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (69, N'4', 12, 53)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (70, N'4', 12, 54)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (71, N'4', 12, 37)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (72, N'2', 12, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (75, N'a gusto', 12, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (76, N'a gusto', 12, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (77, N'a gusto', 12, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (80, N'800g ', 14, 55)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (81, N'a gusto', 14, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (82, N'a gusto', 14, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (83, N'50g', 14, 33)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (84, N'2', 14, 3)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (85, N'3', 14, 54)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (86, N'2', 14, 56)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (87, N'3 tazas', 14, 58)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (88, N'1 taza', 14, 57)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (89, N'4 churrascos', 15, 55)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (90, N'4 cucharadas', 15, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (91, N'2 dientes', 15, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (92, N'2 cucharadas', 15, 49)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (93, N'a gusto', 15, 9)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (94, N'a gusto', 15, 8)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (95, N'a gusto', 15, 59)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (96, N'1 taza ', 16, 60)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (97, N'a gusto', 16, 61)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (98, N'1', 16, 1)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (99, N'', 16, 7)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (100, N'1', 16, 62)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (101, N'a gusto', 16, 63)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (102, N'a gusto', 16, 10)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (103, N'ss', 17, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (104, N'33', 18, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (105, N'33', 19, 1)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (106, N'4li', 20, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (107, N'5lit', 21, 64)
GO
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (108, N'1', 22, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (109, N'1', 23, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (110, N'1', 24, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (111, N'1', 25, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (112, N'1', 26, 64)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (113, N'1', 27, 4)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (114, N'2', 27, 2)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (115, N'2 a gusto', 28, 1)
INSERT [dbo].[RecetaxIngrediente] ([IdRecetaxIngrediente], [Cantidad], [IdReceta], [IdIngrediente]) VALUES (116, N'mucho', 28, 41)
SET IDENTITY_INSERT [dbo].[RecetaxIngrediente] OFF
GO
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (1, N'admin@gmail.com', N'123', N'admin', N'https://tork.news/__export/1648489549559/sites/tork/img/2022/03/28/92832.png_521680808.png', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (2, N'tom.as@gmail.com', N'tommm111', N'tomi_2', N'https://pbs.twimg.com/media/FYZuyRuXwAA75yd?format=jpg&name=large', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (3, N'tito_donQuijote@hotmail.com', N'delamancha', N'tito_de_lamancha', N'https://www.bbva.com/wp-content/uploads/2016/03/don-quijote-de-la-mancha-1920x0-c-f-1.jpg', NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Mail], [Contraseña], [Username], [Foto], [IdRecetaFavorita]) VALUES (4, N'olioli1406@gmail.com', N'oliiEliteamor', N'oli_vivi', N'https://media.vogue.es/photos/60af7ee155ce5f590cf4642a/2:3/w_2560%2Cc_limit/GettyImages-1317477121.jpg', NULL)
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_Comentario_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_Comentario_Receta]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Categoria]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [FK_Receta_Usuario]
GO
ALTER TABLE [dbo].[Receta_Carrousel]  WITH CHECK ADD  CONSTRAINT [FK_Receta_Carrousel_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[Receta_Carrousel] CHECK CONSTRAINT [FK_Receta_Carrousel_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1] FOREIGN KEY([IdIngrediente])
REFERENCES [dbo].[Ingrediente] ([IdIngrediente])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Ingrediente1]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta]
GO
ALTER TABLE [dbo].[RecetaxIngrediente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaxIngrediente_Receta1] FOREIGN KEY([IdReceta])
REFERENCES [dbo].[Receta] ([IdReceta])
GO
ALTER TABLE [dbo].[RecetaxIngrediente] CHECK CONSTRAINT [FK_RecetaxIngrediente_Receta1]
GO
/****** Object:  StoredProcedure [dbo].[AgregarIngrediente]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarIngrediente]
	-- Add the parameters for the stored procedure here
	@IdReceta INT, @IdIngrediente INT, @Cantidad varchar(650)
AS
BEGIN
	insert into RecetaxIngrediente (IdReceta, IdIngrediente, Cantidad)
	values( @IdReceta, @IdIngrediente, @Cantidad);
END

GO
/****** Object:  StoredProcedure [dbo].[AgregarIngredienteAdmin]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarIngredienteAdmin]
	-- Add the parameters for the stored procedure here
	@Nombre_Ingrediente varchar(650)
AS
BEGIN
	INSERT INTO Ingrediente(Nombre_Ingrediente)
	VALUES (@Nombre_Ingrediente)
END
GO
/****** Object:  StoredProcedure [dbo].[AgregarReceta]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarReceta]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT, @Imagen varchar(500), @Titulo varchar(150), @Descripcion varchar(150),@Pasos varchar(5000),@CantidadPersonas INT,@Tiempo INT,@Precio INT,@Video varchar(650),@IdUsuario int
AS
BEGIN
	INSERT INTO Receta (Imagen, Titulo, Descripcion, Pasos, CantidadPersonas, Tiempo, Precio, Video, IdCategoria,IdUsuario)
	VALUES (@Imagen, @Titulo, @Descripcion, @Pasos, @CantidadPersonas, @Tiempo, @Precio, @Video, @IdCategoria, @IdUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPorIngrediente]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarPorIngrediente]
	-- Add the parameters for the stored procedure here
	@NombreIngrediente varchar
AS
BEGIN
	SELECT IdIngrediente FROM Ingrediente WHERE @NombreIngrediente = Nombre_Ingrediente and IdIngrediente IN (SELECT IdReceta FROM RecetaxIngrediente)
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarPorReceta]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* BUSCADOR*/
CREATE PROCEDURE [dbo].[BuscarPorReceta]
	-- Add the parameters for the stored procedure here
	@Titulo varchar
AS
BEGIN
	SELECT * FROM Receta WHERE @Titulo=Titulo
END
GO
/****** Object:  StoredProcedure [dbo].[CantidadesIngredientes]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CantidadesIngredientes]
	@IdReceta INT

AS
BEGIN
	SELECT RecetaxIngrediente.Cantidad FROM RecetaxIngrediente
	INNER JOIN Ingrediente ON RecetaxIngrediente.IdIngrediente=Ingrediente.IdIngrediente
	WHERE RecetaxIngrediente.IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[CargarCategoriaCard]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarCategoriaCard]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT Categoria.* FROM Categoria 
END
GO
/****** Object:  StoredProcedure [dbo].[CargarCategoriaxId]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarCategoriaxId]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Categoria WHERE @IdCategoria=IdCategoria
END

GO
/****** Object:  StoredProcedure [dbo].[CargarInfoUsuario]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarInfoUsuario]
	-- Add the parameters for the stored procedure here
	@IdUsuario INT
AS
BEGIN
	SELECT Mail, Username, Foto FROM Usuario WHERE @IdUsuario=IdUsuario
END

GO
/****** Object:  StoredProcedure [dbo].[CargarReceta]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* RECETAS*/
CREATE PROCEDURE [dbo].[CargarReceta]
	-- Add the parameters for the stored procedure here
	@IdReceta INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdReceta=IdReceta
END
GO
/****** Object:  StoredProcedure [dbo].[CargarRecetasCarrousel]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarRecetasCarrousel]
AS
BEGIN
	SELECT Receta.* FROM Receta_Carrousel 
		INNER JOIN Receta ON Receta.IdReceta = Receta_Carrousel.IdReceta
END
GO
/****** Object:  StoredProcedure [dbo].[CargarRecetaxCategoria]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CargarRecetaxCategoria]
	-- Add the parameters for the stored procedure here
	@IdCategoria INT
AS
BEGIN
	SELECT * FROM Receta WHERE @IdCategoria=IdCategoria
END

GO
/****** Object:  StoredProcedure [dbo].[Favoritos]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Favoritos]
	@IdReceta INT

AS
BEGIN
	SELECT * FROM Receta
	WHERE IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[IngredientesModal]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IngredientesModal]
	@IdReceta INT

AS
BEGIN
	SELECT Ingrediente.Nombre_Ingrediente FROM Ingrediente
	INNER JOIN RecetaxIngrediente ON RecetaxIngrediente.IdIngrediente=Ingrediente.IdIngrediente
	WHERE RecetaxIngrediente.IdReceta=@IdReceta
END

GO
/****** Object:  StoredProcedure [dbo].[Login_VerificarContraseña]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Login_VerificarContraseña]
	-- Add the parameters for the stored procedure here
	@Contraseña varchar(150)
AS
BEGIN
	SELECT Contraseña FROM Usuario WHERE  @Contraseña=Contraseña 
END

GO
/****** Object:  StoredProcedure [dbo].[LoginUsuario]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginUsuario]
	-- Add the parameters for the stored procedure here
	@pUsername varchar(150), @pContraseña varchar(150)
AS
BEGIN
	SELECT * FROM Usuario WHERE @pUsername=Username AND @pContraseña=Contraseña
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimaReceta]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimaReceta]
AS
BEGIN
	select max(IdReceta) as IdReceta from Receta
END

GO
/****** Object:  StoredProcedure [dbo].[OlvideMiContraseña]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OlvideMiContraseña]
	-- Add the parameters for the stored procedure here
	@Mail varchar(150)
AS
BEGIN
	SELECT Contraseña FROM Usuario WHERE @Mail=Mail
END

GO
/****** Object:  StoredProcedure [dbo].[Registro]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Registro]
	-- Add the parameters for the stored procedure here
	@Username varchar(150), @Contraseña varchar(150), @Mail varchar(150)
AS
BEGIN
	INSERT INTO Usuario(Username, Contraseña, Mail) VALUES (@Username, @Contraseña, @Mail)
END

GO
/****** Object:  StoredProcedure [dbo].[Registro_VerificarExistencia]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Registro_VerificarExistencia]
	-- Add the parameters for the stored procedure here
	@Username varchar
AS
BEGIN
	SELECT Username FROM Usuario WHERE @Username= Username
END
GO
/****** Object:  StoredProcedure [dbo].[TodosIngredientes]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[TodosIngredientes]
AS
BEGIN 
	SELECT Nombre_Ingrediente FROM Ingrediente
END

GO
/****** Object:  StoredProcedure [dbo].[UnIngrediente]    Script Date: 3/5/2024 10:31:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UnIngrediente]
@Searching varchar(150)
AS
BEGIN 
	SELECT * FROM Ingrediente
	WHERE Nombre_Ingrediente LIKE CONCAT(@Searching, '%')
END

GO
USE [master]
GO
ALTER DATABASE [Saveurs] SET  READ_WRITE 
GO
