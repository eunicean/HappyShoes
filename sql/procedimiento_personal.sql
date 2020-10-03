USE zapateriahappyshoes;
DROP TABLE IF EXISTS personal;
CREATE TABLE `personal` (
  `cod_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_empleado` varchar(100) NOT NULL,
  `dpi` int(15) NOT NULL,
  `seguro_social` int(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cant_horas_contratadas` int(11) NOT NULL,
  `valor_hora_normal` int(10) NOT NULL,
  `valor_hora_extra` int(10) NOT NULL,
       PRIMARY KEY (cod_empleado)
);


DROP PROCEDURE IF EXISTS crear_personal;
DELIMITER //
CREATE PROCEDURE crear_personal(
IN tipo_empleado varchar(100),
IN dpi varchar(100),
IN seguro_social int(11),
IN nombre varchar(100),
IN apellidos varchar(100),
IN cant_horas_contratadas varchar(100),
IN valor_hora_normal varchar(100),
IN valor_hora_extra varchar(100)
)
BEGIN
  INSERT Into personal(tipo_empleado,dpi,seguro_social,nombre,apellidos,cant_horas_contratadas,valor_hora_normal,valor_hora_extra) Values (tipo_empleado,dpi,seguro_social,nombre,apellidos,cant_horas_contratadas,valor_hora_normal,valor_hora_extra);
END //
DELIMITER ;

/*------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS listar_personal;
DELIMITER //
CREATE PROCEDURE listar_personal()
  BEGIN
  SELECT * FROM personal;
END //
DELIMITER ;


call crear_personal('administrador','45789','4612358','Juan','Zamora',100,25,15);
call crear_personal('gerente','4864','4612358','Luis','Zamora',250,23,15);
call crear_personal('empleado','6845','4612358','ana','Zamora',600,36,15);

SELECT "------------------------------------- LISTAR PERSONAL------------------------------------";
call listar_personal();
