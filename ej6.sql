CREATE DATABASE Ej6;
USE Ej6;

CREATE TABLE Peliculas(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
calificacion_edad int
);

CREATE TABLE Salas(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
codigo_pelicula int,
FOREIGN KEY (codigo_pelicula) REFERENCES Peliculas(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Peliculas (nombre, calificacion_edad) VALUES
('Pelicula 1', 18),
('Pelicula 2', 12),
('Pelicula 3', 15),
('Pelicula 4', 12),
('Pelicula 5', 18),
('Pelicula 6', 15),
('Pelicula 7', 12),
('Pelicula 8', 15),
('Pelicula 9', 18),
('Pelicula 10', 12);

INSERT INTO Salas (nombre, codigo_pelicula) VALUES
('Sala 1', 1),
('Sala 2', 2),
('Sala 3', 3),
('Sala 4', 4),
('Sala 5', 5),
('Sala 6', 6),
('Sala 7', 7),
('Sala 8', 8),
('Sala 9', 9),
('Sala 10', 10);
-- -------------------------UPDATES--------------------------------
UPDATE Peliculas SET calificacion_edad = 16 WHERE codigo = 1;
UPDATE Peliculas SET nombre = 'Nueva Pelicula 2' WHERE codigo = 2;

UPDATE Salas SET nombre = 'Nueva Sala 1' WHERE codigo = 1;
UPDATE Salas SET codigo_pelicula = 6 WHERE codigo = 2;
-- -------------------------DELETES--------------------------------
DELETE FROM Peliculas WHERE codigo = 3;
DELETE FROM Peliculas WHERE codigo = 4;

DELETE FROM Salas WHERE codigo = 3;
DELETE FROM Salas WHERE codigo = 4;
