exec SP_BANCA_OBTIENE_SOCIO 837648,518,1

select * from BANCA..CAT_BANCA_TIPOS_BITACORA

select * from BANCA..TBL_BANCA_BITACORA_OPERACIONES where numero_socio = 820395 

select * from TBL_CORRESPONSALIAS_CUENTAS where NUMERO = 820395

select Id_mov,* from HAPE..EDO_DE_CUENTA where Numero =820395 and Id_tipo_Persona = 1