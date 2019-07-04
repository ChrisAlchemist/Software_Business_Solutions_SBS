declare
@fecha_secion_socio varchar(max) = 
(
select 
	convert(varchar,coalesce(FORMAT(socio.fecha_ultima_sesion,'dd/MM/yyyy'),'N/A')) 
FROM 
	banca..TBL_BANCA_SOCIOS socio
where
	numero_socio = 837648 
)
--declare @dias_dinamicos1 int, @dias_dinamicos2 int, @fecha1 datetime, @fecha2 datetime
--select @dias_dinamicos1 = ROUND(((100 - 1) * RAND() + 1), 0)
--select @dias_dinamicos2 = ROUND(((100 - 2) * RAND() + 1), 0)

--select @fecha1 = DATEADD(day,-@dias_dinamicos1,getdate())
--select @fecha2 = DATEADD(day,-@dias_dinamicos2,getdate())

---SI NUNCA HA ENTRADO A CMV FINANZAS----
if @fecha_secion_socio is null
begin
	---RESPUESTA CORRECTA---
		insert into #respuestas (respuesta,correcta,id_pregunta)
	SELECT TOP 1
		'Nunca ha ingresado a CMV Finanzas',
		1,@id_pregunta
					
	---RESPUESTAS INCORRECTAS---
		insert into #respuestas (respuesta,correcta,id_pregunta)
	SELECT top 1
		convert(varchar,coalesce(FORMAT(@fecha1,'dd/MM/yyyy'),'N/A')),
		0,@id_pregunta
				
	insert into #respuestas (respuesta,correcta,id_pregunta)
	SELECT TOP 1
		convert(varchar,coalesce(FORMAT(@fecha2,'dd/MM/yyyy'),'N/A')),
		0,@id_pregunta					 




declare @dias_dinamicos1 int, @dias_dinamicos2 int, @fecha1 datetime, @fecha2 datetime
select @dias_dinamicos1 = ROUND(((100 - 1) * RAND() + 1), 0)
select @dias_dinamicos2 = ROUND(((100 - 2) * RAND() + 1), 0)

select @fecha1 = DATEADD(day,-@dias_dinamicos1,getdate())
select @fecha2 = DATEADD(day,-@dias_dinamicos2,getdate())

select @fecha1
select @fecha2
select convert(varchar, FORMAT(@fecha1,'dd/MM/yyyy'))

SELECT top 1
						convert(varchar,coalesce(FORMAT(@fecha1,'dd/MM/yyyy'),'N/A')),
						0,1
					where convert(varchar,FORMAT(@fecha1,'dd/MM/yyyy')) <> 'N/A'
