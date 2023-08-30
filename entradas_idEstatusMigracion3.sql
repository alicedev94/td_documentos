---IDStatusMigracion3
SELECT distinct  T0.[IdTransferencia] AS [ID], 
T0.[NumeroTransferencia],
t0.Cod_Transferencia,
T0.[FechaRegistro] AS [FECHA],  
T2.IdTransferenciaSucursalDetalle,
[Cod_Area] Origen, T0.[Cod_AreaDestino] Destino, 'ENTRADA' AS [DOCUMENTO] ,
T1.[IdEstatusMigracion]
,T3.Serial
,T3.Cod_Producto
,t2.CantidadEnviada
,t1.Cod_Area,
t0.Cod_AreaDestino
FROM [DB_SRM].[TransferenciasSucursales] T0 
inner JOIN [DB_SRM].[Transferencias] T1 ON t0.Cod_Transferencia = t1.Cod_Transferencia
LEFT join [DB_SRM].[TransferenciasSucursalesDetalle] T2 ON t0.Cod_TransferenciaSucursal = t2.Cod_TransferenciaSucursal
LEFT join [DB_SRM].[TransferenciasSucursalesDetalleSeriales] T3 ON t2.Cod_TransferenciaSucursalDetalle = t3.Cod_TransferenciaSucursalDetalle
WHERE  T1.[IdEstatusMigracion] IN (3) and t1.IdIntegracion = 1  and Cod_Area = 'CDD' 


SELECT T0.[IdTransferencia] AS [ID], 
T0.[NumeroTransferencia], 
T0.[FechaRegistro] AS [FECHA],  
[Cod_Area] Origen, T0.[Cod_AreaDestino] Destino, 'ENTRADA' AS [DOCUMENTO] 
FROM [DB_SRM].[TransferenciasSucursales] T0 INNER JOIN 
[DB_SRM].[Transferencias] T1 ON T0.Cod_Transferencia = T1.Cod_Transferencia WHERE  T1.[IdEstatusMigracion] = 3 
and Cod_Area = 'CDD'


