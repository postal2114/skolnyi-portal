USE [master]
GO
CREATE DATABASE [SchoolPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SchoolPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SchoolPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SchoolPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SchoolPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SchoolPortal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolPortal] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SchoolPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SchoolPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SchoolPortal] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolPortal', N'ON'
GO
ALTER DATABASE [SchoolPortal] SET QUERY_STORE = OFF
GO
USE [SchoolPortal]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[RecipientId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[Symbol] [nvarchar](1) NOT NULL,
	[Year of admission] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[LessonId] [int] NOT NULL,
	[Mark] [nvarchar](max) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LessonId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[DayOfTheWeek] [nvarchar](max) NOT NULL,
	[Start] [time](7) NOT NULL,
	[End] [time](7) NOT NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Position] [nvarchar](30) NOT NULL,
	[Adress] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Birthday] [date] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chat] ON 

INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (4, 1, 4, N'Здравствуйте', CAST(N'2022-02-21T11:00:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (5, 4, 1, N'Здравствуйте', CAST(N'2022-02-21T11:02:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (7, 1, 4, N'Как дела?', CAST(N'2022-02-21T11:05:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (8, 4, 1, N'Норм', CAST(N'2022-02-21T11:07:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (9, 4, 1, N'У вас как?', CAST(N'2022-02-21T11:10:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (10, 1, 4, N'Тоже норм', CAST(N'2022-02-21T11:20:00.000' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (13, 4, 1, N'Здравствуйте', CAST(N'2022-02-21T13:49:01.837' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (14, 1, 4, N'Учитель тупой', CAST(N'2022-02-21T13:52:12.070' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (15, 1, 4, N'qwe', CAST(N'2022-02-21T13:53:39.843' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (16, 4, 1, N'хай', CAST(N'2022-02-22T21:34:31.470' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (17, 1, 4, N'Привет', CAST(N'2022-02-22T21:36:48.067' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (18, 1, 4, N'как дела', CAST(N'2022-02-22T21:36:57.257' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (19, 4, 1, N'Норм', CAST(N'2022-02-22T21:37:02.263' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (20, 4, 1, N'Привет', CAST(N'2022-02-22T21:55:15.340' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (21, 1, 4, N'Здравствуйте', CAST(N'2022-02-22T21:55:37.527' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (22, 4, 1, N'Как Дела?', CAST(N'2022-02-22T21:55:50.757' AS DateTime))
INSERT [dbo].[Chat] ([Id], [SenderId], [RecipientId], [Text], [Date]) VALUES (23, 4, 6, N'Здравствуйте', CAST(N'2022-02-25T19:29:05.633' AS DateTime))
SET IDENTITY_INSERT [dbo].[Chat] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Year], [Symbol], [Year of admission]) VALUES (1, 6, N'А', 2015)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [ClassId], [StudentId]) VALUES (1, 1, 1)
INSERT [dbo].[Group] ([Id], [ClassId], [StudentId]) VALUES (2, 1, 7)
SET IDENTITY_INSERT [dbo].[Group] OFF
SET IDENTITY_INSERT [dbo].[Lessons] ON 

INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (1, N'Русский', 4)
INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (2, N'Литература', 4)
INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (3, N'Алгебра', 6)
INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (4, N'Геометрия', 6)
INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (5, N'Физика', 6)
INSERT [dbo].[Lessons] ([Id], [Name], [TeacherId]) VALUES (7, N'ОБЖ', 4)
SET IDENTITY_INSERT [dbo].[Lessons] OFF
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([Id], [StudentId], [LessonId], [Mark], [Comment], [Date]) VALUES (3, 1, 7, N'5', N'Ответ', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Marks] ([Id], [StudentId], [LessonId], [Mark], [Comment], [Date]) VALUES (4, 7, 7, N'Н', N'Прогул', CAST(N'2022-02-26' AS Date))
INSERT [dbo].[Marks] ([Id], [StudentId], [LessonId], [Mark], [Comment], [Date]) VALUES (5, 1, 7, N'5', N'Работа на уроке', CAST(N'2022-02-26' AS Date))
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[TimeTable] ON 

INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (1, 1, 1, 1, N'Saturday', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time))
INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (2, 2, 2, 1, N'Saturday', CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (3, 3, 3, 1, N'Saturday', CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (4, 4, 4, 1, N'Saturday', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time))
INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (5, 5, 5, 1, N'Saturday', CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time))
INSERT [dbo].[TimeTable] ([Id], [LessonId], [Count], [ClassId], [DayOfTheWeek], [Start], [End]) VALUES (6, 7, 6, 1, N'Saturday', CAST(N'14:00:00' AS Time), CAST(N'20:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[TimeTable] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Position], [Adress], [Phone], [Birthday]) VALUES (1, N'qwe', N'qwe', N'Скачек Владислав Евгеньевич', N'Ученик', N'какой-то адрес', N'89888888888', CAST(N'2002-11-10' AS Date))
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Position], [Adress], [Phone], [Birthday]) VALUES (4, N'zzz', N'zzz', N'Дергунов Семен Владимирович', N'Учитель', N'Какой-то адрес2', N'89888888887', CAST(N'1975-05-15' AS Date))
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Position], [Adress], [Phone], [Birthday]) VALUES (6, N'zxc', N'zxc', N'Агрушкина Ксения Руслановна', N'Учитель', N'Какой-то адрес3', N'+7 (896)-254-15-78', CAST(N'1958-05-25' AS Date))
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Position], [Adress], [Phone], [Birthday]) VALUES (7, N'kekw', N'kekw', N'Владимир Трупников Сергеевич', N'Ученик', N'Какой-то адрес4', N'+7 (996)-299-19-98', CAST(N'2002-05-29' AS Date))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User1] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Class]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_User] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_User]
GO
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_User] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_User]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_Lessons]
GO
ALTER TABLE [dbo].[Marks]  WITH CHECK ADD  CONSTRAINT [FK_Marks_User] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Marks] CHECK CONSTRAINT [FK_Marks_User]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Class]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Lessons] FOREIGN KEY([LessonId])
REFERENCES [dbo].[Lessons] ([Id])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Lessons]
GO
USE [master]
GO
ALTER DATABASE [SchoolPortal] SET  READ_WRITE 
GO
