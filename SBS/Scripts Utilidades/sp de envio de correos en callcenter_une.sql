use HAPE
go

select mail,Tel_Celular,* from persona where numero = 831470

SELECT * FROM 

exec SP_UNE_ENVIAR_CORREOS

select * from claves where Id_Rol = 39

select * from claves where Numusuario in (519,518,116,547)

exec sp_callcenter_obtener_cuestionario @numero_socio=837648


select reporte_banca,DIAS_RESTANTES_GENERAL, DIAS_RESTANTES_AREA_ESPECIALIZADA,* from TBL_UNE_REPORTE where reporte_banca is null


drop table #TMP_NOTIFICAR_GENERAL

CREATE TABLE #TMP_NOTIFICAR_GENERAL(CONTADOR INT IDENTITY(1,1), FOLIO INT, NUM_FOLIO INT, NUMUSUARIO INT, CORREO VARCHAR(100), DIAS_GENERALES INT, DIAS_AREA_ESP INT, FOLIO_BANCA INT, REPORTE_BANCA BIT, ID_CUENTA INT)
	INSERT INTO #TMP_NOTIFICAR_GENERAL
	SELECT FOLIO, NUM_FOLIO, USUARIO_REGISTRA,NULL,DIAS_RESTANTES_GENERAL, DIAS_RESTANTES_AREA_ESPECIALIZADA, folio_banca, reporte_banca, ID_CUENTA
	FROM TBL_UNE_REPORTE WHERE ID_ESTATUS_REPORTE NOT IN(6,7,8,9) 
	AND (DIAS_RESTANTES_GENERAL IN(1,0) OR (DIAS_RESTANTES_AREA_ESPECIALIZADA IN(1,0) and VoBo = 0) ) AND reporte_banca = 1
	AND ID_CUENTA IN(33,38,39)

	select * from #TMP_NOTIFICAR_GENERAL


	update TBL_UNE_REPORTE set DIAS_RESTANTES_GENERAL =2 where folio_banca = 51
	SELECT DIAS_RESTANTES_GENERAL, ID_CUENTA, *FROM TBL_UNE_REPORTE where folio_banca = 51

	select * from CAT_UNE_CUENTAS

	select * from TBL_UNE_CANALIZACIONES where numusuario = 547
	delete from  TBL_UNE_REPORTE where ID_CUENTA =33 and NUMERO = 837648 and USUARIO_REGISTRA = 547



	exec  SP_CALLCENTER_OBTENER_CUESTIONARIO 11398 