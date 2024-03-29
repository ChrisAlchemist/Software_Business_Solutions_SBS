USE [BANCA]
GO
/****** Object:  StoredProcedure [dbo].[SP_BANCA_INSERTAR_SOCIO]    Script Date: 03/05/2019 04:30:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc

	[dbo].[SP_BANCA_INSERTAR_SOCIO]
	 
		-- parámetros
		@numero_Socio Int,
		@contrasenaTemp varchar(max),
		@contrasenaEdoCuenta  varchar(max),
		@numero_usuario varchar(20) = null,
		@tipo_origen INT = 2
		-- [aquí van los parámetros]

as

	begin -- procedimiento
		
		begin try -- try principal
		
			begin -- inicio
			
				-- declaraciones
				declare	@status int = 1,
						@error_message varchar(255) = '',
						@error_line varchar(255) = '',
						@error_severity varchar(255) = '',
						@error_procedure varchar(255) = '',
						@id_banca_folio int,
						@id_tipo_bitacora int  = 40
						
			
			end -- inicio
			
			begin -- validaciones
			
				if not exists(SELECT * FROM HAPE.DBO.PERSONA WHERE NUMERO = @numero_Socio)
					raiserror('El socio ingresado no existe',11,0)

				if exists(SELECT * FROM TBL_BANCA_SOCIOS WHERE numero_socio = @numero_Socio and id_estatus_banca != 9)
					raiserror('El socio ingresado ya esta registrado en “CMV finanzas”',11,0)
				--if exists(SELECT * FROM TBL_BANCA_SOCIOS WHERE numero_socio = @numero_Socio)
				--raiserror('El monto ingresado es más del que dispone en la institucion',11,0)
				--if exists(SELECT * FROM TBL_BANCA_SOCIOS WHERE numero_socio = @numero_Socio )
				--	raiserror('El socio ya tiene una solicitud pendiente en Banca Electrónica' ,11,0)

				
			end -- validaciones
			if exists(SELECT * FROM TBL_BANCA_SOCIOS WHERE numero_socio = @numero_Socio and id_estatus_banca = 9 )
				begin
						update TBL_BANCA_SOCIOS 
						set
							id_estatus_banca = 4, 
							id_motivo_bloqueo=1,
							banca_activa = 0,
							fecha_alta_solicitud =GETDATE(),
							viene_de_bloqueo = 0,
							contrasena =null,
							fecha_contrasena_temporal = GETDATE(),
							contrasena_temp = @contrasenaTemp,
							fecha_alta_contrasena = null,
							id_pregunta_secreta = null,
							respuesta = null,
							fecha_motivo_bloqueo = null,
							id_imagen_antiphishing = null,
							vigencia_contrasena_temporal = null,
							id_ultima_sesion = null,
							fecha_ultima_sesion =null,
							intentos_sesion = null,
							intentos_respuesta = null,
							fecha_de_desbloqueo = null,
							contrasena_estado_cuenta = @contrasenaEdoCuenta
						where numero_socio=@numero_Socio
				end

				else if not exists(SELECT * FROM TBL_BANCA_SOCIOS WHERE numero_socio = @numero_Socio)
				begin

				INSERT INTO TBL_BANCA_SOCIOS 
				(
					id_persona,
					numero_socio,
					contrasena,
					fecha_alta_contrasena,
					contrasena_temp,
					fecha_contrasena_temporal,
					fecha_alta_persona,
					id_estatus_banca,
					id_pregunta_secreta,
					respuesta,
					id_motivo_bloqueo,
					banca_activa,
					fecha_alta_solicitud,
					contrasena_estado_cuenta
				)
				SELECT  
					s.Id_Persona,
					S.NUMERO,
					null            /*contraseña*/,
					null            /*fecha_alta_contrasena*/,
					@contrasenaTemp /*contrasena_temp*/,
					GETDATE(),
					S.Fecha_Alta /*fecha_alta_persona*/,
					4    /* 1 = registro de solicitud id_estatus_banca select * from cat_banca_estatus_banca*/,
					null /*id_pregunta_secreta*/,
					null /* respuesta*/,
					1    /* id_motivo_bloqueo cart motivo bloque*/,
					0    /*banca_activa*/,
					GETDATE(), /*fecha_alta_solicitud*/
					@contrasenaEdoCuenta
					
				FROM HAPE..PERSONA s WHERE s.Numero = @numero_Socio and  s.Id_Tipo_Persona = 1
				end
				IF @numero_usuario IS NOT NULL AND @numero_usuario <> ''
					BEGIN
					INSERT INTO 
						TBL_BANCA_BITACORA_OPERACIONES 
						(
								id_tipo_bitacora,
								numero_socio,
								fecha_alta,
								id_origen_operacion,
								usuario
						)
						VALUES 
						(
							 @id_tipo_bitacora ,
							 @numero_socio ,
							 getdate() ,
							 @tipo_origen,
							 @numero_usuario
						)


							
					END

					-----------------------------------------------------------------------------------------------------------
					---- VALIDAMOS SI EXISTEN CUENTAS EN LA TABLA DE CORRESPONSALIAS LAS ACTIVAMOS TANT DE PRESTAMOS Y HABERES--
					-----------------------------------------------------------------------------------------------------------

					IF EXISTS (SELECT 1 FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS WHERE ID_MOV = 10 AND NUMERO = @numero_Socio)
					BEGIN
					    UPDATE cc
						SET CC.ACTIVO = 1 
						FROM
						HAPE..TBL_CORRESPONSALIAS_CUENTAS cc
						JOIN HAPE..TBL_REVOLVENTE_LINEAS_CREDITO LC 
						ON  
							LC.Numero =  CC.numero 
							and cc.ID_MOV = 10
							and lc.num_ptmo = cc.NUM_PTMO
						   
						WHERE
								CC.Numero = @numero_Socio
								--and Saldo_Actual > 0
					END
				
					IF EXISTS (SELECT 1 FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS WHERE ID_MOV BETWEEN 1 AND 9 AND NUMERO = @numero_Socio)
					BEGIN
					    UPDATE cc
						SET CC.ACTIVO = 1 
						FROM
						HAPE..TBL_CORRESPONSALIAS_CUENTAS cc
						JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  CC.numero  AND EDC.Id_mov = CC.ID_MOV and edc.Id_Tipo_persona  = 1
						WHERE
								CC.Numero = @numero_Socio
								and edc.Id_Tipo_persona  = 1
								and edc.Num_ptmo is not null
								and Saldo_Actual > 0
					END

					IF EXISTS (SELECT 1 FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS WHERE ID_MOV IN (100,103,112)  AND NUMERO = @numero_Socio)
					BEGIN
					    UPDATE cc
						SET CC.ACTIVO = 1 
						FROM
						HAPE..TBL_CORRESPONSALIAS_CUENTAS cc
						JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  CC.numero  AND EDC.Id_mov = CC.ID_MOV and edc.Id_Tipo_persona  = 1
						WHERE
								CC.Numero = @numero_Socio
								and edc.Id_Tipo_persona  = 1
								and 1 = ( case when edc.Tarjeta_activa = 'T' and edc.Id_mov =112 then 1
										  when edc.id_mov in (100,103) then 1  end)
					END

						--------------------------------------------------------------
						---- INSERTAMOS LOS PRESTAMOS EN TBL_CORRESPONSALIAS_CUENTAS--
						--------------------------------------------------------------

					
						INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS  (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
						SELECT 
						s.numero ,
						'797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
						getdate(),
						edc.Id_mov , 
						EDC.Num_ptmo , 
						1
						FROM  HAPE..PERSONA S  
						JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  S.numero  AND EDC.Id_mov  IN (1,2,3,4,5,6,7,8,9) and edc.Id_Tipo_persona  = 1
						where
							s.Numero = @numero_Socio
							and s.Id_Tipo_Persona = 1
							and '797'+'002'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  not in 
						(
							SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS 
						)
						and edc.Id_Tipo_persona  = 1
						and edc.Num_ptmo is not null
						and Saldo_Actual > 0
						


					------------------------------------------------------------------------------------------------------
					--------------insertamos revolvente CORRESPONSALIAS---------------------------------------------------
					-----------------------------------------------------------------------------------------------------
						INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS  (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
						SELECT 
						s.numero,
						'797'+'002'+REPLACE(STR(10, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
						getdate(),
						10, 
						lc.num_ptmo , 
						1
						FROM  HAPE..PERSONA S JOIN
						HAPE..TBL_REVOLVENTE_LINEAS_CREDITO LC ON  lc.numero =  S.numero  
						 where
							s.Numero = @numero_Socio
							and s.Id_Tipo_Persona = 1 and '797'+'002'+REPLACE(STR(10, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')
							not in (   SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS )


					------------------------------------------------------------------------------------------------
					-- INSERTAMOS LOS HABERES EN TBL_CORRESPONSALIAS_CUENTAS----------------------------------------
					------------------------------------------------------------------------------------------------

					INSERT INTO HAPE..TBL_CORRESPONSALIAS_CUENTAS  (NUMERO,CUENTA,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
					SELECT 
					s.numero ,
					'797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
					getdate(),
					edc.Id_mov , 
					EDC.Num_ptmo , 
					1
					FROM  HAPE..PERSONA S  
						JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  S.numero  AND EDC.Id_mov  in (100,103,112) and edc.Id_Tipo_persona = 1
						where
						s.Numero = @numero_Socio
						and s.Id_Tipo_Persona = 1
						and ('797'+'001'+cast(edc.Id_mov as varchar)+REPLACE(STR(S.numero , 7), SPACE(1), '0') ) not in 
						(
						SELECT CUENTA FROM HAPE..TBL_CORRESPONSALIAS_CUENTAS 
						)
					and 1 = (case when edc.Tarjeta_activa = 'T' and edc.Id_mov =112 then 1
									when edc.id_mov in (100,103) then 1  end)
					and edc.Id_Tipo_persona  = 1


					-- INSERTAMOS LAS CUENTAS INTERBANCARIAS EN TBL_CORRESPONSALIAS_INTERBANCARIAS
					INSERT INTO TBL_BANCA_CUENTAS_INTERBANCARIAS (numero_socio,clabe,FECHA_ALTA,ID_MOV,NUM_PTMO,ACTIVO)
					SELECT 
					s.numero ,
					'01797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  AS CLABE,
					getdate(),
					edc.Id_mov , 
					edc.Num_ptmo , 
					1
					FROM  HAPE..PERSONA S   
					JOIN HAPE..EDO_DE_CUENTA EDC ON  EDC.Numero =  s.numero  AND EDC.Id_mov  in (100,103,112,1,2,3,4,5,6,7,8,9) and edc.Id_Tipo_persona = 1
						where
						s.Numero = @numero_Socio
						and s.Id_Tipo_Persona = 1
						and '01797'+'001'+REPLACE(STR(edc.Id_mov, 3), SPACE(1), '0')+REPLACE(STR(s.numero, 7), SPACE(1), '0')  not in 
						(
						SELECT clabe FROM TBL_BANCA_CUENTAS_INTERBANCARIAS 
						)

					and 1 = (case when edc.Tarjeta_activa = 'T' and edc.Id_mov =112 then 1
								when edc.id_mov in (100,103) then 1  
								when EDC.Id_mov in (1,2,3,4,5,6,7,8,9) and EDC.Saldo_Actual>0 AND EDC.Num_ptmo IS NOT NULL then 1
								end)
					and edc.Id_Tipo_persona  = 1

					
					EXEC SP_BANCA_FRAUDE_SIN_MOVIMIENTOS @numero_Socio

					DECLARE @edad_Socio int, @FECHA_2 DATETIME = GETDATE(), @FECHA_1 DATETIME = (select Fecha_de_nacimiento from HAPE..persona where numero = @numero_Socio and Id_Tipo_Persona=1)

					set @edad_Socio =
					(select year(@fecha_2) - year(@fecha_1)
					-      case
							when
								substring(convert(varchar, @fecha_1, 112), 5, 4) >
								substring(convert(varchar, @fecha_2, 112), 5, 4)
										then 1
							else 0
					end
					)
					if(@edad_Socio>=60)
					begin
					print''
						--EXEC SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60 @numero_Socio
						if not exists(select * 	from  TBL_BANCA_FRAUDE_ALERTA where NUMERO_SOCIO = @numero_Socio and ID_TIPO_ALERTA = 5) 
							insert into TBL_BANCA_FRAUDE_ALERTA 
							(
								Fecha_alerta,
								NUMERO_SOCIO,
								ID_TIPO_ALERTA,
								ID_ALERTA_RECURRENTE,
								ID_ESTATUS
							)
							values
							(
								getdate(),
								@numero_Socio,
								5,
								0,
								1
							)

					end


		
		end try -- try principal
		
		begin catch -- catch principal
		
			-- captura del error
			select	@status = -error_state(),
					@error_procedure = coalesce(error_procedure(), 'CONSULTA DINÁMICA'),
					@error_line = error_line(),
					@error_message = error_message(),
					@error_severity =
						case error_severity()
							when 11 then 'Error en validación'
							when 12 then 'Error en consulta'
							when 13 then 'Error en actualización'
							else 'Error general'
						end
		end catch -- catch principal
		
		begin -- reporte de status
		
			select	@status status,
					@error_procedure error_procedure,
					@error_line error_line,
					@error_severity error_severity,
					@error_message error_message
				
		end -- reporte de status
		
	end -- procedimiento

