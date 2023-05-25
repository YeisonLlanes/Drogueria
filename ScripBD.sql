USE [master]
GO
/****** Object:  Database [Drogueria]    Script Date: 25/05/2023 3:13:46 p. m. ******/
CREATE DATABASE [Drogueria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Drogueria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Drogueria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Drogueria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Drogueria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Drogueria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Drogueria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Drogueria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Drogueria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Drogueria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Drogueria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Drogueria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Drogueria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Drogueria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Drogueria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Drogueria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Drogueria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Drogueria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Drogueria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Drogueria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Drogueria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Drogueria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Drogueria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Drogueria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Drogueria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Drogueria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Drogueria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Drogueria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Drogueria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Drogueria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Drogueria] SET  MULTI_USER 
GO
ALTER DATABASE [Drogueria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Drogueria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Drogueria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Drogueria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Drogueria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Drogueria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Drogueria] SET QUERY_STORE = ON
GO
ALTER DATABASE [Drogueria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Drogueria]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Cliente] [nvarchar](80) NULL,
	[nit_cliente] [int] NULL,
	[Direccion] [nvarchar](100) NULL,
	[Telefono] [nchar](10) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[id_pedido] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[desc_producto] [nvarchar](50) NULL,
	[tipo_producto] [nvarchar](50) NULL,
	[precio] [decimal](18, 0) NULL,
	[stock_bodega] [int] NULL,
	[stock_minimo] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[id_producto] [int] NULL,
	[Cantidad] [int] NULL,
	[total_venta] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 
GO
INSERT [dbo].[Clientes] ([id_cliente], [Nombre_Cliente], [nit_cliente], [Direccion], [Telefono]) VALUES (1, N'Consorcio Limitada', 123456789, N'Kr Falsa 123', N'3001000000')
GO
INSERT [dbo].[Clientes] ([id_cliente], [Nombre_Cliente], [nit_cliente], [Direccion], [Telefono]) VALUES (2, N'Conjunto Las Pruebas', 987654321, N'Calle 654', N'3012345678')
GO
INSERT [dbo].[Clientes] ([id_cliente], [Nombre_Cliente], [nit_cliente], [Direccion], [Telefono]) VALUES (3, N'Drogueria Competencia', 951357842, N'Diagonal Falsa', N'3211236547')
GO
INSERT [dbo].[Clientes] ([id_cliente], [Nombre_Cliente], [nit_cliente], [Direccion], [Telefono]) VALUES (4, N'Ultimis', 842675912, N'Avenida Falsa', N'6543219871')
GO
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pedidos] ON 
GO
INSERT [dbo].[Pedidos] ([id_pedido], [id_producto], [cantidad]) VALUES (1, 4, 15)
GO
INSERT [dbo].[Pedidos] ([id_pedido], [id_producto], [cantidad]) VALUES (2, 8, 5)
GO
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (1, N'Laptop', N'Electrodomestico', CAST(5000000 AS Decimal(18, 0)), 15, 2)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (2, N'Televisor', N'Electrodomestico', CAST(1200000 AS Decimal(18, 0)), 20, 5)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (3, N'SmarTv', N'Electrodomestico', CAST(2500000 AS Decimal(18, 0)), 30, 10)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (4, N'Crema Corporal', N'Unguento', CAST(3500 AS Decimal(18, 0)), 25, 10)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (5, N'Papas Fritas', N'Comestibles', CAST(1500 AS Decimal(18, 0)), 20, 5)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (6, N'Gaseosa', N'Comestibles', CAST(2000 AS Decimal(18, 0)), 15, 5)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (7, N'Chicles', N'Comestibles', CAST(500 AS Decimal(18, 0)), 25, 5)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (8, N'Toallas Humedas', N'Cuidado Personal', CAST(3400 AS Decimal(18, 0)), 10, 8)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (9, N'Esmaltes', N'Cuidado Personal', CAST(6000 AS Decimal(18, 0)), 17, 2)
GO
INSERT [dbo].[Productos] ([id_producto], [desc_producto], [tipo_producto], [precio], [stock_bodega], [stock_minimo]) VALUES (10, N'Ibuprofeno', N'Medicamento', CAST(35000 AS Decimal(18, 0)), 35, 12)
GO
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
SET IDENTITY_INSERT [dbo].[Ventas] ON 
GO
INSERT [dbo].[Ventas] ([id_venta], [id_cliente], [id_producto], [Cantidad], [total_venta]) VALUES (1, 4, 9, 5, CAST(30000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Ventas] ([id_venta], [id_cliente], [id_producto], [Cantidad], [total_venta]) VALUES (2, 3, 8, 10, CAST(34000 AS Decimal(18, 0)))
GO
INSERT [dbo].[Ventas] ([id_venta], [id_cliente], [id_producto], [Cantidad], [total_venta]) VALUES (3, 1, 9, 3, CAST(18000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Clientes]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id_producto])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearCliente]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CrearCliente](
	@Nombre_Cliente nvarchar(80),
	@nit_cliente int,
	@Direccion nvarchar(100),
	@Telefono nchar(10)
	
)
as
Begin
	insert into Clientes(Nombre_Cliente, nit_cliente, Direccion, Telefono) 
	values (@Nombre_Cliente, @nit_cliente, @Direccion, @Telefono) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearPedido]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CrearPedido](
	@id_producto int,
	@cantidad int
	
)
as
Begin
	insert into Pedidos(id_producto, cantidad) 
	values (@id_producto, @cantidad) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearProducto]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CrearProducto](
	@desc_producto nvarchar(50),
	@tipo_producto nvarchar(50),
	@precio decimal(18,0),
	@stock_bodega int,
	@stock_minimo int
)
as
Begin
	insert into Productos(desc_producto, tipo_producto, precio, stock_bodega, stock_minimo) 
	values (@desc_producto, @tipo_producto, @precio, @stock_bodega, @stock_minimo) 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearVenta]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[sp_CrearVenta](
	@id_cliente int,
	@id_producto int,
	@cantidad int
)
as
Begin
	Declare @total int;
	Set @total = (SELECT precio FROM Productos WHERE id_producto = @id_producto) * @cantidad;
	
	Declare @total_stock int;
	Set @total_stock = (SELECT stock_bodega FROM Productos WHERE id_producto = @id_producto) - @cantidad;
	
	INSERT INTO Ventas (id_cliente, id_producto, cantidad, total_venta) 
	VALUES (@id_cliente, @id_producto, @cantidad, @total)

	UPDATE Productos 
	SET stock_bodega = @total_stock WHERE id_producto = @id_producto
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearVenta1]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CrearVenta1](
	@id_cliente int,
	@id_producto int,
	@cantidad int
	
)
as
Begin

	Declare @total int;
	Set @total = (SELECT precio FROM Productos WHERE id_producto = @id_producto) * @cantidad;
	
	Select @total as Total, @id_Cliente as Cliente;

