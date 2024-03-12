-- Active: 1708955107455@@bpxmminzl0o46ycdgr4m-mysql.services.clever-cloud.com@3306@bpxmminzl0o46ycdgr4m

-- creando la tabla empresas
CREATE TABLE empresas(
  ID INT PRIMARY KEY ,
  NIT VARCHAR(50) NOT NULL ,
  nombre VARCHAR(50) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  Direccion VARCHAR(60) NOT NULL
);

-- creando la tabla vehiculos
CREATE TABLE  vehicles(
  ID INT PRIMARY KEY ,
  placa VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  marca VARCHAR(50) NOT NULL,
  color VARCHAR(45),
  tipo_vehiculo VARCHAR(50) NOT NULL
);

-- creando la tabla usuarios
CREATE TABLE usuarios(
  ID INT PRIMARY KEY ,
  nombre VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  email VARCHAR(160),
  contraseña VARCHAR(50) NOT NULL,
  edad VARCHAR(20),
  genero VARCHAR(20) NOT NULL,
  altura VARCHAR(40) NOT NULL,
  peso VARCHAR(40)
);

-- creando la tabla paises
CREATE TABLE paises(
  ID INT PRIMARY KEY,
  nombre VARCHAR(45)
);

-- creando la tabla ciudad
CREATE TABLE ciudad(
  ID INT PRIMARY KEY,
  nombre VARCHAR(45)
);

-- insertando los datos en la tabla empresas

INSERT INTO empresas (ID, NIT, nombre, telefono, Direccion)
VALUES
    (1, '123456789', 'Empresa A', '555-1234', 'Calle Principal 123'),
    (2, '987654321', 'Empresa B', '555-5678', 'Avenida Central 456'),
    (3, '543210987', 'Empresa C', '555-9876', 'Plaza Comercial 789'),
    (4, '246813579', 'Empresa D', '555-4321', 'Boulevard Norte 321'),
    (5, '135792468', 'Empresa E', '555-8765', 'Carrera Sur 654');


-- insertando los datos en la tabla vehicles
INSERT INTO vehicles (ID, placa, modelo, marca, color, tipo_vehiculo)
VALUES
    (1, 'ABC123', 'Sedán', 'Toyota', 'Rojo', 'Automóvil'),
    (2, 'XYZ789', 'Camioneta', 'Ford', 'Azul', 'SUV'),
    (3, 'LMN456', 'Motocicleta', 'Honda', 'Negro', 'Moto'),
    (4, 'PQR987', 'Furgoneta', 'Chevrolet', 'Blanco', 'Comercial'),
    (5, 'DEF321', 'Convertible', 'BMW', 'Plateado', 'Deportivo');


-- insertando datos en la tabla  usuarios
INSERT INTO usuarios (ID, nombre, apellidos, email, contraseña, edad, genero, altura, peso)
VALUES
    (1, 'Juan', 'Pérez', 'juan@example.com', 'secreto123', '30', 'Masculino', '175 cm', '70 kg'),
    (2, 'María', 'González', 'maria@example.com', 'clave456', '28', 'Femenino', '160 cm', '55 kg'),
    (3, 'Carlos', 'Rodríguez', 'carlos@example.com', 'password789', '35', 'Masculino', '180 cm', '80 kg'),
    (4, 'Ana', 'López', 'ana@example.com', 'segura987', '22', 'Femenino', '165 cm', '60 kg'),
    (5, 'Pedro', 'Martínez', 'pedro@example.com', 'confidencial321', '40', 'Masculino', '170 cm', '75 kg');


-- insertando datos en la tabla paises
INSERT INTO paises (ID, nombre)
VALUES
    (1, 'Colombia'),
    (2, 'Estados Unidos'),
    (3, 'España'),
    (4, 'México'),
    (5, 'Argentina');

-- insertando datos en la ciudaddes
INSERT INTO ciudad (ID, nombre)
VALUES
    (1, 'Medellín'),
    (2, 'Bogotá'),
    (3, 'Barcelona'),
    (4, 'Ciudad de México'),
    (5, 'Buenos Aires');


-- selecionando todos los elementos  o datos de las tablas
SELECT * FROM empresas;

SELECT * FROM vehicles;

