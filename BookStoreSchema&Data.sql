USE [master]
GO
/****** Object:  Database [BOOKSTORE]    Script Date: 6/21/2020 7:37:31 AM ******/
CREATE DATABASE [BOOKSTORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BOOKSTORE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.YUZUKI\MSSQL\DATA\BOOKSTORE.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BOOKSTORE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.YUZUKI\MSSQL\DATA\BOOKSTORE_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BOOKSTORE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BOOKSTORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BOOKSTORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BOOKSTORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BOOKSTORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BOOKSTORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BOOKSTORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [BOOKSTORE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BOOKSTORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BOOKSTORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BOOKSTORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BOOKSTORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BOOKSTORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BOOKSTORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BOOKSTORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BOOKSTORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BOOKSTORE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BOOKSTORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BOOKSTORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BOOKSTORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BOOKSTORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BOOKSTORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BOOKSTORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BOOKSTORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BOOKSTORE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BOOKSTORE] SET  MULTI_USER 
GO
ALTER DATABASE [BOOKSTORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BOOKSTORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BOOKSTORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BOOKSTORE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BOOKSTORE] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BOOKSTORE]
GO
/****** Object:  Table [dbo].[AUTHOR]    Script Date: 6/21/2020 7:37:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHOR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_AUTHOR]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_AUTHOR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BOOK_ID] [int] NULL,
	[AUTHOR_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_GENRE]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_GENRE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BOOK_ID] [int] NULL,
	[GENRE_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOK_IMAGE]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_IMAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IMAGE1] [nvarchar](255) NULL,
	[IMAGE2] [nvarchar](255) NULL,
	[IMAGE3] [nvarchar](255) NULL,
	[IMAGE4] [nvarchar](255) NULL,
	[BOOK_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BOOKS]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[EXCERPT] [nvarchar](max) NULL,
	[DESCRIPTION] [nvarchar](max) NULL,
	[PUBLISH_DATE] [date] NULL,
	[PRICE] [int] NULL,
	[BOOK_URL] [nvarchar](255) NULL,
	[PREVIEW] [nvarchar](255) NULL,
	[PUBLISHER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATUS] [int] NULL,
	[CREATED] [date] NULL,
	[EMAIL] [nvarchar](255) NULL,
	[NAME] [nvarchar](255) NULL,
	[CONTENT] [nvarchar](max) NULL,
	[POST_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
	[USERNAME] [nvarchar](255) NULL,
	[PASSWORD] [nvarchar](255) NULL,
	[AVATAR] [nvarchar](255) NULL,
	[GENDER] [bit] NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[ROLE] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GENRE]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GENRE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[PHONE] [nvarchar](255) NULL,
	[TOTALAMOUNT] [int] NULL,
	[CREATED_DATE] [date] NULL,
	[STATUS] [bit] NULL,
	[PAYMENTMETHOD] [int] NULL,
	[CUSTOMER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERDETAIL]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERDETAIL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AMOUNT] [int] NULL,
	[PRICE] [int] NULL,
	[QUANTITY] [int] NULL,
	[NOTE] [nvarchar](255) NULL,
	[ORDER_ID] [int] NULL,
	[BOOK_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[POST]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](255) NULL,
	[EXCERPT] [nvarchar](max) NULL,
	[CONTENT] [nvarchar](max) NULL,
	[STATUS] [int] NULL,
	[CREATED] [date] NULL,
	[POSTURL] [nvarchar](255) NULL,
	[CUSTOMER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PUBLISHER]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WHISHLIST]    Script Date: 6/21/2020 7:37:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHISHLIST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BOOK_ID] [int] NULL,
	[CUSTOMER_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BOOK_GENRE] ON 

INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (1, 1, 1)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (2, 1, 4)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (3, 1, 2)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (4, 2, 3)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (5, 2, 1)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (6, 2, 4)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (7, 3, 1)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (8, 3, 5)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (9, 3, 6)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (10, 4, 2)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (11, 4, 3)
INSERT [dbo].[BOOK_GENRE] ([ID], [BOOK_ID], [GENRE_ID]) VALUES (12, 4, 4)
SET IDENTITY_INSERT [dbo].[BOOK_GENRE] OFF
SET IDENTITY_INSERT [dbo].[BOOK_IMAGE] ON 

INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (1, N'84.jpg', N'83.jpg', N'42.jpg', N'41.jpg', 1)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (2, N'82.jpg', N'81.jpg', N'40.jpg', N'39.jpg', 2)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (3, N'80.jpg', N'79.jpg', N'38.jpg', N'37.jpg', 3)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (4, N'78.jpg', N'77.jpg', N'36.jpg', N'35.png', 4)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (5, N'76.jpg', N'75.jpg', N'34.jpg', N'33.jpg', 5)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (6, N'74.jpg', N'73.jpg', N'32.jpg', N'31.jpg', 6)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (7, N'72.jpg', N'71.png', N'30.jpg', N'29.jpg', 7)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (8, N'70.jpg', N'69.jpg', N'28.jpg', N'27.jpg', 8)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (9, N'68.jpg', N'67.jpg', N'26.jpg', N'25.jpg', 9)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (10, N'66.jpg', N'65.jpg', N'24.jpg', N'23.jpg', 10)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (11, N'64.jpg', N'63.jpg', N'22.jpg', N'21.jpg', 11)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (12, N'62.jpg', N'61.png', N'20.jpg', N'19.jpg', 12)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (13, N'60.jpg', N'59.jpg', N'18.jpg', N'17.jpg', 13)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (14, N'58.jpg', N'57.jpg', N'16.jpg', N'15.jpg', 14)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (15, N'56.jpg', N'55.jpg', N'14.jpg', N'13.jpg', 15)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (16, N'54.jpg', N'53.jpg', N'12.jpg', N'11.jpg', 16)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (17, N'52.jpg', N'51.jpg', N'10.jpg', N'9.jpg', 17)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (18, N'50.jpg', N'49.jpg', N'8.jpg', N'7.jpg', 18)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (19, N'48.png', N'47.jpg', N'6.jpg', N'5.jpg', 19)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (20, N'46.png', N'45.jpg', N'4.jpg', N'3.jpg', 20)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (21, N'44.jpg', N'43.jpg', N'2.jpg', N'1.jpg', 21)
INSERT [dbo].[BOOK_IMAGE] ([ID], [IMAGE1], [IMAGE2], [IMAGE3], [IMAGE4], [BOOK_ID]) VALUES (22, N'88.jpg', N'87.jpg', N'86.jpg', N'85.jpg', 22)
SET IDENTITY_INSERT [dbo].[BOOK_IMAGE] OFF
SET IDENTITY_INSERT [dbo].[BOOKS] ON 

INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (1, N'The Boy ,Tiger Heart', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-06-12' AS Date), 40000, N'84.jpg', N'83.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (2, N'The Imortalists', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-05-18' AS Date), 35000, N'82.jpg', N'81.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (3, N'Up Up,Down Down', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-05-20' AS Date), 35000, N'80.jpg', N'79.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (4, N'Brown', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-11-25' AS Date), 50000, N'78.jpg', N'77.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (5, N'The Hospital', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-01-10' AS Date), 35000, N'76.jpg', N'75.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (6, N'The Emissary', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-01-08' AS Date), 35000, N'74.jpg', N'73.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (7, N'Hippie', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-05-28' AS Date), 40000, N'72.jpg', N'71.png', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (8, N'Frankenstein', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-03-10' AS Date), 55000, N'70.jpg', N'69.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (9, N'The Hole', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-11-30' AS Date), 40000, N'68.jpg', N'67.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (10, N'Heart Spring Mountain', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-11-01' AS Date), 60000, N'23.jpg', N'65.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (11, N'Cherry', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-06-25' AS Date), 65000, N'64.jpg', N'63.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (12, N'The Caregiver', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2019-11-15' AS Date), 165000, N'62.jpg', N'61.png', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (13, N'Crudo', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-12-01' AS Date), 52000, N'60.jpg', N'59.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (14, N'Interior', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-09-01' AS Date), 50000, N'58.jpg', N'57.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (15, N'Insomnia', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-01-23' AS Date), 75000, N'56.jpg', N'55.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (16, N'The Pisces', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-05-23' AS Date), 86000, N'54.jpg', N'53.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (17, N'The Removes', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-01-15' AS Date), 92000, N'52.jpg', N'51.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (18, N'Small Fry', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-07-09' AS Date), 99000, N'50.jpg', N'49.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (19, N'Impossible Owl', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-02-29' AS Date), 102000, N'48.png', N'47.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (20, N'Green', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-03-24' AS Date), 39000, N'46.png', N'45.jpg', 1)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (21, N'Wait,Blink', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-05-03' AS Date), 56000, N'44.jpg', N'43.jpg', 2)
INSERT [dbo].[BOOKS] ([ID], [TITLE], [EXCERPT], [DESCRIPTION], [PUBLISH_DATE], [PRICE], [BOOK_URL], [PREVIEW], [PUBLISHER_ID]) VALUES (22, N'The Tiny Dragon', N'Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.', N'Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises superior warmth with every wear. Thick material blocks out the wind as ribbed cuffs and bottom band seal in body heat.', CAST(N'2020-06-23' AS Date), 149000, N'88.jpg', N'87.jpg', 2)
SET IDENTITY_INSERT [dbo].[BOOKS] OFF
SET IDENTITY_INSERT [dbo].[COMMENT] ON 

INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (1, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 1)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (2, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 1)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (3, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 1)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (4, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 2)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (5, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 2)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (6, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 2)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (7, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 3)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (8, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 3)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (9, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 3)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (10, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 4)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (11, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 4)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (12, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 4)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (13, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 5)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (14, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 5)
INSERT [dbo].[COMMENT] ([ID], [STATUS], [CREATED], [EMAIL], [NAME], [CONTENT], [POST_ID]) VALUES (15, 0, CAST(N'2020-06-21' AS Date), N'fis06279@cuoly.com', N'admin', N'Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit', 5)
SET IDENTITY_INSERT [dbo].[COMMENT] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMERS] ON 

INSERT [dbo].[CUSTOMERS] ([ID], [NAME], [USERNAME], [PASSWORD], [AVATAR], [GENDER], [ADDRESS], [EMAIL], [PHONE], [ROLE]) VALUES (1, N'Nguyễn Văn Khá', N'Kha', N'$2a$10$.fYhUKGlg3/Mvl5lKVwQ/O4n9rsxEq1YhHABvC7kXvmTo00.uQ2hO', N'default.jpg', 0, N'441 Hoàng Quốc Việt', N'Abc@gmail.com', N'0344291555', 1)
INSERT [dbo].[CUSTOMERS] ([ID], [NAME], [USERNAME], [PASSWORD], [AVATAR], [GENDER], [ADDRESS], [EMAIL], [PHONE], [ROLE]) VALUES (2, N'Nguyễn Văn Phong', N'Phong', N'$2a$10$fE88vVX4Hn6WhQQKJIQ6wuxVUGW2hxtbstGPYH62ezYGPQsY2dxMu', N'hung-nguyen-camille.jpg', 0, N'441 Hoàng Quốc Việt', N'Def@gmail.com', N'987654321', 0)
SET IDENTITY_INSERT [dbo].[CUSTOMERS] OFF
SET IDENTITY_INSERT [dbo].[GENRE] ON 

INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (1, N'Biographic')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (2, N'Adventure')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (3, N'Children')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (4, N'Cook')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (5, N'Business')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (6, N'History')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (7, N'Romance')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (8, N'Fiction/Fantasy')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (9, N'Mystery')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (10, N'Science')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (11, N'Self-Improvement')
INSERT [dbo].[GENRE] ([ID], [NAME]) VALUES (12, N'Fantasy')
SET IDENTITY_INSERT [dbo].[GENRE] OFF
SET IDENTITY_INSERT [dbo].[POST] ON 

INSERT [dbo].[POST] ([ID], [TITLE], [EXCERPT], [CONTENT], [STATUS], [CREATED], [POSTURL], [CUSTOMER_ID]) VALUES (1, N'William Shakespeare ,The Plays', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor ac ante egestas hendrerit. Aliquam et metus pharetra, bibendum massa nec, fermentum odio. Nunc id leo ultrices, mollis ligula in, finibus tortor. Mauris eu dui ut lectus fermentum eleifend. Pellentesque faucibus sem ante, non malesuada odio varius nec. Suspendisse potenti. Proin consectetur aliquam odio nec fringilla. Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit amet ligula condimentum sagittis.

Quisque semper nunc vitae erat pellentesque, ac placerat arcu consectetur. In venenatis elit ac ultrices convallis. Duis est nisi, tincidunt ac urna sed, cursus blandit lectus. In ullamcorper sit amet ligula ut eleifend. Proin dictum tempor ligula, ac feugiat metus. Sed finibus tortor eu scelerisque scelerisque.
Aenean et tempor eros, vitae sollicitudin velit. Etiam varius enim nec quam tempor, sed efficitur ex ultrices. Phasellus pretium est vel dui vestibulum condimentum. Aenean nec suscipit nibh. Phasellus nec lacus id arcu facilisis elementum. Curabitur lobortis, elit ut elementum congue, erat ex bibendum odio, nec iaculis lacus sem non lorem. Duis suscipit metus ante, sed convallis quam posuere quis. Ut tincidunt eleifend odio, ac fringilla mi vehicula nec. Nunc vitae lacus eget lectus imperdiet tempus sed in dui. Nam molestie magna at risus consectetur, placerat suscipit justo dignissim. Sed vitae fringilla enim, nec ullamcorper arcu.

Suspendisse turpis ipsum, tempus in nulla eu, posuere pharetra nibh. In dignissim vitae lorem non mollis. Praesent pretium tellus in tortor viverra condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel. Vivamus finibus mi a neque pretium, ut convallis dui lacinia. Morbi a rutrum velit. Curabitur sagittis quam quis consectetur mattis. Aenean sit amet quam vel turpis interdum sagittis et eget neque. Nunc ante quam, luctus et neque a, interdum iaculis metus. Aliquam vel ante mattis, placerat orci id, vehicula quam. Suspendisse quis eros cursus, viverra urna sed, commodo mauris. Cras diam arcu, fringilla a sem condimentum, viverra facilisis nunc. Curabitur vitae orci id nulla maximus maximus. Nunc pulvinar sollicitudin molestie.', 0, CAST(N'2020-06-19' AS Date), N'1.jpg', 1)
INSERT [dbo].[POST] ([ID], [TITLE], [EXCERPT], [CONTENT], [STATUS], [CREATED], [POSTURL], [CUSTOMER_ID]) VALUES (2, N'The Joy Of Reading', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor ac ante egestas hendrerit. Aliquam et metus pharetra, bibendum massa nec, fermentum odio. Nunc id leo ultrices, mollis ligula in, finibus tortor. Mauris eu dui ut lectus fermentum eleifend. Pellentesque faucibus sem ante, non malesuada odio varius nec. Suspendisse potenti. Proin consectetur aliquam odio nec fringilla. Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit amet ligula condimentum sagittis.

Quisque semper nunc vitae erat pellentesque, ac placerat arcu consectetur. In venenatis elit ac ultrices convallis. Duis est nisi, tincidunt ac urna sed, cursus blandit lectus. In ullamcorper sit amet ligula ut eleifend. Proin dictum tempor ligula, ac feugiat metus. Sed finibus tortor eu scelerisque scelerisque.
Aenean et tempor eros, vitae sollicitudin velit. Etiam varius enim nec quam tempor, sed efficitur ex ultrices. Phasellus pretium est vel dui vestibulum condimentum. Aenean nec suscipit nibh. Phasellus nec lacus id arcu facilisis elementum. Curabitur lobortis, elit ut elementum congue, erat ex bibendum odio, nec iaculis lacus sem non lorem. Duis suscipit metus ante, sed convallis quam posuere quis. Ut tincidunt eleifend odio, ac fringilla mi vehicula nec. Nunc vitae lacus eget lectus imperdiet tempus sed in dui. Nam molestie magna at risus consectetur, placerat suscipit justo dignissim. Sed vitae fringilla enim, nec ullamcorper arcu.

Suspendisse turpis ipsum, tempus in nulla eu, posuere pharetra nibh. In dignissim vitae lorem non mollis. Praesent pretium tellus in tortor viverra condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel. Vivamus finibus mi a neque pretium, ut convallis dui lacinia. Morbi a rutrum velit. Curabitur sagittis quam quis consectetur mattis. Aenean sit amet quam vel turpis interdum sagittis et eget neque. Nunc ante quam, luctus et neque a, interdum iaculis metus. Aliquam vel ante mattis, placerat orci id, vehicula quam. Suspendisse quis eros cursus, viverra urna sed, commodo mauris. Cras diam arcu, fringilla a sem condimentum, viverra facilisis nunc. Curabitur vitae orci id nulla maximus maximus. Nunc pulvinar sollicitudin molestie.', 0, CAST(N'2020-06-19' AS Date), N'2.jpg', 1)
INSERT [dbo].[POST] ([ID], [TITLE], [EXCERPT], [CONTENT], [STATUS], [CREATED], [POSTURL], [CUSTOMER_ID]) VALUES (3, N'Books & Life', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor ac ante egestas hendrerit. Aliquam et metus pharetra, bibendum massa nec, fermentum odio. Nunc id leo ultrices, mollis ligula in, finibus tortor. Mauris eu dui ut lectus fermentum eleifend. Pellentesque faucibus sem ante, non malesuada odio varius nec. Suspendisse potenti. Proin consectetur aliquam odio nec fringilla. Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit amet ligula condimentum sagittis.

Quisque semper nunc vitae erat pellentesque, ac placerat arcu consectetur. In venenatis elit ac ultrices convallis. Duis est nisi, tincidunt ac urna sed, cursus blandit lectus. In ullamcorper sit amet ligula ut eleifend. Proin dictum tempor ligula, ac feugiat metus. Sed finibus tortor eu scelerisque scelerisque.
Aenean et tempor eros, vitae sollicitudin velit. Etiam varius enim nec quam tempor, sed efficitur ex ultrices. Phasellus pretium est vel dui vestibulum condimentum. Aenean nec suscipit nibh. Phasellus nec lacus id arcu facilisis elementum. Curabitur lobortis, elit ut elementum congue, erat ex bibendum odio, nec iaculis lacus sem non lorem. Duis suscipit metus ante, sed convallis quam posuere quis. Ut tincidunt eleifend odio, ac fringilla mi vehicula nec. Nunc vitae lacus eget lectus imperdiet tempus sed in dui. Nam molestie magna at risus consectetur, placerat suscipit justo dignissim. Sed vitae fringilla enim, nec ullamcorper arcu.

Suspendisse turpis ipsum, tempus in nulla eu, posuere pharetra nibh. In dignissim vitae lorem non mollis. Praesent pretium tellus in tortor viverra condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel. Vivamus finibus mi a neque pretium, ut convallis dui lacinia. Morbi a rutrum velit. Curabitur sagittis quam quis consectetur mattis. Aenean sit amet quam vel turpis interdum sagittis et eget neque. Nunc ante quam, luctus et neque a, interdum iaculis metus. Aliquam vel ante mattis, placerat orci id, vehicula quam. Suspendisse quis eros cursus, viverra urna sed, commodo mauris. Cras diam arcu, fringilla a sem condimentum, viverra facilisis nunc. Curabitur vitae orci id nulla maximus maximus. Nunc pulvinar sollicitudin molestie.', 0, CAST(N'2020-06-19' AS Date), N'3.jpg', 1)
INSERT [dbo].[POST] ([ID], [TITLE], [EXCERPT], [CONTENT], [STATUS], [CREATED], [POSTURL], [CUSTOMER_ID]) VALUES (4, N'Books & Ebooks', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor ac ante egestas hendrerit. Aliquam et metus pharetra, bibendum massa nec, fermentum odio. Nunc id leo ultrices, mollis ligula in, finibus tortor. Mauris eu dui ut lectus fermentum eleifend. Pellentesque faucibus sem ante, non malesuada odio varius nec. Suspendisse potenti. Proin consectetur aliquam odio nec fringilla. Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit amet ligula condimentum sagittis.

Quisque semper nunc vitae erat pellentesque, ac placerat arcu consectetur. In venenatis elit ac ultrices convallis. Duis est nisi, tincidunt ac urna sed, cursus blandit lectus. In ullamcorper sit amet ligula ut eleifend. Proin dictum tempor ligula, ac feugiat metus. Sed finibus tortor eu scelerisque scelerisque.
Aenean et tempor eros, vitae sollicitudin velit. Etiam varius enim nec quam tempor, sed efficitur ex ultrices. Phasellus pretium est vel dui vestibulum condimentum. Aenean nec suscipit nibh. Phasellus nec lacus id arcu facilisis elementum. Curabitur lobortis, elit ut elementum congue, erat ex bibendum odio, nec iaculis lacus sem non lorem. Duis suscipit metus ante, sed convallis quam posuere quis. Ut tincidunt eleifend odio, ac fringilla mi vehicula nec. Nunc vitae lacus eget lectus imperdiet tempus sed in dui. Nam molestie magna at risus consectetur, placerat suscipit justo dignissim. Sed vitae fringilla enim, nec ullamcorper arcu.

Suspendisse turpis ipsum, tempus in nulla eu, posuere pharetra nibh. In dignissim vitae lorem non mollis. Praesent pretium tellus in tortor viverra condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel. Vivamus finibus mi a neque pretium, ut convallis dui lacinia. Morbi a rutrum velit. Curabitur sagittis quam quis consectetur mattis. Aenean sit amet quam vel turpis interdum sagittis et eget neque. Nunc ante quam, luctus et neque a, interdum iaculis metus. Aliquam vel ante mattis, placerat orci id, vehicula quam. Suspendisse quis eros cursus, viverra urna sed, commodo mauris. Cras diam arcu, fringilla a sem condimentum, viverra facilisis nunc. Curabitur vitae orci id nulla maximus maximus. Nunc pulvinar sollicitudin molestie.', 0, CAST(N'2020-06-19' AS Date), N'4.jpg', 1)
INSERT [dbo].[POST] ([ID], [TITLE], [EXCERPT], [CONTENT], [STATUS], [CREATED], [POSTURL], [CUSTOMER_ID]) VALUES (5, N'Ways Of Knowledge', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor', N'Donec vitae hendrerit arcu, sit amet faucibus nisl. Crastoup pretium arcu ex. Aenean posuere libero eu augue rhoncus. Praesent ornare tortor ac ante egestas hendrerit. Aliquam et metus pharetra, bibendum massa nec, fermentum odio. Nunc id leo ultrices, mollis ligula in, finibus tortor. Mauris eu dui ut lectus fermentum eleifend. Pellentesque faucibus sem ante, non malesuada odio varius nec. Suspendisse potenti. Proin consectetur aliquam odio nec fringilla. Sed interdum at justo in efficitur. Vivamus gravida volutpat sodales. Fusce ornare sit amet ligula condimentum sagittis.

Quisque semper nunc vitae erat pellentesque, ac placerat arcu consectetur. In venenatis elit ac ultrices convallis. Duis est nisi, tincidunt ac urna sed, cursus blandit lectus. In ullamcorper sit amet ligula ut eleifend. Proin dictum tempor ligula, ac feugiat metus. Sed finibus tortor eu scelerisque scelerisque.
Aenean et tempor eros, vitae sollicitudin velit. Etiam varius enim nec quam tempor, sed efficitur ex ultrices. Phasellus pretium est vel dui vestibulum condimentum. Aenean nec suscipit nibh. Phasellus nec lacus id arcu facilisis elementum. Curabitur lobortis, elit ut elementum congue, erat ex bibendum odio, nec iaculis lacus sem non lorem. Duis suscipit metus ante, sed convallis quam posuere quis. Ut tincidunt eleifend odio, ac fringilla mi vehicula nec. Nunc vitae lacus eget lectus imperdiet tempus sed in dui. Nam molestie magna at risus consectetur, placerat suscipit justo dignissim. Sed vitae fringilla enim, nec ullamcorper arcu.

Suspendisse turpis ipsum, tempus in nulla eu, posuere pharetra nibh. In dignissim vitae lorem non mollis. Praesent pretium tellus in tortor viverra condimentum. Nullam dignissim facilisis nisl, accumsan placerat justo ultricies vel. Vivamus finibus mi a neque pretium, ut convallis dui lacinia. Morbi a rutrum velit. Curabitur sagittis quam quis consectetur mattis. Aenean sit amet quam vel turpis interdum sagittis et eget neque. Nunc ante quam, luctus et neque a, interdum iaculis metus. Aliquam vel ante mattis, placerat orci id, vehicula quam. Suspendisse quis eros cursus, viverra urna sed, commodo mauris. Cras diam arcu, fringilla a sem condimentum, viverra facilisis nunc. Curabitur vitae orci id nulla maximus maximus. Nunc pulvinar sollicitudin molestie.', 0, CAST(N'2020-06-19' AS Date), N'5.jpg', 1)
SET IDENTITY_INSERT [dbo].[POST] OFF
SET IDENTITY_INSERT [dbo].[PUBLISHER] ON 

INSERT [dbo].[PUBLISHER] ([ID], [NAME]) VALUES (1, N'NXB Trẻ')
INSERT [dbo].[PUBLISHER] ([ID], [NAME]) VALUES (2, N'NXB Kim Đồng')
SET IDENTITY_INSERT [dbo].[PUBLISHER] OFF
SET IDENTITY_INSERT [dbo].[WHISHLIST] ON 

INSERT [dbo].[WHISHLIST] ([ID], [BOOK_ID], [CUSTOMER_ID]) VALUES (1, 1, 2)
INSERT [dbo].[WHISHLIST] ([ID], [BOOK_ID], [CUSTOMER_ID]) VALUES (2, 6, 2)
INSERT [dbo].[WHISHLIST] ([ID], [BOOK_ID], [CUSTOMER_ID]) VALUES (3, 22, 2)
SET IDENTITY_INSERT [dbo].[WHISHLIST] OFF
ALTER TABLE [dbo].[BOOK_AUTHOR]  WITH CHECK ADD FOREIGN KEY([AUTHOR_ID])
REFERENCES [dbo].[AUTHOR] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOOK_AUTHOR]  WITH CHECK ADD FOREIGN KEY([BOOK_ID])
REFERENCES [dbo].[BOOKS] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOOK_GENRE]  WITH CHECK ADD FOREIGN KEY([BOOK_ID])
REFERENCES [dbo].[BOOKS] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOOK_GENRE]  WITH CHECK ADD FOREIGN KEY([GENRE_ID])
REFERENCES [dbo].[GENRE] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOOK_IMAGE]  WITH CHECK ADD FOREIGN KEY([BOOK_ID])
REFERENCES [dbo].[BOOKS] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOOKS]  WITH CHECK ADD FOREIGN KEY([PUBLISHER_ID])
REFERENCES [dbo].[PUBLISHER] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD FOREIGN KEY([POST_ID])
REFERENCES [dbo].[POST] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMERS] ([ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([BOOK_ID])
REFERENCES [dbo].[BOOKS] ([ID])
GO
ALTER TABLE [dbo].[ORDERDETAIL]  WITH CHECK ADD FOREIGN KEY([ORDER_ID])
REFERENCES [dbo].[ORDER] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[POST]  WITH CHECK ADD FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMERS] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WHISHLIST]  WITH CHECK ADD FOREIGN KEY([BOOK_ID])
REFERENCES [dbo].[BOOKS] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WHISHLIST]  WITH CHECK ADD FOREIGN KEY([CUSTOMER_ID])
REFERENCES [dbo].[CUSTOMERS] ([ID])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [BOOKSTORE] SET  READ_WRITE 
GO
