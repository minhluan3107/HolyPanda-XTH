CREATE DATABASE PJPanda
USE [PJPanda]
GO
/****** Tạo bảng [Accounts] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Photo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Tạo bảng [Authorities] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[RoleId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Tạo bảng [Categories] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Tạo bảng [OrderDetails] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Tạo bảng [Orders] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Tạo bảng [Products] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Tạo bảng [Roles] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*** Nhập liệu bảng [Accounts] không nhập ***/
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES ('luanadmin', 'luan123', N'Phạm Minh Luân', 'luanadmin123@gmail.com', N'luan.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo]) VALUES ('luan123', 'luan123', N'Phạm Minh Luân US', 'luanus123@gmail.com', N'luanus.png')

/*** Nhập liệu bảng [Authorities] không nhập ***/
SET IDENTITY_INSERT [dbo].[Authorities] ON
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (2,'luanadmin', N'STAF')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (3,'luan123', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF

/*** Nhập liệu bảng [Categories] 10 danh mục ***/
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1001', N'Bàn gỗ cao cấp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1002', N'Sofa gia đình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1003', N'Ghế ăn gỗ tự nhiên')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1004', N'Bộ bàn ghế ăn')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1005', N'Ghế phòng khách')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1006', N'Kệ ti vi')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1007', N'Tủ sắt gia đình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1008', N'Tủ quần áo gỗ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1009', N'Tủ giày gỗ cao cấp')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES ('1010', N'Bàn trang điểm')

/*** Nhập liệu bảng [OrderDetails] 20 đơn ***/
SET IDENTITY_INSERT [dbo].[OrderDetails] ON
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212512, 1071, 1042, 14, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212513, 1072, 1043, 39, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212514, 1073, 1044, 20, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212515, 1074, 1045, 25, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212516, 1075, 1046, 38, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212517, 1076, 1047, 42, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212518, 1077, 1048, 35, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212519, 1078, 1049, 28, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212520, 1079, 1050, 40, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212521, 1080, 1051, 38, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212522, 1081, 1052, 14, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212523, 1082, 1053, 39, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212524, 1083, 1054, 19, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212525, 1084, 1055, 36, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212526, 1085, 1056, 40, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212527, 1086, 1057, 28, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212528, 1087, 1058, 45, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212529, 1088, 1059, 25, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212530, 1089, 1060, 17, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (212531, 1090, 1061, 36, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF

/*** Nhập liệu bảng [Orders] 20 đơn ***/
SET IDENTITY_INSERT [dbo].[Orders] ON 
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1071,'luanad', CAST(0x0000AD0100000000 AS DateTime), N'221 Phạm Văn Chiêu, Phường 14, Quận Gò Vấp, TP HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1072,'nganxd', CAST(0x0000AD0100000000 AS DateTime), N'464 Nguyễn Văn Khối, Phường 9, Quận Gò Vấp, TP HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1073,'thientt', CAST(0x0000AD0100000000 AS DateTime), N'205/3 Bình Trị Đông, P. Bình Trị Đông A,  Quận Bình Tân, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1074,'tantt', CAST(0x0000AD0100000000 AS DateTime), N'207 Nơ Trang Long,  Quận Bình Thạnh, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1075,'thaitt', CAST(0x0000AD0100000000 AS DateTime), N'74 Nơ Trang Long,  Quận Bình Thạnh, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1076,'dangdd', CAST(0x0000AD0100000000 AS DateTime), N'47 Phan Khiêm Ích, P. Tân Phong,  Quận 7, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1077,'luanad', CAST(0x0000AD0100000000 AS DateTime), N'Hẻm 33 Vạn Kiếp, P. 3,  Quận Bình Thạnh, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1078,'nganxd', CAST(0x0000AD0100000000 AS DateTime), N'29 Hà Huy Tập, P. Tân Phong,  Quận 7, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1079,'thientt', CAST(0x0000AD0100000000 AS DateTime), N'14 Khổng Tử, P. Bình Thọ,  Tp. Thủ Đức, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1080,'tantt', CAST(0x0000AD0100000000 AS DateTime), N'994 Nguyễn Văn Linh, D2 - 21 Khu Phố Mỹ Toàn 3,  Quận 7, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1081,'thaitt', CAST(0x0000AD0100000000 AS DateTime), N'18A Cộng Hòa,  Quận Tân Bình, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1082,'dangdd', CAST(0x0000AD0100000000 AS DateTime), N'123 Trần Thái Tông, P.15,  Quận Tân Bình, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1083,'luanad', CAST(0x0000AD0100000000 AS DateTime), N'174 - 176 Đường Số 1, P. Bình Trị Đông B,  Quận Bình Tân, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1084,'nganxd', CAST(0x0000AD0100000000 AS DateTime), N'11/3 Đường 1C, P. Bình Hưng Hòa A,  Quận Bình Tân, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1085,'thientt', CAST(0x0000AD0100000000 AS DateTime), N'256 Vành Đai Trong, P. Bình Trị Đông B,  Quận Bình Tân, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1086,'tantt', CAST(0x0000AD0100000000 AS DateTime), N'67/4/118 Vũ Huy Tấn (Đối Diện 50), P. 3,  Quận Bình Thạnh, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1087,'thaitt', CAST(0x0000AD0100000000 AS DateTime), N'14 Tôn Thất Hiệp, P. 13,  Quận 11, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1088,'dangdd', CAST(0x0000AD0100000000 AS DateTime), N'467 Trần Phú, P. 7,  Quận 5, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1089,'luanad', CAST(0x0000AD0100000000 AS DateTime), N'19 Ngô Văn Năm, P. Bến Nghé,  Quận 1, TP. HCM')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address]) VALUES (1090,'nganxd', CAST(0x0000AD0100000000 AS DateTime), N'6 Nguyễn Sơn, P. Phú Thọ Hòa,  Quận Tân Phú, TP. HCM')
SET IDENTITY_INSERT [dbo].[Orders] OFF

