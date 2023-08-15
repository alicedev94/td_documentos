Select Documento = 'ENTRADA', GETDATE() [Fecha], IdEstatusMigracion, MONTH(FechaCreacion) as Mes, COUNT(IdEstatusMigracion) as Cantidad 
from [DB_SRM].[Transferencias] where [Cod_Area] = 'CDD'
group by MONTH(FechaCreacion), IdEstatusMigracion
union all
Select Documento = 'DEVOLUCION', GETDATE() [Fecha], IdEstatusMigracion, MONTH(FechaCreacion) as Mes, COUNT(IdEstatusMigracion) as Cantidad
from [DB_SRM].[Transferencias] where [Cod_Area] <> 'CDD'
group by MONTH(FechaCreacion), IdEstatusMigracion
union all
select Documento = 'FACTURA',GETDATE() [Fecha], IdEstatusMigracion, MONTH(Fecha) as Mes, COUNT(IdEstatusMigracion) as Cantidad
from [ERP_POS].[Facturas] where [MontoTotal] > 0
group by MONTH(Fecha), IdEstatusMigracion
union all
select Documento = 'NOTAC',GETDATE() [Fecha], IdEstatusMigracion, MONTH(Fecha) as Mes, COUNT(IdEstatusMigracion) as Cantidad
from [ERP_POS].[Facturas] where [MontoTotal] < 0
group by MONTH(Fecha), IdEstatusMigracion