USE [master]
GO
/****** Object:  Database [ExamSystem]    Script Date: 9/17/2022 4:31:27 PM ******/
CREATE DATABASE [ExamSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExamSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExamSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ExamSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ExamSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExamSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExamSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamSystem', N'ON'
GO
ALTER DATABASE [ExamSystem] SET QUERY_STORE = OFF
GO
USE [ExamSystem]
GO
/****** Object:  User [student]    Script Date: 9/17/2022 4:31:27 PM ******/
CREATE USER [student] FOR LOGIN [student] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [maneger]    Script Date: 9/17/2022 4:31:27 PM ******/
CREATE USER [maneger] FOR LOGIN [maneger] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [instructor]    Script Date: 9/17/2022 4:31:27 PM ******/
CREATE USER [instructor] FOR LOGIN [instructor] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  UserDefinedFunction [dbo].[show_grade]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[show_grade] (@name nvarchar(max))
returns int
begin
	
	declare @std_id int =(select Student_id from Student where F_name =@name)

	declare @degree int =(select degree from Student_Exam where Student_id=@std_id)

	return @degree

end
GO
/****** Object:  Table [dbo].[Question_Exam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Exam](
	[Question_id] [int] NOT NULL,
	[Question_descrip] [nvarchar](20) NULL,
	[Answer] [nvarchar](20) NULL,
	[Degree] [nvarchar](20) NULL,
	[Course_id] [int] NULL,
	[Exam_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[exam1]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[exam1] as select Question_descrip from Question_Exam where Exam_id=1
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_id] [int] NOT NULL,
	[F_name] [nvarchar](20) NULL,
	[L_name] [nvarchar](20) NULL,
	[E_mail] [nvarchar](20) NULL,
	[Std_adress] [nvarchar](20) NULL,
	[Intake] [nvarchar](20) NULL,
	[Track] [nvarchar](20) NULL,
	[Phone] [nvarchar](11) NULL,
	[pass_word] [int] NULL,
	[branch] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[student_name]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[student_name] as select * from Student
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_id] [int] NOT NULL,
	[Exam_name] [nvarchar](20) NULL,
	[Exam_type] [nvarchar](20) NULL,
	[Intake] [nvarchar](20) NULL,
	[Track] [nvarchar](20) NULL,
	[Start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[total_time] [int] NULL,
	[mor_option] [nvarchar](20) NULL,
	[Instructor_id] [int] NULL,
	[Course_id] [int] NULL,
	[Exam_year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vExam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[vExam] as select * from Exam
GO
/****** Object:  Table [dbo].[Student_Exam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Exam](
	[Student_id] [int] NOT NULL,
	[Exam_id] [int] NOT NULL,
	[degree] [int] NULL,
 CONSTRAINT [PK_Student_Exam] PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC,
	[Exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStudent_exam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vStudent_exam] as select * from Student_Exam
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course_id] [int] NOT NULL,
	[Course_name] [nvarchar](20) NULL,
	[Min_degree] [int] NULL,
	[max_degree] [int] NULL,
	[Instructor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Instructor_id] [int] NOT NULL,
	[F_name] [nvarchar](20) NULL,
	[L_name] [nvarchar](20) NULL,
	[E_mail] [nvarchar](20) NULL,
	[Ins_adress] [nvarchar](20) NULL,
	[Maneger_id] [int] NULL,
	[brach_name] [nchar](20) NULL,
	[Phone] [nvarchar](11) NULL,
	[pass_word] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Choice]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Choice](
	[Question_id] [int] NOT NULL,
	[Question_descrip] [nvarchar](20) NULL,
	[Option1] [nvarchar](50) NULL,
	[Option2] [nvarchar](50) NULL,
	[Option3] [nvarchar](50) NULL,
	[Option4] [nvarchar](50) NULL,
	[Answer] [nvarchar](20) NULL,
	[Course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Text]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Text](
	[Question_id] [int] NOT NULL,
	[Question_descrip] [nvarchar](20) NULL,
	[Answer] [nvarchar](20) NULL,
	[Course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_TorF]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_TorF](
	[Question_id] [int] NOT NULL,
	[Question_descrip] [nvarchar](20) NULL,
	[Option1] [nvarchar](50) NULL,
	[Option2] [nvarchar](50) NULL,
	[Answer] [nvarchar](20) NULL,
	[Course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[Question_id] [int] NOT NULL,
	[Student_id] [int] NOT NULL,
	[Student_Answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_Student_Answer] PRIMARY KEY CLUSTERED 
(
	[Question_id] ASC,
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_courses]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_courses](
	[Student_id] [int] NOT NULL,
	[Course_id] [int] NOT NULL,
	[Degree] [int] NULL,
 CONSTRAINT [PK_Student_courses] PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC,
	[Course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_structor]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_structor](
	[Student_id] [int] NOT NULL,
	[Instructor_id] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Student_id] ASC,
	[Instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (1, N'html', 50, 100, 1)
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (2, N'css', 50, 100, 2)
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (3, N'c#', 50, 100, 2)
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (4, N'sql', 50, 100, 3)
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (5, N'bootstrap', 50, 100, 4)
INSERT [dbo].[Courses] ([Course_id], [Course_name], [Min_degree], [max_degree], [Instructor_id]) VALUES (6, N'javascript', 50, 100, 4)
GO
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (1, N'html', N'choice', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'jfj', 1, 1, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (2, N'css', N'text', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 1, 1, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (3, N'css', N'text', N'15', N'front', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 1, 2, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (4, N'css', N'TorF', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 1, 2, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (5, N'c#', N'text', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 2, 3, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (6, N'c#', N'choice', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 2, 3, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (7, N'sql', N'choice', N'15', N'embedded', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 3, 4, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (8, N'sql', N'TorF', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 3, 4, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (9, N'bootstrap', N'choice', N'15', N'front', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 4, 5, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (10, N'bootstrap', N'text', N'15', N'.net', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 4, 5, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (11, N'javascript', N'TorF', N'15', N'mern', CAST(N'1900-01-01T19:23:33.000' AS DateTime), CAST(N'1900-01-01T20:22:33.000' AS DateTime), 1, N'dsdfw', 4, 6, 2022)
INSERT [dbo].[Exam] ([Exam_id], [Exam_name], [Exam_type], [Intake], [Track], [Start_time], [end_time], [total_time], [mor_option], [Instructor_id], [Course_id], [Exam_year]) VALUES (12, N'java', N'choice', N'15', N'.net', CAST(N'2233-01-01T00:00:00.000' AS DateTime), CAST(N'1800-01-01T00:00:00.000' AS DateTime), 1, N'dsdfw', 4, 6, 2022)
GO
INSERT [dbo].[Instructor] ([Instructor_id], [F_name], [L_name], [E_mail], [Ins_adress], [Maneger_id], [brach_name], [Phone], [pass_word]) VALUES (1, N'hazem', N'mohamed', N'hazem@gmail.com', N'beba', 1, N'benisuif            ', N'01279228491', 123)
INSERT [dbo].[Instructor] ([Instructor_id], [F_name], [L_name], [E_mail], [Ins_adress], [Maneger_id], [brach_name], [Phone], [pass_word]) VALUES (2, N'alaa', N'agami', N'agami@gmail.com', N'El wasta', NULL, N'benisuif            ', N'01015019483', 123)
INSERT [dbo].[Instructor] ([Instructor_id], [F_name], [L_name], [E_mail], [Ins_adress], [Maneger_id], [brach_name], [Phone], [pass_word]) VALUES (3, N'hossam', N'mtarawy', N'hossam@gmail.com', N'Nasser', NULL, N'minia               ', N'01143252594', 123)
INSERT [dbo].[Instructor] ([Instructor_id], [F_name], [L_name], [E_mail], [Ins_adress], [Maneger_id], [brach_name], [Phone], [pass_word]) VALUES (4, N'ali', N'ahmed', N'ali@gmail.com', N'minia', NULL, N'minia               ', N'01154384394', 123)
GO
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (1, N'how to learn', N'study', N'play', N'go', N'ignore', N'study', 1)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (2, N'what is html', N'gooooo', N'markup language', N'gooooo', N'gooooo', N'markup language', 1)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (3, N'what is div', N'gooooo', N'gooooo', N'block element', N'gooooo', N'block element', 1)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (4, N'C# is ', N'gooooo', N'gooooo', N'gooooo', N'general-purpose', N'general-purpose', 3)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (5, N'C# use with ', N'gooooo', N'gooooo', N'mobile apps', N'gooooo', N'mobile apps', 3)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (6, N'C# inroll in ', N'gooooo', N'gamming', N'gooooo', N'gooooo', N'gamming', 3)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (7, N'SQL used for', N'database', N'gooooo', N'gooooo', N'gooooo', N'database', 4)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (8, N'SQL work in', N'gooooo', N'backend', N'gooooo', N'gooooo', N'backend', 4)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (9, N'SQL is', N'gooooo', N'gooooo', N'relational database', N'gooooo', N'relational database', 4)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (10, N'bootstrap is  ', N'gooooo', N'gooooo', N'gooooo', N'css framwork', N'css framwork', 5)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (11, N' bootstrap use for', N'gooooo', N'gooooo', N'styling', N'gooooo', N'styling', 5)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (12, N'bootstrap consist of', N'gooooo', N'multi_classes', N'gooooo', N'gooooo', N'multi_classes', 5)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (13, N'JS is in', N'full stack', N'gooooo', N'gooooo', N'gooooo', N'full stack', 6)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (14, N' JS use for ', N'gooooo', N'web', N'gooooo', N'gooooo', N'web', 6)
INSERT [dbo].[Question_Choice] ([Question_id], [Question_descrip], [Option1], [Option2], [Option3], [Option4], [Answer], [Course_id]) VALUES (15, N'JS use ', N'gooooo', N'gooooo', N'oop consipt', N'gooooo', N'oop consipt', 6)
GO
INSERT [dbo].[Question_Exam] ([Question_id], [Question_descrip], [Answer], [Degree], [Course_id], [Exam_id]) VALUES (1, N'how to remove a Line', N'true', N'25', 1, 1)
INSERT [dbo].[Question_Exam] ([Question_id], [Question_descrip], [Answer], [Degree], [Course_id], [Exam_id]) VALUES (2, N'how to remove a Line', N'true', N'25', 1, 1)
INSERT [dbo].[Question_Exam] ([Question_id], [Question_descrip], [Answer], [Degree], [Course_id], [Exam_id]) VALUES (3, N'how to remove a Line', N'true', N'20', 1, 1)
INSERT [dbo].[Question_Exam] ([Question_id], [Question_descrip], [Answer], [Degree], [Course_id], [Exam_id]) VALUES (4, N'how to remove a Line', N'true', N'30', 1, 1)
GO
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (1, N'what is span', N'inline element', 1)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (2, N'what is <p>', N'paragraph', 1)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (3, N' what is <h>', N'horizontal row', 1)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (4, N'what is css', N'styling', 2)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (5, N'what is flex box', N'displaying', 2)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (6, N'how to remove a Line', N'style none', 2)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (7, N'C# is ', N'general-purpose', 3)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (8, N'C# use fo ', N'desktop apps', 3)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (9, N'C# is ', N'oop', 3)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (10, N'bootstrap is  ', N'css framwork', 5)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (11, N' bootstrap use for', N'styling', 5)
INSERT [dbo].[Question_Text] ([Question_id], [Question_descrip], [Answer], [Course_id]) VALUES (12, N'bootstrap consist of', N'multi_classes', 5)
GO
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (1, N'css is prog lang', N'true', N'false', N'false', 2)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (2, N'CSS use for Styling', N'true', N'false', N'true', 2)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (3, N'css has color only', N'true', N'false', N'false', 2)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (4, N'SQL is prog lang ', N'true', N'false', N'false', 4)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (5, N' SQL use for db', N'true', N'false', N'true', 4)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (6, N'SQL is oop', N'true', N'false', N'false', 4)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (7, N'JS is markup lang', N'true', N'false', N'false', 6)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (8, N' JS use for styling', N'true', N'false', N'false', 6)
INSERT [dbo].[Question_TorF] ([Question_id], [Question_descrip], [Option1], [Option2], [Answer], [Course_id]) VALUES (9, N'JS use oop', N'true', N'false', N'true', 6)
GO
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (1, N'ahmed', N'mohamed', N'ahmed@gmail.com', N'alfashn', N'15', N'.net', N'01145678945', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (2, N'sayed', N'ahmed', N'sayed@gmail.com', N'lab lab', N'15', N'.net', N'01298726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (3, N'mohamed', N'monir', N'monir@gmail.com', N'lab lab', N'15', N'.net', N'01211726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (4, N'ali', N'ahmed', N'ali@gmail.com', N'lab lab', N'15', N'mern', N'01210726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (5, N'khaled', N'maged', N'maged@gmail.com', N'lab lab', N'15', N'social', N'01212726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (6, N'mai', N'ahmed', N'ahmed@gmail.com', N'lab lab', N'15', N'front', N'01213726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (7, N'salama', N'yasser', N'yasser@gmail.com', N'lab lab', N'15', N'embedded', N'01214726125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (8, N'lobna', N'yasser', N'lobna@gmail.com', N'lab lab', N'15', N'embedded', N'01214727125', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (9, N'maha', N'yasser', N'maha@gmail.com', N'lab lab', N'15', N'front', N'01214728825', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (10, N'wael', N'galal', N'galal@gmail.com', N'lab lab', N'15', N'.net', N'01214724425', 123, N'menia')
INSERT [dbo].[Student] ([Student_id], [F_name], [L_name], [E_mail], [Std_adress], [Intake], [Track], [Phone], [pass_word], [branch]) VALUES (11, N'gfd', N'matrewy', N'O.matrewy@gmail.com', N'Minia', N'17', N'Mobile APP', N'01019069277', 123456, N'minia')
GO
INSERT [dbo].[Student_Answer] ([Question_id], [Student_id], [Student_Answer]) VALUES (1, 1, N'true')
INSERT [dbo].[Student_Answer] ([Question_id], [Student_id], [Student_Answer]) VALUES (2, 1, N'true')
INSERT [dbo].[Student_Answer] ([Question_id], [Student_id], [Student_Answer]) VALUES (3, 1, N'false')
INSERT [dbo].[Student_Answer] ([Question_id], [Student_id], [Student_Answer]) VALUES (4, 1, N'true')
GO
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 1, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 2, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 3, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 4, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 5, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (1, 6, 90)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 1, 80)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 2, 66)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 3, 80)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 4, 80)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 5, 80)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (2, 6, 80)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 1, 100)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 2, 100)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 3, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 4, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 5, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (3, 6, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (4, 5, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (4, 6, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (5, 1, 99)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (6, 1, 65)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (6, 2, 65)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (6, 5, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (6, 6, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (9, 1, 85)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (9, 2, 85)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (9, 5, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (9, 6, 70)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (10, 1, 95)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (10, 2, 95)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (10, 3, 100)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (10, 4, 100)
INSERT [dbo].[Student_courses] ([Student_id], [Course_id], [Degree]) VALUES (10, 5, 100)
GO
INSERT [dbo].[Student_Exam] ([Student_id], [Exam_id], [degree]) VALUES (1, 1, 80)
INSERT [dbo].[Student_Exam] ([Student_id], [Exam_id], [degree]) VALUES (2, 1, 0)
INSERT [dbo].[Student_Exam] ([Student_id], [Exam_id], [degree]) VALUES (3, 1, 0)
INSERT [dbo].[Student_Exam] ([Student_id], [Exam_id], [degree]) VALUES (4, 1, 0)
INSERT [dbo].[Student_Exam] ([Student_id], [Exam_id], [degree]) VALUES (5, 1, 0)
GO
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (1, 1)
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (2, 1)
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (3, 1)
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (6, 1)
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (9, 1)
INSERT [dbo].[Student_structor] ([Student_id], [Instructor_id]) VALUES (10, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [chk_phone_unq]    Script Date: 9/17/2022 4:31:27 PM ******/
ALTER TABLE [dbo].[Instructor] ADD  CONSTRAINT [chk_phone_unq] UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Student__5C7E359EC95D59EF]    Script Date: 9/17/2022 4:31:27 PM ******/
ALTER TABLE [dbo].[Student] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [def_Min_degree]  DEFAULT ((50)) FOR [Min_degree]
GO
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [def_Max_degree]  DEFAULT ((100)) FOR [max_degree]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [df_exam_intake]  DEFAULT ('15') FOR [Intake]
GO
ALTER TABLE [dbo].[Question_Exam] ADD  CONSTRAINT [df_Degree]  DEFAULT ('10') FOR [Degree]
GO
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [df_intake]  DEFAULT ('15') FOR [Intake]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [ins_fk] FOREIGN KEY([Instructor_id])
REFERENCES [dbo].[Instructor] ([Instructor_id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [ins_fk]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Courses] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Courses]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [ins_exam_fk] FOREIGN KEY([Instructor_id])
REFERENCES [dbo].[Instructor] ([Instructor_id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [ins_exam_fk]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [mng_fk] FOREIGN KEY([Maneger_id])
REFERENCES [dbo].[Instructor] ([Instructor_id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [mng_fk]
GO
ALTER TABLE [dbo].[Question_Choice]  WITH CHECK ADD  CONSTRAINT [queschois_course_fk] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Question_Choice] CHECK CONSTRAINT [queschois_course_fk]
GO
ALTER TABLE [dbo].[Question_Exam]  WITH CHECK ADD  CONSTRAINT [ques_course_fk] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Question_Exam] CHECK CONSTRAINT [ques_course_fk]
GO
ALTER TABLE [dbo].[Question_Exam]  WITH CHECK ADD  CONSTRAINT [ques_exam_fk] FOREIGN KEY([Exam_id])
REFERENCES [dbo].[Exam] ([Exam_id])
GO
ALTER TABLE [dbo].[Question_Exam] CHECK CONSTRAINT [ques_exam_fk]
GO
ALTER TABLE [dbo].[Question_Text]  WITH CHECK ADD  CONSTRAINT [quesctext_course_fk] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Question_Text] CHECK CONSTRAINT [quesctext_course_fk]
GO
ALTER TABLE [dbo].[Question_TorF]  WITH CHECK ADD  CONSTRAINT [quesctorf_course_fk] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Question_TorF] CHECK CONSTRAINT [quesctorf_course_fk]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Question_Exam] FOREIGN KEY([Question_id])
REFERENCES [dbo].[Question_Exam] ([Question_id])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Question_Exam]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Student]
GO
ALTER TABLE [dbo].[Student_courses]  WITH CHECK ADD  CONSTRAINT [FK_Student_courses_Courses] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Courses] ([Course_id])
GO
ALTER TABLE [dbo].[Student_courses] CHECK CONSTRAINT [FK_Student_courses_Courses]
GO
ALTER TABLE [dbo].[Student_courses]  WITH CHECK ADD  CONSTRAINT [FK_Student_courses_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Student_courses] CHECK CONSTRAINT [FK_Student_courses_Student]
GO
ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Exam] FOREIGN KEY([Exam_id])
REFERENCES [dbo].[Exam] ([Exam_id])
GO
ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Exam]
GO
ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Student]
GO
ALTER TABLE [dbo].[Student_structor]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Instructor] FOREIGN KEY([Instructor_id])
REFERENCES [dbo].[Instructor] ([Instructor_id])
GO
ALTER TABLE [dbo].[Student_structor] CHECK CONSTRAINT [FK_Table_1_Instructor]
GO
ALTER TABLE [dbo].[Student_structor]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([Student_id])
GO
ALTER TABLE [dbo].[Student_structor] CHECK CONSTRAINT [FK_Table_1_Student]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [chk_email] CHECK  (([E_mail] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [chk_email]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [Chk_Phone] CHECK  ((NOT [Phone] like '%[^0-9]%' AND [Phone] like '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'))
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [Chk_Phone]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [chk_stu_email] CHECK  (([E_mail] like '%_@__%.__%'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [chk_stu_email]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [Chk_stu_Phone] CHECK  ((NOT [Phone] like '%[^0-9]%' AND [Phone] like '01[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]%'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [Chk_stu_Phone]
GO
/****** Object:  StoredProcedure [dbo].[addquestion_from_textquestion_proc]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[addquestion_from_textquestion_proc]  @qusexam_id int ,@patren nvarchar 
as 
begin 
	
		declare @x nvarchar(max)=(	select Question_descrip  from Question_Text where Question_descrip like '['+@patren +']%')

		update Question_Exam 
		set Question_descrip=@x
		where Question_id=@qusexam_id


end
GO
/****** Object:  StoredProcedure [dbo].[choseExamForinstructor]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[choseExamForinstructor]  @qusexam_id int ,@patren nvarchar ,@instruct_name nvarchar(max) ,@degree int
as 
begin 

		declare @max int=(select sum(cast( Degree as int)) from Question_Exam where Exam_id=1)
		
		if((@max+@degree)>100)
		begin
			print'you overload max degree'
		end
		else
			begin
					-- insert degree of question
						update Question_Exam set Degree=@degree where Question_id =@qusexam_id
						-- check if instructro do this course
					declare @insid int =(select Instructor_id  from Instructor where F_name=@instruct_name) --return id of instructor
					declare @coursename nvarchar(max)=(select Course_name from Courses where Instructor_id=@insid)--return course name for this constructor

					declare @examid int=(select Exam_id from Question_Exam where Question_id=@qusexam_id) --return id of exam that conatin question 
					declare @courseid int= (select Course_id from Exam where Exam_id=@examid)            --return id of cours
					declare @courename2 nvarchar(max)=(select Course_name from Courses where Course_id=@courseid)-- return name of courses
	

					if(@coursename=@courename2)
						begin

							declare @x nvarchar(max)=(	select Question_descrip  from Question_Text where Question_descrip like '['+@patren +']%')
							update Question_Exam 
							set Question_descrip=@x
							where Question_id=@qusexam_id


						end

					else
						begin

							print 'this is not your course to but queston'

						end

			end

				

end
GO
/****** Object:  StoredProcedure [dbo].[determineStudent]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[determineStudent] @startOfStudent int ,@endOfStudent int ,@exm_name nvarchar(max)
as 
begin
	--select F_name ,L_name  from student_name ,Student_Exam where student_name.Student_id=Student_Exam.Student_id and student_name.Student_id between @startOfStudent and @endOfStudent  
	declare @exam_id int =( select Exam_id from Exam where Exam_name=@exm_name) 
	declare @conut int = @startOfStudent

	while @conut<=@endOfStudent 
	begin
		insert into Student_Exam(Student_id,Exam_id,degree)
		values (@conut,@exam_id,0)
		set @conut=@conut+1
	end



end 
GO
/****** Object:  StoredProcedure [dbo].[manager_add_new_user]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[manager_add_new_user] 
      @Student_id int, 
	  @F_name nvarchar(max),
      @L_name nvarchar(max),
      @E_mail nvarchar(max),
      @Std_adress nvarchar(max),
      @Intake nvarchar(max),
	  @Track nvarchar(max),
	  @Phone nvarchar(max),
	  @pass_word int,
	  @branch nvarchar(max)
	   
as 
begin 
		insert into Student values(@Student_id ,@F_name,@L_name,
		@E_mail,@Std_adress,@Intake,@Track,@Phone,@pass_word,@branch)
end
GO
/****** Object:  StoredProcedure [dbo].[setDateOfExam]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[setDateOfExam] @start datetime , @end datetime, @nameExam nvarchar(max)
as 
begin
	
	declare @idexam int =(select Exam_id from Exam where Exam_name= @nameExam)

	update Exam 
	set Start_time=@start ,end_time=@end
	where Exam_id=@idexam

end
GO
/****** Object:  StoredProcedure [dbo].[show_question]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[show_question] 
as 
begin


select * from exam1 

end
GO
/****** Object:  StoredProcedure [dbo].[show_question_withTime]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[show_question_withTime] 
as 
begin
	
	declare @starttime datetime=(select Start_time from Exam where Exam_id=1)
	declare @endtime datetime=(select end_time from Exam where Exam_id=1)



	if(@starttime >=GETDATE() AND @endtime <=getdate() )
	begin
		SELECT Question_descrip FROM exam1 
end
	else 
	begin

	print 'you are not in day of exam'
	end




end
GO
/****** Object:  StoredProcedure [dbo].[student_ans_true_or_false]    Script Date: 9/17/2022 4:31:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[student_ans_true_or_false] @answer nvarchar(max) ,@qiestion_id int
as 
begin
	insert into Student_Answer values(@qiestion_id,1,@answer)
	--update Student_Answer set Student_Answer=@answer where Student_id =1 and Question_id=@qiestion_id

	declare @true_answer nvarchar(max)=(select Answer from Question_Exam where Question_id=@qiestion_id)

	declare @student_answer nvarchar(max)=(select Student_Answer from Student_Answer where Question_id=@qiestion_id and Student_id=1)

	declare @grade int =(select degree   from Student_Exam where Student_id=1 and Exam_id=1)
	
	declare @adddegree int

	if(@true_answer=@student_answer)
		begin
		
		set @adddegree=(select Degree  from Question_Exam where Question_id=@qiestion_id)
			
			update Student_Exam
			set degree=(@grade+@adddegree)
			where Student_id=1 and Exam_id=1

		end
	else
	begin
		print 'from esle'
	end


end
GO
USE [master]
GO
ALTER DATABASE [ExamSystem] SET  READ_WRITE 
GO
