use sbs
go
IF NOT EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'TBL_SBS_EQUIPO_MIEMBROS')
begin
create table TBL_SBS_EQUIPO_MIEMBROS
	(
		ID_MIEMBRO INT IDENTITY,
		NOMBRE VARCHAR(200),
		APELLIDO_P VARCHAR(200),
		APELLIDO_M VARCHAR(200),
		PUESTO VARCHAR(MAX),
		PATH_IMAGEN_MIENBRO VARCHAR(MAX),	
		MAIL VARCHAR(300),
		TEL_CELULAR VARCHAR(300),
		CUENTA_YOUTUBE VARCHAR(MAX),
		CUENTA_FACEBOOK VARCHAR(MAX),
		CUENTA_LINKEDIN VARCHAR(MAX)

	)
end

SELECT * FROM TBL_SBS_EQUIPO_MIEMBROS


--DROP TABLE TBL_SBS_EQUIPO