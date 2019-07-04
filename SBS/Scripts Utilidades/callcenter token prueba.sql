use banca
go

select * from CAT_BANCA_ESTATUS_BANCA

select id_estatus_banca,* from banca..tbl_banca_socios where numero_socio = 837648
--update tbl_banca_socios set id_estatus_banca = 4, banca_activa  = 0 where numero_socio = 778174

use HAPE 
go
select id_de_sucursal,* from hape..persona where numero = 837648

select *from  hape..sucursales where id_de_sucursal = 6

select top 5 * from hape..persona where id_de_sucursal = 6 and Id_Tipo_Persona = 1 order by NEWID()

select Mail,Tel_Celular,* from HAPE..PERSONA where Numero = 778174 and Id_Tipo_Persona = 1

--update HAPE..PERSONA set Tel_Celular = '7861021588', Mail = 'cristian.perez.garcia.54@gmail.com' where Numero = 778174 and Id_Tipo_Persona =1


select * from hape..claves where Id_de_sucursal = 6 and Numusuario =287

select * from hape..CAT_UNE_CUENTAS 

 SP_BANCA_OBTENER_DATOS_SOCIO @NUMERO=N'778174'	
SP_BANCA_ACTUALIZA_ESTATUS @Numero=N'778174',@Estatus=8


