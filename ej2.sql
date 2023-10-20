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

