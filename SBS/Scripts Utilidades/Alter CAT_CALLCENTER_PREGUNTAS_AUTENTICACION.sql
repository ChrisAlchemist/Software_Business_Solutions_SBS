use BANCA
go


--select *from banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
--select *from banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION where descripcion_pregunta like '%banca electrónica%'

update 
	banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
	set 
		descripcion_pregunta = '¿Cuándo fue su último ingreso a CMV Finanzas?' 
	where 
		id_pregunta = 7
go

update 
	banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
	set 
		descripcion_pregunta = '¿Cuándo fue su último movimiento en CMV Finanzas?' 
	where 
		id_pregunta = 13
go

