use HAPE
go

delete from TBL_CEDICOOP_PERSONAS

DBCC CHECKIDENT (TBL_CEDICOOP_PERSONAS, RESEED, 0)
go

insert into TBL_CEDICOOP_PERSONAS (codigo,nombre,apellidos,fecha_alta,correo,telefono,ocupado, numero)
values 
(
	'a554ae58e62950b9',
	'Maritza',
	'Espinoza Hernández ',
	GETDATE(),
	'cristian.perez.garcia.54@gmail.com',
	'11111',
	0,
	null
)

--insert into TBL_CEDICOOP_PERSONAS (codigo,nombre,apellidos,fecha_alta,correo,telefono,ocupado, numero)
--values 
--(
--	'cb47504af0',
--	'Prueba',
--	'Piloto Cmv',
--	GETDATE(),
--	'fernando.arellano@cedicoop.coop',
--	'22222',
--	0,
--	null
--)


select * from TBL_CEDICOOP_PERSONAS
go