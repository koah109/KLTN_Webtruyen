USE [master]
GO
/****** Object:  Database [webtruyen]    Script Date: 5/20/2024 8:11:02 PM ******/
CREATE DATABASE [webtruyen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webtruyen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\webtruyen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'webtruyen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\webtruyen_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [webtruyen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webtruyen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webtruyen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webtruyen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webtruyen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webtruyen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webtruyen] SET ARITHABORT OFF 
GO
ALTER DATABASE [webtruyen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webtruyen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webtruyen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webtruyen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webtruyen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webtruyen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webtruyen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webtruyen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webtruyen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webtruyen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webtruyen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webtruyen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webtruyen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webtruyen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webtruyen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webtruyen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webtruyen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webtruyen] SET RECOVERY FULL 
GO
ALTER DATABASE [webtruyen] SET  MULTI_USER 
GO
ALTER DATABASE [webtruyen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webtruyen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webtruyen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webtruyen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [webtruyen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [webtruyen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'webtruyen', N'ON'
GO
ALTER DATABASE [webtruyen] SET QUERY_STORE = OFF
GO
USE [webtruyen]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NOT NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
	[token] [nvarchar](max) NULL,
	[roleID] [int] NOT NULL,
	[expireTime] [datetime] NULL,
	[accountBalance] [decimal](18, 0) NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountChaper]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountChaper](
	[accountID] [bigint] NOT NULL,
	[chapterID] [bigint] NOT NULL,
 CONSTRAINT [PK_AccountChaper] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC,
	[chapterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chaper]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chaper](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[content] [ntext] NOT NULL,
	[storyID] [bigint] NOT NULL,
	[order] [bigint] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Chaper] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[userID] [bigint] NOT NULL,
	[storyID] [bigint] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[storyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rate]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rate] [int] NULL,
	[accountId] [bigint] NULL,
	[storyId] [bigint] NULL,
 CONSTRAINT [PK_Rate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[userID] [bigint] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[storyID] [bigint] NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Story]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Story](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NULL,
	[author] [nvarchar](max) NULL,
	[categoryID] [bigint] NOT NULL,
	[isActive] [bit] NULL,
	[totalReview] [bigint] NULL,
	[numOfPeopleReview] [bigint] NULL,
	[status] [nvarchar](max) NULL,
	[createdDate] [datetime] NOT NULL,
	[modifiedDate] [datetime] NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[createdBy] [bigint] NULL,
 CONSTRAINT [PK_Story] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[View]    Script Date: 5/20/2024 8:11:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[View](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[storyId] [bigint] NULL,
	[viewDate] [datetime] NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (1, N'myemail@gmail.com', N'123456', CAST(N'2024-05-12T21:24:40.257' AS DateTime), CAST(N'2024-05-12T21:24:40.257' AS DateTime), NULL, NULL, 0, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (2, N'user1@example.com', N'password1', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (3, N'user2@example.com', N'password2', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (4, N'user3@example.com', N'password3', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (5, N'user4@example.com', N'password4', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (6, N'user5@example.com', N'password5', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (7, N'user6@example.com', N'password6', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (8, N'user7@example.com', N'password7', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (9, N'user8@example.com', N'password8', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (10, N'user9@example.com', N'password9', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (11, N'user10@example.com', N'password10', CAST(N'2024-05-12T22:44:37.290' AS DateTime), CAST(N'2024-05-12T22:44:37.290' AS DateTime), NULL, NULL, 1, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Account] ([id], [email], [password], [createdDate], [modifiedDate], [phone], [address], [isActive], [token], [roleID], [expireTime], [accountBalance], [isDelete]) VALUES (12, N'nguyenthanh231202@gmail.com', N'12345678', CAST(N'2024-05-13T04:03:38.750' AS DateTime), CAST(N'2024-05-13T04:03:38.750' AS DateTime), NULL, NULL, 1, NULL, 2, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (1, N'Tiên Hiệp', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (2, N'Kiếm Hiệp', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (3, N'Truyện Teen', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (4, N'Ngôn Tình', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (5, N'Đam Mỹ', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (6, N'Quan Trường', 1)
GO
INSERT [dbo].[Category] ([id], [name], [isActive]) VALUES (7, N'Thám Hiểm', 1)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Chaper] ON 
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (1, N'Chapter 1', N'Content of Chapter 1', 6, 1, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (2, N'Chapter 2', N'Content of Chapter 2', 6, 2, 0)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (3, N'Chapter 3', N'Content of Chapter 3', 6, 3, 0)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (4, N'Chapter 1', N'Content of Chapter 1', 7, 1, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (5, N'Chapter 2', N'Content of Chapter 2', 7, 2, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (6, N'Chapter 1', N'Content of Chapter 1', 8, 1, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (7, N'Chapter 2', N'Content of Chapter 2', 8, 2, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (8, N'Chapter 3', N'Content of Chapter 3', 8, 3, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (9, N'Chapter 1', N'Content of Chapter 1', 9, 1, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (10, N'Chapter 1', N'Content of Chapter 1', 10, 1, 1)
GO
INSERT [dbo].[Chaper] ([id], [name], [content], [storyID], [order], [status]) VALUES (11, N'Chương 4', N'<p>Chương 4</p>', 6, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Chaper] OFF
GO
SET IDENTITY_INSERT [dbo].[Rate] ON 
GO
INSERT [dbo].[Rate] ([id], [rate], [accountId], [storyId]) VALUES (1, 4, 12, 6)
GO
SET IDENTITY_INSERT [dbo].[Rate] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (2, N'Great story!', 1, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 6)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (3, N'I loved it.', 2, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 6)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (4, N'Could be better.', 3, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 6)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (5, N'Amazing!', 4, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 7)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (6, N'Not my cup of tea.', 5, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 7)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (7, N'Awesome!', 6, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 7)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (8, N'Fantastic!', 7, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 8)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (9, N'Really good.', 8, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 8)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (10, N'Excellent work!', 9, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 9)
GO
INSERT [dbo].[Review] ([id], [content], [userID], [createdDate], [storyID]) VALUES (11, N'Hilarious!', 10, CAST(N'2024-05-12T23:00:44.773' AS DateTime), 10)
GO
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'USER')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'ADMIN')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Story] ON 
GO
INSERT [dbo].[Story] ([id], [title], [description], [author], [categoryID], [isActive], [totalReview], [numOfPeopleReview], [status], [createdDate], [modifiedDate], [image], [createdBy]) VALUES (6, N'The Hobbit', N'Bilbo Baggins embarks on an epic quest.', N'J.R.R. Tolkien', 1, 1, NULL, NULL, NULL, CAST(N'2024-05-12T22:59:04.280' AS DateTime), CAST(N'2024-05-12T22:59:04.280' AS DateTime), N'https://m.media-amazon.com/images/M/MV5BMTcwNTE4MTUxMl5BMl5BanBnXkFtZTcwMDIyODM4OA@@._V1_FMjpg_UX1000_.jpg', 12)
GO
INSERT [dbo].[Story] ([id], [title], [description], [author], [categoryID], [isActive], [totalReview], [numOfPeopleReview], [status], [createdDate], [modifiedDate], [image], [createdBy]) VALUES (7, N'Harry Potter and the Philosopher''s Stone', N'Harry discovers he''s a wizard.', N'J.K. Rowling', 1, 1, NULL, NULL, NULL, CAST(N'2024-05-12T22:59:04.280' AS DateTime), CAST(N'2024-05-12T22:59:04.280' AS DateTime), N'https://m.media-amazon.com/images/M/MV5BNmQ0ODBhMjUtNDRhOC00MGQzLTk5MTAtZDliODg5NmU5MjZhXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_.jpg', 12)
GO
INSERT [dbo].[Story] ([id], [title], [description], [author], [categoryID], [isActive], [totalReview], [numOfPeopleReview], [status], [createdDate], [modifiedDate], [image], [createdBy]) VALUES (8, N'The Da Vinci Code', N'A murder mystery surrounding a famous painting.', N'Dan Brown', 3, 1, NULL, NULL, NULL, CAST(N'2024-05-12T22:59:04.280' AS DateTime), CAST(N'2024-05-12T22:59:04.280' AS DateTime), N'https://resizing.flixster.com/-XZAfHZM39UwaGJIFWKAE8fS0ak=/v3/t/assets/p159678_p_v8_av.jpg', 12)
GO
INSERT [dbo].[Story] ([id], [title], [description], [author], [categoryID], [isActive], [totalReview], [numOfPeopleReview], [status], [createdDate], [modifiedDate], [image], [createdBy]) VALUES (9, N'To Kill a Mockingbird', N'A coming-of-age story set in the American South.', N'Harper Lee', 2, 1, NULL, NULL, NULL, CAST(N'2024-05-12T22:59:04.280' AS DateTime), CAST(N'2024-05-12T22:59:04.280' AS DateTime), N'https://cdn.britannica.com/21/182021-050-666DB6B1/book-cover-To-Kill-a-Mockingbird-many-1961.jpg', 12)
GO
INSERT [dbo].[Story] ([id], [title], [description], [author], [categoryID], [isActive], [totalReview], [numOfPeopleReview], [status], [createdDate], [modifiedDate], [image], [createdBy]) VALUES (10, N'The Great Gatsby', N'Life and decadence in the Jazz Age.', N'F. Scott Fitzgerald', 2, 1, NULL, NULL, NULL, CAST(N'2024-05-12T22:59:04.280' AS DateTime), CAST(N'2024-05-12T22:59:04.280' AS DateTime), N'https://m.media-amazon.com/images/M/MV5BMTkxNTk1ODcxNl5BMl5BanBnXkFtZTcwMDI1OTMzOQ@@._V1_FMjpg_UX1000_.jpg', 12)
GO
SET IDENTITY_INSERT [dbo].[Story] OFF
GO
SET IDENTITY_INSERT [dbo].[View] ON 
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (1, 6, CAST(N'2024-05-16T19:29:30.643' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (2, 7, CAST(N'2024-05-16T19:29:30.643' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (3, 8, CAST(N'2024-05-16T19:29:30.643' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (4, 9, CAST(N'2024-05-16T19:29:30.643' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (5, 10, CAST(N'2024-05-17T19:29:37.577' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (6, 6, CAST(N'2024-05-17T19:29:37.577' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (7, 6, CAST(N'2024-05-17T19:29:37.577' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (8, 7, CAST(N'2024-05-18T19:29:46.420' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (9, 6, CAST(N'2024-05-18T19:29:46.420' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (10, 8, CAST(N'2024-05-18T19:29:46.420' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (11, 9, CAST(N'2024-05-18T19:29:46.420' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (12, 9, CAST(N'2024-05-18T19:29:46.420' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (13, 8, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (14, 10, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (15, 7, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (16, 6, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (17, 8, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (18, 6, CAST(N'2024-05-19T19:29:51.827' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (19, 7, CAST(N'2024-05-20T19:29:59.647' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (20, 10, CAST(N'2024-05-20T19:30:03.723' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (31, 6, CAST(N'2024-05-20T20:09:30.450' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (32, 6, CAST(N'2024-05-20T20:09:38.867' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (33, 6, CAST(N'2024-05-20T20:09:40.067' AS DateTime))
GO
INSERT [dbo].[View] ([id], [storyId], [viewDate]) VALUES (34, 6, CAST(N'2024-05-20T20:10:06.807' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[View] OFF
GO
ALTER TABLE [dbo].[View] ADD  CONSTRAINT [DF_View_viewDate]  DEFAULT (getdate()) FOR [viewDate]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AccountChaper]  WITH CHECK ADD  CONSTRAINT [FK_AccountChaper_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[AccountChaper] CHECK CONSTRAINT [FK_AccountChaper_Account]
GO
ALTER TABLE [dbo].[AccountChaper]  WITH CHECK ADD  CONSTRAINT [FK_AccountChaper_Chaper] FOREIGN KEY([chapterID])
REFERENCES [dbo].[Chaper] ([id])
GO
ALTER TABLE [dbo].[AccountChaper] CHECK CONSTRAINT [FK_AccountChaper_Chaper]
GO
ALTER TABLE [dbo].[Chaper]  WITH CHECK ADD  CONSTRAINT [FK_Chaper_Story] FOREIGN KEY([storyID])
REFERENCES [dbo].[Story] ([id])
GO
ALTER TABLE [dbo].[Chaper] CHECK CONSTRAINT [FK_Chaper_Story]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Account]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Story] FOREIGN KEY([storyID])
REFERENCES [dbo].[Story] ([id])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Story]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Account]
GO
ALTER TABLE [dbo].[Rate]  WITH CHECK ADD  CONSTRAINT [FK_Rate_Story] FOREIGN KEY([storyId])
REFERENCES [dbo].[Story] ([id])
GO
ALTER TABLE [dbo].[Rate] CHECK CONSTRAINT [FK_Rate_Story]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Account]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Story] FOREIGN KEY([storyID])
REFERENCES [dbo].[Story] ([id])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Story]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Account] FOREIGN KEY([createdBy])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Account]
GO
ALTER TABLE [dbo].[Story]  WITH CHECK ADD  CONSTRAINT [FK_Story_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Story] CHECK CONSTRAINT [FK_Story_Category]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FK_View_Story] FOREIGN KEY([storyId])
REFERENCES [dbo].[Story] ([id])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FK_View_Story]
GO
USE [master]
GO
ALTER DATABASE [webtruyen] SET  READ_WRITE 
GO
