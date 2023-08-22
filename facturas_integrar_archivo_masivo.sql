--FACTURAS1
SELECT
t0.IdFactura, t0.Cod_Area, t0.IdSucursal, t0.CajaFactura, t1.Cod_Producto,
t0.Fecha , [Serial], Cod_Area, 'FACTURA' AS [DOCUMENTO] FROM    
[ERP_POS].[Facturas] T0 INNER JOIN [ERP_POS].[DetalleFacturas] T1 ON
T0.IdFactura = T1.IdFactura WHERE  [MontoTotal] > 0 AND
T0.[IdEstatusMigracion] = 0 --and  t0.Fecha < '2023-08-21'

--FACTURAS2
SELECT
t0.CantidadProductos,t0.IdFactura, t0.Cod_Area, t0.CajaFactura, t1.Cod_Producto
FROM     [ERP_POS].[Facturas] T0 INNER JOIN
[ERP_POS].[DetalleFacturas] T1 ON T0.IdFactura = T1.IdFactura WHERE
 [MontoTotal] > 0 AND T0.[IdEstatusMigracion] = 0 --and t0.Fecha < '2023-08-21'
