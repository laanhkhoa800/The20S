USE [CuaHang]
GO
/****** Object:  Table [dbo].[Accout_Admin]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[Animation]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[BaoCaoDatHang]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[BaoCaoDoanhThu]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[DauSanPham]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[HD]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoanKhachHang]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[TinhTrangSanPham]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[TinhTrangTaiKhoan]    Script Date: 11/22/2021 10:05:55 PM ******/
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
/****** Object:  Table [dbo].[TrinhTrangDonHang]    Script Date: 11/22/2021 10:05:55 PM ******/
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
