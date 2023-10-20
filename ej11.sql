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