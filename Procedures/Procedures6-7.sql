SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProveedores]
@Id int
AS
UPDATE Proveedores SET Estado = 0 WHERE id = @Id
GO
------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarProvedor]
@Id int,
@Codigo varchar(25),
@razonSocial varchar(50), 
@CUIT varchar(20),
@domicilio varchar(50), 
@Telefono varchar(20),
@email varchar(50)
AS
UPDATE Proveedores SET Codigo = @Codigo, razonSocial = @razonSocial, CUIT = @CUIT, 
domicilio = @domicilio, telefono = @Telefono, email = @email WHERE id = @Id
GO