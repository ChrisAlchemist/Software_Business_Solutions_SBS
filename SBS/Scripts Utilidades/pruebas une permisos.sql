select * from HAPE..TIPOS_DE_OPERACIONES


select * from HAPE..TBL_CORRESPONSALIAS_CUENTAS where NUMERO =202840 

select Id_mov,Num_ptmo,* from HAPE..EDO_DE_CUENTA
where
Numero = 820395
and Id_Tipo_persona =1


--delete HAPE..TBL_CORRESPONSALIAS_CUENTAS where NUMERO =820395 and ID_MOV in (3,6)

--select * from BANCA..TBL_BANCA_CUENTAS_INTERBANCARIAS where numero_socio = 202840-- and id_mov = 3


--insert into BANCA..TBL_BANCA_CUENTAS_INTERBANCARIAS (numero,)

--update HAPE..TBL_UNE_PERMISOS_ADMIN set USUARIO_CALL_CENTER =1 where ID_ROL = 219
update HAPE..TBL_UNE_PERMISOS_ADMIN set USUARIO_CALL_CENTER =1, PERMISO_REGISTRAR =1 where ID_ROL = 219
select * from HAPE..TBL_UNE_PERMISOS_ADMIN where ID_ROL = 219


--select Id_Rol,* from HAPE..CLAVES where Numusuario_Jefe =171 -- Id_Rol = 219 --Usuario = 'ATM_JEF '
