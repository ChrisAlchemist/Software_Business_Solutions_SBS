use hape
go

exec SP_BANCA_OBTIENE_SOCIO 837648, 5450

--update hape..TBL_CONTRATOS_HABERES set monto_actualizado =0 where numero = 837648 and id_tipo_contrato = 3
select * from HAPE..TBL_CONTRATOS_HABERES where numero = 837648 and id_tipo_contrato = 3

exec SP_BANCA_ACTUALIZAR_MONTO_BANDERA 837648, 0, 3

--update TBL_CONTRATOS_HABERES set monto_actualizado = null where numero = 837648 and id_tipo_contrato not in(3)
