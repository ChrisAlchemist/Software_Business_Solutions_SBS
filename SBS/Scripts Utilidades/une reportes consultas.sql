use hape 
go

select * from HAPE..CAT_UNE_ESTATUS_REPORTE
select * from HAPE..CAT_UNE_SUPUESTOS_REPORTE 

exec SP_CALLCENTER_OBTENER_CUESTIONARIO 837648

select FOLIO, ID_ESTATUS_REPORTE,* from TBL_UNE_REPORTE where ID_CUENTA = 33 and NUMERO =837648

--update HAPE..CAT_UNE_ESTATUS_REPORTE set DESCRIPCION = 'Fallo de autenticación (CMV Finanzas)' where ID_ESTATUS_REPORTE =11