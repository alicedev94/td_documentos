USE [MDW_ERP]
GO

/****** Object:  View [dbo].[CT_DOCUMENTOS_ORDEN]    Script Date: 14/08/2023 9:01:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[CT_DOCUMENTOS_ORDEN]
as
		SELECT [IdTransferencia] AS [ID], [FechaCreacion] AS [FECHA], 'ENTRADA' AS [DOCUMENTO]
		FROM     [DB_SRM].[Transferencias]
		WHERE  [IdEstatusMigracion] = 0 and [Cod_Area] = 'CDD' 
		UNION ALL
		SELECT [IdTransferencia] AS [ID], [FechaCreacion] AS [FECHA], 'DEVOLUCION' AS [DOCUMENTO]
		FROM     [DB_SRM].[Transferencias]
		WHERE  [IdEstatusMigracion] = 0 and [Cod_Area] <> 'CDD' 
		UNION ALL
		SELECT [IdFactura] AS [ID], [Fecha] AS [FECHA], 'FACTURA' AS [DOCUMENTO]
		FROM     [ERP_POS].[Facturas]
		WHERE  [MontoTotal] > 0 AND [IdEstatusMigracion] = 0 
		UNION ALL
		SELECT [IdFactura] AS [ID], [Fecha] AS [FECHA], 'NOTAC' AS [DOCUMENTO]
		FROM     [ERP_POS].[Facturas]
		WHERE  [MontoTotal] < 0 AND [IdEstatusMigracion] = 0
GO
