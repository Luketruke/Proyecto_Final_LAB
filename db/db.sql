USE [master]
GO
/****** Object:  Database [COMERCIO_P3]    Script Date: 20-Jul-22 11:51:01 AM ******/
CREATE DATABASE [COMERCIO_P3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'COMERCIO_P3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\COMERCIO_P3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'COMERCIO_P3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\COMERCIO_P3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [COMERCIO_P3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [COMERCIO_P3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [COMERCIO_P3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET ARITHABORT OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [COMERCIO_P3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [COMERCIO_P3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [COMERCIO_P3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [COMERCIO_P3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET RECOVERY FULL 
GO
ALTER DATABASE [COMERCIO_P3] SET  MULTI_USER 
GO
ALTER DATABASE [COMERCIO_P3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [COMERCIO_P3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [COMERCIO_P3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [COMERCIO_P3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [COMERCIO_P3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [COMERCIO_P3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'COMERCIO_P3', N'ON'
GO
ALTER DATABASE [COMERCIO_P3] SET QUERY_STORE = OFF
GO
USE [COMERCIO_P3]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [int] NOT NULL,
	[nombres] [varchar](25) NOT NULL,
	[apellidos] [varchar](25) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[CUIT] [varchar](20) NOT NULL,
	[idDomicilio] [int] NOT NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[idTipoCliente] [int] NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroCompra] [int] NULL,
	[IDProveedor] [int] NOT NULL,
	[IdFormaDePago] [int] NOT NULL,
	[Subtotal] [decimal](18, 0) NULL,
	[Descuento] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[Fecha] [datetime] NULL,
	[Observaciones] [varchar](255) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras_Items]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdCompra] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](18, 0) NULL,
	[Descuento] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionesClientes]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionesClientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Localidad] [varchar](255) NULL,
	[CodigoPostal] [varchar](255) NULL,
	[Observaciones] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [varchar](40) NULL,
	[idCliente] [int] NOT NULL,
	[idVendedor] [int] NOT NULL,
	[IdFormaDePago] [int] NOT NULL,
	[Subtotal] [decimal](18, 2) NULL,
	[Descuento] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Fecha] [datetime] NULL,
	[Observaciones] [varchar](255) NULL,
	[idSucursal] [int] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[idPuntoDeVenta] [int] NOT NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas_Items]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [decimal](18, 2) NULL,
	[Descuento] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Codigo] [varchar](25) NULL,
	[PrecioUnitario] [decimal](18, 2) NULL,
	[descripcion] [varchar](100) NULL,
	[Estado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormasDePago]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormasDePago](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosStock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosStock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[idStock] [int] NOT NULL,
	[idSucursal] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Fecha] [datetime] NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumeracionFacturas]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeracionFacturas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [bigint] NOT NULL,
	[idTipoDocumento] [int] NOT NULL,
	[idPuntoVenta] [int] NULL,
	[Estado] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
	[precioVenta] [decimal](18, 0) NULL,
	[costo] [decimal](18, 0) NULL,
	[idCategoria] [int] NOT NULL,
	[idMarca] [int] NOT NULL,
	[Observaciones] [varchar](255) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NOT NULL,
	[razonSocial] [varchar](50) NOT NULL,
	[CUIT] [varchar](20) NOT NULL,
	[domicilio] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores_Productos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores_Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDProducto] [int] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[Estado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PuntoVenta]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuntoVenta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](4) NOT NULL,
	[nombrePuntoVenta] [varchar](30) NOT NULL,
	[idSucursal] [int] NOT NULL,
	[estado] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[idProducto] [int] NOT NULL,
	[Stock] [int] NULL,
	[StockMinimo] [int] NULL,
	[Estado] [int] NULL,
	[idSucursal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[Estado] [int] NOT NULL,
	[Localidad] [varchar](30) NULL,
	[CodigoPostal] [varchar](12) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoClientes]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoClientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoCliente] [varchar](40) NOT NULL,
	[Estado] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDocumento]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoDocumento] [varchar](30) NOT NULL,
	[Estado] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[idTipoUsuario] [int] NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedores]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [int] NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[fechaAlta] [datetime] NULL,
	[idSucursal] [int] NOT NULL,
	[Estado] [int] NULL,
	[PorcentajeXVenta] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([idTipoCliente])
