USE [HAPE]
GO
/****** Object:  StoredProcedure [dbo].[SP_BANCA_OBTIENE_SOCIO]    Script Date: 15/01/2019 03:54:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		EDSON PEÑA
-- Create date: 2018-09-04
-- Description:	
--				
-- =============================================
ALTER PROCEDURE [dbo].[SP_BANCA_OBTIENE_SOCIO]
@numeroSocio bigInt,
@noUsuario int ,
@idTIpoPersona int  =1

AS
BEGIN

begin try
declare
@existeError bit  = 0 ,
@mensajeError varchar(500) = ''

	-- validaciones

	 if ((Select Id_de_Sucursal from PERSONA where Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona) <> (select Id_de_sucursal from hape..CLAVES where Numusuario = @noUsuario))
			select  @existeError = 1 , @mensajeError  = 'El socio no pertenece a  su sucursal.|' 

	if exists (SELECT 1 FROM HAPE..PERSONA WHERE Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona and  Bloqueado_Cobranza = 'A')
		select  @existeError = 1 , @mensajeError  = 'El socio  cuenta con bloqueo alto en cobranza.|' 

	if exists (SELECT 1 FROM HAPE..PERSONA WHERE Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona and  Bloqueado_Exclusion = 'A')
		select  @existeError = 1 , @mensajeError  = @mensajeError +'El socio  cuenta con bloqueo de exclusion.|'
				
	if exists (SELECT 1 FROM HAPE..PERSONA WHERE Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona and (Mail is null  or  Mail  =''))
			select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con correo electronico por favor actuliza la información.|'
	
	if exists (SELECT 1 FROM HAPE..PERSONA WHERE Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona and (Tel_Celular is null or  Tel_Celular  like  ''))
		select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con teléfono celular.|'


	if  not exists (SELECT 1 FROM TBL_CONTRATOS_HABERES WHERE 
					Numero = @numeroSocio 
					and Id_Tipo_Persona  =@idTIpoPersona 
					and id_tipo_contrato = 2 
	 )
	 begin
	      declare @nombre_contrato varchar(500)
		  select @nombre_contrato = tipo_contrato from CAT_CONTRATOS_HABERES_TIPO_CONTRATO where activo = 1 and id_tipo_contrato = 2
		 select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con el o los '+@nombre_contrato+' firmados.|'
	end


	if exists (SELECT 1 FROM HAPE..PERSONA WHERE Numero = @numeroSocio and Id_Tipo_Persona  =@idTIpoPersona and (Tel_Celular like '%(%' or  Tel_Celular  like  '%)%'))
		select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con teléfono celular actualizado.|'

	--if exists (select 1 from hape..PERSONA a inner join HAPE..REFERENCIAS b on a.Id_Persona = b.Id_Persona 
	--			where a.Numero = @numeroSocio and a.Id_Tipo_Persona  =@idTIpoPersona and (b.Parentesco is null  or  b.Parentesco  =''))
	--		select  @existeError = 1 , @mensajeError  = @mensajeError+'El beneficiario del socio no cuenta con parentesco por favor actuliza la información.|'
	
	
	--if  not exists (SELECT * FROM TBL_CORRESPONSALIAS_CUENTAS WHERE Numero = @numeroSocio and ACTIVO= 1 AND id_mov in (100,103) )
	--	select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con claves de corresponsalias activadas.|' 
 


	-- VALIDAMOS QUE LOS BENEFICIARIOS TENGAN SUS DATOS ACTUALIZADOS --•	NombrE,Domicilio,Fecha de Nacimiento,Porcentaje
	IF EXISTS ( select 1 from REFERENCIAS where Id_de_Referencia in (1,7,8,9) AND id_persona in (
				select Id_Persona from PERSONA where Numero  = @numeroSocio and Id_Tipo_Persona = 1
				) 
				AND 
					(	ISNULL(Id_Colonia_CNBV,0) = 0 OR
						CONVERT (VARCHAR , Fecha_de_Nacimiento, 112) = '19000101' OR
						ISNULL(Porcentaje,0) = 0 OR
						Nombre_Referencia is null or Nombre_Referencia ='' 
				    ))
	 select  @existeError = 1 , @mensajeError  = @mensajeError+'Por favor actualize la información de los beneficiarios del socio.|'

	 --VALIDAMOS LA ACTUALIZACION DE LOS CAMPOS DE LA NUEVA VERSION DE IMAGEN

	 IF EXISTS (SELECT 1  FROM HAPE..PERSONA WHERE Numero = @numeroSocio AND Id_Tipo_Persona = 1 AND DatosActualizados = 'F')
	 BEGIN
		 select  @existeError = 1 , @mensajeError  = @mensajeError+'El socio no cuenta con su información actualizada.|'
	 END
	

	if exists (select 1 from QUEBRANTOS.dbo.QUEBRANTO_EDO_DE_CUENTA where Numero = @numeroSocio)
	 select  @existeError = 1 , @mensajeError  = @mensajeError+'EL socio  ha sido quebrantado, no se puede activar servicios electrónicos por internet “CMV Finanzas”. |'




	-- fin de validaciones
	
	SELECT 
	1 estatus ,
	@existeError existeError,
	@mensajeError mensajeError,
	isnull(p.Nombre_s,' ')+' '+isnull(p.Apellido_Paterno,' ')+' '+isnull(p.Apellido_Materno,' ') nombreCompleto,
	CASE WHEN S.numero_socio IS NULL THEN 1  ELSE 0 END puedeActivar,
	CASE WHEN S.id_motivo_bloqueo  <> 1 THEN 1  ELSE 0 END bloqueado,
	CASE WHEN CB.numero IS NULL THEN 0 ELSE 1 END tieneContratoBanca,
	isnull(S.banca_activa,0)banca_activa,
	ISNULL(s.id_estatus_banca,0) id_estatus_banca,
	cast(ISNULL(CB.monto_maximo_transferencia,0) as money) monto_maximo_transferencia,
	CB.id_tipo_notificacion, CB.monto_actualizado,
	p.Mail,
	p.Tel_Celular,
	C.Codigo_Postal,C.Nombre_Colonia , L.Nombre_Localidad, E.DESCRIPCION,
	isnull(p.Calle,'')+' '+isnull(p.Numero_Exterior,'')+', '+ISNULL(C.Nombre_Colonia,' ')+','+isnull(cast(C.Codigo_Postal as varchar),'')+' '+ISNULL(L.Nombre_Localidad,'')+' '+ISNULL(E.DESCRIPCION,' ') domiCompleto,
	s.id_motivo_bloqueo,
	P.*
	FROM HAPE..PERSONA  P
	LEFT JOIN CNBV_MNPIO_COL C ON P.Id_Colonia_CNBV = C.Id_Colonia_CNBV
	LEFT JOIN CNBV_LOCALIDADES L ON L.Id_Localidad_CNBV = C.Id_Localidad_CNBV AND C.Id_Entidad_Federativa = L.Id_Entidad_Federativa
	LEFT JOIN ENTIDAD_FEDERATIVA E ON E.ID_ENTIDAD_FEDERATIVA  = C.Id_Entidad_Federativa
	LEFT JOIN BANCA..TBL_BANCA_SOCIOS  S ON S.NUMERO_SOCIO = P.Numero AND P.Id_Tipo_Persona = @idTIpoPersona
	LEFT JOIN hape..TBL_CONTRATOS_HABERES CB ON CB.Numero = @numeroSocio  and  id_tipo_contrato = 3
	WHERE P.NUMERO = @numeroSocio 
	AND p.Id_Tipo_Persona =  @idTIpoPersona
	

 
end try
begin catch
	select 0 as estatus , ERROR_MESSAGE() AS mensaje 	
	
end catch

END

