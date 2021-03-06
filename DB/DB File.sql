USE [master]
GO
/****** Object:  Database [DynamcisLinkDB]    Script Date: 7/1/2020 11:23:04 PM ******/
CREATE DATABASE [DynamcisLinkDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DynamcisLinkDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DynamcisLinkDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DynamcisLinkDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DynamcisLinkDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DynamcisLinkDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DynamcisLinkDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DynamcisLinkDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DynamcisLinkDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DynamcisLinkDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DynamcisLinkDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DynamcisLinkDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET RECOVERY FULL 
GO
ALTER DATABASE [DynamcisLinkDB] SET  MULTI_USER 
GO
ALTER DATABASE [DynamcisLinkDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DynamcisLinkDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DynamcisLinkDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DynamcisLinkDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DynamcisLinkDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DynamcisLinkDB', N'ON'
GO
USE [DynamcisLinkDB]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 7/1/2020 11:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_no] [int] NULL,
	[store_id] [int] NOT NULL,
	[invoice_date] [datetime] NULL,
	[total] [decimal](18, 0) NULL,
	[taxes] [decimal](18, 0) NULL,
	[net] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Details]    Script Date: 7/1/2020 11:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[unit_id] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[qty] [int] NOT NULL,
	[total] [decimal](18, 0) NULL,
	[discount] [decimal](18, 0) NULL,
	[net] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Invoice_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/1/2020 11:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id] [int] NOT NULL,
	[item_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stores]    Script Date: 7/1/2020 11:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[id] [int] NOT NULL,
	[store_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Units]    Script Date: 7/1/2020 11:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[id] [int] NOT NULL,
	[unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([id], [invoice_no], [store_id], [invoice_date], [total], [taxes], [net]) VALUES (47, 10, 1, CAST(N'2020-07-01 23:03:18.100' AS DateTime), CAST(4435 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), CAST(4202 AS Decimal(18, 0)))
INSERT [dbo].[Invoice] ([id], [invoice_no], [store_id], [invoice_date], [total], [taxes], [net]) VALUES (48, 0, 1, CAST(N'2020-07-01 23:18:55.777' AS DateTime), CAST(4 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[Invoice_Details] ON 

INSERT [dbo].[Invoice_Details] ([id], [invoice_id], [item_id], [unit_id], [price], [qty], [total], [discount], [net]) VALUES (59, 47, 2, 2, CAST(1 AS Decimal(18, 0)), 2, CAST(2 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)))
INSERT [dbo].[Invoice_Details] ([id], [invoice_id], [item_id], [unit_id], [price], [qty], [total], [discount], [net]) VALUES (60, 47, 3, 3, CAST(13 AS Decimal(18, 0)), 341, CAST(4433 AS Decimal(18, 0)), CAST(233 AS Decimal(18, 0)), CAST(4200 AS Decimal(18, 0)))
INSERT [dbo].[Invoice_Details] ([id], [invoice_id], [item_id], [unit_id], [price], [qty], [total], [discount], [net]) VALUES (61, 48, 2, 2, CAST(2 AS Decimal(18, 0)), 2, CAST(4 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Invoice_Details] OFF
INSERT [dbo].[Items] ([id], [item_name]) VALUES (1, N'item1')
INSERT [dbo].[Items] ([id], [item_name]) VALUES (2, N'item2')
INSERT [dbo].[Items] ([id], [item_name]) VALUES (3, N'item3')
INSERT [dbo].[Items] ([id], [item_name]) VALUES (4, N'item4')
INSERT [dbo].[Stores] ([id], [store_name]) VALUES (1, N'store1')
INSERT [dbo].[Stores] ([id], [store_name]) VALUES (2, N'store2')
INSERT [dbo].[Stores] ([id], [store_name]) VALUES (3, N'store3')
INSERT [dbo].[Stores] ([id], [store_name]) VALUES (4, N'store4')
INSERT [dbo].[Units] ([id], [unit_name]) VALUES (1, N'unit1')
INSERT [dbo].[Units] ([id], [unit_name]) VALUES (2, N'unit2')
INSERT [dbo].[Units] ([id], [unit_name]) VALUES (3, N'unit3')
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Stores]
GO
ALTER TABLE [dbo].[Invoice_Details]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Details_Invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Details] CHECK CONSTRAINT [FK_Invoice_Details_Invoice]
GO
ALTER TABLE [dbo].[Invoice_Details]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Details_Items] FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([id])
GO
ALTER TABLE [dbo].[Invoice_Details] CHECK CONSTRAINT [FK_Invoice_Details_Items]
GO
ALTER TABLE [dbo].[Invoice_Details]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Details_Units] FOREIGN KEY([unit_id])
REFERENCES [dbo].[Units] ([id])
GO
ALTER TABLE [dbo].[Invoice_Details] CHECK CONSTRAINT [FK_Invoice_Details_Units]
GO
USE [master]
GO
ALTER DATABASE [DynamcisLinkDB] SET  READ_WRITE 
GO
