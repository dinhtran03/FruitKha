USE [Fruitka]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method] [varchar](255) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[note] [text] NULL,
	[customer_id] [int] NOT NULL,
	[shipping_address_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
 CONSTRAINT [PK__Order__3213E83FA2DF2F42] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[slug] [varchar](255) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[sale_price] [decimal](10, 2) NULL,
	[quantity] [int] NOT NULL,
	[image] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[product_category_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[user_id] [int] NOT NULL,
	[is_default] [bit] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK__Shipping__3213E83FCB7B3D10] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[password] [varchar](60) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [name], [created_at]) VALUES (1, N'Strawberry', CAST(N'2024-04-16T21:07:39.730' AS DateTime))
INSERT [dbo].[ProductCategory] ([id], [name], [created_at]) VALUES (2, N'Berry', CAST(N'2024-04-16T21:07:39.730' AS DateTime))
INSERT [dbo].[ProductCategory] ([id], [name], [created_at]) VALUES (3, N'Lemon', CAST(N'2024-04-16T21:07:39.730' AS DateTime))
INSERT [dbo].[ProductCategory] ([id], [name], [created_at]) VALUES (4, N'Apple', CAST(N'2024-04-16T21:07:39.730' AS DateTime))
INSERT [dbo].[ProductCategory] ([id], [name], [created_at]) VALUES (5, N'Avocado', CAST(N'2024-04-16T21:07:39.730' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (1, N'Strawberry', N'strawberry', CAST(85.00 AS Decimal(10, 2)), CAST(85.00 AS Decimal(10, 2)), 99, N'http://localhost:8080/Fruitka/assets/img/products/product-img-1.jpg', N'Strawberries are vibrant red fruits known for their sweet taste and juicy texture. They are typically small in size, with a distinctive seedy outer surface and a green leafy cap at the top. This fruit is widely loved for its delicious flavor, often enjoyed fresh, in desserts, or as a topping for various dishes. Strawberries are also rich in vitamin C, antioxidants, and fiber, making them not only delicious but also nutritious additions to any diet.', 1, CAST(N'2024-04-07T12:20:52.687' AS DateTime))
INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (2, N'Berry', N'berry', CAST(70.00 AS Decimal(10, 2)), CAST(70.00 AS Decimal(10, 2)), 49, N'http://localhost:8080/Fruitka/assets/img/products/product-img-2.jpg', N'Berries are small, colorful fruits that are typically juicy and sweet, although some may have a tart or sour flavor. They come in a variety of types, including strawberries, blueberries, raspberries, and blackberries, each with its own unique taste and nutritional profile. Berries are often prized for their high antioxidant content, vitamins, and dietary fiber, making them a popular choice for health-conscious individuals. They can be enjoyed fresh, added to cereals, salads, or desserts, or used to make jams, sauces, and smoothies. Berries are not only delicious but also offer numerous health benefits, contributing to overall well-being when consumed as part of a balanced diet.', 2, CAST(N'2024-04-07T12:22:33.157' AS DateTime))
INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (3, N'Lemon', N'lemon', CAST(35.00 AS Decimal(10, 2)), CAST(35.00 AS Decimal(10, 2)), 200, N'http://localhost:8080/Fruitka/assets/img/products/product-img-3.jpg', N'Lemon is a citrus fruit known for its vibrant yellow color, tart taste, and refreshing aroma. It is commonly used in cooking, baking, and beverage preparation around the world. Lemons are rich in vitamin C, antioxidants, and other nutrients, making them beneficial for immune health and overall well-being. Their acidic juice adds brightness and tanginess to a wide range of dishes, from savory to sweet. Additionally, lemon zest, the outer yellow peel, is often used to enhance flavor in various recipes. Whether squeezed over seafood, mixed into salad dressings, or used to make lemonade, lemons are versatile fruits that add a burst of flavor to countless culinary creations.', 3, CAST(N'2024-04-07T12:24:10.837' AS DateTime))
INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (7, N'Red Apple', N'red-apple', CAST(120.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(10, 2)), 28, N'https://rare-gallery.com/thumbs/842944-Apples-Closeup-White-background-Red.jpg', N'The apple fruit, scientifically known as Malus domestica, is one of the most widely cultivated fruits globally. It comes in various colors, sizes, and flavors, with popular varieties including Granny Smith, Gala, Fuji, and Red Delicious. Apples are known for their crisp texture, sweet or tart taste, and nutritional value. They are rich in dietary fiber, vitamins (particularly vitamin C), and antioxidants, making them a healthy snack choice. Apples are versatile and can be eaten fresh, juiced, or cooked into various dishes like pies, sauces, and salads. Additionally, they have cultural significance in many societies and are associated with folklore, mythology, and traditions around the world.', 4, CAST(N'2024-04-18T15:45:11.820' AS DateTime))
INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (8, N'Green Apple', N'green-apple', CAST(100.00 AS Decimal(10, 2)), CAST(100.00 AS Decimal(10, 2)), 99, N'https://th.bing.com/th/id/OIP.LBsNECK05zv9mwiPWVOvvQHaFW?w=600&h=434&rs=1&pid=ImgDetMain', N'Green Apple description', 4, CAST(N'2024-04-18T15:57:42.670' AS DateTime))
INSERT [dbo].[Products] ([id], [name], [slug], [price], [sale_price], [quantity], [image], [description], [product_category_id], [created_at]) VALUES (9, N'Avocado', N'avocado', CAST(50.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 69, N'https://th.bing.com/th/id/R.26708c9b771a989cc317bb14f09633e2?rik=ule2pe4jR2YnWQ&riu=http%3a%2f%2fwww.victory-over-diseases.com%2fwp-content%2fuploads%2f2011%2f07%2favocado.jpg&ehk=Vt2MWE63VJ4s3AhXIyL88vb7bnFt26JmuOGAvz9hRLI%3d&risl=1&pid=ImgRaw&r=0', N'Avocado description', 5, CAST(N'2024-04-19T13:24:45.923' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [email], [phone], [password], [created_at], [role]) VALUES (1, N'Admin', N'admin@gmail.com', N'0912345678', N'$2a$12$aujPmogVMGwSI5/.y320n.5jigJ1neCz3YnvfRK/4/AyS0xyh73y6', CAST(N'2024-04-18T12:38:14.443' AS DateTime), N'ADMIN')
INSERT [dbo].[Users] ([id], [name], [email], [phone], [password], [created_at], [role]) VALUES (2, N'Liu Tiu Diu', N'liutiudiu@gmail.com', N'0927707795', N'$2a$12$b1/kKhRlt74N84VIyqoFG.MnKPN2Ygjm390qH33mMWF8N5MlJn0HG', CAST(N'2024-04-18T14:35:32.110' AS DateTime), N'USER')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_createdAt]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[ShippingAddress] ADD  CONSTRAINT [DF_ShippingAddress_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_role]  DEFAULT ('USER') FOR [role]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Carts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Cart]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartITem_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartITem_Product]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_OrderItem_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_ShippingAddress] FOREIGN KEY([shipping_address_id])
REFERENCES [dbo].[ShippingAddress] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_ShippingAddress]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[ProductCategory] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ShippingAddress]  WITH CHECK ADD  CONSTRAINT [FK_ShippingAddress_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingAddress] CHECK CONSTRAINT [FK_ShippingAddress_User]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllCartItems]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectAllCartItems] @CartId int 
as
select ci.*, p.name product_name, p.slug product_slug, p.price product_price, p.sale_price product_sale_price, p.quantity product_quantity,p.image product_image,p.description product_description,p.product_category_id,p.created_at product_created_at from CartItem ci left join Products p on ci.product_id = p.id where ci.cart_id = @CartId;
GO
/****** Object:  StoredProcedure [dbo].[SelectCart]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SelectCart] @UserId int
AS
SELECT 
    c.*, 
    sub_total, 
    u.name user_name, 
    u.email user_email, 
    u.phone user_phone, 
    u.created_at user_created_at, 
    u.role user_role
FROM 
    Carts c
LEFT JOIN 
    Users u ON c.user_id = u.id
LEFT JOIN 
    (SELECT 
         cart_id, 
         SUM(ci.quantity * p.sale_price) sub_total
     FROM 
         CartItem ci 
	 LEFT JOIN 
		Products p ON ci.product_id = p.id
     GROUP BY 
         cart_id) ci ON c.id = ci.cart_id
WHERE 
    c.user_id = @UserId;
GO
/****** Object:  StoredProcedure [dbo].[SelectCartItem]    Script Date: 4/19/2024 1:34:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectCartItem] @CartId int, @ProductId int
as
select ci.*, p.name product_name, p.slug product_slug, p.price product_price, p.sale_price product_sale_price, p.quantity product_quantity,p.image product_image,p.description product_description,p.product_category_id,p.created_at product_created_at from CartItem ci left join Products p on ci.product_id = p.id where ci.cart_id = @CartId and ci.product_id = @ProductId;
GO
