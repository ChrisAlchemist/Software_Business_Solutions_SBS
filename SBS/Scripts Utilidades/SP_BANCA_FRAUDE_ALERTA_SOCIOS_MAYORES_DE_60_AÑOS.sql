use BANCA
go

-- se crea procedimiento SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60
if exists (select * from sysobjects where name like 'SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60' and xtype = 'p' and db_name() = 'Banca')
	drop proc SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60
go

/*

Autor			Luis Arturo G�lvez Macias
UsuarioRed		GAML841262
Fecha			2019 02 13
Objetivo		Obtener los socios que son mayores a  60 a�os cumplidos al dia que se ejecute el procedimiento almacenado
Proyecto		BancaFraude	
Ticket			ticket

*/

create proc	SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60
		-- par�metros
		-- [aqu� van los par�metros]
		 @diahoy datetime
as

	begin -- procedimiento
		
		begin try -- try principal
		
			begin -- inicio
			
				-- declaraciones
				declare	@status int = 1,
						@error_message varchar(255) = '',
						@error_line varchar(255) = '',
						@error_severity varchar(255) = '',
						@error_procedure varchar(255) = ''
						
				declare	@tran_name varchar(32) = 'SP_BANCAFRAUDE_ALERTASOCIOMAYOR60',
						@tran_count int = @@trancount,
						@tran_scope bit = 0
						
				
						
				-- valores por defecto
				print '[aqu� van las asignaciones por defecto de los par�metros opcionales que sean necesarias]'
			
			end -- inicio
			
			begin -- validaciones
			
				print '[aqu� se realizan las validaciones]'

				-- -- se realiza la validaci�n 1 = 0
				-- if 1 = 0
				-- 	raiserror('1 igual a 0', 11, 0)
				
			end -- validaciones

			begin -- preparaci�n
			
			DELETE FROM TBL_BANCAFRAUDE_SOCIOSMAYORESA60
			
			end -- preparaci�n
			
			begin -- transacci�n

				begin -- inicio

					if @tran_count = 0
						begin tran @tran_name
					else
						save tran @tran_name
				
					select @tran_scope = 1
				
				end -- inicio
				
				begin -- componente de la transacci�n
				
				insert into TBL_BANCA_FRAUDE_ALERTA (Fecha_alerta,NUMERO_SOCIO,ID_TIPO_ALERTA,ID_ALERTA_RECURRENTE,ID_ESTATUS)
				select GETDATE(),Numero,5,0,1
				from hape.dbo.PERSONA 
				where Id_Tipo_Persona=1 and Numero not in ( select socioutilitario
				from hape.dbo.SUCURSALES) and (HAPE.dbo.fn_anios_cumplidos(Fecha_de_nacimiento, @diahoy))  >= 60   and Numero not in (10)
 
				
				end -- componente de la transacci�n
				
				begin -- commit
				
					if @tran_count = 0
					
						begin -- si la transacci�n se inici� dentro de este �mbito
						
							commit tran @tran_name
							select @tran_scope = 0
						
						end -- si la transacci�n se inici� dentro de este �mbito
				
				end -- commit
			
			end
		
		end try -- try principal
		
		begin catch -- catch principal
		
			-- captura del error
			select	@status = -error_state(),
					@error_procedure = coalesce(error_procedure(), 'CONSULTA DIN�MICA'),
					@error_line = error_line(),
					@error_message = error_message(),
					@error_severity =
						case error_severity()
							when 11 then 'Error en validaci�n'
							when 12 then 'Error en consulta'
							when 13 then 'Error en actualizaci�n'
							else 'Error general'
						end
						
			-- revertir transacci�n si es necesario
			if @tran_scope = 1
				rollback tran @tran_name
		
		end catch -- catch principal
		
		begin -- reporte de status
		
			select	@status status,
					@error_procedure error_procedure,
					@error_line error_line,
					@error_severity error_severity,
					@error_message error_message,
					*
				from  TBL_BANCA_FRAUDE_ALERTA
				
		end -- reporte de status
		
	end -- procedimiento
go

grant exec on SP_BANCA_FRAUDE_ALERTA_SOCIOS_MAYORES_DE_60 to public

