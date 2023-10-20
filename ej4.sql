CREATE DATABASE Ej4;
USE Ej4;

CREATE TABLE Departamentos (
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
presupuesto int
);

CREATE TABLE Empleados (
dni varchar(9) PRIMARY KEY,
nombre nvarchar(100),
apellidos nvarchar(255),
codigo_departamento int,
FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo)ON DELETE CASCADE ON UPDATE CASCADE
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Departamentos (nombre, presupuesto) VALUES
('Departamento 1', 10000),
('Departamento 2', 15000),
('Departamento 3', 8000),
('Departamento 4', 12000),
('Departamento 5', 20000),
('Departamento 6', 9000),
('Departamento 7', 18000),
('Departamento 8', 11000),
('Departamento 9', 13000),
('Departamento 10', 7000);

INSERT INTO Empleados (dni, nombre, apellidos, codigo_departamento) VALUES
('123456789', 'Juan', 'Pérez', 1),
('987654321', 'María', 'López', 2),
('555555555', 'Carlos', 'Rodríguez', 3),
('111222333', 'Laura', 'Martínez', 4),
('777888999', 'Pedro', 'Sánchez', 1),
('444555666', 'Ana', 'Gómez', 2),
('333222111', 'Luis', 'Torres', 3),
('666777888', 'Elena', 'Vargas', 1),
('999999999', 'Javier', 'Reyes', 2),
('000111222', 'Sara', 'González', 3);

-- -------------------------UPDATES--------------------------------
UPDATE Departamentos SET presupuesto = 12000 WHERE codigo = 1;
UPDATE Departamentos SET nombre = 'Nuevo Departamento 2' WHERE codigo = 2;

UPDATE Empleados SET nombre = 'Nuevo Nombre' WHERE dni = '123456789';
UPDATE Empleados SET codigo_departamento = 4 WHERE dni = '987654321';

-- -------------------------DELETES--------------------------------
DELETE FROM Departamentos WHERE codigo = 3;
DELETE FROM Departamentos WHERE codigo = 4;

DELETE FROM Empleados WHERE dni = '555555555';
DELETE FROM Empleados WHERE dni = '111222333';