/*** Nhập liệu bảng [Products] mỗi danh mục 5 sản phẩm ***/
SET IDENTITY_INSERT [dbo].[Products] ON 
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1042, N'Bàn làm việc 1m2 x 80 gỗ cao cấp', N'1042.jpg', 700.000, CAST(0x910D0B00 AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1043, N'Bàn làm việc 1m1 x 70 gỗ cao cấp', N'1043.jpg', 680.000, CAST(0x910D0B00 AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1044, N'Bàn làm việc 1m x 60 gỗ xoài', N'1044.jpg', 650.000, CAST(0x910D0B00 AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1045, N'Bàn làm việc 1m x 60 gỗ mít', N'1045.jpg', 600.000, CAST(0x910D0B00 AS Date), 0, N'1001')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1046, N'Bàn làm việc 1m x 60 gỗ thông', N'1046.jpg', 550.000, CAST(0x910D0B00 AS Date), 0, N'1001')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1047, N'Sofa 4 ghế', N'1047.jpg', 200.000, CAST(0x21150B00 AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1048, N'Sofa 3 ghế', N'1048.jpg', 180.000, CAST(0x21150B00 AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1049, N'Sofa 2 ghế', N'1049.jpg', 220.000, CAST(0x21150B00 AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1050, N'Sofa chân gỗ', N'1050.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1002')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1051, N'Sofa chân trụ', N'1051.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1002')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1052, N'Ghế gỗ 4 chân', N'1052.jpg', 200.000, CAST(0x21150B00 AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1053, N'Ghế gỗ 3 chân', N'1053.jpg', 180.000, CAST(0x21150B00 AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1054, N'Ghế gỗ 2 chân', N'1054.jpg', 220.000, CAST(0x21150B00 AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1055, N'Ghế gỗ xếp', N'1055.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1003')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1056, N'Ghế gỗ đa năng', N'1056.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1003')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1057, N'Bộ bàn ghế ăn 4 ghế', N'1057.jpg', 700.000, CAST(0x910D0B00 AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1058, N'Bộ bàn ghế ăn 6 ghế', N'1058.jpg', 680.000, CAST(0x910D0B00 AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1059, N'Bộ bàn ghế ăn 8 ghế', N'1059.jpg', 650.000, CAST(0x910D0B00 AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1060, N'Bộ bàn ghế ăn 10 ghế', N'1060.jpg', 600.000, CAST(0x910D0B00 AS Date), 0, N'1004')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1061, N'Bộ bàn ghế ăn 12 ghế', N'1061.jpg', 550.000, CAST(0x910D0B00 AS Date), 0, N'1004')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1062, N'Ghế nhựa cao cấp', N'1062.jpg', 700.000, CAST(0x910D0B00 AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1063, N'Ghế gỗ có lót đệm', N'1063.jpg', 680.000, CAST(0x910D0B00 AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1064, N'Ghế nhựa có trục xoay', N'1064.jpg', 650.000, CAST(0x910D0B00 AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1065, N'Ghế chân tĩnh', N'1065.jpg', 600.000, CAST(0x910D0B00 AS Date), 0, N'1005')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1066, N'Ghế chân quỳ', N'1066.jpg', 550.000, CAST(0x910D0B00 AS Date), 0, N'1005')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1067, N'Kệ tivi treo tường', N'1067.jpg', 200.000, CAST(0x21150B00 AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1068, N'Kệ tivi gỗ tự nhiên thiết kế đa năng', N'1068.jpg', 180.000, CAST(0x21150B00 AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1069, N'Kệ tivi gỗ công nghiệp MDF', N'1069.jpg', 220.000, CAST(0x21150B00 AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1070, N'Kệ tivi kết hợp vách ngăn', N'1070.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1006')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1071, N'Kệ tivi thiết kế hình lục giác đặc sắc', N'1071.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1006')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1072, N'Tủ locker 3 cánh', N'1072.jpg', 700.000, CAST(0x910D0B00 AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1073, N'Tủ locker 4 ô', N'1073.jpg', 680.000, CAST(0x910D0B00 AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1074, N'Tủ sắt 2 cánh kính có ngăn kéo trắng', N'1074.jpg', 650.000, CAST(0x910D0B00 AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1075, N'Tủ sắt 4 cánh kính trượt', N'1075.jpg', 600.000, CAST(0x910D0B00 AS Date), 0, N'1007')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1076, N'Tủ sắt hồ sơ trắng', N'1076.jpg', 550.000, CAST(0x910D0B00 AS Date), 0, N'1007')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1077, N'Tủ quần áo cửa trượt ', N'1077.jpg', 200.000, CAST(0x21150B00 AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1078, N'Tủ quần áo cao áp trần cửa lùa ', N'1078.jpg', 180.000, CAST(0x21150B00 AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1079, N'Tủ áo 4 cánh ', N'1079.jpg', 220.000, CAST(0x21150B00 AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1080, N'Tủ quần áo 5 cánh 2m4', N'1080.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1008')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1081, N'Tủ quần áo 2 tầng', N'1081.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1008')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1082, N'Tủ giày gỗ 2 cánh', N'1082.jpg', 700.000, CAST(0x910D0B00 AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1083, N'Tủ giày gỗ đa năng ', N'1083.jpg', 680.000, CAST(0x910D0B00 AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1084, N'Tủ giày âm tường phong cách Luxury ', N'1084.jpg', 650.000, CAST(0x910D0B00 AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1085, N'Tủ giày cánh lùa', N'1085.jpg', 600.000, CAST(0x910D0B00 AS Date), 0, N'1009')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1086, N'Tủ giày dép gỗ công nghiệp', N'1086.jpg', 550.000, CAST(0x910D0B00 AS Date), 0, N'1009')

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1087, N'Bàn trang điểm tân cổ điển', N'1087.jpg', 200.000, CAST(0x21150B00 AS Date), 0, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1088, N'Bàn trang điểm gương gập', N'1088.jpg', 180.000, CAST(0x21150B00 AS Date), 0, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1089, N'Bàn trang điêm ngồi bệt', N'1089.jpg', 220.000, CAST(0x21150B00 AS Date), 0, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1090, N'Bàn trang điểm gương tròn', N'1090.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1010')
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (1091, N'Bàn trang điểm tông trắng', N'1091.jpg', 400.000, CAST(0x21150B00 AS Date), 0, N'1010')
SET IDENTITY_INSERT [dbo].[Products] OFF

/*** Nhập liệu bảng [Roles] không nhập ***/
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')


ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO

ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO

ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO

ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO

ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO






