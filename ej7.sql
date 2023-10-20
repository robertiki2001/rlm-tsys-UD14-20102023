CREATE DATABASE Ej7;
USE Ej7;

CREATE TABLE Despachos(
numero int auto_increment PRIMARY KEY,
capacidad int
);

CREATE TABLE Directores(
dni varchar(9) PRIMARY KEY,
nom_apels nvarchar(255),
dni_jefe varchar(9),
numero_despacho int,
FOREIGN KEY (dni_jefe) REFERENCES Directores(dni) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (numero_despacho) REFERENCES Despachos(numero) ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Despachos (capacidad) VALUES
(5),
(8),
(6),
(7),
(10),
(9),
(5),
(8),
(7),
(6);

INSERT INTO Directores (dni, nom_apels, dni_jefe, numero_despacho) VALUES
('111111111', 'Director 1', NULL, 1),
('222222222', 'Director 2', '111111111', 2),
('333333333', 'Director 3', '111111111', 3),
('444444444', 'Director 4', NULL, 4),
('555555555', 'Director 5', '444444444', 5),
('666666666', 'Director 6', '444444444', 6),
('777777777', 'Director 7', NULL, 7),
('888888888', 'Director 8', '777777777', 8),
('999999999', 'Director 9', '777777777', 9),
('000000000', 'Director 10', NULL, 10);

-- -------------------------UPDATES--------------------------------
UPDATE Despachos SET capacidad = 6 WHERE numero = 1;
UPDATE Despachos SET capacidad = 9 WHERE numero = 2;

UPDATE Directores SET dni_jefe = '555555555' WHERE dni = '222222222';
UPDATE Directores SET numero_despacho = 10 WHERE dni = '333333333';
-- -------------------------DELETES--------------------------------
DELETE FROM Despachos WHERE numero = 3;
DELETE FROM Despachos WHERE numero = 4;

DELETE FROM Directores WHERE dni = '444444444';
DELETE FROM Directores WHERE dni = '555555555';
