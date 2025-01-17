USE [master]
GO
/****** Object:  Database [TestDB_BS23]    Script Date: 5/14/2020 5:21:36 PM ******/
CREATE DATABASE [TestDB_BS23]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB_BS23', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TestDB_BS23.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDB_BS23_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TestDB_BS23_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestDB_BS23] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB_BS23].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB_BS23] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB_BS23] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB_BS23] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB_BS23] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB_BS23] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB_BS23] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB_BS23] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB_BS23] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB_BS23] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB_BS23] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB_BS23] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB_BS23] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB_BS23] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB_BS23] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB_BS23] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB_BS23] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB_BS23] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB_BS23] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB_BS23] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB_BS23] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB_BS23] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB_BS23] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB_BS23] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB_BS23] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB_BS23] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB_BS23] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB_BS23] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB_BS23] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TestDB_BS23] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDB_BS23', N'ON'
GO
USE [TestDB_BS23]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/14/2020 5:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/14/2020 5:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Post_id] [int] NOT NULL,
	[Commented_by] [int] NOT NULL,
	[CommentMessage] [nvarchar](max) NOT NULL,
	[Comment_Time] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dislikes]    Script Date: 5/14/2020 5:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dislikes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Disliked_by] [int] NOT NULL,
	[Comment_id] [int] NOT NULL,
 CONSTRAINT [PK_Dislikes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 5/14/2020 5:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Liked_by] [int] NOT NULL,
	[Comment_id] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 5/14/2020 5:21:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostBody] [nvarchar](max) NOT NULL,
	[Posted_by] [int] NOT NULL,
	[PostTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/14/2020 5:21:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514075238_InitialMigrtion', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514080215_DislikeMigrtion', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514080320_DislikeMigrtionRe', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514085244_CommentMigration', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514090935_ServerSidePagination', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200514093157_ServerSidePagination2', N'3.1.4')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (1, 1, 2, N'Hi', CAST(N'2020-05-14T13:58:22.6630000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (2, 2, 1, N'Hello', CAST(N'2020-05-14T13:58:58.4770000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (3, 3, 1, N'Hi', CAST(N'2020-05-14T14:44:51.6030000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (4, 4, 2, N'Hooo', CAST(N'2020-05-14T14:44:59.5200000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (5, 2, 3, N'Hiiiiiii', CAST(N'2020-05-14T14:45:11.5370000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [Post_id], [Commented_by], [CommentMessage], [Comment_Time]) VALUES (6, 1, 4, N'2222222', CAST(N'2020-05-14T14:45:29.3400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Dislikes] ON 

INSERT [dbo].[Dislikes] ([Id], [Disliked_by], [Comment_id]) VALUES (1, 4, 1)
INSERT [dbo].[Dislikes] ([Id], [Disliked_by], [Comment_id]) VALUES (2, 4, 2)
INSERT [dbo].[Dislikes] ([Id], [Disliked_by], [Comment_id]) VALUES (3, 4, 1)
INSERT [dbo].[Dislikes] ([Id], [Disliked_by], [Comment_id]) VALUES (4, 4, 0)
SET IDENTITY_INSERT [dbo].[Dislikes] OFF
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (1, 2, 1)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (2, 1, 1)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (3, 1, 3)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (4, 2, 4)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (6, 1, 5)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (9, 3, 2)
INSERT [dbo].[Likes] ([Id], [Liked_by], [Comment_id]) VALUES (10, 1, 6)
SET IDENTITY_INSERT [dbo].[Likes] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (1, N'Hello World!', 1, CAST(N'2020-05-14T13:55:13.3970000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (2, N'Hello Dhaka', 2, CAST(N'2020-05-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (3, N'Hi There', 3, CAST(N'2020-05-14T14:00:08.3730000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (4, N'Whats on your mind?', 4, CAST(N'2020-05-14T14:00:29.9270000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (5, N'Good Afternoon', 1, CAST(N'2020-05-14T16:48:17.4030000' AS DateTime2))
INSERT [dbo].[Posts] ([Id], [PostBody], [Posted_by], [PostTime]) VALUES (6, N'Good Day', 2, CAST(N'2020-05-14T16:48:54.5430000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [Email], [Gender]) VALUES (1, N'Admin', N'admin@gmail.com', N'Male')
INSERT [dbo].[Users] ([ID], [Username], [Email], [Gender]) VALUES (2, N'User1', N'user1@gmail.com', N'Female')
INSERT [dbo].[Users] ([ID], [Username], [Email], [Gender]) VALUES (3, N'user2', N'user2@gmail.com', N'Male')
INSERT [dbo].[Users] ([ID], [Username], [Email], [Gender]) VALUES (4, N'user3', N'User3@gmail.com', N'Male')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_Comment_Time]  DEFAULT (getdate()) FOR [Comment_Time]
GO
ALTER TABLE [dbo].[Dislikes] ADD  DEFAULT ((0)) FOR [Comment_id]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT ((0)) FOR [Comment_id]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_Posts_PostTime]  DEFAULT (getdate()) FOR [PostTime]
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetPost]    Script Date: 5/14/2020 5:21:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Usp_GetPost]  
                         @PageNo INT ,  
                         @PageSize INT 
                        As  
                        Begin  
                            Select * From (Select ROW_NUMBER() Over (
	                        Order by id) AS 'RowNum', * from [dbo].Posts)t
	                        where t.RowNum Between ((@PageNo-1)*@PageSize +1) AND (@PageNo*@pageSize)  
                        End
GO
USE [master]
GO
ALTER DATABASE [TestDB_BS23] SET  READ_WRITE 
GO
