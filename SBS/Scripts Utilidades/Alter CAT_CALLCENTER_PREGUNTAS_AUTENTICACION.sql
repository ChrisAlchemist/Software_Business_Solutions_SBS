use BANCA
go


--select *from banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
--select *from banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION where descripcion_pregunta like '%banca electr�nica%'

update 
	banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
	set 
		descripcion_pregunta = '�Cu�ndo fue su �ltimo ingreso a CMV Finanzas?' 
	where 
		id_pregunta = 7
go

update 
	banca..CAT_CALLCENTER_PREGUNTAS_AUTENTICACION 
	set 
		descripcion_pregunta = '�Cu�ndo fue su �ltimo movimiento en CMV Finanzas?' 
	where 
		id_pregunta = 13
go