REFERENCES [dbo].[TipoClientes] ([id])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([ID])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([ID])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compras] ([ID])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Compras_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[DireccionesClientes]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([IdFormaDePago])
REFERENCES [dbo].[FormasDePago] ([ID])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedores] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedores] ([id])
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedores] ([id])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([ID])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([ID])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([ID])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Facturas_Items]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[MovimientosStock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[MovimientosStock]  WITH CHECK ADD FOREIGN KEY([idStock])
REFERENCES [dbo].[Stock] ([Id])
GO
ALTER TABLE [dbo].[MovimientosStock]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[NumeracionFacturas]  WITH CHECK ADD FOREIGN KEY([idTipoDocumento])
REFERENCES [dbo].[TipoDocumento] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Proveedores_Productos]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedores] ([id])
GO
ALTER TABLE [dbo].[PuntoVenta]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Vendedores]  WITH CHECK ADD FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursales] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCategoria]
@Descripcion varchar(50)
AS
INSERT INTO Categorias 
VALUES (@Descripcion, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCliente]
@idCliente int,
@Codigo int,
@Nombres varchar(50),
@Apellidos varchar(50),
@FechaNacimiento datetime,
@Cuit varchar(15),
@Telefono varchar(50),
@Email varchar(50),
@idTipoCliente int,
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(15),
@Observaciones varchar(255)
AS
INSERT INTO Clientes 
VALUES (@Codigo, @Nombres, @Apellidos, @FechaNacimiento, @Cuit, 0, @Telefono, @Email, @idTipoCliente, 1)

SET @idCliente = @@IDENTITY

INSERT INTO DireccionesClientes 
VALUES (@idCliente, @Direccion, @Localidad, @CodigoPostal, @Observaciones)

