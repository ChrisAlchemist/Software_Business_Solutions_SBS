--select * from hape..TBL_CORRESPONSALIAS_SERVICIOS
--begin tran 
DECLARE 
--@ID_SOCIO BIGINT,
--@idMov int = 1 ,
@correo varchar(150) ='edgar_esmed@hotmail.com',
@numeroSocio int = 820395   ,																																																																			---------------------------------------------------------------,
@idMov int = 1
--IF OBJECT_ID('tempdb..#socio') IS NOT NULL
--    DROP TABLE #socio

--create table #socio ( numero int , id_persona int )

--insert into #socio ( numero  , id_persona)
select edc.numero  ,p.Id_Persona,edc.Id_mov,edc.Saldo_Actual  from 
HAPE..EDO_DE_CUENTA edc
join hape..PERSONA p on p.numero = edc.numero and p.Id_Tipo_Persona = 1
left JOIN HAPE..TBL_SOCIO_PUNTUAL SP  ON P.Numero = SP.Numero and p.Id_Tipo_Persona = 1
WHERE 
--p.numero not in (select numero_socio from TBL_BANCA_SOCIOS)
--AND P.Numero  = COALESCE (@numeroSocio, p.numero)
p.numero= 820395    
--and len(p.Numero) >5
-- OBTENEMOS 
--AND  1 = ( case when edc.saldo_actual > 0 and edc.Id_mov <= COALESCE(@idMov , edc.Id_mov) then 1 else 0 END)
and p.Id_Tipo_persona = 1
and edc.Saldo_Actual > 0 
and Id_mov <= 10-- = @idMov
and Num_ptmo is not null




--INSERT INTO TBL_BANCA_SOCIOS (id_persona,
--numero_socio,
--contrasena,
--fecha_alta_contrasena,
--contrasena_temp,
--fecha_contrasena_temporal,
--fecha_alta_persona,
--id_estatus_banca,
--id_pregunta_secreta,
--respuesta,
--id_motivo_bloqueo,
--banca_activa,
--fecha_motivo_bloqueo)
--SELECT   s.Id_Persona,S.NUMERO,null,null,'92783E2C53CC921E312EB32B88507A97',GETDATE(),'2018-05-03 12:02:53.740',
--4,	3,	'Morelia'	,1,	0 /*banca_activa*/,	'2018-05-16 12:38:52.307' 
--FROM #socio S


