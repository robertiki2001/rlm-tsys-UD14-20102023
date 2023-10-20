CREATE DATABASE Ej10;
USE Ej10;

CREATE TABLE Cajeros(
codigo int PRIMARY KEY,
nom_apels nvarchar(255)
);

CREATE TABLE MaquinasRegistradoras(
codigo int PRIMARY KEY,
piso int
);

CREATE TABLE Productos(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
precio int
);

CREATE TABLE Venta(
codigo_cajero int,
codigo_maquina_registradora int,
codigo_producto int,
FOREIGN KEY (codigo_cajero) REFERENCES Cajeros(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_maquina_registradora) REFERENCES MaquinasRegistradoras(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_producto) REFERENCES Productos(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (codigo_cajero, codigo_maquina_registradora, codigo_producto)
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Cajeros (codigo, nom_apels) VALUES
(1, 'Cajero 1'),
(2, 'Cajero 2'),
(3, 'Cajero 3'),
(4, 'Cajero 4'),
(5, 'Cajero 5'),
(6, 'Cajero 6'),
(7, 'Cajero 7'),
(8, 'Cajero 8'),
(9, 'Cajero 9'),
(10, 'Cajero 10');

INSERT INTO MaquinasRegistradoras (codigo, piso) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

INSERT INTO Productos (nombre, precio) VALUES
('Producto 1', 100),
('Producto 2', 150),
('Producto 3', 80),
('Producto 4', 120),
('Producto 5', 200),
('Producto 6', 90),
('Producto 7', 180),
('Producto 8', 110),
('Producto 9', 130),
('Producto 10', 70);

INSERT INTO Venta (codigo_cajero, codigo_maquina_registradora, codigo_producto) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- -------------------------UPDATES--------------------------------
UPDATE Cajeros SET nom_apels = 'Nuevo Cajero 1' WHERE codigo = 1;
UPDATE Cajeros SET nom_apels = 'Nuevo Cajero 2' WHERE codigo = 2;

UPDATE MaquinasRegistradoras SET piso = 3 WHERE codigo = 1;
UPDATE MaquinasRegistradoras SET piso = 4 WHERE codigo = 2;

UPDATE Productos SET nombre = 'Nuevo Producto 1' WHERE codigo = 1;
UPDATE Productos SET precio = 160 WHERE codigo = 2;

UPDATE Venta SET codigo_producto = 8 WHERE codigo_cajero = 1 AND codigo_maquina_registradora = 1;
UPDATE Venta SET codigo_cajero = 5 WHERE codigo_producto = 5 AND codigo_maquina_registradora = 5;

-- -------------------------DELETES--------------------------------
DELETE FROM Cajeros WHERE codigo = 3;
DELETE FROM Cajeros WHERE codigo = 4;

DELETE FROM MaquinasRegistradoras WHERE codigo = 3;
DELETE FROM MaquinasRegistradoras WHERE codigo = 4;

DELETE FROM Productos WHERE codigo = 3;
DELETE FROM Productos WHERE codigo = 4;

DELETE FROM Venta WHERE codigo_cajero = 3 AND codigo_maquina_registradora = 3;
DELETE FROM Venta WHERE codigo_producto = 6 AND codigo_maquina_registradora = 6;
