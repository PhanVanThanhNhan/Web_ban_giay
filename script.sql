USE [master]
GO
/****** Object:  Database [QlBanGiay]    Script Date: 12/19/2022 5:22:29 PM ******/
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
/****** Object:  Table [dbo].[giay]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[giay](
	[magiay] [nvarchar](50) NOT NULL,
	[tengiay] [nvarchar](50) NULL,
	[anh] [nvarchar](230) NULL,
	[soluong] [int] NULL,
	[gia] [int] NULL,
	[maloai] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_giay] PRIMARY KEY CLUSTERED 
(
	[magiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [bigint] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[tendn] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[sdt] [nvarchar](50) NULL,
	[diachi] [nvarchar](50) NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaChiTietHD] [bigint] IDENTITY(1,1) NOT NULL,
	[MaGiay] [nvarchar](50) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[MaHoaDon] [bigint] NOT NULL,
	[damua] [bigint] NULL,
 CONSTRAINT [PK_ChiTietHoaDon] PRIMARY KEY CLUSTERED 
(
	[MaChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[MaHoaDon] [bigint] IDENTITY(1,1) NOT NULL,
	[makh] [bigint] NULL,
	[NgayMua] [datetime] NOT NULL,
	[damua] [bit] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VXacNhan]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VXacNhan]
AS
SELECT dbo.hoadon.makh, dbo.khachhang.hoten, dbo.giay.tengiay, dbo.ChiTietHoaDon.SoLuongMua, dbo.giay.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.giay.gia AS thanhtien, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.damua, 
                  dbo.hoadon.MaHoaDon, dbo.ChiTietHoaDon.MaChiTietHD
FROM     dbo.ChiTietHoaDon INNER JOIN
                  dbo.giay ON dbo.ChiTietHoaDon.MaGiay = dbo.giay.magiay INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh
WHERE  (dbo.ChiTietHoaDon.damua = 0)
GO
/****** Object:  Table [dbo].[admin]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[TenDangNhap] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Quyen] [bit] NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai](
	[maloai] [nvarchar](50) NOT NULL,
	[tenloai] [nvarchar](50) NULL,
 CONSTRAINT [PK_loaigiay] PRIMARY KEY CLUSTERED 
(
	[maloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VDonDuyet]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VDonDuyet]
AS
SELECT dbo.khachhang.makh, dbo.khachhang.hoten, dbo.giay.tengiay, dbo.ChiTietHoaDon.SoLuongMua, dbo.giay.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.giay.gia AS thanhtien, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.damua, 
                  dbo.ChiTietHoaDon.MaChiTietHD, dbo.hoadon.MaHoaDon
FROM     dbo.giay INNER JOIN
                  dbo.ChiTietHoaDon ON dbo.giay.magiay = dbo.ChiTietHoaDon.MaGiay INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh INNER JOIN
                  dbo.loai ON dbo.giay.maloai = dbo.loai.maloai CROSS JOIN
                  dbo.admin
WHERE  (dbo.ChiTietHoaDon.damua = 1)
GO
/****** Object:  View [dbo].[VLichSu]    Script Date: 12/19/2022 5:22:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VLichSu]
AS
SELECT dbo.khachhang.makh, dbo.giay.tengiay, dbo.ChiTietHoaDon.SoLuongMua, dbo.giay.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.giay.gia AS thanhtien, dbo.ChiTietHoaDon.damua, dbo.giay.anh, dbo.hoadon.NgayMua
FROM     dbo.giay INNER JOIN
                  dbo.ChiTietHoaDon ON dbo.giay.magiay = dbo.ChiTietHoaDon.MaGiay INNER JOIN
                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN
                  dbo.khachhang ON dbo.hoadon.makh = dbo.khachhang.makh
GO
INSERT [dbo].[admin] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'abc', N'123', NULL)
INSERT [dbo].[admin] ([TenDangNhap], [MatKhau], [Quyen]) VALUES (N'nhan', N'123', NULL)
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaGiay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10017, N'1', 1, 10018, 0)
INSERT [dbo].[ChiTietHoaDon] ([MaChiTietHD], [MaGiay], [SoLuongMua], [MaHoaDon], [damua]) VALUES (10018, N'11', 1, 10019, 1)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'1', N'Freak3 Bread', N'images/Freak3Bread.jpg', 10, 3500000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'10', N'Kyrie 6 Atum', N'images/Kyrie6Atum.jpg', 10, 2700000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'11', N'Kyrie 6 Valentine', N'images/Kyrie6Valentine.jpg', 10, 3500000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'12', N'Kyrie Low 5 SE', N'images/KyrieLow5EP.jpg', 10, 3620000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'13', N'Lebron 18 Low', N'images/Lebron18Low.jpg', 10, 2300000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'14', N'Lebron 19', N'images/Lebron19.jpg', 10, 5500000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'15', N'Lebron 19 Black', N'images/Lebron19Black.jpg', 10, 4200000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'16', N'Lebron 19 Low', N'images/Lebron19Low.jpg', 10, 3100000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'17', N'Nike Dunk Low SE', N'images/NikeDunkLowSe.jpg', 10, 2900000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'18', N'PG6 EP', N'images/PG6EP.jpg', 10, 2850000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'19', N'Why not zero 4', N'images/Whynotzero4.jpg', 10, 1900000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'2', N'Freak3 Grey', N'images/Freak3Grey.jpg', 10, 3500000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'20', N'Zion1', N'images/Zion1.jpg', 10, 2300000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'21', N'Dame 8 Blue', N'images/Dame8Blue.jpg', 10, 2300000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'22', N'Dame 8 Mint', N'images/Dame8Mint.jpg', 10, 3200000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'23', N'Dame 8 White', N'images/Dame8White.jpg', 10, 2100000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'24', N'D.O.N Issue 3', N'images/DONIssue3.jpg', 10, 1500000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'25', N'Forum Blue ', N'images/Forumblue.jpg', 10, 2250000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'26', N'Harden Step Back 3', N'images/HardenStepBack3.jpg', 10, 2400000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'27', N'Harden Vol 6 Black', N'images/HardenVol6Black.jpg', 10, 2400000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'28', N'Harden Vol 6 Pink', N'images/HardenVol6Pink.jpg', 10, 2250000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'29', N'Harden Vol 6 Purple', N'images/HardenVol6Purple.jpg', 10, 2400000, N'2', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'3', N'Freak3 Uno', N'images/Freak3Uno.jpg', 10, 4200000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'30', N'Black Fives Fusion Nitro', N'images/BlackFivesFusionNitro.jpg', 10, 2400000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'31', N'Court Rider Pop', N'images/CourRiderPop.jpg', 10, 3500000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'32', N'Fusion Nitro', N'images/FusionNitro.jpg', 10, 2840000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'33', N'Fusion Nitro White', N'images/FusionNitroPink.jpg', 10, 2540000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'34', N'MB.01 UFO', N'images/MB.01UFO.jpg', 10, 7000000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'35', N'Puma X Dunkin', N'images/PumaxDunkinTripleBasketballSneakers.jpg', 10, 5500000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'36', N'Fusion Nitro Pink', N'images/FusionNitroPink.jpg', 10, 2540000, N'3', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'4', N'Jordan1KO', N'images/Jordan1KO.jpg', 10, 6000000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'5', N'Jordan36 Bread', N'images/Jordan36.jpg', 10, 5000000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'6', N'Jordan36 Hanimichi', N'images/Jordan36Hanimichi.jpg', 10, 5320000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'7', N'Jordan36 TacoJay', N'images/Jordan36TacoJay.jpg', 10, 6200000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'8', N'KD 15 EP', N'images/KD15EP.jpg', 10, 3200000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[giay] ([magiay], [tengiay], [anh], [soluong], [gia], [maloai], [NgayNhap]) VALUES (N'9', N'KDTrey 5 EP', N'images/KDTrey5Ep.jpg', 10, 2500000, N'1', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[hoadon] ON 

INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10018, 2, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[hoadon] ([MaHoaDon], [makh], [NgayMua], [damua]) VALUES (10019, 10018, CAST(N'2022-12-15T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([makh], [hoten], [tendn], [password], [email], [sdt], [diachi]) VALUES (1, N'Thành Nhân', N'abcd', N'123', N'abcd@gmail.com', N'0865691202', N'HUế')
INSERT [dbo].[khachhang] ([makh], [hoten], [tendn], [password], [email], [sdt], [diachi]) VALUES (2, N'UserTest', N'abc', N'123', N'nhan1@gmail.com', N'1010101010', N'Huế')
INSERT [dbo].[khachhang] ([makh], [hoten], [tendn], [password], [email], [sdt], [diachi]) VALUES (10016, N'UserTest', N'nhannhan', N'1', N'nhannhan@gmail.com', N'1010101010', N'Hue')
INSERT [dbo].[khachhang] ([makh], [hoten], [tendn], [password], [email], [sdt], [diachi]) VALUES (10017, N'phan van thanh nhan', N'abcdd', N'1', N'nhanbl0907@gmail.com', N'0865691202', N'Hue')
INSERT [dbo].[khachhang] ([makh], [hoten], [tendn], [password], [email], [sdt], [diachi]) VALUES (10018, N'UserTest', N'abcdc', N'1', N'longbro@gmail.com', N'7654321', N'hue')
SET IDENTITY_INSERT [dbo].[khachhang] OFF
GO
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'1', N'Nike')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'2', N'Adidas')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'3', N'Puma')
INSERT [dbo].[loai] ([maloai], [tenloai]) VALUES (N'4', N'jordan')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_giay1] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[giay] ([magiay])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_giay1]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_hoadon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[hoadon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_hoadon]
GO
ALTER TABLE [dbo].[giay]  WITH CHECK ADD  CONSTRAINT [FK_giay_loai] FOREIGN KEY([maloai])
REFERENCES [dbo].[loai] ([maloai])
GO
ALTER TABLE [dbo].[giay] CHECK CONSTRAINT [FK_giay_loai]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang1] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[32] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "admin"
            Begin Extent = 
               Top = 255
               Left = 23
               Bottom = 396
               Right = 217
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 64
               Bottom = 170
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "giay"
            Begin Extent = 
               Top = 192
               Left = 371
               Bottom = 355
               Right = 565
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 6
               Left = 388
               Bottom = 169
               Right = 582
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 0
               Left = 684
               Bottom = 163
               Right = 878
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loai"
            Begin Extent = 
               Top = 215
               Left = 689
               Bottom = 334
               Right = 883
            End
            DisplayFlags = 344
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDonDuyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDonDuyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VDonDuyet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "giay"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichSu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VLichSu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[25] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ChiTietHoaDon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "giay"
            Begin Extent = 
               Top = 3
               Left = 489
               Bottom = 166
               Right = 683
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "hoadon"
            Begin Extent = 
               Top = 168
               Left = 320
               Bottom = 331
               Right = 514
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "khachhang"
            Begin Extent = 
               Top = 180
               Left = 608
               Bottom = 343
               Right = 802
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VXacNhan'
GO
USE [master]
GO
ALTER DATABASE [QlBanGiay] SET  READ_WRITE 
GO
