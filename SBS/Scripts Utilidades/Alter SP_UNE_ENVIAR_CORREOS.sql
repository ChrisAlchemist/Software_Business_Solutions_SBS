USE [HAPE]
GO
/****** Object:  StoredProcedure [dbo].[SP_UNE_ENVIAR_CORREOS]    Script Date: 04/04/2019 01:16:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*

Autor			EDUARDO LEMUS ZAVALA
UsuarioRed		LEZE667231
Fecha			20170210
Objetivo		ENVIAR CORREOS A LOS ENCARGADOS DE LOS FOLIOS QUE ESTEN CERCA DE VENCER O ESTEN VENCIDOS
Proyecto		UNE
Ticket			

*/

ALTER proc [dbo].[SP_UNE_ENVIAR_CORREOS]
as
begin

	--variables para guardar la informacion que sera enviada en el correo
	declare @status int = 1,@style nvarchar(max)='',@firma nvarchar(max)='',@subject varchar(100)='',@recipients nvarchar(max)='',
	@recipients_copy nvarchar(max)='',@receptor varchar(100)='',@body nvarchar(max)='',@fondo_correo nvarchar(max)=''

	--fecha del dia
	DECLARE @FECHA DATETIME = GETDATE(), @ANIO INT = DATEPART(YEAR,GETDATE())
	DECLARE @FECHA_INICIAL DATETIME = CONVERT(VARCHAR,DATEPART(YEAR,GETDATE()))+'0101'

	--guardamos los dias festivos del año en curso
	CREATE TABLE #TMP_DIAS_FESTIVOS_ANIO(DIA_FESTIVO DATETIME)
	INSERT INTO #TMP_DIAS_FESTIVOS_ANIO 
	SELECT DISTINCT(Dia_Festivo) FROM DIAS_FESTIVOS 
	WHERE CONVERT(VARCHAR,DIA_FESTIVO,112) >= CONVERT(varchar,@FECHA_INICIAL,112)
	AND DATEPART(dw,CONVERT(VARCHAR,DIA_FESTIVO,101)) NOT in('1','7') ORDER BY Dia_Festivo

	-- validamos si es dia entre semana y verificamos si este dia es dia festivo, para no generar el descuento de dias disponibles
	IF(DATEPART(dw,CONVERT(VARCHAR,@FECHA,101)) in('2','3','4','5','6'))
	begin
		IF((SELECT COUNT(1) FROM #TMP_DIAS_FESTIVOS_ANIO WHERE CONVERT(VARCHAR,DIA_FESTIVO,112)=CONVERT(VARCHAR,@FECHA,112))=0)
		BEGIN
			UPDATE TBL_UNE_REPORTE SET DIAS_RESTANTES_GENERAL = 
			CASE WHEN DIAS_RESTANTES_GENERAL -1 < 0 THEN 0 ELSE DIAS_RESTANTES_GENERAL -1 END WHERE ID_ESTATUS_REPORTE NOT IN(6,7,8,9)
			
			UPDATE TBL_UNE_REPORTE SET DIAS_RESTANTES_AREA_ESPECIALIZADA = 
			case when DIAS_RESTANTES_AREA_ESPECIALIZADA -1 < 0 then 0 else DIAS_RESTANTES_AREA_ESPECIALIZADA -1 end WHERE ID_ESTATUS_REPORTE IN(3,4,10) AND VoBo = 0
		END
	end

	-- borramos tabla temporal
	DROP TABLE #TMP_DIAS_FESTIVOS_ANIO

	-- variables para manejar el ciclo y enviar los corres
	DECLARE @MIN INT = 1, @MAX INT

	-- insertamos los reportes que esten a punto de vencerse y los que ya estan vencidos
	CREATE TABLE #TMP_NOTIFICAR_GENERAL(CONTADOR INT IDENTITY(1,1), FOLIO INT, NUM_FOLIO INT, NUMUSUARIO INT, CORREO VARCHAR(100), DIAS_GENERALES INT, DIAS_AREA_ESP INT, FOLIO_BANCA INT, REPORTE_BANCA BIT)
	INSERT INTO #TMP_NOTIFICAR_GENERAL
	SELECT FOLIO, NUM_FOLIO, USUARIO_REGISTRA,NULL,DIAS_RESTANTES_GENERAL, DIAS_RESTANTES_AREA_ESPECIALIZADA, folio_banca, reporte_banca
	FROM TBL_UNE_REPORTE WHERE ID_ESTATUS_REPORTE NOT IN(6,7,8,9) 
	AND (DIAS_RESTANTES_GENERAL IN(1,0) OR (DIAS_RESTANTES_AREA_ESPECIALIZADA IN(1,0) and VoBo = 0) ) AND reporte_banca = 0

	/*REPORTES DE BANCA*/
	INSERT INTO #TMP_NOTIFICAR_GENERAL
	SELECT FOLIO, NUM_FOLIO, USUARIO_REGISTRA,NULL,DIAS_RESTANTES_GENERAL, DIAS_RESTANTES_AREA_ESPECIALIZADA, folio_banca, reporte_banca
	FROM TBL_UNE_REPORTE WHERE ID_ESTATUS_REPORTE NOT IN(6,7,8,9) 
	AND (DIAS_RESTANTES_GENERAL IN(1,0) OR (DIAS_RESTANTES_AREA_ESPECIALIZADA IN(1,0) and VoBo = 0) ) AND reporte_banca = 1
	AND ID_CUENTA IN(33,38,39)
	

	--SE ACTUALIZA EL NUMUSUARIO DE LOS RESPONSABLES DE REPORTES CANALIZADOS A AREAS QUE ESTEN A PUNTO DE VENCERCE
	UPDATE TMP SET TMP.NUMUSUARIO = USR.NUMUSUARIO FROM #TMP_NOTIFICAR_GENERAL TMP INNER JOIN TBL_UNE_USUARIOS_ASIGNADOS USR
	ON TMP.FOLIO = USR.folio WHERE USR.responsable = 1 AND TMP.DIAS_AREA_ESP IN (1,0)

	--actualizamos los correos de los usuarios a los que se les notificara
	UPDATE TMP SET TMP.CORREO = CL.CORREO FROM #TMP_NOTIFICAR_GENERAL TMP INNER JOIN CLAVES CL ON TMP.NUMUSUARIO = CL.NUMUSUARIO

	--obtenemos el numero de envios que se realizaran
	SELECT @MAX = MAX(CONTADOR) FROM #TMP_NOTIFICAR_GENERAL

	-- estilos del mensaje
	set @style=N'<style type="text/css">p,li {text-align:justify;font-family: Century Gothic,CenturyGothic,AppleGothic,sans-serif; font-size: 14px;}</style>'
	set @firma=N'<img src="firma_une.jpg" width=50/><br><br>'+
	N'ACATITA DE BAJAN No. 222, COL. LOMAS DE HIDALGO<br>' +
	N'TEL: (443) 3226-300, EXT. 11020 y 11021, MORELIA, MICH.<br>' + 
	N'LADA SIN COSTO: 01 800 3000 268<br>' +
	N'<a href="http://www.cajamorelia.com.mx/">www.cajamorelia.com.mx</a></p>'

	-- variables para obtener la informacion
	DECLARE @CORREO_USR VARCHAR(100), @DIASGEN INT, @DIASAREA INT, @NUMFOLIO INT, @tipoReporte varchar(100),@numero int, @numusaurio int, @nombre_resp varchar(100)
	,@nombre varchar(150), @supuesto varchar(150), @monto_rec money, @SUCURSAL VARCHAR(100), @estatus varchar(50), @REPORTE_BANCA BIT, @FOLIO_BANCA INT,
	@ENCABEZADO1 VARCHAR(200),@ENCABEZADOpropiedades varchar(200),@ENCABEZADOFOLIO VARCHAR(200), @subjectVencido varchar(200),@ENCABEZADO1Vencido varchar(200)
	-- enviamos el correo de cada caso
	WHILE(@MIN<=@MAX)
	BEGIN
	
		SELECT @CORREO_USR = CORREO, @DIASGEN = DIAS_GENERALES, @DIASAREA = DIAS_AREA_ESP, @NUMFOLIO = NUM_FOLIO, @numusaurio = NUMUSUARIO, @REPORTE_BANCA = REPORTE_BANCA, @FOLIO_BANCA = FOLIO_BANCA
		FROM #TMP_NOTIFICAR_GENERAL WHERE CONTADOR  = @MIN

		select @tipoReporte=cat.DESCRIPCION,@numero=ISNULL(rep.numero,0),
		@nombre=rep.NOMBRE_S+' '+rep.APELLIDO_PATERNO+' '+rep.APELLIDO_MATERNO ,
		@supuesto = sup.DESCRIPCION, @monto_rec = ISNULL(rep.IMPORTE_RECLAMACION,0), @SUCURSAL = SUC.Descripcion,
		@estatus = EST.DESCRIPCION
		from TBL_UNE_REPORTE rep inner join CAT_UNE_TIPO_REPORTE cat
		on rep.ID_TIPO_REPORTE = cat.ID_TIPO_REPORTE
		inner join CAT_UNE_SUPUESTOS_REPORTE sup ON rep.ID_SUPUESTOS_REPORTE = sup.ID_SUPUESTOS_REPORTE
		INNER JOIN SUCURSALES SUC ON REP.ID_DE_SUCURSAL = SUC.Id_de_Sucursal
		INNER JOIN CAT_UNE_ESTATUS_REPORTE EST ON REP.ID_ESTATUS_REPORTE = EST.ID_ESTATUS_REPORTE
		where NUM_FOLIO = @NUMFOLIO

		SELECT @nombre_resp = NOMBRE_S+' '+APELLIDO_PATERNO+' '+APELLIDO_MATERNO FROM CLAVES
		WHERE Numusuario = @numusaurio

		IF(@REPORTE_BANCA = 1)
		BEGIN
			set @ENCABEZADO1='Por este medio le informamos que tiene un reporte de CMV Finanzas PENDIENTE DE CONCLUIR.<br/>'
			set @ENCABEZADOpropiedades = 'Propiedades del reporte de '+@tipoReporte+':<br/>'
			SET @ENCABEZADOFOLIO = 'Folio: '+CONVERT(varchar,@FOLIO_BANCA)+'<br/>'
			set @subjectVencido = 'Reporte CMV Finanzas Vencido'
		END
		else
		BEGIN
			set @ENCABEZADO1='Por este medio le informamos que tiene una '+@tipoReporte+' PENDIENTE DE CONCLUIR.<br/>'
			set @ENCABEZADOpropiedades = 'Propiedades de la '+@tipoReporte+':<br/>'
			SET @ENCABEZADOFOLIO='Folio: '+CONVERT(varchar,@NUMFOLIO)+'<br/>'
			set @subjectVencido = 'REPORTE DE LA UNE VENCIDO'
		END


		IF(@DIASGEN = 1)
		BEGIN
			set @body=@fondo_correo+ @style + 'ASESOR ATENCIÓN A SOCIOS 01 800.<br/>';
			set @body=@body+'Presente.<br>'
			set @body=@body+@ENCABEZADO1
			set @body=@body+@ENCABEZADOpropiedades
			set @body=@body+'Sucursal de origén: '+@SUCURSAL+'<br/>'
			set @body=@body+'Nombre: '+@nombre+'<br/>'
			set @body=@body+@ENCABEZADOFOLIO
			set @body=@body+'Causas: '+@supuesto+'<br/>'
			if(@monto_rec>0)
				set @body=@body+'Monto: '+CONVERT(varchar,@monto_rec)+'<br/>'
			set @body=@body+'<br><br>'+@firma+'<br><br>'
			begin try
				EXEC msdb.dbo.sp_send_dbmail 
				@profile_name = 'UNEBANCA',
				--@profile_name = 'UNE',
				@recipients=@CORREO_USR,
				--@copy_recipients =@CorreoAsistente,
				@subject = 'REPORTE A UN DIA DE VENCIMIENTO',
				@body = @body,
				@file_attachments = 'C:\ImgCorreo\firma_une.jpg',
				@body_format = 'HTML';
			end try
			begin catch
				select	@status = 0
				raiserror('No se envió el correo correctamente', 12, 0)
			end catch

		END

		IF(@DIASGEN = 0)
		BEGIN
			--UPDATE TBL_UNE_REPORTE SET ID_ESTATUS_REPORTE = 8 WHERE NUM_FOLIO = @NUMFOLIO
			UPDATE TBL_UNE_REPORTE SET VENCIDO = 1 WHERE NUM_FOLIO = @NUMFOLIO
			set @body=@fondo_correo+ @style + 'ASESOR ATENCIÓN A SOCIOS 01 800.<br/>';
			set @body=@body+'Presente.<br>'
			set @body=@body+'Por este medio le informamos que tiene una '+@tipoReporte+' VENCIDA.<br/>'
			set @body=@body+@ENCABEZADOpropiedades
			if(@numero = 0)
				set @body=@body+'Número de socio: N/A<br/>'
			else
				set @body=@body+'Número de socio: '+CONVERT(varchar,@numero)+'<br/>'
			set @body=@body+'Nombre: '+@nombre+'<br/>'
			set @body=@body+@ENCABEZADOFOLIO
			set @body=@body+'Supuesto: '+@supuesto+'<br/>'
			if(@monto_rec>0)
				set @body=@body+'Monto: '+CONVERT(varchar,@monto_rec)+'<br/>'
			set @body=@body+'Tiempo de respuesta: INMEDIATA <br/>'
			set @body=@body+'<br><br>'+@firma+'<br><br>'
			begin try
				EXEC msdb.dbo.sp_send_dbmail 
				@profile_name = 'UNEBANCA',
				--@profile_name = 'Une',
				@recipients=@CORREO_USR,
				--@copy_recipients =@CorreoAsistente,
				@subject = @subjectVencido,
				@body = @body,
				@file_attachments = 'C:\ImgCorreo\firma_une.jpg',
				@body_format = 'HTML';
			end try
			begin catch
				select	@status = 0
				raiserror('No se envió el correo correctamente', 12, 0)
			end catch

		END

		IF(@DIASAREA = 1)
		BEGIN
			set @body=@fondo_correo+ @style + @nombre_resp+'<br/>';
			set @body=@body+'Presente.<br>'
			set @body=@body+@ENCABEZADO1
			set @body=@body+@ENCABEZADOpropiedades
			if(@numero = 0)
				set @body=@body+'Número de socio: N/A<br/>'
			else
				set @body=@body+'Número de socio: '+CONVERT(varchar,@numero)+'<br/>'
			set @body=@body+'Nombre: '+@nombre+'<br/>'
			set @body=@body+@ENCABEZADOFOLIO
			set @body=@body+'Supuesto: '+@supuesto+'<br/>'
			if(@monto_rec>0)
				set @body=@body+'Monto: '+CONVERT(varchar,@monto_rec)+'<br/>'

			set @body=@body+'Status: '+@estatus+' <br/>'
			set @body=@body+'<br><br>'+@firma+'<br><br>'

			begin try
				EXEC msdb.dbo.sp_send_dbmail 
				@profile_name = 'UNEBANCA',
				--@profile_name = 'une',
				@recipients=@CORREO_USR,
				--@copy_recipients =@CorreoAsistente,
				@subject = 'REPORTE CANALIZADO A AREA ESPECIFICA A UN DIA DE VENCIMIENTO',
				@body = @body,
				@file_attachments = 'C:\ImgCorreo\firma_une.jpg',
				@body_format = 'HTML';
			end try
			begin catch
				select	@status = 0
				raiserror('No se envió el correo correctamente', 12, 0)
			end catch
		END

		IF(@DIASAREA = 0)
		BEGIN
			--UPDATE TBL_UNE_REPORTE SET ID_ESTATUS_REPORTE = 9 WHERE NUM_FOLIO = @NUMFOLIO
			UPDATE TBL_UNE_REPORTE SET VENCIDO = 2 WHERE NUM_FOLIO = @NUMFOLIO
			set @body=@fondo_correo+ @style + @nombre_resp+'<br/>';
			set @body=@body+'Presente.<br>'
			set @body=@body+'Por este medio le informamos que tiene una '+@tipoReporte+' VENCIDA.<br/>'
			set @body=@body+@ENCABEZADOpropiedades
			if(@numero = 0)
				set @body=@body+'Número de socio: N/A<br/>'
			else
				set @body=@body+'Número de socio: '+CONVERT(varchar,@numero)+'<br/>'
			set @body=@body+'Nombre: '+@nombre+'<br/>'
			set @body=@body+@ENCABEZADOFOLIO
			set @body=@body+'Supuesto: '+@supuesto+'<br/>'
			if(@monto_rec>0)
				set @body=@body+'Monto: '+CONVERT(varchar,@monto_rec)+'<br/>'
			set @body=@body+'Tiempo de respuesta: INMEDIATA <br/>'
			set @body=@body+'<br><br>'+@firma+'<br><br>'
			begin try
				EXEC msdb.dbo.sp_send_dbmail 
				@profile_name = 'UNEBANCA',
				--@profile_name = 'Une',
				@recipients=@CORREO_USR,
				--@copy_recipients =@CorreoAsistente,
				@subject = @subjectVencido,
				@body = @body,
				@file_attachments = 'C:\ImgCorreo\firma_une.jpg',
				@body_format = 'HTML';
			end try
			begin catch
				select	@status = 0
				raiserror('No se envió el correo correctamente', 12, 0)
			end catch
		END

		SET @MIN = @MIN + 1

	END

	DROP TABLE #TMP_NOTIFICAR_GENERAL
END
