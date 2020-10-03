USE zapateriahappyshoes;
DROP TABLE IF EXISTS usuario;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100)  NOT NULL,
  `pswd` varchar(100)  NOT NULL,
  `email` varchar(100)  NOT NULL,
       PRIMARY KEY (id)
) ;

DROP PROCEDURE IF EXISTS guardar_usuario;
DELIMITER //
CREATE PROCEDURE guardar_usuario(
IN username VARCHAR(100),
IN pswd VARCHAR(100),
IN email VARCHAR(100)
)
BEGIN
	INSERT Into usuario Values ('',username,pswd,email);
END //

DELIMITER ;
/*-----------------------------------------------------------*/
DROP PROCEDURE IF EXISTS validar_login;
DELIMITER //
CREATE PROCEDURE validar_login(
IN par_pswd VARCHAR(100),
IN par_email VARCHAR(100)
)
BEGIN
	SELECT count(*) FROM usuario where pswd = par_pswd and email = par_email;
END //

DELIMITER ;
/*-----------------------------------------------------------*/
DROP PROCEDURE IF EXISTS listar_usuarios;
DELIMITER //
CREATE PROCEDURE listar_usuarios()
	BEGIN
	SELECT * FROM usuario;
END //

DELIMITER ;


/*  agregar usuarios*/
CALL guardar_usuario('Ana','123','ad2@gmail.com');
CALL guardar_usuario('MArio','123','ad3@gmail.com');
CALL guardar_usuario('ALam','123','ad4@gmail.com');

SELECT "-------------------- listar_usuarios --------------------";
CALL listar_usuarios();