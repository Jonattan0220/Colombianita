USE [master]
GO
/****** Object:  Database [Colombianita]    Script Date: 15/07/2022 12:36:09 ******/
CREATE DATABASE [Colombianita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Colombianita', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Colombianita.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Colombianita_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Colombianita_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Colombianita] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Colombianita].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Colombianita] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Colombianita] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Colombianita] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Colombianita] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Colombianita] SET ARITHABORT OFF 
GO
ALTER DATABASE [Colombianita] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Colombianita] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Colombianita] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Colombianita] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Colombianita] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Colombianita] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Colombianita] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Colombianita] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Colombianita] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Colombianita] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Colombianita] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Colombianita] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Colombianita] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Colombianita] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Colombianita] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Colombianita] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Colombianita] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Colombianita] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Colombianita] SET  MULTI_USER 
GO
ALTER DATABASE [Colombianita] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Colombianita] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Colombianita] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Colombianita] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Colombianita] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Colombianita] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Colombianita] SET QUERY_STORE = OFF
GO
USE [Colombianita]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 15/07/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[LegalRepresentative] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/07/2022 12:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [Name], [Province], [City], [Address], [PhoneNumber], [LegalRepresentative]) VALUES (1, N'Colombianita S.A.', N'Valle del Cauca', N'Jumbo', N'Calle 5 2 69', N'54326985', N'Luis Miguel Olivares')
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (1, N'Gomas', 1)
INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (2, N'Dulces', 1)
INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (3, N'Galletas', 1)
INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (4, N'Caramelo', 1)
INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (5, N'Gomas', 1)
INSERT [dbo].[Product] ([ProductId], [Name], [CompanyId]) VALUES (6, N'Arroz', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Company]
GO
USE [master]
GO
ALTER DATABASE [Colombianita] SET  READ_WRITE 
GO
