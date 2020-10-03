USE zapateriahappyshoes;
DROP TABLE IF EXISTS sucrl_datos;
CREATE TABLE `sucrl_datos` (
  `cod` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_sucrl` varchar(100)  NOT NULL,
  `locacion` varchar(100) NOT NULL,
  `fecha_fundacion` date NOT NULL,
  `cod_gerente` int(11) NOT NULL,
       PRIMARY KEY (cod)
);


DROP PROCEDURE IF EXISTS crear_sucursal;
DELIMITER //
CREATE PROCEDURE crear_sucursal(
IN tipo_sucursal varchar(100),
IN locacion varchar(100),
IN fecha_fundacion date,
IN cod_emp_gerente int(11)
)
BEGIN
	INSERT Into sucrl_datos(tipo_sucrl,locacion,fecha_fundacion,cod_gerente) Values (tipo_sucursal,locacion,fecha_fundacion,cod_emp_gerente);
END //
DELIMITER ;

/*------------------------------------------------------------------------*/
DROP PROCEDURE IF EXISTS listar_sucursales;
DELIMITER //
CREATE PROCEDURE listar_sucursales()
	BEGIN
	SELECT * FROM sucrl_datos;
END //
DELIMITER ;

call crear_sucursal('fabricacion','zona1 av6','2011-04-01',1);
call crear_sucursal('distribucio','zona10','2011-04-01',2);
call crear_sucursal('venta','zona3','2011-04-01',3);


SELECT "------------------------- Listar sucursales ----------------------";
call listar_sucursales();

