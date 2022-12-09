USE [master]
GO
/****** Object:  Database [QlBanGiay]    Script Date: 11/29/2022 10:35:19 PM ******/
CREATE DATABASE [QlBanGiay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QlBanGiay', FILENAME = N'D:\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlBanGiay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QlBanGiay_log', FILENAME = N'D:\SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QlBanGiay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QlBanGiay] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QlBanGiay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QlBanGiay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QlBanGiay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QlBanGiay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QlBanGiay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QlBanGiay] SET ARITHABORT OFF 
GO
ALTER DATABASE [QlBanGiay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QlBanGiay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QlBanGiay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QlBanGiay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QlBanGiay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QlBanGiay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QlBanGiay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QlBanGiay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QlBanGiay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QlBanGiay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QlBanGiay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QlBanGiay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QlBanGiay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QlBanGiay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QlBanGiay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QlBanGiay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QlBanGiay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QlBanGiay] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QlBanGiay] SET  MULTI_USER 
GO
ALTER DATABASE [QlBanGiay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QlBanGiay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QlBanGiay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QlBanGiay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QlBanGiay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QlBanGiay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QlBanGiay] SET QUERY_STORE = OFF
GO
USE [QlBanGiay]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/29/2022 10:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[giay]    Script Date: 11/29/2022 10:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giay](
	[magiay] [nvarchar](50) NOT NULL,
	[tengiay] [nvarchar](50) NULL,
	[anh] [nvarchar](50) NULL,
	[soluong] [int] NULL,
	[gia] [int] NULL,
	[maloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_giay] PRIMARY KEY CLUSTERED 
(
	[magiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 11/29/2022 10:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[mahoadon] [nvarchar](50) NOT NULL,
	[magiay] [nvarchar](50) NULL,
	[makh] [nvarchar](50) NULL,
	[soluong] [int] NULL,
	[gia] [int] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[mahoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 11/29/2022 10:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [nvarchar](50) NOT NULL,
	[tenkh] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [nvarchar](50) NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loaigiay]    Script Date: 11/29/2022 10:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loaigiay](
	[maloai] [nvarchar](50) NOT NULL,
	[hanggiay] [nvarchar](50) NULL,
 CONSTRAINT [PK_loaigiay] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[admin] ([Username], [Password]) VALUES (N'abc', N'123')
INSERT [dbo].[admin] ([Username], [Password]) VALUES (N'nhan', N'123')
GO
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'1', N'Freak3 Bread', N'images/Freak3Bread.jpg', 10, 3500000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'10', N'Kyrie 6 Atum', N'images/Kyrie6Atum.jpg', 10, 2700000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'11', N'Kyrie 6 Valentine', N'images/Kyrie6Valentine.jpg', 10, 3500000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'12', N'Kyrie Low 5 SE', N'images/KyrieLow5EP.jpg', 10, 3620000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'13', N'Lebron 18 Low', N'images/Lebron18Low.jpg', 10, 2300000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'14', N'Lebron 19', N'images/Lebron19.jpg', 10, 5500000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'15', N'Lebron 19 Black', N'images/Lebron19Black.jpg', 10, 4200000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'16', N'Lebron 19 Low', N'images/Lebron19Low.jpg', 10, 3100000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'17', N'Nike Dunk Low SE', N'images/NikeDunkLowSe.jpg', 10, 2900000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'18', N'PG6 EP', N'images/PG6EP.jpg', 10, 2850000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'19', N'Why not zero 4', N'images/Whynotzero4.jpg', 10, 1900000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'2', N'Freak3 Grey', N'images/Freak3Grey.jpg', 10, 3500000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'20', N'Zion1', N'images/Zion1.jpg', 10, 2300000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'21', N'Dame 8 Blue', N'images/Dame8Blue.jpg', 10, 2300000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'22', N'Dame 8 Mint', N'images/Dame8Mint.jpg', 10, 3200000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'23', N'Dame 8 White', N'images/Dame8White.jpg', 10, 2100000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'24', N'D.O.N Issue 3', N'images/DONIssue3.jpg', 10, 1500000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'25', N'Forum Blue ', N'images/Forumblue.jpg', 10, 2250000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'26', N'Harden Step Back 3', N'images/HardenStepBack3.jpg', 10, 2400000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'27', N'Harden Vol 6 Black', N'images/HardenVol6Black.jpg', 10, 2400000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'28', N'Harden Vol 6 Pink', N'images/HardenVol6Pink.jpg', 10, 2250000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'29', N'Harden Vol 6 Purple', N'images/HardenVol6Purple.jpg', 10, 2400000, N'2')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'3', N'Freak3 Uno', N'images/Freak3Uno.jpg', 10, 4200000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'30', N'Black Fives Fusion Nitro', N'images/BlackFivesFusionNitro.jpg', 10, 2400000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'31', N'Court Rider Pop', N'images/CourRiderPop.jpg', 10, 3500000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'32', N'Fusion Nitro', N'images/FusionNitro.jpg', 10, 2840000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'33', N'Fusion Nitro White', N'images/FusionNitroPink.jpg', 10, 2540000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'34', N'MB.01 UFO', N'images/MB.01UFO.jpg', 10, 7000000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'35', N'Puma X Dunkin', N'images/PumaxDunkinTripleBasketballSneakers.jpg', 10, 5500000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'36', N'Fusion Nitro Pink', N'images/FusionNitroPink.jpg', 10, 2540000, N'3')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'4', N'Jordan1KO', N'images/Jordan1KO.jpg', 10, 6000000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'5', N'Jordan36 Bread', N'images/Jordan36.jpg', 10, 5000000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'6', N'Jordan36 Hanimichi', N'images/Jordan36Hanimichi.jpg', 10, 5320000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'7', N'Jordan36 TacoJay', N'images/Jordan36TacoJay.jpg', 10, 6200000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'8', N'KD 15 EP', N'images/KD15EP.jpg', 10, 3200000, N'1')
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai]) VALUES (N'9', N'KDTrey 5 EP', N'images/KDTrey5Ep.jpg', 10, 2500000, N'1')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [username], [password], [email], [sdt]) VALUES (N'1', N'Thành Nhân', N'abcd', N'123', N'abcd@gmail.com', N'0865691202')
GO
INSERT [dbo].[loaigiay] ([maloai], [hanggiay]) VALUES (N'1', N'Nike')
INSERT [dbo].[loaigiay] ([maloai], [hanggiay]) VALUES (N'2', N'Adidas')
INSERT [dbo].[loaigiay] ([maloai], [hanggiay]) VALUES (N'3', N'Puma')
GO
ALTER TABLE [dbo].[giay]  WITH CHECK ADD  CONSTRAINT [FK_giay_loaigiay] FOREIGN KEY([maloai])
REFERENCES [dbo].[loaigiay] ([maloai])
GO
ALTER TABLE [dbo].[giay] CHECK CONSTRAINT [FK_giay_loaigiay]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_giay] FOREIGN KEY([magiay])
REFERENCES [dbo].[giay] ([magiay])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_giay]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
USE [master]
GO
ALTER DATABASE [QlBanGiay] SET  READ_WRITE 
GO