--------------insertamos revolvente CORRESPONSALIAS---------------------------------------------------
-----------------------------------------------------------------------------------
--INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
--SELECT 
--s.numero,
--'797'+'002'+REPLACE(STR(10, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
--getdate(),
--10, 
--lc.num_ptmo , 
--1
--FROM  HAPE..PERSONA S JOIN
--HAPE..TBL_REVOLVENTE_LINEAS_CREDITO LC ON  lc.numero =  S.numero  
-- where
--	s.Numero = @numeroSocio
--	and s.Id_Tipo_Persona = 1 and '797'+'002'+REPLACE(STR(10, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')
--	not in (   SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS )



--------------------------------------------------------------
---- INSERTAMOS LOS PRESTAMOS EN TBL_CORRESPONSALIAS_CUENTAS--
--------------------------------------------------------------
set @idMov = 1
while (@idMov < 10)
begin
	INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
	SELECT 
	s.numero ,
	'797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
	getdate(),
	edc.Id_mov , 
	EDC.Num_ptmo , 
	1
	FROM  HAPE..PERSONA S  
	JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  S.numero  AND EDC.Id_mov  = CAST(@idMov AS INT) and edc.Id_Tipo_persona  = 1
	where
	 s.Numero = @numeroSocio
	 and s.Id_Tipo_Persona = 1
	 and '797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  not in 
	(
	SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS 
	)
	and edc.Id_Tipo_persona  = 1
	and EDC.Saldo_Actual > 0
	and edc.Num_ptmo is not null
	

	set @idMov = @idMov + 1
end
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------
-- INSERTAMOS LOS HABERES EN TBL_CORRESPONSALIAS_CUENTAS----------------------------------------
------------------------------------------------------------------------------------------------

--INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
--SELECT 
--s.numero ,
--'797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
--getdate(),
--edc.Id_mov , 
--EDC.Num_ptmo , 
--1
--FROM  HAPE..PERSONA S  
-- JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  S.numero  AND EDC.Id_mov  in (100,103,112) and edc.Id_Tipo_persona = 1
-- where
-- s.Numero = @numeroSocio
-- and s.Id_Tipo_Persona = 1
-- and ('797'+'001'+cast(edc.Id_mov as varchar)+REPLACE(STR(S.numero , 7), SPACE(1), '0') ) not in 
-- (
--	SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS 
-- )
--and 1 = (case when edc.Tarjeta_activa = 'T' and edc.Id_mov =112 then 1
--			  when edc.id_mov in (100,103) then 1  end)
--and edc.Id_Tipo_persona  = 1


-- INSERTAMOS LOS HABERES EN TBL_CORRESPONSALIAS_INTERBANCARIAS
--INSERT INTO TBL_BANCA_CUENTAS_INTERBANCARIAS (numero_socio,clabe,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
--SELECT 
--s.numero ,
--'01797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
--getdate(),
--edc.Id_mov , 
--edc.Num_ptmo , 
--1
--FROM  HAPE..PERSONA S   
--JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  s.numero  AND EDC.Id_mov  in (100,103,112) and edc.Id_Tipo_persona = 1
-- where
-- s.Numero = @numeroSocio
-- and s.Id_Tipo_Persona = 1
-- and '01797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  not in 
-- (
--	SELECT clabe FROM TBL_BANCA_CUENTAS_INTERBANCARIAS 
-- )

--and 1 = (case when edc.Tarjeta_activa = 'T' and edc.Id_mov =112 then 1
--		  when edc.id_mov in (100,103) then 1  end)
--and edc.Id_Tipo_persona  = 1
--------------------------------------------------------------------
 --INSERTAMOS LOS PRESTAMOS EN TBL_CORRESPONSALIAS_INTERBANCARIAS--
--------------------------------------------------------------------
INSERT INTO banca..TBL_BANCA_CUENTAS_INTERBANCARIAS (numero_socio,clabe,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
SELECT 
s.numero,
'01797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
getdate(),
edc.Id_mov , 
edc.Num_ptmo , 
1
FROM  HAPE..PERSONA S
 JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  s.numero and  EDC.Id_mov  =CAST(@idMov AS INT)  and edc.Id_Tipo_persona = 1
 where
 s.Numero = @numeroSocio
 and s.Id_Tipo_Persona = 1
 and '01797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0') not in 
 (
	SELECT clabe FROM banca..TBL_BANCA_CUENTAS_INTERBANCARIAS 
 )
 and edc.Id_Tipo_persona  = 1
 and edc.Num_ptmo is not null

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
---------------------------------------------------------------------------------

UPDATE HAPE..PERSONA SET Mail =@correo 
WHERE Numero = @numeroSocio
and Id_Tipo_Persona = 1

------------------------
--select * from #socio
-------------------------

 select * from hape..TBL_CORRESPONSALIAS_CUENTAS where NUMERO in (@numeroSocio) order by numero , ID_MOV
 select * from banca..TBL_BANCA_CUENTAS_INTERBANCARIAS where numero_socio in (@numeroSocio) order by numero_socio, ID_MOV
 select numero_socio , COUNT(numero_socio) from banca..TBL_BANCA_SOCIOS group by numero_socio having COUNT(numero_socio) > 1

--ROLLBACK TRAN

--update  tbl_banca_socios set 
--id_motivo_bloqueo = 1 ,
--viene_de_bloqueo = 0, 
--intentos_sesion =0,
--banca_activa = 1,
--fecha_alta_contrasena= GETDATE(),
--contrasena = 'FA2A2E2BC761751A9D777FD9912929CB',
--id_estatus_banca = 4,
--id_imagen_antiphishing =13
-- where  numero_socio in (262197,
--24391,
--89193,
--205771,
--65766,
--562962,605112,755527,49487,100050,101630,124826,182818,219937,240518,261434,
--324499,333193,346180,362052,515088,523059,587100,609350,636833,
--8451,30568,74951,77101,92896,98981,142251,
--8440,65025,188713,28382,62471,
--198578,201597,374823
--)