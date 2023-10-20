CREATE DATABASE Ej5;
USE Ej5;	

CREATE TABLE Almacenes (
codigo int auto_increment PRIMARY KEY,
lugar nvarchar(100),
capacidad int
);

CREATE TABLE Cajas(
num_referencia char(5) PRIMARY KEY,
contenido nvarchar(100),
valor int,
almacen int,
codigo_almacen int,
FOREIGN KEY (codigo_almacen) REFERENCES Almacenes(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Almacenes (lugar, capacidad) VALUES
('Almacén A', 5000),
('Almacén B', 8000),
('Almacén C', 6000),
('Almacén D', 7000),
('Almacén E', 9000),
('Almacén F', 7500),
('Almacén G', 5500),
('Almacén H', 6500),
('Almacén I', 7200),
('Almacén J', 6800);

INSERT INTO Cajas (num_referencia, contenido, valor, codigo_almacen) VALUES
('Caja1', 'Contenido A', 100, 1),
('Caja2', 'Contenido B', 150, 2),
('Caja3', 'Contenido C', 80, 3),
('Caja4', 'Contenido D', 120, 4),
('Caja5', 'Contenido E', 200, 1),
('Caja6', 'Contenido F', 90, 2),
('Caja7', 'Contenido G', 180, 3),
('Cajq8', 'Contenido H', 110, 4),
('Cajq9', 'Contenido I', 130, 1),
('Caja0', 'Contenido J', 70, 2);
-- -------------------------UPDATES--------------------------------
UPDATE Almacenes SET capacidad = 5500 WHERE codigo = 1;
UPDATE Almacenes SET lugar = 'Nuevo Almacén B' WHERE codigo = 2;

UPDATE Cajas SET valor = 120 WHERE num_referencia = 'Caja1';
UPDATE Cajas SET contenido = 'Nuevo Contenido B' WHERE num_referencia = 'Caja2';

-- -------------------------DELETES--------------------------------
DELETE FROM Almacenes WHERE codigo = 3;
DELETE FROM Almacenes WHERE codigo = 4;

DELETE FROM Cajas WHERE num_referencia = 'Caja3';
DELETE FROM Cajas WHERE num_referencia = 'Caja4';
