USE [master]
GO
/****** Object:  Database [1ten(casino)]    Script Date: 07.11.2024 19:29:30 ******/
CREATE DATABASE [1ten(casino)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'1ten(casino)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\1ten(casino).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'1ten(casino)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\1ten(casino)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [1ten(casino)] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [1ten(casino)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [1ten(casino)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1ten(casino)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1ten(casino)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1ten(casino)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1ten(casino)] SET ARITHABORT OFF 
GO
ALTER DATABASE [1ten(casino)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [1ten(casino)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1ten(casino)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1ten(casino)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1ten(casino)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [1ten(casino)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1ten(casino)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1ten(casino)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1ten(casino)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1ten(casino)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [1ten(casino)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1ten(casino)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [1ten(casino)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [1ten(casino)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [1ten(casino)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1ten(casino)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [1ten(casino)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [1ten(casino)] SET RECOVERY FULL 
GO
ALTER DATABASE [1ten(casino)] SET  MULTI_USER 
GO
ALTER DATABASE [1ten(casino)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [1ten(casino)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [1ten(casino)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [1ten(casino)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [1ten(casino)] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [1ten(casino)] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'1ten(casino)', N'ON'
GO
ALTER DATABASE [1ten(casino)] SET QUERY_STORE = ON
GO
ALTER DATABASE [1ten(casino)] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [1ten(casino)]
GO
/****** Object:  Table [dbo].[Game_History]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_History](
	[History_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Type] [nvarchar](50) NULL,
	[HistoryDate] [date] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Game_History] PRIMARY KEY CLUSTERED 
(
	[History_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game_Sessions]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game_Sessions](
	[Session_ID] [int] IDENTITY(1,1) NOT NULL,
	[Game_ID] [int] NULL,
	[User_ID] [int] NULL,
	[Bet_Amount] [int] NULL,
	[Date] [date] NULL,
	[Win_Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Game_Sessions] PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Game_ID] [int] IDENTITY(1,1) NOT NULL,
	[Game_Name] [nvarchar](50) NULL,
	[Game_Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Game_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[Report_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Wins] [decimal](18, 2) NULL,
	[Losses] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED 
(
	[Report_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Transaction_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NULL,
	[Transaction_Type] [nvarchar](50) NULL,
	[Amount] [int] NULL,
	[Transaction_Date] [date] NULL,
	[Sposob] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Transaction_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07.11.2024 19:29:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RegistrationDate] [date] NULL,
	[Balance] [int] NULL,
	[RoleID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[SecondName] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game_History] ON 

INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (1, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (2, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (3, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (4, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(9360.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (5, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (6, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (7, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (8, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (9, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (10, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (11, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (12, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (13, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (14, 9, N'Проигрыш', CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (15, 9, N'Выигрыш', CAST(N'2024-09-27' AS Date), CAST(2250.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (24, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (25, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(2160.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (26, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (27, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(30600.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (28, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (29, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (30, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(6240.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (31, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (32, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (33, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (40, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (41, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (42, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (43, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (44, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (45, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (46, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (47, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (48, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (49, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (50, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (51, 9, N'Проигрыш', CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (52, 9, N'Выигрыш', CAST(N'2024-09-28' AS Date), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (53, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(85680.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (54, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (55, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (56, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (57, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (58, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (59, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (60, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (61, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (62, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (63, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (64, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (65, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (66, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (67, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (68, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (69, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (70, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (71, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(17920.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (72, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (73, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(8960.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (74, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(26880.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (75, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (76, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (77, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (78, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (79, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (80, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (81, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (82, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (83, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (84, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (85, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (86, 9, N'Проигрыш', CAST(N'2024-10-01' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (87, 9, N'Выигрыш', CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (88, 9, N'Проигрыш', CAST(N'2024-10-19' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (89, 9, N'Проигрыш', CAST(N'2024-10-19' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (90, 9, N'Проигрыш', CAST(N'2024-10-19' AS Date), CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (91, 9, N'Выигрыш', CAST(N'2024-10-19' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_History] ([History_ID], [User_ID], [Type], [HistoryDate], [Amount]) VALUES (92, 9, N'Выигрыш', CAST(N'2024-10-19' AS Date), CAST(1500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Game_History] OFF
GO
SET IDENTITY_INSERT [dbo].[Game_Sessions] ON 

INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (4, 2, 9, 500, CAST(N'2024-09-27' AS Date), CAST(3570.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (5, 2, 9, 500, CAST(N'2024-09-27' AS Date), CAST(1530.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (6, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(14280.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (7, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(7140.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (8, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(4560.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (9, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(5100.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (10, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (11, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(212.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (12, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(530.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (13, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(9000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (14, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(9360.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (15, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(2160.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (16, 2, 9, 100, CAST(N'2024-09-27' AS Date), CAST(30600.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (17, 2, 9, 100, CAST(N'2024-09-27' AS Date), CAST(6240.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (18, 2, 9, 1160, CAST(N'2024-09-27' AS Date), CAST(85680.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (19, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(28000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (20, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(17920.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (21, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(8960.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (22, 2, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(26880.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (23, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (24, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (25, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (26, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (27, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (28, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (29, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (30, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (31, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (32, 3, 9, 1000, CAST(N'2024-09-27' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (33, 3, 9, 1500, CAST(N'2024-09-27' AS Date), CAST(2250.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (42, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (43, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (44, 2, 9, 3000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (45, 2, 9, 3000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (46, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (47, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (48, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (49, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (50, 3, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (51, 3, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (58, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (59, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (60, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (61, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (62, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (63, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (64, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (65, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (66, 3, 9, 5000, CAST(N'2024-09-28' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (67, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (68, 2, 9, 1000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (69, 3, 9, 10000, CAST(N'2024-09-28' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (70, 3, 9, 10000, CAST(N'2024-09-28' AS Date), CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (71, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (72, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (73, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (74, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (75, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (76, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (77, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (78, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (79, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (80, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (81, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (82, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (83, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (84, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (85, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (86, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (87, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (88, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (89, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (90, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (91, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (92, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (93, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (94, 3, 9, 5000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (95, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (96, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (97, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (98, 2, 9, 4000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (99, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (100, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (101, 2, 9, 3000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (102, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (103, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (104, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (105, 2, 9, 2000, CAST(N'2024-10-01' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (106, 2, 9, 1000, CAST(N'2024-10-19' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (107, 2, 9, 1000, CAST(N'2024-10-19' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (108, 2, 9, 1000, CAST(N'2024-10-19' AS Date), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (109, 3, 9, 1000, CAST(N'2024-10-19' AS Date), CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Game_Sessions] ([Session_ID], [Game_ID], [User_ID], [Bet_Amount], [Date], [Win_Amount]) VALUES (110, 3, 9, 1000, CAST(N'2024-10-19' AS Date), CAST(1500.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Game_Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Game_ID], [Game_Name], [Game_Type]) VALUES (2, N'Мины', N'Мины')
INSERT [dbo].[Games] ([Game_ID], [Game_Name], [Game_Type]) VALUES (3, N'Blackjack', N'Карты')
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Админ')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (20, 6, N'Пополнение', 10000, CAST(N'2024-09-27' AS Date), N'Банковская карта')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (21, 9, N'Пополнение', 5000, CAST(N'2024-09-27' AS Date), N'Электронный кошёелёк')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (22, 9, N'Пополнение', 10000, CAST(N'2024-09-27' AS Date), N'Электронный кошёелёк')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (24, 9, N'Пополнение', 1000, CAST(N'2024-09-28' AS Date), N'Другой способ')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (25, 9, N'Списание', 5000, CAST(N'2024-09-28' AS Date), N'Электронный кошёелёк')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (27, 9, N'Пополнение', 10000, CAST(N'2024-09-28' AS Date), N'Банковская карта')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (28, 9, N'Списание', 5000, CAST(N'2024-09-28' AS Date), N'Электронный кошёелёк')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (29, 9, N'Пополнение', 50000, CAST(N'2024-10-01' AS Date), N'Электронный кошёелёк')
INSERT [dbo].[Transactions] ([Transaction_ID], [User_ID], [Transaction_Type], [Amount], [Transaction_Date], [Sposob]) VALUES (30, 9, N'Списание', 5000, CAST(N'2024-10-01' AS Date), N'Банковская карта')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Login], [Password], [RegistrationDate], [Balance], [RoleID], [FirstName], [SecondName], [PhoneNumber]) VALUES (6, N'admin', N'admin', CAST(N'2024-09-20' AS Date), 10000, 1, N'Галимов', N'Тимур', NULL)
INSERT [dbo].[Users] ([User_ID], [Login], [Password], [RegistrationDate], [Balance], [RoleID], [FirstName], [SecondName], [PhoneNumber]) VALUES (9, N'user', N'user', CAST(N'2024-09-27' AS Date), 92522, 2, N'Ихсанов', N'Тамерлан', N'89372894016')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Game_History]  WITH CHECK ADD  CONSTRAINT [FK_Game_History_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Game_History] CHECK CONSTRAINT [FK_Game_History_Users]
GO
ALTER TABLE [dbo].[Game_Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Game_Sessions_Games] FOREIGN KEY([Game_ID])
REFERENCES [dbo].[Games] ([Game_ID])
GO
ALTER TABLE [dbo].[Game_Sessions] CHECK CONSTRAINT [FK_Game_Sessions_Games]
GO
ALTER TABLE [dbo].[Game_Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Game_Sessions_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Game_Sessions] CHECK CONSTRAINT [FK_Game_Sessions_Users]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Users] FOREIGN KEY([Report_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Users]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [1ten(casino)] SET  READ_WRITE 
GO
