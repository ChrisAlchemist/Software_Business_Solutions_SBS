use sbs
go
IF NOT EXISTS(SELECT 1 FROM TBL_SBS_EQUIPO_MIEMBROS WHERE ID_MIEMBRO = 1)
BEGIN
	INSERT INTO TBL_SBS_EQUIPO_MIEMBROS 
	(
		NOMBRE,
		APELLIDO_P,
		APELLIDO_M,
		PUESTO,
		PATH_IMAGEN_MIENBRO,
		MAIL,
		TEL_CELULAR,
		CUENTA_YOUTUBE,
		CUENTA_FACEBOOK,
		CUENTA_LINKEDIN
	)
	VALUES
	(
		'Cristian',
		'Pérez',
		'García',
		'Desarrollador Web/Windows',
		'C:\Users\ISC-Cristian\Pictures\328893.jpg',
		'cristian.perez.garcia.54@gmail.com',
		'786-102-1588',
		'',
		'https://www.facebook.com/ISC.CristianPerez/',
		'https://www.linkedin.com/in/cristian-perez-garcia-387781170/'
	)
END

SELECT * FROM TBL_SBS_EQUIPO_MIEMBROS