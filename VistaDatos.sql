USE Bodega;

CREATE VIEW dbo.VistaDatos 
WITH SCHEMABINDING
AS
SELECT A.["idarticulo"], F.["idfactura"], C.["idcliente"], P.["nombre"] 
FROM dbo.Venta V
INNER JOIN dbo.Articulo A ON A.["idarticulo"] = V.["idarticulo"]
INNER JOIN dbo.Factura F ON F.["idfactura"] = V.["idfactura"]
INNER JOIN dbo.Cliente C ON C.["idcliente"] = F.["idcliente"]
INNER JOIN dbo.Producto P ON P.["idproducto"] = A.["idproducto"];
GO
SET STATISTICS IO ON
GO
SELECT * FROM dbo.VistaDatos;
GO
CREATE UNIQUE CLUSTERED INDEX
	VistaNombresCompadores
ON VistaDatos(["idarticulo"], ["idfactura"], ["idcliente"], ["nombre"]);

