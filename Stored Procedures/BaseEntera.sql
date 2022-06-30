USE [COMERCIO_P3]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NOT NULL,
	[nombres] [varchar](25) NOT NULL,
	[apellidos] [varchar](25) NOT NULL,
	[fechaNacimiento] [datetime] NULL,
	[CUIT] [varchar](20) NOT NULL,
	[idDomicilio] [int] NOT NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras_Items]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[DireccionesClientes]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Facturas]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [int] NULL,
	[idCliente] [int] NOT NULL,
	[idVendedor] [int] NOT NULL,
	[IdFormaDePago] [int] NOT NULL,
	[Subtotal] [decimal](18, 0) NULL,
	[Descuento] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[Fecha] [datetime] NULL,
	[Observaciones] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas_Items]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas_Items](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NOT NULL,
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
/****** Object:  Table [dbo].[FormasDePago]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Marcas]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Permisos]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombrePermiso] [varchar](50) NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos_Usuarios]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos_Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idPermiso] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NULL,
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Proveedores_Productos]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Stock]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  Table [dbo].[Vendedores]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](25) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
	[Estado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idPermiso])
REFERENCES [dbo].[Permisos] ([id])
GO
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idPermiso])
REFERENCES [dbo].[Permisos] ([id])
GO
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idPermiso])
REFERENCES [dbo].[Permisos] ([id])
GO
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Permisos_Usuarios]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([id])
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
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 30-Jun-22 5:19:09 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 30-Jun-22 5:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCliente]
@idCliente int,
@Codigo varchar(12),
@Nombres varchar(50),
@Apellidos varchar(50),
@FechaNacimiento datetime,
@Cuit varchar(15),
@Telefono varchar(50),
@Email varchar(50),
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(15),
@Observaciones varchar(255)
AS
INSERT INTO Clientes 
VALUES (@Codigo, @Nombres, @Apellidos, @FechaNacimiento, @Cuit, 0, @Telefono, @Email, 1)

SET @idCliente = @@IDENTITY

INSERT INTO DireccionesClientes 
VALUES (@idCliente, @Direccion, @Localidad, @CodigoPostal, @Observaciones)

UPDATE Clientes SET idDomicilio = (SELECT id FROM DireccionesClientes WHERE idCliente = @idCliente)
GO
/****** Object:  StoredProcedure [dbo].[AgregarMarca]    Script Date: 30-Jun-22 5:19:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProducto]
@Codigo varchar(12),
@Descripcion varchar(50),
@PrevioVenta decimal(18,2),
@Costo decimal(18,2),
@IdCategoria INT,
@IdMarca INT,
@Observaciones varchar(255)
AS
INSERT INTO Productos 
VALUES (@Codigo, @Descripcion, @PrevioVenta, @Costo, @IdCategoria, @IdMarca, @Observaciones, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarProveedor]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarProveedor]
@Codigo varchar(25),
@RazonSocial varchar(50),
@CUIT varchar(20),
@domicilio varchar(50),
@telefono varchar(20),
@Email varchar(50)
AS
INSERT INTO Proveedores 
VALUES (@Codigo, @RazonSocial, @CUIT, @domicilio, @telefono, @Email, 1)
GO
/****** Object:  StoredProcedure [dbo].[EliminarCliente]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarCliente]
@Id int
AS
UPDATE Clientes SET Estado = 0 WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ModificarCategoria]    Script Date: 30-Jun-22 5:19:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
@Id int,
@Codigo varchar(20),
@Nombres varchar(50), 
@Apellidos varchar(50), 
@FechaNacimiento DateTime,
@CUIT varchar(15), 
@idDomicilio int,
@Telefono varchar(25),
@Email varchar(60),
@Direccion varchar(50),
@Localidad varchar(50),
@CodigoPostal varchar(15),
@Observaciones varchar(255)
AS
UPDATE Clientes SET Codigo = @Codigo, nombres = @Nombres, apellidos = @Apellidos, 
@FechaNacimiento = @FechaNacimiento, CUIT = @CUIT, idDomicilio = @idDomicilio, Telefono = @Telefono,
email = @Email WHERE id = @Id

UPDATE DireccionesClientes 
SET Direccion = @Direccion, Localidad = @Localidad, 
CodigoPostal = @CodigoPostal, Observaciones = @Observaciones 
WHERE idCliente = @Id 
GO
/****** Object:  StoredProcedure [dbo].[ModificarMarca]    Script Date: 30-Jun-22 5:19:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarProducto]
@Id int,
@Codigo varchar(20),
@Descripcion varchar(50), 
@PrevioVenta decimal(18,2), 
@Costo decimal(18,2),
@IdCategoria int, 
@IdMarca int,
@Observaciones varchar(255)
AS
UPDATE Productos SET Codigo = @Codigo, descripcion = @Descripcion, precioVenta = @PrevioVenta, 
costo = @Costo, idCategoria = @IdCategoria, idMarca = @IdMarca, Observaciones = @Observaciones WHERE id = @Id
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProductos]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasProductos]
AS
SELECT id, descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientesTodos]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientesTodos]
AS
SELECT C.id, C.codigo, C.nombres, C.Apellidos, C.nombres + ' ' + C.Apellidos as NombreCompleto, C.fechaNacimiento, 
C.CUIT, C.idDomicilio, C.telefono, C.email 
FROM Clientes C 
WHERE C.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDireccionCliente]    Script Date: 30-Jun-22 5:19:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerMarcasProductos]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMarcasProductos]
AS
SELECT id, descripcion FROM Marcas WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosTodos]    Script Date: 30-Jun-22 5:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerProductosTodos]
AS
SELECT P.id, P.codigo, P.descripcion, P.precioVenta, P.costo, C.id idCategoria, C.descripcion Categoria, M.id idMarca, M.descripcion Marca, P.Observaciones
FROM Productos P
INNER JOIN Categorias C ON C.id = P.idCategoria
INNER JOIN Marcas M ON M.id = P.idMarca
WHERE P.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProveedores]    Script Date: 30-Jun-22 5:19:10 PM ******/
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
