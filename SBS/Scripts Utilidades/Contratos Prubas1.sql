--select * from claves where numusuario =5450

use BANCA
go

select * from banca..tbl_banca_socios where numero_socio =837648
--delete from banca..tbl_banca_socios where numero_socio = 837648
select * from banca..TBL_BANCA_CONTRATOS_BANCA where numero=837648
select * from hape..tbl_contratos_haberes where numero =837648 and id_tipo_contrato = 3
--delete from hape..tbl_contratos_haberes where numero = 837648 and id_tipo_contrato = 3


--update TBL_BANCA_SOCIOS set id_estatus_banca = 6, banca_activa = 1 where numero_socio=837648;


exec SP_BANCA_MODIFICAR_MEDIO_NOTIFICACION 837648, 2, 5450, 1

