--select * from banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION


declare
	@numero_socio int = 837648, --345064
	@id_persona_socio int
	set @id_persona_socio = 
			(
				select 
					id_persona 
				from 
					hape..PERSONA 
				where 
					Numero = @numero_socio and Id_Tipo_Persona = 1
			)
	

create table #preguntas(
	id_pregunta	bigint,
	descripcion_pregunta varchar(300)
)

create table #respuestas(
	respuesta varchar(2000),
	correcta bit,
	id_pregunta bigint
)

declare               
	@contador_de_preguntas int = 0,
	@id_pregunta int

while @contador_de_preguntas < 3
begin
	
	SELECT TOP 1 @id_pregunta = id_pregunta FROM BANCA..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
	where id_pregunta in (12,24,23) --pruebas para seleccionar q preguntas queremos generar
	ORDER BY NEWID()

	if not exists( select * from #preguntas where id_pregunta = @id_pregunta)
	begin
		--===========================	inserción a la tabla de #preguntas	===========================
		insert into #preguntas (id_pregunta,descripcion_pregunta)
		select 
			id_pregunta,descripcion_pregunta 
		from BANCA..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION  
		where 
			id_pregunta = @id_pregunta

		---1 ¿Cuál es su nombre completo?
		if(@id_pregunta = 1)
		begin
			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 coalesce(nombre_s,'')+' '
				+coalesce(apellido_paterno,'')+' '
				+coalesce(apellido_materno,'') nombre_completo,
				0,@id_pregunta
			FROM hape..persona 
			where
				Numero <> @numero_socio 
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT coalesce(nombre_s,'')+' '
				+coalesce(apellido_paterno,'')+' '
				+coalesce(apellido_materno,'') nombre_completo,
				1,@id_pregunta
			FROM hape..persona  
			WHERE
				Numero = @numero_socio
				and Id_Tipo_Persona = 1
		end

		---2 ¿A qué sucursal pertenece?
		if(@id_pregunta = 2)
		begin

			declare @id_de_sucursal int
			
			select @id_de_sucursal = Id_de_Sucursal from HAPE..PERSONA where Numero = @numero_socio and Id_Tipo_Persona=1

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 Descripcion,
				0,@id_pregunta
			FROM hape..SUCURSALES  
			WHERE
				Id_de_Sucursal <> @id_de_sucursal
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT Descripcion,
				1,@id_pregunta
			FROM hape..SUCURSALES  
			WHERE
				Id_de_Sucursal = @id_de_sucursal
		end

		--3	¿Cuál es su número de teléfono celular?
		if(@id_pregunta = 3)
		begin

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 isnull(Tel_Celular,'4432342134'),
				0,@id_pregunta
			FROM hape..persona 
			where
				Numero <> @numero_socio 
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT Tel_Celular,
				1,@id_pregunta
			FROM hape..persona  
			WHERE
				Numero = @numero_socio
				and Id_Tipo_Persona = 1
		end

		--4	¿Cuál es su dirección? (calle y número, colonia, población, código postal)
		if(@id_pregunta = 4)
		begin

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				coalesce(persona.Calle,'')+' '+coalesce(persona.Numero_Exterior,'')
				+' '+ coalesce(municipio.Nombre_Colonia,'')+', '+ coalesce(municipio.CNBV_Municipio,'')
				+', CP: '+ convert(varchar,municipio.Codigo_Postal) domicilio,
				0,@id_pregunta
			FROM hape..persona persona
			inner join
				HAPE..CNBV_MNPIO_COL municipio on persona.Id_Colonia_CNBV = municipio.Id_Colonia_CNBV
			where
				Numero <> @numero_socio 
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT coalesce(persona.Calle,'')+' '+coalesce(persona.Numero_Exterior,'')
				+' '+ coalesce(municipio.Nombre_Colonia,'')+', '+ coalesce(municipio.CNBV_Municipio,'')
				+', CP: '+ convert(varchar,municipio.Codigo_Postal) domicilio,
				1,@id_pregunta
			FROM hape..persona persona
			inner join
				HAPE..CNBV_MNPIO_COL municipio on persona.Id_Colonia_CNBV = municipio.Id_Colonia_CNBV
			WHERE
				Numero = @numero_socio
				and Id_Tipo_Persona = 1
		end

		--5	¿Entre que calles vive?
		if(@id_pregunta = 5)
		begin

		insert into #respuestas (respuesta,correcta,id_pregunta)
			select 
				Entre_que_calles, 1,@id_pregunta
			from 
				hape..TEXTOS 
			where 
				Id_persona=@id_persona_socio
			and 
				Entre_que_calles<>''
			---------------------------------
		insert into #respuestas (respuesta,correcta,id_pregunta)
			
			select top 2 
				Entre_que_calles, 0,@id_pregunta
			from 
				hape..TEXTOS 
			where 
				Id_persona<>@id_persona_socio 
			and 
				Entre_que_calles<>''
			order by NEWID()
			--print ''
		end

		--6 ¿Cuál es el tiempo de residencia en su domicilio?
		if(@id_pregunta = 6)
		begin

		declare @tiempo_arraigo int = 
		(
			select 
				datediff(YEAR,Arraigo,GETDATE()) 
				from 
					HAPE..PERSONA 
				where 
					numero =@numero_socio 
					and Id_Tipo_Persona = 1
		)

			insert into #respuestas(respuesta, correcta, id_pregunta)
			select @tiempo_arraigo,1,@id_pregunta;
			
		
			---RESPUESTAS INCORRECTA----
			WITH arraigos_incorrectos AS (
					SELECT arraigo = 1
					UNION ALL
					SELECT arraigo + 1 FROM arraigos_incorrectos WHERE arraigo < 100 
				)
			insert into #respuestas(respuesta, correcta,id_pregunta)
			SELECT top 2 arraigo, 0,@id_pregunta FROM arraigos_incorrectos 
				where
					arraigo not in (@tiempo_arraigo)
					order by NEWID()
		end

		--7 ¿Cuándo fue su último ingreso a banca electrónica?
		if(@id_pregunta = 7)
		begin
			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				convert(varchar,coalesce(FORMAT(socio.fecha_ultima_sesion,'dd/MM/yyyy'),'N/A')),
				0,@id_pregunta
			FROM banca..TBL_BANCA_SOCIOS socio
			where
				numero_socio <> @numero_socio 
				and fecha_ultima_sesion is not null
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT 
				convert(varchar,coalesce(FORMAT(socio.fecha_ultima_sesion,'dd/MM/yyyy'),'N/A')),
				1,@id_pregunta
			FROM banca..TBL_BANCA_SOCIOS socio
			where
				numero_socio = @numero_socio 

		end

		--8 ¿Cuál es su dirección de correo electrónico?
		if(@id_pregunta = 8)
		begin
			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				persona.Mail,
				0,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero <> @numero_socio 
				and Mail is not null and Mail <> '' and Mail like '%@%'
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT 
				persona.Mail,
				1,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero = @numero_socio 
		end

		--9 ¿Cuál es su fecha de nacimiento?
		if(@id_pregunta = 9)
		begin

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				coalesce(PERSONA.Fecha_de_nacimiento,'N/A'),
				0,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero <> @numero_socio 
				and Fecha_de_nacimiento is not null
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT 
				coalesce(PERSONA.Fecha_de_nacimiento,'N/A'),
				1,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero = @numero_socio 
				and Id_Tipo_Persona = 1

			update #respuestas set respuesta =FORMAT(convert(datetime,respuesta) ,'dd/MM/yyyy')
			where
				id_pregunta = @id_pregunta
		end

		--10 ¿Cuál es su edad?
		if(@id_pregunta = 10)
		begin
			--datediff(YEAR,@fecha_nacimiento,@fecha_hoy)
			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				datediff(YEAR,persona.Fecha_de_nacimiento,GETDATE()),
				0,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero <> @numero_socio 
				and Fecha_de_nacimiento is not null
			ORDER BY NEWID()

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT 
				datediff(YEAR,persona.Fecha_de_nacimiento,GETDATE()),
				1,@id_pregunta
			FROM HAPE..PERSONA persona
			where
				numero = @numero_socio 
		end

		--11 ¿Cuál es su nacionalidad?
		if(@id_pregunta = 11)
		begin
			declare 
				@id_nacionalidad int,
				@nacionalidad varchar(30)

			select @nacionalidad = nacionalidad.DESCRIPCION, @id_nacionalidad = nacionalidad.ID_NACIONALIDAD from hape..PERSONA persona
			inner join 
				HAPE..TEXTOS textos on persona.Id_Persona =  textos.Id_persona
			inner join
				HAPE..NACIONALIDAD nacionalidad on textos.Id_Nacionalidad =  nacionalidad.Id_Nacionalidad
			where
				persona.Numero = @numero_socio
				and persona.Id_Tipo_Persona = 1

			insert into #respuestas (respuesta,correcta,id_pregunta)
			SELECT TOP 2 
				DESCRIPCION,0,@id_pregunta 
				from hape..NACIONALIDAD
				where
					ID_NACIONALIDAD <> @id_nacionalidad
				order by NEWID()
				
				
			insert into #respuestas (respuesta,correcta,id_pregunta)
			values(	@nacionalidad,1,@id_pregunta)

		end
		
		--12 ¿en que ciudad nacio?
		if(@id_pregunta = 12)
		begin
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

				---RESPUESTAS INCORRECTAS---
				insert into #respuestas (respuesta,correcta,id_pregunta)
				select 
				top 2 (coalesce( estado.descripcion,'')+', ' + coalesce (pais.descripcion,'') + ' '),0, @id_pregunta   
				from  
					hape..CAT_PAISES pais 
				join 
					HAPE..ENTIDAD_FEDERATIVA estado on estado.Id_Pais = pais.Id_Pais
				where 
					estado.ID_ENTIDAD_FEDERATIVA <> @estado_nacimiento 
				and 
					estado.DESCRIPCION <> 'NINGUNO' and estado.DESCRIPCION is not null and pais.Descripcion is not null
				order by NEWID()

				---RESPUESTA CORRECTA----
				insert into #respuestas (respuesta,correcta,id_pregunta)
				select @lugar_nacimiento_socio,1,@id_pregunta
		end
		
		--13 ¿Ha realizado algún movimiento en su banca electrónica en el último mes? En caso afirmativo: ¿Cuál? (Deposito o retiro)
		if(@id_pregunta = 13)
		begin
			-----VARIABLES NECESARIAS----------
			declare @movimiento_socio int

			set @movimiento_socio = 
			(
			select top 1 b.id_tipo_bitacora
				from BANCA..TBL_BANCA_BITACORA_OPERACIONES a
						inner join BANCA..CAT_BANCA_TIPOS_BITACORA b on a.id_tipo_bitacora = b.id_tipo_bitacora
						where
							a.id_tipo_bitacora in (15,16,19,20,50)
							and numero_socio = @numero_socio
							order by id_bitacora desc
			)

			--------------------------RESPUESTAS INCORRECTAS----------------------------
			if not exists (select * from BANCA..TBL_BANCA_BITACORA_OPERACIONES where numero_socio = @numero_socio and id_tipo_bitacora in (15,16,19,20,50))
			begin
				insert into #respuestas (respuesta,correcta,id_pregunta)
				select top 2 (convert(varchar,FORMAT(a.fecha_alta ,'dd/MM/yyyy'))+',  '+coalesce(b.descripcion,'')) +' ',0,@id_pregunta 
				from BANCA..TBL_BANCA_BITACORA_OPERACIONES a
					inner join BANCA..CAT_BANCA_TIPOS_BITACORA b on a.id_tipo_bitacora = b.id_tipo_bitacora
					where
						 b.id_tipo_bitacora in (15,16,19,20,50) and numero_socio <> @numero_socio
				ORDER BY NEWID()
			end
			else
			begin
				insert into #respuestas (respuesta,correcta,id_pregunta)
					select top 2 (convert(varchar,FORMAT(a.fecha_alta ,'dd/MM/yyyy'))+',  '+coalesce(b.descripcion,'')) +' ',0,@id_pregunta 
					from BANCA..TBL_BANCA_BITACORA_OPERACIONES a
						inner join BANCA..CAT_BANCA_TIPOS_BITACORA b on a.id_tipo_bitacora = b.id_tipo_bitacora
					where
						numero_socio <> @numero_socio and (b.id_tipo_bitacora<> @movimiento_socio and b.id_tipo_bitacora in (15,16,19,20,50))
					ORDER BY NEWID()
			end
			--------------------------RESPUESTA CORRECTAS-------------------------------
			

				if  not exists (select * from BANCA..TBL_BANCA_BITACORA_OPERACIONES where numero_socio = 837648 and id_tipo_bitacora in (15,16,19,20,50))
				begin
					insert into #respuestas (respuesta,correcta,id_pregunta)
					select 'Ninguna',1,@id_pregunta
				end
				else 
				begin
				insert into #respuestas (respuesta,correcta,id_pregunta)
				select top 1 (convert(varchar,FORMAT(a.fecha_alta ,'dd/MM/yyyy'))+',  '+coalesce(b.descripcion,'')) +' ',1,@id_pregunta 
				from BANCA..TBL_BANCA_BITACORA_OPERACIONES a
						inner join BANCA..CAT_BANCA_TIPOS_BITACORA b on a.id_tipo_bitacora = b.id_tipo_bitacora
						where
							a.id_tipo_bitacora in (15,16,19,20,50)
							and numero_socio = @numero_socio
							order by id_bitacora desc
				end
		end

		--14 ¿Cuál es su profesión u ocupación?
		if(@id_pregunta = 14)
		begin

			declare @id_profesion_socio varchar
			
			select @id_profesion_socio = profesion.Id_Profesion 
			from HAPE..PERSONA persona 
				inner join hape..PROFESION profesion on persona.Id_profesion = profesion.Id_Profesion
			where 
				persona.numero =@numero_socio
				and Id_Tipo_Persona =1
			
			-------RESPUESTA CORRECTA-----------------------------
			insert into #respuestas(respuesta,correcta,id_pregunta)
			select Descripcion,1,@id_pregunta
			from HAPE..PROFESION 
			where  id_profesion=@id_profesion_socio
			
			--------REPUESTAS INCORRECTAS---------
			insert into #respuestas(respuesta,correcta,id_pregunta)
			
			select top 2 
				descripcion,0, @id_pregunta
			from hape..PROFESION 
				where Id_Profesion<> @id_profesion_socio
			order by NEWID()
			--------------------------------------
		end

		--15 ¿Cuál es su escolaridad?
		if(@id_pregunta = 15)
		begin
			
			declare @id_escolaridad_socio varchar
			
			select @id_escolaridad_socio = escolaridad.Id_Escolaridad 
			from HAPE..PERSONA persona 
				inner join hape..ESCOLARIDAD escolaridad on persona.Id_Escolaridad = escolaridad.Id_Escolaridad
			where 
				persona.numero =@numero_socio
				and Id_Tipo_Persona =1
			
			-------RESPUESTA CORRECTA-----------------------------
			insert into #respuestas(respuesta,correcta,id_pregunta)
			select Descripcion,1,@id_pregunta
			from HAPE..ESCOLARIDAD 
			where  Id_Escolaridad=@id_escolaridad_socio
			
			--------REPUESTAS INCORRECTAS---------
			insert into #respuestas(respuesta,correcta,id_pregunta)
			
			select top 2 
				descripcion,0, @id_pregunta
			from hape..ESCOLARIDAD 
				where Id_Escolaridad<> @id_escolaridad_socio
			order by NEWID()
			
		end

		--16 ¿Cuál es su estado civil?
		if(@id_pregunta = 16)
		begin
			declare @id_edo_civil_socio varchar
			
			select @id_edo_civil_socio = edo_civil.Id_edo_civil 
			from HAPE..PERSONA persona 
				inner join hape..ESTADO_CIVIL edo_civil on persona.Id_edo_civil = edo_civil.Id_edo_civil
			where 
				persona.numero =@numero_socio
				and Id_Tipo_Persona =1			

			insert into #respuestas(respuesta,correcta,id_pregunta)
			-------RESPUESTA CORRECTA-----------------------------
			select Descripcion,1,@id_pregunta
			from HAPE..ESTADO_CIVIL 
			where  Id_edo_civil=@id_edo_civil_socio
			
			--------REPUESTAS INCORRECTAS---------
			insert into #respuestas(respuesta,correcta,id_pregunta)			
			select top 2 
				descripcion,0, @id_pregunta
			from hape..ESTADO_CIVIL 
				where Id_edo_civil<> @id_edo_civil_socio
			order by NEWID()
			
		end

		--17 ¿Tiene algún crédito vigente con CMV, cuál?
		if(@id_pregunta = 17)
		begin

			-------RESPUESTA CORRECTA-----------------------------
			insert into #respuestas(respuesta,correcta,id_pregunta)			
			select ISNULL(STUFF ((
				SELECT ', ' + tipo_operaciones.Desc_prestamo from
				--select a.Saldo_Actual,a.Numero,a.Id_mov,b.Desc_prestamo,* from 
					hape..EDO_DE_CUENTA edo_cuenta 
				inner join
					hape..TIPOS_DE_OPERACIONES tipo_operaciones on edo_cuenta.Id_mov = tipo_operaciones.Id_mov
				where
				Numero = @numero_socio
				and Id_Tipo_persona = 1
				and edo_cuenta.Id_mov < 10
				and edo_cuenta.Saldo_Actual > 0
				and edo_cuenta.Num_ptmo <> '' and edo_cuenta.Num_ptmo is not null
				FOR XML PATH ('')), 1, 1, '' ),'No cuenta con creditos actualmente.'),1,@id_pregunta

			-------RESPUESTA INCORRECTA-----------------------------
			insert into #respuestas(respuesta,correcta,id_pregunta)			
			select TOP 2 Desc_prestamo,0,@id_pregunta from 
					hape..TIPOS_DE_OPERACIONES tipo_operaciones 
			WHERE
				Id_mov not in (
					select Id_mov from hape..EDO_DE_CUENTA edo_cuenta 
					where
					Numero = @numero_socio
					and Id_Tipo_persona = 1
					and edo_cuenta.Id_mov < 10
					and edo_cuenta.Saldo_Actual > 0
					and edo_cuenta.Num_ptmo <> '' and edo_cuenta.Num_ptmo is not null
				)
				and Id_mov <100
			order by NEWID()
		end

		--18 ¿Cuántos beneficiarios de cuenta tiene?
		if(@id_pregunta = 18)
		begin
			declare @numero_beneficiarios_socio int 
			set @numero_beneficiarios_socio = 
			(
				select count(b.id_persona) 
				from hape..PERSONA a 
				inner join hape..REFERENCIAS b on a.Id_Persona = b.Id_Persona 
				where a.numero = @numero_socio  and a.Id_Tipo_Persona = 1 and  Id_de_Referencia in (1,7,8,9)
			)

			----RESPUESTA CORRECTA------
			insert into #respuestas(respuesta,correcta,id_pregunta)
			VALUES(@numero_beneficiarios_socio, 1, @id_pregunta);
			
			---RESPUESTAS INCORRECTA----
			WITH beneficiarios_incorrectos AS (
					SELECT beneficiario = 1
					UNION ALL
					SELECT beneficiario + 1 FROM beneficiarios_incorrectos WHERE beneficiario < 10 
				)
			insert into #respuestas(respuesta, correcta,id_pregunta)
			SELECT top 2 beneficiario, 0,@id_pregunta FROM beneficiarios_incorrectos 
				where
					beneficiario not in (@numero_beneficiarios_socio)
					order by NEWID()
		end

		--19 ¿Qué parentesco tiene con su beneficiario principal?
		if(@id_pregunta = 19)
		begin
			-------RESPUESTAS CORRECTAS----
			insert into #respuestas(respuesta,correcta,id_pregunta)
				select 
					top 1
					( 
						coalesce(b.Nombre_Referencia,'Sin Beneficiario') + ' '
						+ coalesce(b.Apellido_Paterno_Referencia,'') + ' ' 
						+ coalesce(b.Apellido_Materno_Referencia,'') + ' ' 
						+'- Parentesco: ' + coalesce(Parentesco,'') 
					), 1,@id_pregunta
				from 
					hape..PERSONA a 
				inner join 
					HAPE..REFERENCIAS b on a.Id_Persona = b.Id_Persona 
				where 
					a.numero = @numero_socio  
					and a.Id_Tipo_Persona = 1 
					and  Id_de_Referencia in (1,7,8,9) 
				order by Porcentaje desc

			----RESPUESTAS INCORRECTAS---
			insert into #respuestas(respuesta,correcta,id_pregunta)
				select 
					top 2
					( 
						b.Nombre_Referencia + ' '
						+ coalesce(b.Apellido_Paterno_Referencia,'') + ' ' 
						+ coalesce(b.Apellido_Materno_Referencia,'') + ' ' 
						+'- Parentesco: ' + coalesce(Parentesco,' Sin información')
					),0, @id_pregunta 
				from 
					hape..PERSONA a 
				inner join 
					REFERENCIAS b on a.Id_Persona = b.Id_Persona 
				where 
					a.numero <> @numero_socio  
					and a.Id_Tipo_Persona = 1 
					and  Id_de_Referencia in (1,7,8,9) 
					and b.Nombre_Referencia <> ''
				order by NEWID()
		end

		--20 ¿Cuántos dependientes económicos tiene?
		if(@id_pregunta = 20)
		begin

			declare @dependientes_economicos_socio int 
			set @dependientes_economicos_socio = 
			(
				select top 1 Dependientes_economicos 
				from hape..persona 
				where numero = @numero_socio and Id_Tipo_Persona =1
			);

			--------RESPUESTA CORRECTA---------
			if @dependientes_economicos_socio = null
			begin
				set @dependientes_economicos_socio =0
			end

			insert into #respuestas(respuesta,correcta,id_pregunta)
			select @dependientes_economicos_socio,1,@id_pregunta;

			---RESPUESTAS INCORRECTA-----------
			WITH dependientes_incorrectos AS (
					SELECT dependientes_incorrectos = 1
					UNION ALL
					SELECT dependientes_incorrectos + 1 FROM dependientes_incorrectos WHERE dependientes_incorrectos < 20 
				)

			insert into #respuestas(respuesta,correcta,id_pregunta)
			SELECT 
			top 
					2 dependientes_incorrectos,0,@id_pregunta 
			FROM dependientes_incorrectos 
			where
				dependientes_incorrectos not in (@dependientes_economicos_socio)
			order by NEWID()
						
		end

		--21 ¿Tiene residencia en otro país?
		if(@id_pregunta = 21)
		begin
			------RESPUESTA CORRECTA-----
			declare @residencia_extranjero_socio varchar =
				(
				select textos.Reside_Extranjero 
					from 
						hape..PERSONA persona
					inner join
						HAPE..TEXTOS textos 
					on persona.Id_persona = textos.Id_persona
					where persona.Numero = @numero_socio
				)

			if @residencia_extranjero_socio ='F'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'No',1,@id_pregunta
			end

			else if @residencia_extranjero_socio ='T'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'Si',1,@id_pregunta
			end

			------RESPUESTAS INCORRECTAS-----
			declare @recidencia_incorrecta varchar 
			set @recidencia_incorrecta =
			(
				select top 1 Reside_Extranjero from hape..TEXTOS where Reside_Extranjero not in(@residencia_extranjero_socio)
			)

			if @recidencia_incorrecta ='F'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'No', 0, @id_pregunta
					
			end

			else if @recidencia_incorrecta ='T'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'Si',0,@id_pregunta

			end

		end

		--22 ¿Ha cumplido con funciones públicas destacadas?
		if(@id_pregunta = 22)
		begin
			 
			declare @estatus_peps_socio varchar = 
			(
				select 
					PEPS 
				from 
					hape..persona p
				join 
					hape..textos tx on p.id_persona=tx.Id_persona
				where 
					p.Id_persona=@id_persona_socio
			)

			-----------RESPUESTA CORRECTA-----------------
			if @estatus_peps_socio ='F'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',1,@id_pregunta

				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',0,@id_pregunta
			end

			else if @estatus_peps_socio ='T'
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',1,@id_pregunta

				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',0,@id_pregunta
			end

			---------RESPUESTAS INCORRECTAS------------------------
			

		end

		--23 ¿Algún familiar a cumplido con funciones públicas destacadas?
		if(@id_pregunta = 23)
		begin
			
			declare @id_peps_referencia int = 
			(
				select top 1 
					Id_PEPS 
				from 
					hape..REFERENCIAS 
				where 
					Id_Persona = @id_persona_socio
			) 
			----------------RESPUESTA CORRECTA----------------
			if @id_peps_referencia>0 or @id_peps_referencia is not null
			begin
			insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',1,@id_pregunta
			end
					
			else
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',1,@id_pregunta
			end

			----------RESPUESTAS INCORRECTAS-----------------
			declare @estatus_incorrecto_familiar int 
			set @estatus_incorrecto_familiar =
			(
				select top 1 Id_PEPS from hape..TEXTOS where Id_PEPS not in(@id_peps_referencia)
			)

			if @estatus_incorrecto_familiar = 0 or @estatus_incorrecto_familiar is null
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',0,@id_pregunta

			end

			else
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO', 0, @id_pregunta
				
			end
		end 

		--24 ¿Los recursos de su cuenta son de su propiedad?
		if(@id_pregunta = 24)
		begin
			if EXISTS (select Id_de_Referencia from HAPE..REFERENCIAS where Id_Persona = @id_persona_socio and Id_de_Referencia  in(16)) 
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',1,@id_pregunta
				--INCORRECTA
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',0,@id_pregunta
			end
			else
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',1,@id_pregunta
				insert into #respuestas(respuesta,correcta,id_pregunta)
				--INCORRECTA
				select 'SI',0,@id_pregunta
			end
		end 
		--25 ¿Los recursos provienen de un tercero?
		if(@id_pregunta = 25)
		begin
			if EXISTS (select Id_de_Referencia from HAPE..REFERENCIAS where Id_Persona = @id_persona_socio and Id_de_Referencia not in(16)) 
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'SI',1,@id_pregunta
				--INCORRECTA
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',0,@id_pregunta
			end
			else
			begin
				insert into #respuestas(respuesta,correcta,id_pregunta)
				select 'NO',1,@id_pregunta
				insert into #respuestas(respuesta,correcta,id_pregunta)
				--INCORRECTA
				select 'SI',0,@id_pregunta
			end
		end 

		---PASAMOS A LA SIGUIENTE PREGUNTA
		set @contador_de_preguntas = @contador_de_preguntas + 1
	end
end

select * from #preguntas
select * from #respuestas order by NEWID()

drop table #preguntas
drop table #respuestas

