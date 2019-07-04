use HAPE
go
select * from claves where Numusuario in (519,547,116,518)

select * from TBL_UNE_PERMISOS_ADMIN where USUARIO_CALL_CENTER =1

select mail,Tel_Celular,* from HAPE..persona where NUMERO = 837648 and id_tipo_persona = 1

update 
	HAPE..persona 
	set 
		Mail ='cristian.perez.garcia.54@gmail.com', 
		Tel_Celular = '7861021588' 
	where 
		NUMERO = 837648 
	and 
		id_tipo_persona = 1
