USE SBS
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

Autor			Cristian Pérez García
Fecha			20200103
Objetivo		Obtener los miembros del equipo que conforman a SBS
Proyecto		SBS Software BussinesSolutions

*/

if exists (select * from sysobjects where name like 'SP_SBS_OBTENER_EQUIPO_MIEMBROS' and xtype = 'p')
	drop proc SP_SBS_OBTENER_EQUIPO_MIEMBROS
go

create proc

	[dbo].[SP_SBS_OBTENER_EQUIPO_MIEMBROS]
	
		-- parametros		
		--num_usuario, 
		--usuario, 		
		
as

	begin -- procedimiento
		
		begin try -- try principal
		
			begin -- inicio

				-- declaraciones
				declare @estatus int = 200,
						@error_message varchar(255) = '',
						@error_line varchar(255) = '',
						@error_severity varchar(255) = '',
						@error_procedure varchar(255) = ''
						
					
			end -- inicio
			
			
			
			begin -- ámbito de la actualización
				if exists 
				(
					SELECT TOP 1 1 FROM TBL_SBS_EQUIPO_MIEMBROS
				)
				BEGIN
					SELECT 
						ID_MIEMBRO,
						coalesce(NOMBRE,'')+' '
						+coalesce(APELLIDO_P,'')+' '
						+coalesce(APELLIDO_M,'') NOMBRE_COMPLETO,
						PUESTO,
						PATH_IMAGEN_MIENBRO,
						MAIL,
						TEL_CELULAR,
						CUENTA_YOUTUBE,
						CUENTA_FACEBOOK,
						CUENTA_LINKEDIN
					FROM
						TBL_SBS_EQUIPO_MIEMBROS


					SELECT @estatus = 200;
				END
				ELSE
				BEGIN 
					SELECT @estatus = -1;
					SELECT @error_message = 'No existe ningun miembro'
				END
			
			end -- ámbito de la actualización

		end try -- try principal
		
		begin catch -- catch principal
		
			-- captura del error
			select	@estatus = -error_state(),
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
		
		begin -- reporte de estatus
			if @error_message<>''
			begin
				select	
					@estatus estatus,
					@error_procedure error_procedure,
					@error_line error_line,
					@error_severity error_severity,
					@error_message error_message
			
			end
				
		end -- reporte de estatus
		
	end -- procedimiento
	go

	grant exec on SP_SBS_OBTENER_EQUIPO_MIEMBROS to public
	go