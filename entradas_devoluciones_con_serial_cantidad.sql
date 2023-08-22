--ENTRADAS
SELECT 
T0.[IdTransferencia],
[Cod_SucursalOrigen],
T1.NumeroTransferencia,
T2.IdTransferenciaSucursalDetalle,
T3.Cod_Producto,
T3.Serial,
t0.FechaCreacion,
t1.Cod_AreaDestino,
t2.CantidadEnviada,
t2.CantidadRecibida
FROM [MDW_ERP].[DB_SRM].[Transferencias] T0
inner join [DB_SRM].[TransferenciasSucursales] T1
ON T0.IdTransferencia = T1.IdTransferencia
inner join [DB_SRM].[TransferenciasSucursalesDetalle] T2 
ON T1.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
inner join [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 
ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
where  t0.Cod_Area = 'CDD' and t0.IdEstatusMigracion = 0 and T0.[IdTransferencia]
in ('92656','92688','102002','103069','103672','103705','103715')

--DEVOLUCIONES
SELECT 
T0.[IdTransferencia],
[Cod_SucursalOrigen],
T1.NumeroTransferencia,
T2.IdTransferenciaSucursalDetalle,
T3.Cod_Producto,
T3.Serial,
t0.FechaCreacion,
t1.Cod_AreaDestino,
t2.CantidadEnviada,
t2.CantidadRecibida
FROM [MDW_ERP].[DB_SRM].[Transferencias] T0
inner join [DB_SRM].[TransferenciasSucursales] T1
ON T0.IdTransferencia = T1.IdTransferencia
inner join [DB_SRM].[TransferenciasSucursalesDetalle] T2 
ON T1.IdTransferenciaSucursal = T2.IdTransferenciaSucursal 
inner join [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 
ON T2.IdTransferenciaSucursalDetalle = T3.IdTransferenciaSucursalDetalle
where  t0.Cod_Area != 'CDD' and t0.IdEstatusMigracion = 0 and T0.[IdTransferencia]
in ('92656','92688','102002','103069','103672','103705','103715')