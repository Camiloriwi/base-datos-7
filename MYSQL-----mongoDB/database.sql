-- Active: 1709292484859@@bnz3brqyreubxvgbb0l9-mysql.services.clever-cloud.com@3306@bnz3brqyreubxvgbb0l9



CREATE TABLE `departamentos` (
    `dept_no` tinyint NOT NULL,
    `dnombre` varchar(15) NOT NULL,
    `loc` varchar(15) NOT NULL,
    PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `departamentos` VALUES
    (10, 'CONTABILIDAD', 'SEVILLA'),
    (15, 'INFORMATICA', 'MADRID'),
    (20, 'INVESTIGACION', 'MADRID');

CREATE TABLE `empleados` (
    `emp_no` smallint unsigned NOT NULL,
    `apellido` varchar(60) DEFAULT NULL,
    `oficio` varchar(150) DEFAULT NULL,
    `dir` smallint DEFAULT NULL,
    `fecha_alt` date DEFAULT NULL,
    `salario` float(11,2) DEFAULT NULL,
    `comision` float(11,2) DEFAULT NULL,
    `dept_no` tinyint NOT NULL,
    PRIMARY KEY (`emp_no`),
    KEY `dept_no` (`dept_no`),
    CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`dept_no`) REFERENCES `departamentos` (`dept_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `empleados` VALUES
    (1, 'García', 'Analista', 101, '2023-01-15', 55000.00, NULL, 10),
    (2, 'López', 'Programador', 102, '2023-02-20', 60000.00, NULL, 15),
    (3, 'Martínez', 'Diseñador', 103, '2023-03-10', 52000.00, NULL, 20);

-- Crear una vista para mostrar empleados con salario superior a 50000
CREATE VIEW Empleados_Salario_Alto AS
    SELECT * FROM empleados WHERE salario > 50000;

-- Crear un procedimiento para actualizar el salario de un empleado
DELIMITER //
CREATE PROCEDURE ActualizarSalario(IN empleado_id INT, IN nuevo_salario DECIMAL(10,2))
BEGIN
    UPDATE Empleados SET salario = nuevo_salario WHERE id = empleado_id;
END //
DELIMITER ;

-- Crear una vista para mostrar empleados en orden descendente por salario
CREATE VIEW Empleados_Orden_Salario AS
    SELECT * FROM empleados ORDER BY salario DESC;

-- Crear un procedimiento para calcular el promedio de salarios en un departamento
DELIMITER //
CREATE PROCEDURE CalcularPromedioSalarios(IN departamento_id INT, OUT promedio DECIMAL(10,2))
BEGIN
    SELECT AVG(salario) INTO promedio FROM Empleados WHERE departamento_id = departamento_id;
END //
DELIMITER ;

-- Crear una vista para mostrar empleados con más de 5 años de experiencia
CREATE VIEW Empleados_Experiencia AS
    SELECT * FROM empleados WHERE oficio > 5;

-- Crear un procedimiento para eliminar empleados con salario menor a 30000
DELIMITER //
CREATE PROCEDURE EliminarEmpleadosBajos()
BEGIN
    DELETE FROM Empleados WHERE salario < 30000;
END //
DELIMITER ;