SELECT * FROM usuarios;

SELECT * FROM paises;

SELECT * FROM ciudad;


-- selecionando solo el ID de la tabla paises

SELECT ID FROM paises;
-- selecionando solo el nombre de la tabla paises
SELECT nombre FROM paises;

--selecionando el NIt y el nombre de la tabla empresas
SELECT NIT, nombre FROM empresas;
-- selecionando la direccion el telefono y el nombre de la tabla empresas
SELECT Direccion,telefono,nombre FROM empresas;

-- selecionando el nombre el ID  el email y el genero de la tabla usuarios
SELECT ID,nombre,email FROM usuarios;
SELECT nombre,genero FROM usuarios;

--selecionando el nombre el genero  de la tabla usuarios donde el id sea ='4' y = a '5'
SELECT nombre, genero FROM usuarios WHERE ID = '4' AND ID = '2';

-- selecionando el nombre de la tabla usuarios donde el nombre sea  = 'juan'
SELECT nombre FROM usuarios WHERE nombre = 'Juan';

-- selecionando el nombre de la tabla vehicles donde la marca sea  = 'BMW'
SELECT marca FROM vehicles WHERE marca = 'BMW';

-- selecionando el color de la tabla vehicles donde el color sea  = 'Azul'
SELECT color FROM vehicles WHERE color = 'Azul';


-- actualizando el dato edad a 31  de la tabla usuarios donde el nombre sea = 'juan
UPDATE usuarios SET edad = '31' WHERE nombre = 'Juan';

-- actualizando el dato modelo de la tabla vehicles donde la marca sea  ='Chevrolet'
UPDATE vehicles SET modelo = 'corvete' WHERE marca = 'Chevrolet';



-- eliminando datos de la tabla usuarios por id  o por email

DELETE FROM usuarios WHERE id = '2';

DELETE FROM usuarios WHERE email = 'pedro@example.com';

-- eliminando de la tabla vehicles
DELETE FROM vehicles WHERE marca = 'Honda';
-- eliminando de la tabla paises

DELETE FROM paises WHERE nombre = 'bogota';

-- creando nuevas columnas en la tabla usuarios y vehicles

ALTER TABLE usuarios ADD COLUMN  telefono VARCHAR(20);
SELECT * FROM usuarios;

ALTER TABLE vehicles ADD COLUMN  año DATA;

ALTER TABLE usuarios ADD COLUMN  direccion VARCHAR(160);


SELECT * FROM users;

SELECT nombres, apellidos FROM users WHERE edad= 20;

SELECT * FROM users WHERE genero='M' AND edad >= 20 AND edad <=30;


/* SELECT COUNT() FROM users; */
SELECT COUNT(edad) FROM users;

SELECT MIN(edad) FROM users;

SELECT * FROM users  ORDER BY id  LIMIT 5;

SELECT * FROM users ORDER BY id DESC LIMIT 10;


SELECT * FROM users WHERE correo LIKE '_.net%';

SELECT* FROM users WHERE pais !='colombia';

SELECT * FROM users WHERE pais != 'ecuador' AND pais != 'panama';

SELECT * FROM users WHERE correo LIKE '%.net';


SELECT * FROM users WHERE pais= 'colombia' AND musica= 'rock';

UPDATE users SET musica = 'carranga' WHERE musica = 'metal';
SELECT * FROM users WHERE musica = 'carranga';


SELECT * FROM users WHERE genero='H' AND musica= 'carranga'
AND pais = 'colombia' AND edad >= 10 AND edad <= 20;


UPDATE users SET musica = 'carranga' WHERE edad = 99;
SELECT * FROM users WHERE edad = 99;



SELECT * FROM users WHERE nombres LIKE 'A%' OR nombres LIKE 'a%';

SELECT * FROM users WHERE apellidos LIKE '%z' OR apellidos LIKE '%Z';


UPDATE users SET musica = 'NULL' WHERE edad = 50;

SELECT * FROM users WHERE musica = 'NULL';

SELECT * FROM users;


SELECT SUM(edad) FROM users;

SELECT count(id) FROM users WHERE pais = 'ecuador';

SELECT * FROM users WHERE pais = 'colombia' AND musica = 'vallenato';