UPDATE Clientes SET idDomicilio = (SELECT id FROM DireccionesClientes WHERE idCliente = @idCliente)
GO
/****** Object:  StoredProcedure [dbo].[AgregarFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarFactura]
@NumeroFactura varchar(30),
@idCliente int,
@idVendedor int,
@idFormaDePago int,
@Subtotal decimal(18,2),
@Descuento decimal(18,2),
@Total decimal(18,2),
@Fecha datetime,
@Observaciones varchar(50),
@idSucursal int,
@idTipoDocumento int,
@idPuntoDeVenta int
AS
INSERT INTO Facturas
OUTPUT inserted.Id
VALUES (@NumeroFactura, @idCliente, @idVendedor, @idFormaDePago, @Subtotal, @Descuento, @Total, 
@Fecha, @Observaciones, @idSucursal, @idTipoDocumento, @idPuntoDeVenta, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarItemFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarItemFactura]
@idFactura int,
@idProducto int,
@Cantidad int,
@Subtotal decimal(18,2),
@Descuento decimal(18,2),
@Total decimal(18,2),
@codigo varchar(25),
@PrecioUnitario decimal(18,2),
@Descripcion varchar(50)
AS
INSERT INTO Facturas_Items 
VALUES (@idFactura, @idProducto, @Cantidad, @Subtotal, @Descuento, @Total, @codigo, 
@PrecioUnitario, @Descripcion, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarMarca]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarMarca]
@Descripcion varchar(50)
AS
INSERT INTO Marcas 
VALUES (@Descripcion, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarMovimientoStock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarMovimientoStock]
@IdStock int,
@Cantidad int
AS
INSERT INTO MovimientosStock VALUES 
((SELECT idProducto FROM Stock WHERE Id = @IdStock),@IdStock,
(SELECT idSucursal FROM Stock WHERE Id = @IdStock),@Cantidad,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[AgregarMovimientoStockFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarMovimientoStockFactura]
@IdProducto int,
@IdStock int,
@Cantidad int,
@IdSucursal int
AS
INSERT INTO MovimientosStock VALUES 
(@IdProducto,@IdStock,@IdSucursal,@Cantidad*-1,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[AgregarNumeracionDocumentos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarNumeracionDocumentos]
@IdPuntoVenta int
AS
INSERT INTO NumeracionFacturas VALUES (1,1,@IdPuntoVenta,1)
INSERT INTO NumeracionFacturas VALUES (1,2,@IdPuntoVenta,1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto]
@Codigo int,
@Descripcion varchar(50),
@PrevioVenta decimal(18,2),
@Costo decimal(18,2),
@IdCategoria INT,
@IdMarca INT,
@Observaciones varchar(255)
AS
INSERT INTO Productos 
OUTPUT inserted.Id
VALUES (@Codigo, @Descripcion, @PrevioVenta, @Costo, @IdCategoria, @IdMarca, @Observaciones, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarProveedor]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProveedor]
@idProveedor int,
@Codigo varchar (25),
@RazonSocial varchar(50),
@CUIT varchar(20),
@telefono varchar(20),
@Email varchar(50),
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(15),
@Observaciones varchar(255)
AS
INSERT INTO Proveedores 
VALUES (@Codigo, @RazonSocial, @CUIT,0,@telefono, @Email, 1)

SET @idProveedor = @@IDENTITY

INSERT INTO DireccionesProveedores
VALUES (@idProveedor, @Direccion, @Localidad, @CodigoPostal, @Observaciones)

SELECT * FROM Proveedores
GO
/****** Object:  StoredProcedure [dbo].[AgregarPuntoDeVenta]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarPuntoDeVenta]
@Numero varchar(4),
@Nombre varchar(50),
@IdSucursal int
AS
INSERT INTO PuntoVenta
OUTPUT Inserted.Id
VALUES (@Numero,@Nombre,@IdSucursal,1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarStock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarStock]
@idProducto int,
@StockMinimo int,
@IdSucursal int
AS
INSERT INTO Stock 
VALUES (@idProducto, 0, @StockMinimo, 1, @IdSucursal)
GO
/****** Object:  StoredProcedure [dbo].[AgregarSucursal]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarSucursal]
@Nombre varchar(50),
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(50)
AS
INSERT INTO Sucursales (Nombre, Direccion, Localidad, CodigoPostal, Estado)
VALUES (@Nombre,@Direccion,@Localidad,@CodigoPostal,1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarVendedor]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarVendedor]
@Codigo int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Telefono varchar(50),
@Email varchar(50),
@FechaAlta datetime,
@IdSucursal int,
@PorcentajeXVenta decimal(18,2)
AS
INSERT INTO Vendedores 
VALUES (@Codigo, @Nombres, @Apellidos, @Telefono, @Email, @FechaAlta, @IdSucursal, 1, @PorcentajeXVenta)
GO
/****** Object:  StoredProcedure [dbo].[AnularFacturaFallada]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AnularFacturaFallada]
@idFactura int
AS
UPDATE Facturas SET Estado = 0 WHERE ID = @idFactura
GO
/****** Object:  StoredProcedure [dbo].[EliminarCategoria]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCategoria]
@Id int
AS
UPDATE Categorias SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCliente]
@Id int
AS
UPDATE Clientes SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarMarcas]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarMarcas]
@Id int
AS
UPDATE Marcas SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarProductos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProductos]
@Id int
AS
UPDATE Productos SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[EliminarPuntoDeVenta]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarPuntoDeVenta]
@IdPuntoVenta int
AS
UPDATE PuntoVenta SET Estado = 0 WHERE id = @IdPuntoVenta
GO
/****** Object:  StoredProcedure [dbo].[EliminarSucursal]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarSucursal]
@IdSucursal int
AS
UPDATE Sucursales SET Estado = 0 WHERE id = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[EliminarVendedor]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarVendedor]
@Id int
AS
UPDATE Vendedores SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarCategoria]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCategoria]
@Id int,
@Descripcion varchar(50)
AS
UPDATE Categorias SET descripcion = @Descripcion WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
@Id int,
@Nombres varchar(50), 
@Apellidos varchar(50), 
@FechaNacimiento DateTime,
@CUIT varchar(15), 
@idDomicilio int,
@Telefono varchar(25),
@Email varchar(60),
@idTipoCliente int,
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(15),
@Observaciones varchar(255)
AS
UPDATE Clientes SET nombres = @Nombres, apellidos = @Apellidos, 
FechaNacimiento = @FechaNacimiento, CUIT = @CUIT, idDomicilio = @idDomicilio, Telefono = @Telefono,
email = @Email, idTipoCliente = @idTipoCliente WHERE id = @Id

UPDATE DireccionesClientes 
SET Direccion = @Direccion, Localidad = @Localidad, 
CodigoPostal = @CodigoPostal, Observaciones = @Observaciones 
WHERE idCliente = @Id 
GO
/****** Object:  StoredProcedure [dbo].[ModificarMarca]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarMarca]
@Id int,
@Descripcion varchar(50)
AS
UPDATE Marcas SET descripcion = @Descripcion WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarNumeracion]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarNumeracion]
@idTipoDocumento int,
@idPuntoVenta int
AS
UPDATE NumeracionFacturas 
SET numero = numero + 1
WHERE idTipoDocumento = @idTipoDocumento AND idPuntoVenta = @idPuntoVenta
GO
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarProducto]
@Id int,
@Descripcion varchar(50), 
@PrevioVenta decimal(18,2), 
@Costo decimal(18,2),
@IdCategoria int, 
@IdMarca int,
@Observaciones varchar(255)
AS
UPDATE Productos SET descripcion = @Descripcion, precioVenta = @PrevioVenta, 
costo = @Costo, idCategoria = @IdCategoria, idMarca = @IdMarca, Observaciones = @Observaciones WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarPuntoDeVenta]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarPuntoDeVenta]
@IdPuntoVenta int,
@Numero varchar(4),
@Nombre varchar(50)
AS
UPDATE PuntoVenta
SET numero = @Numero, nombrePuntoVenta = @Nombre
WHERE Id = @IdPuntoVenta
GO
/****** Object:  StoredProcedure [dbo].[ModificarStock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarStock]
@IdStock int,
@Cantidad int
AS
UPDATE Stock SET Stock = (SELECT Stock FROM Stock WHERE Id = @IdStock) + @Cantidad WHERE Id = @IdStock
GO
/****** Object:  StoredProcedure [dbo].[ModificarStockFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarStockFactura]
@IdProducto int,
@Cantidad int,
@IdSucursal int
AS
UPDATE Stock
SET Stock = Stock - @Cantidad
OUTPUT Inserted.Id
WHERE idProducto = @IdProducto AND idSucursal = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[ModificarSucursal]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarSucursal]
@IdSucursal int,
@Nombre varchar(50),
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(50)
AS
UPDATE Sucursales 
SET Nombre = @Nombre, Direccion = @Direccion, Localidad = @Localidad, CodigoPostal = @CodigoPostal
WHERE id = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[ModificarVendedor]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarVendedor]
@Id int,
@Nombres varchar(50),
@Apellidos varchar(50),
@Telefono varchar(50),
@Email varchar(50),
@FechaAlta datetime,
@IdSucursal int,
@PorcentajeXVenta decimal(18,2)
AS
UPDATE Vendedores SET nombres = @Nombres, apellidos = @Apellidos, 
FechaAlta = @FechaAlta, Telefono = @Telefono, email = @Email, 
IdSucursal = @IdSucursal, PorcentajeXVenta = @PorcentajeXVenta WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProductos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasProductos]
AS
SELECT id, descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientesFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientesFactura]
AS
SELECT id,nombres + ' ' + apellidos nombreCliente, idTipoCliente FROM Clientes WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientesFacturaFiltrados]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientesFacturaFiltrados]
@filtro varchar(30)
AS
SELECT id,nombres + ' ' + apellidos as nombreCliente, idTipoCliente FROM Clientes 
WHERE Estado = 1 and (nombres like '%' + @filtro + '%') OR (apellidos like '%' + @filtro + '%')
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientesTodos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientesTodos]
AS
SELECT C.id, C.codigo, C.nombres, C.Apellidos, C.nombres + ' ' + C.Apellidos as NombreCompleto, C.fechaNacimiento, 
C.CUIT, C.idDomicilio, C.telefono, C.email, C.idTipoCliente
FROM Clientes C 
WHERE C.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosFacturaImpresion]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDatosFacturaImpresion]
@IdFactura int
AS
SELECT TP.tipoDocumento, F.NumeroFactura, C.nombres + ' ' + C.apellidos as Cliente,
V.nombres + ' ' + V.apellidos as Vendedor, FP.Tipo as FormaDePago, F.Subtotal, F.Descuento, F.Total,
F.Fecha, F.Observaciones, S.nombre Sucursal, DC.Direccion + ', ' + DC.Localidad DireccionCliente, TC.tipoCliente, C.CUIT
FROM Facturas F 
INNER JOIN Clientes C ON C.Id = F.idCliente
INNER JOIN FormasDePago FP ON FP.ID = F.IdFormaDePago
INNER JOIN Sucursales S ON S.id = F.idSucursal
INNER JOIN Vendedores V ON V.id = F.idVendedor
INNER JOIN TipoDocumento TP ON TP.id = F.idTipoDocumento
INNER JOIN DireccionesClientes DC ON DC.idCliente = C.id
INNER JOIN PuntoVenta PV ON PV.id = F.idPuntoDeVenta
INNER JOIN TipoClientes TC ON TC.id = C.idTipoCliente
WHERE F.ID = @IdFactura
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDireccionCliente]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerDireccionCliente]
@idCliente int
AS
SELECT Direccion, Localidad, CodigoPostal, Observaciones
FROM DireccionesClientes D
INNER JOIN Clientes C ON C.id = D.idCliente
WHERE C.Estado = 1 AND D.idCliente = @idCliente

GO
/****** Object:  StoredProcedure [dbo].[ObtenerFacturasTodas]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerFacturasTodas]
AS
SELECT F.id, F.NumeroFactura, F.Fecha, TD.tipoDocumento, C.nombres + ' ' + C.apellidos nombreCompleto, F.Subtotal, F.Descuento, F.Total
FROM Facturas F 
INNER JOIN TipoDocumento TD ON TD.id = F.idTipoDocumento
INNER JOIN Clientes C ON C.id = F.idCliente
WHERE F.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFormasDePago]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerFormasDePago]
AS
SELECT id, tipo FROM FormasDePago WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerItemsFacturaImpresion]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerItemsFacturaImpresion]
@IdFactura int
AS
SELECT Codigo, descripcion, Cantidad, PrecioUnitario, Subtotal, Descuento, Total
FROM Facturas_Items 
WHERE IdFactura = @IdFactura
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMarcasProductos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMarcasProductos]
AS
SELECT id, descripcion FROM Marcas WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMovimientosStock]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMovimientosStock]
@idProducto int
AS
SELECT Id, IdProducto, IdStock, IdSucursal, Cantidad
FROM MovimientosStock
WHERE idProducto = @idProducto
GO
/****** Object:  StoredProcedure [dbo].[ObtenerNumeroFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerNumeroFactura]
@idPuntoDeVenta int,
@idTipoDocumento int
AS
SELECT  
CASE
WHEN NF.numero between 1 and 9 
THEN PV.numero + '-0000000' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 10 and 99 
THEN PV.numero + '-000000' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 100 and 999 
THEN PV.numero + '-00000' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 1000 and 9999 
THEN PV.numero + '-0000' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 10000 and 99999 
THEN PV.numero + '-000' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 100000 and 999999 
THEN PV.numero + '-00' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 1000000 and 9999999 
THEN PV.numero + '-0' + CAST(NF.numero as varchar(10))
WHEN NF.numero between 10000000 and 9999999 
THEN PV.numero + '-' + CAST(NF.numero as varchar(10))
END as Factura
FROM NumeracionFacturas NF
INNER JOIN PuntoVenta PV ON NF.idPuntoVenta = PV.id
INNER JOIN TipoDocumento TD ON TD.id = NF.idTipoDocumento
WHERE NF.Estado = 1 AND NF.idPuntoVenta = @idPuntoDeVenta AND NF.idTipoDocumento = @idTipoDocumento
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosFactura]
@IdSucursal int
AS
SELECT P.id, P.codigo, P.descripcion, P.precioVenta, P.costo, C.id idCategoria, C.descripcion Categoria,
M.id idMarca, M.descripcion Marca, P.Observaciones, S.Stock StockActual, S.StockMinimo
FROM Productos P
INNER JOIN Categorias C ON C.id = P.idCategoria
INNER JOIN Marcas M ON M.id = P.idMarca
INNER JOIN Stock S ON S.idProducto = P.id
WHERE P.Estado = 1 AND idSucursal = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosFacturaFiltrados]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosFacturaFiltrados]
@filtro varchar(30),
@IdSucursal int
AS
SELECT P.id, P.codigo, P.descripcion, P.precioVenta, P.costo, C.id idCategoria, C.descripcion Categoria, 
M.id idMarca, M.descripcion Marca, P.Observaciones, S.Stock StockActual
FROM Productos P
INNER JOIN Categorias C ON C.id = P.idCategoria
INNER JOIN Marcas M ON M.id = P.idMarca
INNER JOIN Stock S ON S.idProducto = P.id
WHERE P.Estado = 1 and P.descripcion like '%' + @filtro + '%' AND S.idSucursal = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosTodos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosTodos]
AS
SELECT P.id, P.codigo, P.descripcion, P.precioVenta, P.costo, C.id idCategoria, C.descripcion Categoria,
M.id idMarca, M.descripcion Marca, P.Observaciones, S.Stock StockActual, S.StockMinimo
FROM Productos P
INNER JOIN Categorias C ON C.id = P.idCategoria
INNER JOIN Marcas M ON M.id = P.idMarca
INNER JOIN Stock S ON S.idProducto = P.id
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProveedores]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProveedores]
AS
SELECT P.id, P.codigo, P.razonSocial, P.CUIT, P.domicilio, P.telefono, P.email 
FROM Proveedores P 
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPuntosDeVenta]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPuntosDeVenta]
@idSucursal int
AS
SELECT PV.id,PV.nombrePuntoVenta, PV.numero, S.direccion + ', ' + S.Localidad Direccion, S.nombre NombreSucursal
FROM PuntoVenta PV
INNER JOIN Sucursales S ON PV.idSucursal = S.id
WHERE PV.Estado = 1 and idSucursal = @idSucursal
GO
/****** Object:  StoredProcedure [dbo].[ObtenerStockHistorico]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerStockHistorico]
@idStock int
AS
SELECT ST.Id, P.descripcion, MS.Cantidad, MS.Fecha, S.nombre NombreSucursal
FROM Stock ST
INNER JOIN MovimientosStock MS ON MS.idStock = ST.Id
INNER JOIN Sucursales S ON S.id = ST.idSucursal
INNER JOIN Productos P ON p.id = ST.idProducto
WHERE ST.Id = @idStock
GO
/****** Object:  StoredProcedure [dbo].[ObtenerStockProductos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerStockProductos]
@idProducto int
AS
SELECT ST.Id, ST.IdProducto, ST.Stock StockActual, ST.StockMinimo, 
S.id IdSucursal, S.nombre NombreSucursal, P.descripcion
FROM Stock ST
INNER JOIN Sucursales S ON S.id = ST.idSucursal
INNER JOIN Productos P ON p.id = ST.idProducto
WHERE idProducto = @idProducto
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSucursales]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSucursales]
AS
SELECT id,nombre,direccion,localidad,codigopostal,
direccion + ', ' + Localidad as DireccionCompleta
FROM Sucursales WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTipoClienteEspecifico]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTipoClienteEspecifico]
@idCliente int
AS
SELECT C.idTipoCliente
FROM Clientes C 
WHERE C.Estado = 1 AND id = @idCliente
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTipoClientes]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTipoClientes]
AS
SELECT id, tipoCliente FROM tipoClientes WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTipoFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerTipoFactura]
@idTipoDocumento int
AS
SELECT tipoDocumento FROM TipoDocumento WHERE id =  @idTipoDocumento
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoCodigoCliente]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimoCodigoCliente]
AS
SELECT TOP 1 Codigo FROM Clientes ORDER BY id DESC
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoCodigoProducto]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimoCodigoProducto]
AS
SELECT TOP 1 Codigo FROM Productos ORDER BY id DESC
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoCodigoVendedor]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerUltimoCodigoVendedor]
AS
SELECT TOP 1 Codigo FROM Vendedores ORDER BY id DESC
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVendedoresFactura]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVendedoresFactura]
@IdSucursal int
AS
SELECT id, nombres + ' ' + apellidos NombreVendedor
FROM Vendedores 
WHERE Estado = 1 and idSucursal = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVendedoresTodos]    Script Date: 20-Jul-22 11:51:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerVendedoresTodos]
AS
SELECT v.id idVendedor, v.codigo, v.nombres, v.Apellidos, 
v.nombres + ' ' + v.Apellidos as NombreCompleto, v.telefono, 
v.email, v.fechaAlta, S.id idSucursal, S.nombre, V.PorcentajeXVenta
FROM Vendedores V
INNER JOIN Sucursales S ON S.id = V.idSucursal
WHERE V.Estado = 1
GO
USE [master]
GO
ALTER DATABASE [COMERCIO_P3] SET  READ_WRITE 
GO
