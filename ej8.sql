CREATE DATABASE Ej8;
USE Ej8;

CREATE TABLE Piezas (
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Proveedores (
id char(4) PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Suministra (
codigo_pieza int,
id_proveedor char(4),
precio int,
FOREIGN KEY (codigo_pieza) REFERENCES Piezas(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (codigo_pieza, id_proveedor)
);

-- -------------------------INSERTS--------------------------------ç
INSERT INTO Piezas (nombre) VALUES
('Pieza A'),
('Pieza B'),
('Pieza C'),
('Pieza D'),
('Pieza E'),
('Pieza F'),
('Pieza G'),
('Pieza H'),
('Pieza I'),
('Pieza J');

INSERT INTO Proveedores (id, nombre) VALUES
('P1', 'Proveedor 1'),
('P2', 'Proveedor 2'),
('P3', 'Proveedor 3'),
('P4', 'Proveedor 4'),
('P5', 'Proveedor 5'),
('P6', 'Proveedor 6'),
('P7', 'Proveedor 7'),
('P8', 'Proveedor 8'),
('P9', 'Proveedor 9'),
('P10', 'Proveedor 10');

INSERT INTO Suministra (codigo_pieza, id_proveedor, precio) VALUES
(1, 'P1', 100),
(2, 'P2', 150),
(3, 'P3', 80),
(4, 'P4', 120),
(5, 'P5', 200),
(6, 'P6', 90),
(7, 'P7', 180),
(8, 'P8', 110),
(9, 'P9', 130),
(10, 'P10', 70);
-- -------------------------UPDATES--------------------------------
UPDATE Piezas SET nombre = 'Nueva Pieza A' WHERE codigo = 1;
UPDATE Piezas SET nombre = 'Nueva Pieza B' WHERE codigo = 2;

UPDATE Proveedores SET nombre = 'Nuevo Proveedor 1' WHERE id = 'P1';
UPDATE Proveedores SET nombre = 'Nuevo Proveedor 2' WHERE id = 'P2';

UPDATE Suministra SET precio = 120 WHERE codigo_pieza = 1 AND id_proveedor = 'P1';
UPDATE Suministra SET precio = 160 WHERE codigo_pieza = 2 AND id_proveedor = 'P2';
-- -------------------------DELETES--------------------------------
DELETE FROM Piezas WHERE codigo = 3;
DELETE FROM Piezas WHERE codigo = 4;

DELETE FROM Proveedores WHERE id = 'P3';
DELETE FROM Proveedores WHERE id = 'P4';

DELETE FROM Suministra WHERE codigo_pieza = 3 AND id_proveedor = 'P3';
DELETE FROM Suministra WHERE codigo_pieza = 4 AND id_proveedor = 'P4';
