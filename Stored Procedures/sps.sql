USE [COMERCIO_P3]
GO
/****** Object:  StoredProcedure [dbo].[AgregarCategoria]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarCliente]    Script Date: 29-Jun-22 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AgregarCliente]
@Codigo varchar(12),
@Nombres varchar(50),
@Apellidos varchar(50),
@FechaNacimiento datetime,
@Cuit varchar(15),
@Domicilio varchar(50),
@Telefono varchar(50),
@Email varchar(50)
AS
INSERT INTO Clientes 
VALUES (@Codigo, @Nombres, @Apellidos, @FechaNacimiento, @Cuit, @Domicilio, @Telefono, @Email, 1)
GO
/****** Object:  StoredProcedure [dbo].[AgregarMarca]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarCategoria]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ModificarMarca]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerCategoriasProductos]    Script Date: 29-Jun-22 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerCategoriasProductos]
AS
SELECT id, descripcion FROM Categorias WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerClientesTodos]    Script Date: 29-Jun-22 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerClientesTodos]
AS
SELECT C.id, C.codigo, C.nombres, C.Apellidos, C.fechaNacimiento, C.CUIT, C.domicilio, C.telefono, C.email 
FROM Clientes C 
WHERE C.Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerMarcasProductos]    Script Date: 29-Jun-22 4:28:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerMarcasProductos]
AS
SELECT id, descripcion FROM Marcas WHERE Estado = 1
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductosTodos]    Script Date: 29-Jun-22 4:28:00 PM ******/
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
USE [COMERCIO_P3]
GO
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 29-Jun-22 6:31:25 PM ******/
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