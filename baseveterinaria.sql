USE [master]
GO
/****** Object:  Database [BASEVETE]    Script Date: 23/11/2022 11:28:11 a. m. ******/
CREATE DATABASE [BASEVETE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BASEVETE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BASEVETE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BASEVETE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BASEVETE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BASEVETE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BASEVETE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BASEVETE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BASEVETE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BASEVETE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BASEVETE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BASEVETE] SET ARITHABORT OFF 
GO
ALTER DATABASE [BASEVETE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BASEVETE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BASEVETE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BASEVETE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BASEVETE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BASEVETE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BASEVETE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BASEVETE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BASEVETE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BASEVETE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BASEVETE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BASEVETE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BASEVETE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BASEVETE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BASEVETE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BASEVETE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BASEVETE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BASEVETE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BASEVETE] SET  MULTI_USER 
GO
ALTER DATABASE [BASEVETE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BASEVETE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BASEVETE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BASEVETE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BASEVETE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BASEVETE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BASEVETE] SET QUERY_STORE = OFF
GO
USE [BASEVETE]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[NombreP] [varchar](50) NULL,
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nchar](10) NULL,
	[Telefono] [nchar](15) NULL,
	[CodigoP] [int] NULL,
	[FechaDA] [date] NULL,
	[FechaUV] [date] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVENTARIO]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTARIO](
	[Articulo] [varchar](50) NULL,
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Stock] [nchar](10) NULL,
	[Deposito] [nchar](10) NULL,
	[Precio] [nchar](10) NULL,
 CONSTRAINT [PK_INVENTARIO] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO2]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO2](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_USUARIO2] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[buscar_clientes]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[buscar_clientes]
@letra as varchar(50)
as
select NombreP, Codigo as ID, Email, Telefono, CodigoP,FechaDA,	FechaUV
from Cliente
where NombreP LIKE '%' + @letra + '%'
GO
/****** Object:  StoredProcedure [dbo].[buscar_usuarios]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[buscar_usuarios]
@letra as varchar(50)
as
select Articulo, Codigo as ID, Stock, Deposito, Precio
from INVENTARIO
where Articulo LIKE '%' + @letra + '%'
GO
/****** Object:  StoredProcedure [dbo].[editar_cliente]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[editar_cliente]
@Nombre varchar(50),
@codigo int,
@Email varchar(50),
@Telefono nchar(15),
@CodigoPostal int,
@Fechadealta date,
@Fechadeultimavisita date
as
update Cliente set NombreP=@Nombre ,Email=@Email ,Telefono=@Telefono ,CodigoP=@CodigoPostal,FechaDA=@Fechadealta,FechaUV=@Fechadeultimavisita
where Codigo=@codigo
GO
/****** Object:  StoredProcedure [dbo].[editar_usuario]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[editar_usuario]
@Articulo varchar(50),
@codigo int,
@Stock nchar(10),
@Deposito nchar(10),
@Precio nchar(10)
as
update INVENTARIO set Articulo=@Articulo ,Stock=@Stock ,Deposito=@Deposito ,Precio=@Precio
where Codigo=@codigo
GO
/****** Object:  StoredProcedure [dbo].[eliminar_cliente]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[eliminar_cliente]
@codigo int
as
delete from Cliente where Codigo=@codigo
GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_usuario]
@codigo int
as
delete from INVENTARIO where Codigo=@codigo
GO
/****** Object:  StoredProcedure [dbo].[insertar_clientes]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[insertar_clientes]
@Nombre varchar(50),
@Email varchar(50),
@Telefono nchar(15),
@CodigoPostal int,
@Fechadealta date,
@Fechadeultimavisita date
as
insert into Cliente(NombreP,Email,Telefono,CodigoP,FechaDA,FechaUV) VALUES(@Nombre, @Email, @Telefono, @CodigoPostal, @Fechadealta, @Fechadeultimavisita)
GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertar_usuario]
@Articulo varchar(50),
@Stock nchar(10),
@Deposito nchar(10),
@Precio nchar(10)
as
insert into INVENTARIO VALUES(@Articulo,@Stock, @Deposito, @Precio)
GO
/****** Object:  StoredProcedure [dbo].[mostrar_cliente]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[mostrar_cliente]
as
select NombreP, Codigo as ID, Email, Telefono, CodigoP, FechaDA, FechaUV
from Cliente
GO
/****** Object:  StoredProcedure [dbo].[mostrar_usuario]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[mostrar_usuario]
as
select Articulo, Codigo as ID,Stock, Deposito, Precio
from INVENTARIO
GO
/****** Object:  StoredProcedure [dbo].[validar_usuario]    Script Date: 23/11/2022 11:28:11 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validar_usuario]
@login varchar(50),
@password varchar(50)
as
select * from USUARIO2
where Login =@login and Password = @password
GO
USE [master]
GO
ALTER DATABASE [BASEVETE] SET  READ_WRITE 
GO
