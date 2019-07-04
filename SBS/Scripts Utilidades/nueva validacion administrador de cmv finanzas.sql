select * from hape..cat_une_supuestos_reporte

--certificado de aportación
if not exists (select Id_mov,* from HAPE..EDO_DE_CUENTA where Numero = 837648 and Id_Tipo_persona =1 and Id_mov =102 and Saldo_Actual >=500)
begin
	select 'no tiene'
end
else
begin
	select 'si tiene'
end

select Id_mov,* from HAPE..EDO_DE_CUENTA where Numero = 837648 and Id_Tipo_persona =1 and Id_mov =102 and Saldo_Actual >=500



select Saldo_Actual,* from HAPE..EDO_DE_CUENTA where Id_Tipo_persona =1 and Id_mov =102 and Saldo_Actual <500

--select * from TBL_UNE_REPORTE where folio_banca = 249

--select * from HAPE..EDO_DE_CUENTA where Numero = 4