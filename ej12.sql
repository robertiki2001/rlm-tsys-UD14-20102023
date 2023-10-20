CREATE DATABASE Ej12;
USE Ej12;

CREATE TABLE Profesores(
dni varchar(8) PRIMARY KEY,
nombre varchar(20) UNIQUE,
apellido1 varchar(20),
apellido2 varchar(20),
direccion varchar(20),
titulo varchar(20),
gana double not null
);

CREATE TABLE Cursos(
codigo_curso int PRIMARY KEY,
nombre_curso varchar(20) UNIQUE,
maximo_alumnos int,
fecha_inicio date,
fecha_fin date,
numero_horas int not null,
dni_profesor varchar(8),
FOREIGN KEY (dni_profesor) REFERENCES Profesores(dni) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (fecha_inicio <= fecha_fin)
);

CREATE TABLE Alumno (
codigo_unico int PRIMARY KEY,
nombre varchar(20),
apellido1 varchar(20),
apellido2 varchar(20),
dni varchar(8),
direccion varchar(20),
sexo char(1),
fecha_nacimiento date,
codigo_curso int,
FOREIGN KEY (codigo_curso) REFERENCES Cursos(codigo_curso) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (sexo = 'M' OR sexo = 'F')
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Profesores (dni, nombre, apellido1, apellido2, direccion, titulo, gana) VALUES
('12345678', 'Profesor1', 'Apellido1', 'Apellido2', 'Dirección1', 'Título1', 3000.00),
('23456789', 'Profesor2', 'Apellido1', 'Apellido2', 'Dirección2', 'Título2', 3500.00),
('34567890', 'Profesor3', 'Apellido1', 'Apellido2', 'Dirección3', 'Título3', 4000.00),
('45678901', 'Profesor4', 'Apellido1', 'Apellido2', 'Dirección4', 'Título4', 2800.00),
('56789012', 'Profesor5', 'Apellido1', 'Apellido2', 'Dirección5', 'Título5', 3200.00),
('67890123', 'Profesor6', 'Apellido1', 'Apellido2', 'Dirección6', 'Título6', 3800.00),
('78901234', 'Profesor7', 'Apellido1', 'Apellido2', 'Dirección7', 'Título7', 2600.00),
('89012345', 'Profesor8', 'Apellido1', 'Apellido2', 'Dirección8', 'Título8', 3000.00),
('90123456', 'Profesor9', 'Apellido1', 'Apellido2', 'Dirección9', 'Título9', 3100.00),
('01234567', 'Profesor10', 'Apellido1', 'Apellido2', 'Dirección10', 'Título10', 2900.00);

INSERT INTO Cursos (codigo_curso, nombre_curso, maximo_alumnos, fecha_inicio, fecha_fin, numero_horas, dni_profesor) VALUES
(1, 'Curso1', 20, '2023-10-01', '2023-10-31', 40, '12345678'),
(2, 'Curso2', 15, '2023-11-01', '2023-11-30', 30, '23456789'),
(3, 'Curso3', 25, '2023-12-01', '2023-12-31', 45, '34567890'),
(4, 'Curso4', 18, '2023-10-01', '2023-10-31', 35, '45678901'),
(5, 'Curso5', 22, '2023-11-01', '2023-11-30', 42, '56789012'),
(6, 'Curso6', 16, '2023-12-01', '2023-12-31', 37, '67890123'),
(7, 'Curso7', 30, '2023-10-01', '2023-10-31', 38, '78901234'),
(8, 'Curso8', 19, '2023-11-01', '2023-11-30', 33, '89012345'),
(9, 'Curso9', 21, '2023-12-01', '2023-12-31', 44, '90123456'),
(10, 'Curso10', 17, '2023-10-01', '2023-10-31', 36, '01234567');

INSERT INTO Alumno (codigo_unico, nombre, apellido1, apellido2, dni, direccion, sexo, fecha_nacimiento, codigo_curso) VALUES
(1, 'Alumno1', 'Apellido1', 'Apellido2', '12345678', 'Dirección1', 'M', '2000-01-15', 1),
(2, 'Alumno2', 'Apellido1', 'Apellido2', '23456789', 'Dirección2', 'F', '2000-02-20', 2),
(3, 'Alumno3', 'Apellido1', 'Apellido2', '34567890', 'Dirección3', 'M', '2000-03-25', 3),
(4, 'Alumno4', 'Apellido1', 'Apellido2', '45678901', 'Dirección4', 'F', '2000-04-10', 4),
(5, 'Alumno5', 'Apellido1', 'Apellido2', '56789012', 'Dirección5', 'M', '2000-05-05', 5),
(6, 'Alumno6', 'Apellido1', 'Apellido2', '67890123', 'Dirección6', 'F', '2000-06-15', 6),
(7, 'Alumno7', 'Apellido1', 'Apellido2', '78901234', 'Dirección7', 'M', '2000-07-30', 7),
(8, 'Alumno8', 'Apellido1', 'Apellido2', '89012345', 'Dirección8', 'F', '2000-08-22', 8),
(9, 'Alumno9', 'Apellido1', 'Apellido2', '90123456', 'Dirección9', 'M', '2000-09-10', 9),
(10, 'Alumno10', 'Apellido1', 'Apellido2', '01234567', 'Dirección10', 'F', '2000-10-01', 10);

-- -------------------------UPDATES--------------------------------
UPDATE Profesores SET gana = 3200.00 WHERE dni = '12345678';
UPDATE Profesores SET titulo = 'Nuevo Título' WHERE dni = '23456789';

UPDATE Cursos SET numero_horas = 50 WHERE codigo_curso = 1;
UPDATE Cursos SET fecha_fin = '2023-12-15' WHERE codigo_curso = 2;

UPDATE Alumno SET direccion = 'Nueva Dirección 1' WHERE codigo_unico = 1;
UPDATE Alumno SET codigo_curso = 5 WHERE codigo_unico = 2;
-- -------------------------DELETES--------------------------------
DELETE FROM Profesores WHERE dni = '34567890';
DELETE FROM Profesores WHERE dni = '45678901';

DELETE FROM Cursos WHERE codigo_curso = 3;
DELETE FROM Cursos WHERE codigo_curso = 4;

DELETE FROM Alumno WHERE codigo_unico = 3;
DELETE FROM Alumno WHERE codigo_unico = 4;
