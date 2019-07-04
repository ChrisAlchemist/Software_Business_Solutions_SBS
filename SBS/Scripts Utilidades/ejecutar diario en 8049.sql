use hape
go

exec SP_UNE_ENVIAR_CORREOS
go

--USE msdb;
--GO

--EXEC dbo.sp_add_operator @name = N'cristian',
--	@enabled = 1,
--	@email_address = N'cristian.perez.garcia.54@gmail.com';
--GO

exec SP_CALLCENTER_OBTENER_CUESTIONARIO 837648