CREATE DATABASE Ej2;
USE Ej2;

CREATE TABLE Editorial(
clave_editorial smallint PRIMARY KEY,
nombre varchar(60),
direccion varchar(60),
telefono varchar(15)
);

CREATE TABLE Tema(
clave_tema smallint PRIMARY KEY,
nombre varchar(25)
);

CREATE TABLE Autor(
clave_autor int auto_increment PRIMARY KEY,
nombre varchar(25)
);

CREATE TABLE Socio(
clave_socio int PRIMARY KEY,
nombre varchar(25),
direccion varchar(120),
telefono varchar(10),
categoria char
);

CREATE TABLE Libro(
clave_libro int PRIMARY KEY,
titulo varchar(50),
idioma varchar(25),
formato varchar(25),
clave_editorial smallint,
FOREIGN KEY (clave_editorial) REFERENCES Editorial(clave_editorial) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ejemplar(
clave_ejemplar int auto_increment PRIMARY KEY,
clave_libro int,
numero_orden smallint,
edicion smallint,
ubicacion varchar(130),
categoria char,
FOREIGN KEY (clave_libro) REFERENCES Libro(clave_libro) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Prestamo(
clave_socio int,
clave_ejemplar int,
numero_orden smallint,
fecha_prestamo date,
fecha_devolucion date,
notas blob,
FOREIGN KEY (clave_socio) REFERENCES Socio(clave_socio) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (clave_ejemplar) REFERENCES Ejemplar(clave_ejemplar) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (clave_socio,clave_ejemplar,numero_orden)
);

CREATE TABLE EscritoPor(
clave_libro int,
clave_autor int,
FOREIGN KEY (clave_libro) REFERENCES Libro(clave_libro) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (clave_autor) REFERENCES Autor(clave_autor) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (clave_libro,clave_autor)
);

CREATE TABLE TrataSobre(
clave_libro int,
clave_tema smallint,
FOREIGN KEY (clave_libro) REFERENCES Libro(clave_libro) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (clave_tema) REFERENCES Tema(clave_tema) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (clave_libro,clave_tema)
);

-- -------------------------INSERTS--------------------------------
INSERT INTO Editorial (clave_editorial, nombre, direccion, telefono) VALUES
(1, 'Editorial A', 'Calle A, Ciudad A', '123-456-789'),
(2, 'Editorial B', 'Calle B, Ciudad B', '987-654-321'),
(3, 'Editorial C', 'Calle C, Ciudad C', '555-555-555'),
(4, 'Editorial D', 'Calle D, Ciudad D', '111-222-333'),
(5, 'Editorial E', 'Calle E, Ciudad E', '444-444-444'),
(6, 'Editorial F', 'Calle F, Ciudad F', '777-777-777'),
(7, 'Editorial G', 'Calle G, Ciudad G', '888-888-888'),
(8, 'Editorial H', 'Calle H, Ciudad H', '999-999-999'),
(9, 'Editorial I', 'Calle I, Ciudad I', '000-000-000'),
(10, 'Editorial J', 'Calle J, Ciudad J', '123-123-123');

INSERT INTO Tema (clave_tema, nombre) VALUES
(1, 'Tema A'),
(2, 'Tema B'),
(3, 'Tema C'),
(4, 'Tema D'),
(5, 'Tema E'),
(6, 'Tema F'),
(7, 'Tema G'),
(8, 'Tema H'),
(9, 'Tema I'),
(10, 'Tema J');

INSERT INTO Autor (nombre) VALUES
('Autor A'),
('Autor B'),
('Autor C'),
('Autor D'),
('Autor E'),
('Autor F'),
('Autor G'),
('Autor H'),
('Autor I'),
('Autor J');

INSERT INTO Socio (clave_socio, nombre, direccion, telefono, categoria) VALUES
(1, 'Juan Pérez', 'Calle A, Ciudad A', '123-4567', 'A'),
(2, 'María López', 'Calle B, Ciudad B', '987-6543', 'B'),
(3, 'Carlos Rodríguez', 'Calle C, Ciudad C', '555-5555', 'C'),
(4, 'Laura Martínez', 'Calle D, Ciudad D', '111-2222', 'A'),
(5, 'Pedro Sánchez', 'Calle E, Ciudad E', '777-8888', 'B'),
(6, 'Ana Gómez', 'Calle F, Ciudad F', '444-5555', 'C'),
(7, 'Luis Torres', 'Calle G, Ciudad G', '333-2222', 'A'),
(8, 'Elena Vargas', 'Calle H, Ciudad H', '666-7777', 'B'),
(9, 'Javier Reyes', 'Calle I, Ciudad I', '999-9999', 'C'),
(10, 'Sara González', 'Calle J, Ciudad J', '000-1111', 'A');

INSERT INTO Libro (clave_libro, titulo, idioma, formato, clave_editorial) VALUES
(1, 'Libro 1', 'Español', 'Tapa Dura', 1),
(2, 'Libro 2', 'Inglés', 'Tapa Blanda', 2),
(3, 'Libro 3', 'Francés', 'Digital', 3),
(4, 'Libro 4', 'Alemán', 'Tapa Dura', 4),
(5, 'Libro 5', 'Español', 'Tapa Blanda', 1),
(6, 'Libro 6', 'Inglés', 'Digital', 2),
(7, 'Libro 7', 'Francés', 'Tapa Dura', 3),
(8, 'Libro 8', 'Alemán', 'Tapa Blanda', 4),
(9, 'Libro 9', 'Español', 'Tapa Dura', 1),
(10, 'Libro 10', 'Inglés', 'Digital', 2);

INSERT INTO Ejemplar (clave_libro, numero_orden, edicion, ubicacion, categoria) VALUES
(1, 1, 1, 'Estante 1, Sección A', 'A'),
(2, 2, 1, 'Estante 2, Sección B', 'B'),
(3, 3, 2, 'Estante 3, Sección C', 'C'),
(4, 4, 2, 'Estante 4, Sección D', 'A'),
(5, 5, 1, 'Estante 5, Sección E', 'B'),
(6, 6, 3, 'Estante 6, Sección F', 'C'),
(7, 7, 3, 'Estante 7, Sección G', 'A'),
(8, 8, 2, 'Estante 8, Sección H', 'B'),
(9, 9, 4, 'Estante 9, Sección I', 'C'),
(10, 10, 4, 'Estante 10, Sección J', 'A');

INSERT INTO Prestamo (clave_socio, clave_ejemplar, numero_orden, fecha_prestamo, fecha_devolucion, notas) VALUES
(1, 1, 1, '2023-10-01', '2023-10-15', 'Notas para préstamo 1'),
(2, 2, 1, '2023-10-02', '2023-10-16', 'Notas para préstamo 2'),
(3, 3, 2, '2023-10-03', '2023-10-17', 'Notas para préstamo 3'),
(4, 4, 2, '2023-10-04', '2023-10-18', 'Notas para préstamo 4'),
(5, 5, 1, '2023-10-05', '2023-10-19', 'Notas para préstamo 5'),
(6, 6, 3, '2023-10-06', '2023-10-20', 'Notas para préstamo 6'),
(7, 7, 3, '2023-10-07', '2023-10-21', 'Notas para préstamo 7'),
(8, 8, 2, '2023-10-08', '2023-10-22', 'Notas para préstamo 8'),
(9, 9, 4, '2023-10-09', '2023-10-23', 'Notas para préstamo 9'),
(10, 10, 4, '2023-10-10', '2023-10-24', 'Notas para préstamo 10');

INSERT INTO EscritoPor (clave_libro, clave_autor) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO TrataSobre (clave_libro, clave_tema) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
-- -------------------------UPDATES--------------------------------
UPDATE Editorial SET telefono = '111-111-111' WHERE clave_editorial = 1;
UPDATE Editorial SET direccion = 'Nueva Dirección' WHERE clave_editorial = 2;

UPDATE Tema SET nombre = 'Tema Actualizado' WHERE clave_tema = 1;
UPDATE Tema SET nombre = 'Nuevo Tema' WHERE clave_tema = 2;

UPDATE Autor SET nombre = 'Autor Actualizado' WHERE clave_autor = 1;
UPDATE Autor SET nombre = 'Nuevo Autor' WHERE clave_autor = 2;

UPDATE Socio SET telefono = '0000-0000' WHERE clave_socio = 1;
UPDATE Socio SET categoria = 'D' WHERE clave_socio = 2;

UPDATE Libro SET formato = 'Tapa Dura' WHERE clave_libro = 1;
UPDATE Libro SET idioma = 'Alemán' WHERE clave_libro = 2;

UPDATE Ejemplar SET ubicacion = 'Nueva Ubicación' WHERE clave_ejemplar = 1;
UPDATE Ejemplar SET edicion = 3 WHERE clave_ejemplar = 2;

UPDATE Prestamo SET fecha_devolucion = '2023-11-01' WHERE clave_socio = 1 AND clave_ejemplar = 1 AND numero_orden = 1;
UPDATE Prestamo SET notas = 'Nuevas notas' WHERE clave_socio = 2 AND clave_ejemplar = 2 AND numero_orden = 1;

UPDATE EscritoPor SET clave_autor = 10 WHERE clave_libro = 1;
UPDATE EscritoPor SET clave_libro = 10 WHERE clave_autor = 2;

UPDATE TrataSobre SET clave_tema = 8 WHERE clave_libro = 1;
UPDATE TrataSobre SET clave_libro = 7 WHERE clave_tema = 2;


-- -------------------------DELETES--------------------------------
DELETE FROM Editorial WHERE clave_editorial = 3;
DELETE FROM Editorial WHERE clave_editorial = 4;

DELETE FROM Tema WHERE clave_tema = 3;
DELETE FROM Tema WHERE clave_tema = 4;

DELETE FROM Autor WHERE clave_autor = 3;
DELETE FROM Autor WHERE clave_autor = 4;

DELETE FROM Socio WHERE clave_socio = 3;
DELETE FROM Socio WHERE clave_socio = 4;

DELETE FROM Libro WHERE clave_libro = 3;
DELETE FROM Libro WHERE clave_libro = 4;

DELETE FROM Ejemplar WHERE clave_ejemplar = 3;
DELETE FROM Ejemplar WHERE clave_ejemplar = 4;

DELETE FROM Prestamo WHERE clave_socio = 3 AND clave_ejemplar = 3 AND numero_orden = 2;
DELETE FROM Prestamo WHERE clave_socio = 4 AND clave_ejemplar = 4 AND numero_orden = 2;

DELETE FROM EscritoPor WHERE clave_libro = 3;
DELETE FROM EscritoPor WHERE clave_autor = 4;

DELETE FROM TrataSobre WHERE clave_libro = 3;
DELETE FROM TrataSobre WHERE clave_tema = 4;