end
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearVenta2]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_CrearVenta2](
	@id_cliente int,
	@id_producto int,
	@cantidad int
	
)
as
Begin
	Declare @total int;
	Set @total = (SELECT precio FROM Productos WHERE id_producto = @id_producto) * @cantidad;
	
	Declare @total_stock int;
	Set @total_stock = (SELECT stock_bodega FROM Productos WHERE id_producto = @id_producto) - @cantidad;
	
	Select @total as Total, @total_stock as NuevoStock

	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EditarProducto]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_EditarProducto](
	@id_producto int,
	@desc_producto nvarchar(50),
	@tipo_producto nvarchar(50),
	@precio decimal(18,0),
	@stock_bodega int,
	@stock_minimo int
)
as
Begin
	update Productos set desc_producto =@desc_producto,
	tipo_producto =  @tipo_producto, 
	precio = @precio, 
	stock_bodega = @stock_bodega, 
	stock_minimo = @stock_minimo
	Where id_producto = @id_producto
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarProducto]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_EliminarProducto](
	@id_producto int
)
as
Begin
	Delete from Productos where id_producto = @id_producto
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InfoVentas]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_InfoVentas]
as
Begin
	Declare @total_ingresos nvarchar(max);
	Declare @mas_vendido nvarchar(max);
	Declare @menos_vendido nvarchar(max);

	SET @total_ingresos = (
	SELECT '$' + CONVERT(VARCHAR, CONVERT(VARCHAR, CAST(SUM(total_venta) AS MONEY), 1))
	FROM Ventas v)
	
	SET @mas_vendido = (
	SELECT desc_producto 
	FROM Productos
	WHERE id_producto = (
		Select top(1) T1.id_producto 
		From(  
			Select T2.id_producto from(
			 Select SUM(v.Cantidad) as cantidad, v.id_producto 
			 From Ventas v
			 Group By v.id_Producto 
			) T2 
		) T1
	))

	SET @menos_vendido = (
	SELECT desc_producto 
	FROM Productos
	WHERE id_producto = (
			Select Top(1) T2.id_producto from(
			 Select SUM(v.Cantidad) as cantidad, v.id_producto 
			 From Ventas v
			 Group By v.id_Producto 
			) T2 order by cantidad ASC 
	))


	SELECT @total_ingresos as total_ventas_drogueria, @mas_vendido as productos_mas_vendido, @menos_vendido as productos_menos_vendido

end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaClientes]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ListaClientes]
as
Begin
	Select * From Clientes
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaPedidos]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ListaPedidos]
as
Begin
	Select * 
	From Pedidos pe
	INNER JOIN Productos po on pe.id_producto = po.id_producto
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaProductos]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ListaProductos]
as
Begin
	Select * From Productos
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaVentas]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ListaVentas]
as
Begin
	Select * 
	From Ventas v
	INNER JOIN Clientes c on v.id_cliente = c.id_cliente
	INNER JOIN Productos p on v.id_producto = p.id_producto
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerCliente]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ObtenerCliente](
	@id_cliente int
)
as
Begin
	Select * From Clientes where id_cliente = @id_cliente
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerProducto]    Script Date: 25/05/2023 3:13:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_ObtenerProducto](
	@id_producto int
)
as
Begin
	Select * From Productos where id_producto = @id_producto
end
GO
USE [master]
GO
ALTER DATABASE [Drogueria] SET  READ_WRITE 
GO
