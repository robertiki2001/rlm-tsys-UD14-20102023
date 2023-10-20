CREATE DATABASE Ej9;
USE Ej9;

CREATE TABLE Cientificos(
dni varchar(8) PRIMARY KEY,
nom_apels nvarchar(255)
);

CREATE TABLE Proyecto(
id char(4) PRIMARY KEY,
nombre nvarchar(255),
horas int
);

CREATE TABLE Asignado_A(
cientifico varchar(8),
proyecto char(4),
FOREIGN KEY (cientifico) REFERENCES Cientificos(dni) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (proyecto) REFERENCES Proyecto(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (cientifico, proyecto)
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Cientificos (dni, nom_apels) VALUES
('12345678', 'Científico 1'),
('23456789', 'Científico 2'),
('34567890', 'Científico 3'),
('45678901', 'Científico 4'),
('56789012', 'Científico 5'),
('67890123', 'Científico 6'),
('78901234', 'Científico 7'),
('89012345', 'Científico 8'),
('90123456', 'Científico 9'),
('01234567', 'Científico 10');

INSERT INTO Proyecto (id, nombre, horas) VALUES
('P1', 'Proyecto 1', 100),
('P2', 'Proyecto 2', 150),
('P3', 'Proyecto 3', 80),
('P4', 'Proyecto 4', 120),
('P5', 'Proyecto 5', 200),
('P6', 'Proyecto 6', 90),
('P7', 'Proyecto 7', 180),
('P8', 'Proyecto 8', 110),
('P9', 'Proyecto 9', 130),
('P10', 'Proyecto 10', 70);

INSERT INTO Asignado_A (cientifico, proyecto) VALUES
('12345678', 'P1'),
('23456789', 'P2'),
('34567890', 'P3'),
('45678901', 'P4'),
('56789012', 'P5'),
('67890123', 'P6'),
('78901234', 'P7'),
('89012345', 'P8'),
('90123456', 'P9'),
('01234567', 'P10');
-- -------------------------UPDATES--------------------------------
UPDATE Cientificos SET nom_apels = 'Nuevo Científico 1' WHERE dni = '12345678';
UPDATE Cientificos SET nom_apels = 'Nuevo Científico 2' WHERE dni = '23456789';

UPDATE Proyecto SET nombre = 'Nuevo Proyecto 1' WHERE id = 'P1';
UPDATE Proyecto SET horas = 160 WHERE id = 'P2';

UPDATE Asignado_A SET proyecto = 'P8' WHERE cientifico = '12345678' AND proyecto = 'P1';
UPDATE Asignado_A SET cientifico = '23456789' WHERE proyecto = 'P2';
-- -------------------------DELETES--------------------------------
DELETE FROM Cientificos WHERE dni = '34567890';
DELETE FROM Cientificos WHERE dni = '45678901';

DELETE FROM Proyecto WHERE id = 'P3';
DELETE FROM Proyecto WHERE id = 'P4';

DELETE FROM Asignado_A WHERE cientifico = '34567890' AND proyecto = 'P3';
DELETE FROM Asignado_A WHERE cientifico = '45678901' AND proyecto = 'P4';
