SELECT DISTINCT T0.[IdFactura] AS [ID], T0.[Fecha] AS [FECHA], 'FACTURA' AS [DOCUMENTO]
FROM     [ERP_POS].[Facturas] T0 INNER JOIN [dbo].[DocumentosPorIntegrar] T1 ON T0.IDFACTURA = T1.IDFACTURA
WHERE  T0.[MontoTotal] > 0 AND T0.[IdEstatusMigracion] = 0