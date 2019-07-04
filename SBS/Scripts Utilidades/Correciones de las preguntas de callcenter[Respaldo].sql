use hape 
go

exec SP_CALLCENTER_OBTENER_CUESTIONARIO 715495

select * from banca..tbl_banca_socios where numero_socio = 806610 --715495

select * from persona where numero = 715495

select Tel_Celular,Mail,* from PERSONA where Numero = 806610

declare @id_profesion_socio int
			
				select 
					@id_profesion_socio = profesion.Id_Profesion 
				from 
					HAPE..PERSONA persona 
				inner join 
					hape..PROFESION profesion on persona.Id_profesion = profesion.Id_Profesion
				where 
					persona.numero =837648
				and 
					Id_Tipo_Persona =1

select @id_profesion_socio


---------------12. en que entidad federativa nacio ?-------------------------------------------------------
declare @id_persona_socio int  = 
		(
			select 
				id_persona 
			from 
				hape..PERSONA 
			where 
				Numero = 806610 and Id_Tipo_Persona = 1
		)


declare
					@estado_nacimiento int ,
					@lugar_nacimiento_socio varchar(max)

					select 
						@estado_nacimiento = estado.ID_ENTIDAD_FEDERATIVA,
						@lugar_nacimiento_socio =  (coalesce( estado.descripcion,'')+', ' + coalesce (pais.descripcion,'') + ' ')  
					from 
						HAPE..TEXTOS txt 
					inner join 
						hape..CAT_PAISES pais on pais.Id_Pais = txt.ID_PAIS_DE_NACIMIENTO  
					join 
						HAPE..ENTIDAD_FEDERATIVA estado on estado.ID_ENTIDAD_FEDERATIVA =txt.ID_ENTIDAD_FEDERATIVA_DE_NACIMIENTO 
					where 
						txt.Id_persona = @id_persona_socio
						

						select @estado_nacimiento

					

					--	select ID_ENTIDAD_FEDERATIVA_DE_NACIMIENTO, * from textos where Id_persona =1085926
----------------------------------------------

			if(@estado_nacimiento is null)

			begin

				select top 2 
						(
							coalesce( estado.descripcion,'')+', ' + 
							coalesce (pais.descripcion,'') + ' ')							   
					from  
						hape..CAT_PAISES pais 
					join 
						HAPE..ENTIDAD_FEDERATIVA estado on estado.Id_Pais = pais.Id_Pais
					where 
					
						estado.DESCRIPCION <> 'NINGUNO'
					and 
						estado.DESCRIPCION is not null and pais.Descripcion is not null
					order by NEWID()
			end
	select top 2 
						(
							coalesce( estado.descripcion,'')+', ' + 
							coalesce (pais.descripcion,'') + ' ')							   
					from  
						hape..CAT_PAISES pais 
					join 
						HAPE..ENTIDAD_FEDERATIVA estado on estado.Id_Pais = pais.Id_Pais
					where 
						estado.ID_ENTIDAD_FEDERATIVA <> @estado_nacimiento 
					and 
						estado.DESCRIPCION <> 'NINGUNO'
					and 
						estado.DESCRIPCION is not null and pais.Descripcion is not null
					order by NEWID()



	--------------7. cuando fue su ultimo ingreso a cmv finanzas ?-------------
	declare
				@fecha_secion_socio varchar(max) = 
				(
				select 
					convert(varchar,coalesce(FORMAT(socio.fecha_ultima_sesion,'dd/MM/yyyy'),'N/A')) 
				FROM 
					banca..TBL_BANCA_SOCIOS socio
				where
					numero_socio = 806610
				)
				declare @dias_dinamicos1 int, @dias_dinamicos2 int, @fecha1 datetime, @fecha2 datetime
				select @dias_dinamicos1 = ROUND(((100 - 1) * RAND() + 1), 0)
				select @dias_dinamicos2 = ROUND(((100 - 2) * RAND() + 1), 0)

				select @fecha1 = DATEADD(day,-@dias_dinamicos1,getdate())
				select @fecha2 = DATEADD(day,-@dias_dinamicos2,getdate())

				
				SELECT top 1
					convert(varchar,coalesce(FORMAT(@fecha1,'dd/MM/yyyy'),'N/A'))
					
				--where @fecha1 <> @fecha_secion_socio

				
				SELECT 
					convert(varchar,coalesce(FORMAT(@fecha2,'dd/MM/yyyy'),'N/A'))
				--where @fecha2 <> @fecha_secion_socio


			