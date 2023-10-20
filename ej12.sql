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

CREATE TABLE Alumno(
codigo_unico int PRIMARY KEY,
nombre varchar(20),
apellido1 varchar(20),
apellido2 varchar(20),
dni varchar(8),
direccion varchar(20),
sexo char(1), 
fecha_nacimiento date,
codigo_curso int,
FOREIGN KEY (codigo_curso) REFERENCES Cursos(codigo_unico) ON DELETE CASCADE ON UPDATE CASCADE,
CHECK (sexo = 'M' OR sexo = 'H')
);