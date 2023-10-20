CREATE DATABASE Ej11;

USE Ej11;

CREATE TABLE Facultad(
codigo int PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Equipos (
numero_serie char(4) PRIMARY KEY,
nombre nvarchar(100),
codigo_facultad int,
FOREIGN KEY (codigo_facultad) REFERENCES Facultad(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Investigadores(
dni varchar(8) PRIMARY KEY,
nom_apels nvarchar(255),
codigo_facultad int,
FOREIGN KEY (codigo_facultad) REFERENCES Facultad(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Reserva (
dni_investigador varchar(8),
numero_serie_equipo char(4),
comienzo datetime,
fin datetime,
FOREIGN KEY (dni_investigador) REFERENCES Investigadores(dni)ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (numero_serie_equipo) REFERENCES Equipos(numero_serie)ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (dni_investigador, numero_serie_equipo)
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Facultad (codigo, nombre) VALUES
(1, 'Facultad 1'),
(2, 'Facultad 2'),
(3, 'Facultad 3'),
(4, 'Facultad 4'),
(5, 'Facultad 5'),
(6, 'Facultad 6'),
(7, 'Facultad 7'),
(8, 'Facultad 8'),
(9, 'Facultad 9'),
(10, 'Facultad 10');

INSERT INTO Equipos (numero_serie, nombre, codigo_facultad) VALUES
('E001', 'Equipo 1', 1),
('E002', 'Equipo 2', 2),
('E003', 'Equipo 3', 3),
('E004', 'Equipo 4', 4),
('E005', 'Equipo 5', 5),
('E006', 'Equipo 6', 6),
('E007', 'Equipo 7', 7),
('E008', 'Equipo 8', 8),
('E009', 'Equipo 9', 9),
('E010', 'Equipo 10', 10);

INSERT INTO Investigadores (dni, nom_apels, codigo_facultad) VALUES
('12345678', 'Investigador 1', 1),
('23456789', 'Investigador 2', 2),
('34567890', 'Investigador 3', 3),
('45678901', 'Investigador 4', 4),
('56789012', 'Investigador 5', 5),
('67890123', 'Investigador 6', 6),
('78901234', 'Investigador 7', 7),
('89012345', 'Investigador 8', 8),
('90123456', 'Investigador 9', 9),
('01234567', 'Investigador 10', 10);

INSERT INTO Reserva (dni_investigador, numero_serie_equipo, comienzo, fin) VALUES
('12345678', 'E001', '2023-10-01 08:00:00', '2023-10-01 10:00:00'),
('23456789', 'E002', '2023-10-02 09:00:00', '2023-10-02 11:00:00'),
('34567890', 'E003', '2023-10-03 10:00:00', '2023-10-03 12:00:00'),
('45678901', 'E004', '2023-10-04 11:00:00', '2023-10-04 13:00:00'),
('56789012', 'E005', '2023-10-05 12:00:00', '2023-10-05 14:00:00'),
('67890123', 'E006', '2023-10-06 13:00:00', '2023-10-06 15:00:00'),
('78901234', 'E007', '2023-10-07 14:00:00', '2023-10-07 16:00:00'),
('89012345', 'E008', '2023-10-08 15:00:00', '2023-10-08 17:00:00'),
('90123456', 'E009', '2023-10-09 16:00:00', '2023-10-09 18:00:00'),
('01234567', 'E010', '2023-10-10 17:00:00', '2023-10-10 19:00:00');

-- -------------------------UPDATES--------------------------------
UPDATE Facultad SET nombre = 'Nueva Facultad 1' WHERE codigo = 1;
UPDATE Facultad SET nombre = 'Nueva Facultad 2' WHERE codigo = 2;

UPDATE Equipos SET nombre = 'Nuevo Equipo 1' WHERE numero_serie = 'E001';
UPDATE Equipos SET codigo_facultad = 5 WHERE numero_serie = 'E002';

UPDATE Investigadores SET nom_apels = 'Nuevo Investigador 1' WHERE dni = '12345678';
UPDATE Investigadores SET codigo_facultad = 6 WHERE dni = '23456789';

UPDATE Reserva SET comienzo = '2023-10-01 09:00:00' WHERE dni_investigador = '12345678' AND numero_serie_equipo = 'E001';
UPDATE Reserva SET numero_serie_equipo = 'E009' WHERE dni_investigador = '23456789' AND numero_serie_equipo = 'E002';
-- -------------------------DELETES--------------------------------
DELETE FROM Facultad WHERE codigo = 3;
DELETE FROM Facultad WHERE codigo = 4;

DELETE FROM Equipos WHERE numero_serie = 'E003';
DELETE FROM Equipos WHERE numero_serie = 'E004';

DELETE FROM Investigadores WHERE dni = '34567890';
DELETE FROM Investigadores WHERE dni = '45678901';

DELETE FROM Reserva WHERE dni_investigador = '34567890' AND numero_serie_equipo = 'E003';
DELETE FROM Reserva WHERE dni_investigador = '45678901' AND numero_serie_equipo = 'E004';
