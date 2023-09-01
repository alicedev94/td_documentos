--FACTURAS
SELECT
t0.IdFactura, t0.Cod_Area, t0.IdSucursal, t0.CajaFactura, t1.Cod_Producto,
t0.Fecha , [Serial], Cod_Area, 'FACTURA' AS [DOCUMENTO] FROM    
[ERP_POS].[Facturas] T0 INNER JOIN [ERP_POS].[DetalleFacturas] T1 ON
T0.IdFactura = T1.IdFactura WHERE  [MontoTotal] > 0 AND
T0.[IdEstatusMigracion] = 0 

SELECT
t0.CantidadProductos,t0.IdFactura, t0.Cod_Area, t0.CajaFactura, t1.Cod_Producto
FROM     [ERP_POS].[Facturas] T0 INNER JOIN
[ERP_POS].[DetalleFacturas] T1 ON T0.IdFactura = T1.IdFactura WHERE
 [MontoTotal] > 0 AND T0.[IdEstatusMigracion] = 0 

--NOTA DE CREDITO
SELECT
t0.IdFactura, t0.Cod_Area, t0.IdSucursal, t0.CajaFactura, t1.Cod_Producto,
t0.Fecha , [Serial], Cod_Area, 'NOTAC' AS [DOCUMENTO] FROM    
[ERP_POS].[Facturas] T0 INNER JOIN [ERP_POS].[DetalleFacturas] T1 ON
T0.IdFactura = T1.IdFactura WHERE  [MontoTotal] < 0 AND
T0.[IdEstatusMigracion] = 0 

SELECT
t0.CantidadProductos,t0.IdFactura, t0.Cod_Area, t0.CajaFactura, t1.Cod_Producto
FROM     [ERP_POS].[Facturas] T0 INNER JOIN
[ERP_POS].[DetalleFacturas] T1 ON T0.IdFactura = T1.IdFactura WHERE
 [MontoTotal] < 0 AND T0.[IdEstatusMigracion] = 0

--ENTRADAS 

--CANTIDAD
SELECT DISTINCT T0.[IdTransferencia] AS [ID], 
T0.[NumeroTransferencia],
T0.[FechaRegistro] AS [FECHA],  
[Cod_Area] Origen, 
T0.[Cod_AreaDestino] Destino
, 'ENTRADA' AS [DOCUMENTO] 
,t2.CantidadEnviada
,t2.CantidadRecibida
FROM [DB_SRM].[TransferenciasSucursales] T0 
INNER JOIN [DB_SRM].[Transferencias] T1 ON T0.IdTransferencia = T1.IdTransferencia 
INNER join [DB_SRM].[TransferenciasSucursalesDetalle] T2 ON T0.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
INNER join   [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
WHERE  T1.[IdEstatusMigracion] IN(0,3) and Cod_Area = 'CDD'  and T1.IdIntegracion=2  and T0.IdTransferenciaSucursal <> '-1'

--SERIAL
SELECT  T0.[IdTransferencia] AS [ID], 
T0.[NumeroTransferencia],
T0.[FechaRegistro] AS [FECHA],  
[Cod_Area] Origen, 
T0.[Cod_AreaDestino] Destino, 'ENTRADA' AS [DOCUMENTO]
,T3.Serial
,T3.Cod_Producto
FROM [DB_SRM].[TransferenciasSucursales] T0 
INNER JOIN [DB_SRM].[Transferencias] T1 ON T0.IdTransferencia = T1.IdTransferencia 
INNER join [DB_SRM].[TransferenciasSucursalesDetalle] T2 ON T0.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
INNER join   [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
WHERE  T1.[IdEstatusMigracion] IN(0,3) and Cod_Area = 'CDD' and T1.IdIntegracion = 2  and T0.IdTransferenciaSucursal <> '-1' 

--DEVOLUCIONES 

--CANTIDAD
SELECT DISTINCT T0.[IdTransferencia],
t1.Cod_SucursalOrigen,
T0.[NumeroTransferencia],
T3.Cod_Producto,
T1.FechaCreacion,  
t2.CantidadEnviada
,t2.CantidadRecibida
FROM [DB_SRM].[TransferenciasSucursales] T0 
INNER JOIN [DB_SRM].[Transferencias] T1 ON T0.IdTransferencia = T1.IdTransferencia 
INNER join [DB_SRM].[TransferenciasSucursalesDetalle] T2 ON T0.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
INNER join   [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
WHERE  T1.[IdEstatusMigracion] IN(0,3) and Cod_Area != 'CDD' and T1.IdIntegracion = 2  and T0.IdTransferenciaSucursal <> '-1'/*and t0.Cod_Transferencia = -1 */

--SERIAL
SELECT  T0.[IdTransferencia],
t0.Cod_SucursalDestino,
T0.[NumeroTransferencia],
T3.Cod_Producto,
T3.Serial,
t1.FechaCreacion
,t0.Cod_AreaDestino
FROM [DB_SRM].[TransferenciasSucursales] T0 
INNER JOIN [DB_SRM].[Transferencias] T1 ON T0.IdTransferencia = T1.IdTransferencia 
INNER join [DB_SRM].[TransferenciasSucursalesDetalle] T2 ON T0.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
INNER join   [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
WHERE  T1.[IdEstatusMigracion] IN(0,3) and Cod_Area != 'CDD' and T1.IdIntegracion = 2  and T0.IdTransferenciaSucursal <> '-1'