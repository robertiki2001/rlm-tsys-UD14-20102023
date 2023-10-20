CREATE DATABASE Ej3;
USE Ej3;

CREATE TABLE Fabricantes(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Articulos(
codigo int auto_increment PRIMARY KEY,
nombre varchar(100),
precio int,
codigo_fabricante int ,
FOREIGN KEY (codigo_fabricante) REFERENCES Fabricantes(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Fabricantes (nombre) VALUES
('Fabricante A'),
('Fabricante B'),
('Fabricante C'),
('Fabricante D'),
('Fabricante E'),
('Fabricante F'),
('Fabricante G'),
('Fabricante H'),
('Fabricante I'),
('Fabricante J');

INSERT INTO Articulos (nombre, precio, codigo_fabricante) VALUES
('Artículo 1', 100, 1),
('Artículo 2', 150, 2),
('Artículo 3', 80, 3),
('Artículo 4', 120, 4),
('Artículo 5', 200, 1),
('Artículo 6', 90, 2),
('Artículo 7', 180, 3),
('Artículo 8', 110, 4),
('Artículo 9', 130, 1),
('Artículo 10', 70, 2);

-- -------------------------UPDATES--------------------------------
UPDATE Fabricantes SET nombre = 'Nuevo Fabricante A' WHERE codigo = 1;
UPDATE Fabricantes SET nombre = 'Nuevo Fabricante B' WHERE codigo = 2;

UPDATE Articulos SET precio = 120 WHERE codigo = 1;
UPDATE Articulos SET nombre = 'Nuevo Artículo 2' WHERE codigo = 2;

-- -------------------------DELETES--------------------------------
DELETE FROM Fabricantes WHERE codigo = 3;
DELETE FROM Fabricantes WHERE codigo = 4;

DELETE FROM Articulos WHERE codigo = 3;
DELETE FROM Articulos WHERE codigo = 4;
