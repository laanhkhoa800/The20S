USE [CuaHang]
GO
ALTER TABLE [dbo].[TaiKhoanKhachHang] DROP CONSTRAINT [FK_TaiKhoanKhachHang_TinhTrangTaiKhoan]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK_SanPham_TinhTrangSanPham]
GO
ALTER TABLE [dbo].[SanPham] DROP CONSTRAINT [FK_SanPham_DauSanPham]
GO
ALTER TABLE [dbo].[HD] DROP CONSTRAINT [FK_HD_TrinhTrangDonHang]
GO
ALTER TABLE [dbo].[HD] DROP CONSTRAINT [FK_HD_TaiKhoanKhachHang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] DROP CONSTRAINT [FK_ChiTietHoaDon_HD]
GO
/****** Object:  Table [dbo].[TrinhTrangDonHang]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrinhTrangDonHang]') AND type in (N'U'))
DROP TABLE [dbo].[TrinhTrangDonHang]
GO
/****** Object:  Table [dbo].[TinhTrangTaiKhoan]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TinhTrangTaiKhoan]') AND type in (N'U'))
DROP TABLE [dbo].[TinhTrangTaiKhoan]
GO
/****** Object:  Table [dbo].[TinhTrangSanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TinhTrangSanPham]') AND type in (N'U'))
DROP TABLE [dbo].[TinhTrangSanPham]
GO
/****** Object:  Table [dbo].[TaiKhoanKhachHang]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaiKhoanKhachHang]') AND type in (N'U'))
DROP TABLE [dbo].[TaiKhoanKhachHang]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SanPham]') AND type in (N'U'))
DROP TABLE [dbo].[SanPham]
GO
/****** Object:  Table [dbo].[HD]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HD]') AND type in (N'U'))
DROP TABLE [dbo].[HD]
GO
/****** Object:  Table [dbo].[DauSanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DauSanPham]') AND type in (N'U'))
DROP TABLE [dbo].[DauSanPham]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChiTietHoaDon]') AND type in (N'U'))
DROP TABLE [dbo].[ChiTietHoaDon]
GO
/****** Object:  Table [dbo].[BaoCaoDoanhThu]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaoCaoDoanhThu]') AND type in (N'U'))
DROP TABLE [dbo].[BaoCaoDoanhThu]
GO
/****** Object:  Table [dbo].[BaoCaoDatHang]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BaoCaoDatHang]') AND type in (N'U'))
DROP TABLE [dbo].[BaoCaoDatHang]
GO
/****** Object:  Table [dbo].[Animation]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Animation]') AND type in (N'U'))
DROP TABLE [dbo].[Animation]
GO
/****** Object:  Table [dbo].[Accout_Admin]    Script Date: 1/10/2022 12:58:10 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accout_Admin]') AND type in (N'U'))
DROP TABLE [dbo].[Accout_Admin]
GO
/****** Object:  Table [dbo].[Accout_Admin]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accout_Admin](
	[maAdmin] [int] NOT NULL,
	[User] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Accout_Admin] PRIMARY KEY CLUSTERED 
(
	[maAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animation]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animation](
	[idAnimation] [int] IDENTITY(1,1) NOT NULL,
	[Img_animation_1] [nvarchar](max) NULL,
	[Img_animation_2] [nvarchar](max) NULL,
	[Img_animation_3] [nvarchar](max) NULL,
	[Img_animation_4] [nvarchar](max) NULL,
 CONSTRAINT [PK_Animation] PRIMARY KEY CLUSTERED 
(
	[idAnimation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoDatHang]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoDatHang](
	[maBaoCaoDatHang] [int] IDENTITY(1,1) NOT NULL,
	[maDH] [int] NULL,
	[maKH] [int] NULL,
	[soluongSP] [int] NULL,
	[ngayDat] [date] NULL,
	[giaTien] [float] NULL,
 CONSTRAINT [PK_BaoCaoDatHang] PRIMARY KEY CLUSTERED 
(
	[maBaoCaoDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaoCaoDoanhThu]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaoCaoDoanhThu](
	[maTK] [int] IDENTITY(1,1) NOT NULL,
	[ngayTK] [date] NULL,
	[soluongTon] [int] NULL,
	[soluongXuat] [int] NULL,
	[doanhThu] [float] NULL,
 CONSTRAINT [PK_BaoCaoDoanhThu] PRIMARY KEY CLUSTERED 
(
	[maTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[maChiTietHD] [int] IDENTITY(1,1) NOT NULL,
	[maHD] [int] NULL,
	[maSP] [int] NULL,
	[soluongDatSP] [int] NULL,
	[Tong] [float] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[maChiTietHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DauSanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DauSanPham](
	[maDSP] [int] IDENTITY(1,1) NOT NULL,
	[tenSP] [nvarchar](50) NULL,
	[loaiSP] [nvarchar](50) NULL,
	[hinhanhSP] [nvarchar](max) NULL,
	[soluongSP] [int] NULL,
	[giaSP] [float] NULL,
	[hinhanhphu1] [nvarchar](max) NULL,
	[hinhanhphu2] [nvarchar](max) NULL,
	[hinhanhphu3] [nvarchar](max) NULL,
	[hinhanhphu4] [nvarchar](max) NULL,
	[hinhanhphu5] [nvarchar](max) NULL,
	[ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_DauSanPham] PRIMARY KEY CLUSTERED 
(
	[maDSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HD]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HD](
	[maHD] [int] IDENTITY(1,1) NOT NULL,
	[maKH] [int] NULL,
	[NgayDat] [date] NULL,
	[TongHD] [float] NULL,
	[ghichuHD] [nvarchar](max) NULL,
	[diachiPhu] [nvarchar](max) NULL,
	[maTT] [int] NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK_HD] PRIMARY KEY CLUSTERED 
(
	[maHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[maSP] [int] IDENTITY(1,1) NOT NULL,
	[maDSP] [int] NULL,
	[sokiemsoat] [int] NULL,
	[size] [nchar](3) NULL,
	[matinhTrang] [int] NULL,
 CONSTRAINT [PK_SanPham_1] PRIMARY KEY CLUSTERED 
(
	[maSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanKhachHang]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanKhachHang](
	[maKH] [int] IDENTITY(1,1) NOT NULL,
	[tenKH] [nvarchar](50) NULL,
	[diachiKH] [nvarchar](max) NULL,
	[emailKH] [nvarchar](50) NULL,
	[sodienthoaiKH] [nvarchar](50) NULL,
	[maTT] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[huyenKH] [nvarchar](70) NULL,
	[tinhKH] [nvarchar](70) NULL,
 CONSTRAINT [PK_TaiKhoanKhachHang] PRIMARY KEY CLUSTERED 
(
	[maKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrangSanPham]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangSanPham](
	[matinhTrang] [int] NOT NULL,
	[tenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangSanPham] PRIMARY KEY CLUSTERED 
(
	[matinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrangTaiKhoan]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangTaiKhoan](
	[maTT] [int] IDENTITY(1,1) NOT NULL,
	[tenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[maTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrinhTrangDonHang]    Script Date: 1/10/2022 12:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrinhTrangDonHang](
	[maTT] [int] NOT NULL,
	[tenTTHD] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrinhTrangDonHang] PRIMARY KEY CLUSTERED 
(
	[maTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accout_Admin] ([maAdmin], [User], [Password]) VALUES (1, N'admin', N'admin')
GO
SET IDENTITY_INSERT [dbo].[Animation] ON 

INSERT [dbo].[Animation] ([idAnimation], [Img_animation_1], [Img_animation_2], [Img_animation_3], [Img_animation_4]) VALUES (1, N'~/Content/Image/br3.PNG', N'~/Content/Image/br1.PNG', N'~/Content/Image/Sweater1.png', N'~/Content/Image/sales_dola.PNG')
SET IDENTITY_INSERT [dbo].[Animation] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] ON 

INSERT [dbo].[ChiTietHoaDon] ([maChiTietHD], [maHD], [maSP], [soluongDatSP], [Tong]) VALUES (5, 3, 2011, 1, 540000)
INSERT [dbo].[ChiTietHoaDon] ([maChiTietHD], [maHD], [maSP], [soluongDatSP], [Tong]) VALUES (6, 4, 3011, 1, 360000)
INSERT [dbo].[ChiTietHoaDon] ([maChiTietHD], [maHD], [maSP], [soluongDatSP], [Tong]) VALUES (7, 5, 3016, 1, 360000)
SET IDENTITY_INSERT [dbo].[ChiTietHoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[DauSanPham] ON 

INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (1005, N'Polo_Red', N'POLOS', N'~/Content/Image_SanPham/6-0.jpg', 5, 360000, N'~/Content/Image_SanPham/IMG_5641.jpg', N'~/Content/Image_SanPham/IMG_5700.jpg', N'~/Content/Image_SanPham/IMG_5726.jpg', N'~/Content/Image_SanPham/IMG_5809_36.jpg', N'~/Content/Image_SanPham/6-0.jpg', N'Áo polo cá tín dành riêng cho nam giới, với chất liệu vãi mềm mại thoáng mát làm từ 100% coton')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (1008, N'Polo_Orange', N'POLOS', N'~/Content/Image_SanPham/1.jpg', 1, 540000, N'~/Content/Image_SanPham/2.jpg', N'~/Content/Image_SanPham/3.jpg', N'~/Content/Image_SanPham/4.jpg', N'~/Content/Image_SanPham/5.jpg', N'~/Content/Image_SanPham/2.jpg', N'Áo polo cá tín dành riêng cho nam giới, với chất liệu vãi mềm mại thoáng mát làm từ 100% coton')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (1009, N'Hoodie-SR', N'T-SHIRT', N'~/Content/Image_SanPham/19112021051107_ao_hodie_nam_U1AKH11101SONHT_toto_shop__13_.jpg', 1, 540000, N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(2)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(3)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(7)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(9)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(2)).jpg', N'áo đẹp')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2004, N'Hoodie-SR-White', N'HOODIES', N'~/Content/Image_SanPham/14052021100522_IMG_8433.jpg', 2, 640000, N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_1).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_2).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_5).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_8).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH2041001_(Don_1).jpg', N'Chất liệu vải mềm mại nhưng không kém phần dày dặn, Tạo cảm giác thoải mái cho khách hàng khi mặc cả mùa hè lẩn mùa đông')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2005, N'Hoodie-WRS-Pro', N'HOODIES', N'~/Content/Image_SanPham/img_3522_31421a37635c44b3aea428f481dd5007_master.jpg', 1, 560000, N'~/Content/Image_SanPham/91dd47494112894cd00350_1812d9d5fdd04b9499bcfdd9d647647b_master.jpg', N'~/Content/Image_SanPham/bdd05671502a9874c13b53_b8d8c33477f84ba88dd251ae4c3aedf0_master.jpg', N'~/Content/Image_SanPham/9a1d114e5d22957ccc3348_323924abb35041cb9746b5ca27423a88_master.jpg', N'~/Content/Image_SanPham/e4a59ff6d39a1bc4428b46_c0b3d0b8c7944435baad966f41a27ca9_master.jpg', N'~/Content/Image_SanPham/91dd47494112894cd00350_1812d9d5fdd04b9499bcfdd9d647647b_master.jpg', N'Chất liệu vải mềm mại nhưng không kém phần dày dặn, Tạo cảm giác thoải mái cho khách hàng khi mặc cả mùa hè lẩn mùa đông, Màu sắc nổi bậc')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2006, N'Hoodie-SRS-Red', N'HOODIES', N'~/Content/Image_SanPham/img_3516_ea41aa420b8b4f2191729f99e6e6e7e4_master.jpg', 1, 560000, N'~/Content/Image_SanPham/img_3517_223a8459de5c4c549ea57a6c111c74a7_master.jpg', N'~/Content/Image_SanPham/86a8dfeea970602e396165_cab18b21bad640f1ab7df1356b1d2b5a_master.jpg', N'~/Content/Image_SanPham/Untitled-1-Recovered.jpg', N'~/Content/Image_SanPham/4d632d4a5b479319ca5638_bbd328ff81cf4564be21b4286cba6eed_master.jpg', N'~/Content/Image_SanPham/1d71a23ad4a41dfa44b564_4c29d777c70c41faa8f5913c997582ca_master.jpg', N'Chất liệu vải mềm mại nhưng không kém phần dày dặn, Tạo cảm giác thoải mái cho khách hàng khi mặc cả mùa hè lẩn mùa đông, Màu sắc nổi bậc')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2007, N'Hoodie-SR-Black', N'HOODIES', N'~/Content/Image_SanPham/19112021051107_ao_hodie_nam_U1AKH11101SONHT_toto_shop__13_.jpg', 1, 560000, N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(2)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(3)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(7)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(9)).jpg', N'~/Content/Image_SanPham/AO_HOODIE_U1AKH11101SONHT_(ao_hodie_nam_u1akh11101sonht_toto_shop_(2)).jpg', N'Chất liệu vải mềm mại nhưng không kém phần dày dặn, Tạo cảm giác thoải mái cho khách hàng khi mặc cả mùa hè lẩn mùa đông')
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2010, N'Tee-S', NULL, N'~/Content/Image_SanPham/1.jfif', 0, 350000, N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/1.jfif', N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/1.jfif', NULL)
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2011, N'Tee-S', NULL, N'~/Content/Image_SanPham/1.jfif', 0, 350000, N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/1.jfif', N'~/Content/Image_SanPham/4.jfif', N'~/Content/Image_SanPham/1.jfif', NULL)
INSERT [dbo].[DauSanPham] ([maDSP], [tenSP], [loaiSP], [hinhanhSP], [soluongSP], [giaSP], [hinhanhphu1], [hinhanhphu2], [hinhanhphu3], [hinhanhphu4], [hinhanhphu5], [ghichu]) VALUES (2012, N'Hoodie-SRS-Red', NULL, N'~/Content/Image_SanPham/img_3516_ea41aa420b8b4f2191729f99e6e6e7e4_master.jpg', 1, 560000, N'~/Content/Image_SanPham/img_3517_223a8459de5c4c549ea57a6c111c74a7_master.jpg', N'~/Content/Image_SanPham/86a8dfeea970602e396165_cab18b21bad640f1ab7df1356b1d2b5a_master.jpg', N'~/Content/Image_SanPham/Untitled-1-Recovered.jpg', N'~/Content/Image_SanPham/4d632d4a5b479319ca5638_bbd328ff81cf4564be21b4286cba6eed_master.jpg', N'~/Content/Image_SanPham/1d71a23ad4a41dfa44b564_4c29d777c70c41faa8f5913c997582ca_master.jpg', NULL)
SET IDENTITY_INSERT [dbo].[DauSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[HD] ON 

INSERT [dbo].[HD] ([maHD], [maKH], [NgayDat], [TongHD], [ghichuHD], [diachiPhu], [maTT], [soluong]) VALUES (3, 6, CAST(N'2022-01-09' AS Date), 565000, N'saaaaaa', NULL, 1, 1)
INSERT [dbo].[HD] ([maHD], [maKH], [NgayDat], [TongHD], [ghichuHD], [diachiPhu], [maTT], [soluong]) VALUES (4, 6, CAST(N'2022-01-09' AS Date), 385000, N'', NULL, 1, 1)
INSERT [dbo].[HD] ([maHD], [maKH], [NgayDat], [TongHD], [ghichuHD], [diachiPhu], [maTT], [soluong]) VALUES (5, 6, CAST(N'2022-01-09' AS Date), 385000, N'', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[HD] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (2010, 1008, 1, N'M  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (2011, 1009, 1, N'M  ', 2)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (2012, 1009, 2, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3006, 2004, 1, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3007, 2004, 2, N'L  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3008, 2005, 1, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3009, 2006, 1, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3010, 2007, 1, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3011, 1005, 1, N'M  ', 2)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3012, 1005, 2, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3013, 1005, 3, N'L  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3014, 1005, 4, N'L  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3015, 1005, 5, N'S  ', 1)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3016, 1005, 6, N'M  ', 2)
INSERT [dbo].[SanPham] ([maSP], [maDSP], [sokiemsoat], [size], [matinhTrang]) VALUES (3017, 1005, 7, N'M  ', 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanKhachHang] ON 

INSERT [dbo].[TaiKhoanKhachHang] ([maKH], [tenKH], [diachiKH], [emailKH], [sodienthoaiKH], [maTT], [Password], [huyenKH], [tinhKH]) VALUES (6, N'NguyenAnhKhoa', NULL, N'laanhkhoa800@gmail.com', N'1314131313', 1, N'123', N'Quận Gò Vấp', N'Thành phố Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[TaiKhoanKhachHang] OFF
GO
INSERT [dbo].[TinhTrangSanPham] ([matinhTrang], [tenTinhTrang]) VALUES (1, N'conhang')
INSERT [dbo].[TinhTrangSanPham] ([matinhTrang], [tenTinhTrang]) VALUES (2, N'dadat')
INSERT [dbo].[TinhTrangSanPham] ([matinhTrang], [tenTinhTrang]) VALUES (3, N'danggiao')
INSERT [dbo].[TinhTrangSanPham] ([matinhTrang], [tenTinhTrang]) VALUES (4, N'daban')
GO
SET IDENTITY_INSERT [dbo].[TinhTrangTaiKhoan] ON 

INSERT [dbo].[TinhTrangTaiKhoan] ([maTT], [tenTinhTrang]) VALUES (1, N'active')
INSERT [dbo].[TinhTrangTaiKhoan] ([maTT], [tenTinhTrang]) VALUES (2, N'block')
INSERT [dbo].[TinhTrangTaiKhoan] ([maTT], [tenTinhTrang]) VALUES (3, N'order')
SET IDENTITY_INSERT [dbo].[TinhTrangTaiKhoan] OFF
GO
INSERT [dbo].[TrinhTrangDonHang] ([maTT], [tenTTHD]) VALUES (1, N'DangCho')
INSERT [dbo].[TrinhTrangDonHang] ([maTT], [tenTTHD]) VALUES (2, N'DaLen')
INSERT [dbo].[TrinhTrangDonHang] ([maTT], [tenTTHD]) VALUES (3, N'DangGiao')
INSERT [dbo].[TrinhTrangDonHang] ([maTT], [tenTTHD]) VALUES (4, N'ThanhCong')
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_HD] FOREIGN KEY([maHD])
REFERENCES [dbo].[HD] ([maHD])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_HD]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHoaDon_SanPham] FOREIGN KEY([maSP])
REFERENCES [dbo].[SanPham] ([maSP])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK_ChiTietHoaDon_SanPham]
GO
ALTER TABLE [dbo].[HD]  WITH CHECK ADD  CONSTRAINT [FK_HD_TaiKhoanKhachHang] FOREIGN KEY([maKH])
REFERENCES [dbo].[TaiKhoanKhachHang] ([maKH])
GO
ALTER TABLE [dbo].[HD] CHECK CONSTRAINT [FK_HD_TaiKhoanKhachHang]
GO
ALTER TABLE [dbo].[HD]  WITH CHECK ADD  CONSTRAINT [FK_HD_TrinhTrangDonHang] FOREIGN KEY([maTT])
REFERENCES [dbo].[TrinhTrangDonHang] ([maTT])
GO
ALTER TABLE [dbo].[HD] CHECK CONSTRAINT [FK_HD_TrinhTrangDonHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DauSanPham] FOREIGN KEY([maDSP])
REFERENCES [dbo].[DauSanPham] ([maDSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DauSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_TinhTrangSanPham] FOREIGN KEY([matinhTrang])
REFERENCES [dbo].[TinhTrangSanPham] ([matinhTrang])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_TinhTrangSanPham]
GO
ALTER TABLE [dbo].[TaiKhoanKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanKhachHang_TinhTrangTaiKhoan] FOREIGN KEY([maTT])
REFERENCES [dbo].[TinhTrangTaiKhoan] ([maTT])
GO
ALTER TABLE [dbo].[TaiKhoanKhachHang] CHECK CONSTRAINT [FK_TaiKhoanKhachHang_TinhTrangTaiKhoan]
GO
